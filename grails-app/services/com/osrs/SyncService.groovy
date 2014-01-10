package com.osrs

import com.osrs.infraFacilities.InfrastructuralFacilities
import com.osrs.health.HealthAndFamilyWelfare
import com.osrs.health.Hospital
import com.osrs.education.Education
import com.osrs.education.NoOfEnrolmentInCollege
import com.osrs.education.NoOfEnrolmentInOtherTechCourse
import grails.converters.JSON
import com.osrs.education.NoOfEnrolmentInEdu

class SyncService {

    static transactional = true

    def userService
    def dataCollectionService

    def serviceMethod() {

    }

    /*
    * Authenticate mobile user for data Synchronization
    * */
    def userAuthResponse(auth){
        def userInstance = userService.iUserLoggedInAction(auth)
        if(userInstance){return true}
        else{return false}

    }

    /*
  * Authenticate mobile user for data Synchronization blockwise
  * */
    def userAuthBlockResponse(jData){
      def userInstance = userService.iUserLoggedInAction(jData.auth)
      def vilIns=  Village.findById(jData.date.villageId)

        if(userInstance?.block?.id==vilIns?.gramPanchayat?.block?.id) {
         return true
        }
        else{
           return false
        }


    }

    /*
    * Checking for given village and time data already exist or not.
    * input: village code and date(year amd month)
    * return map for all category for which data exist or for which data not exist
    * */
    def syncDataStatus(date,villageCode){
        def data=[:]
        data.villageCode= villageCode
        data.year=(date.year).toString()
        data.month=(date.month).toString()

        return (dataCollectionService.getOldData(data))
    }

    /*
    *  Saving Infrastructural data to database
    * Return true if saved and false if not saved
    * */
    def startInfraSyncing(data){
        log.debug "----Infra mob data sync params:"+data
        def village = Village.findByCode(data.villageCode)
        def mUser=User.findByUsername(data.auth.username)
        if(data[Categories.INFRASTRUCTURE.value()] && data[Categories.INFRASTRUCTURE.value()]!='null'){
            data[Categories.INFRASTRUCTURE.value()] = JSON.parse(data[Categories.INFRASTRUCTURE.value()])
            def isfInstance = new InfrastructuralFacilities(data[Categories.INFRASTRUCTURE.value()])  //TODO Check json
            isfInstance.village = village
            isfInstance.month = (data.date.month)
            isfInstance.year = (data.date.year)
            isfInstance.userCreated = mUser
            isfInstance.userUpdated = mUser
            isfInstance.dateCreated = new Date()
            isfInstance.lastUpdated = new Date()
            isfInstance.status = DataStatus.COMPLETED.value()
            try {
                if (isfInstance.validate() && isfInstance.save(flush: true)) {
                    return true
                } else {
                    log.debug "###########:" + isfInstance.errors
                    return false
                }
            } catch (Exception e) {
                log.debug " error on saving infra object:" + e
                return false
            }
        }

       return true

    }

    /*
    *  Saving "Health and Family welfare" data to database
    * Return true if saved and false if not saved
    * */
    def startHealthSyncing(data){
        if(data[Categories.HEALTH.value()] && !(data[Categories.HEALTH.value()]=='null' || data[Categories.HEALTH.value()]==null)){
            data[Categories.HEALTH.value()] = JSON.parse(data[Categories.HEALTH.value()])
           // log.debug "---------data.Hospitals---------"+data.Hospitals
            data.Hospitals = JSON.parse(data.Hospitals)
            def village = Village.findByCode(data.villageCode)
            def mUser = User.findByUsername(data.auth.username)
            def healthInstance = new HealthAndFamilyWelfare(data[Categories.HEALTH.value()])
            healthInstance.village = village
            healthInstance.month = (data.date.month)
            healthInstance.year = (data.date.year)
            healthInstance.userCreated = mUser
            healthInstance.userUpdated = mUser
            healthInstance.dateCreated = new Date()
            healthInstance.lastUpdated = new Date()
            healthInstance.status = DataStatus.COMPLETED.value()

            healthInstance.govHospitals = getHospitalInstance(mUser, data[Categories.HEALTH.value()].govHospitalId, HospitalType.govHospitals, data.Hospitals)
            healthInstance.govDispensaries = getHospitalInstance(mUser, data[Categories.HEALTH.value()].govDispensaryId, HospitalType.govDispensaries, data.Hospitals)
            healthInstance.primHealthCenter = getHospitalInstance(mUser, data[Categories.HEALTH.value()].primHealthCenterId, HospitalType.primHealthCenter, data.Hospitals)
            healthInstance.subCenter = getHospitalInstance(mUser, data[Categories.HEALTH.value()].subCenterId, HospitalType.subCenter, data.Hospitals)
            healthInstance.commHealthCenter = getHospitalInstance(mUser, data[Categories.HEALTH.value()].commHealthCenterId, HospitalType.commHealthCenter, data.Hospitals)
            healthInstance.familyWelCenter = getHospitalInstance(mUser, data[Categories.HEALTH.value()].familyWelCenterId, HospitalType.familyWelCenter, data.Hospitals)
            healthInstance.ayurCenter = getHospitalInstance(mUser, data[Categories.HEALTH.value()].ayurCenterId, HospitalType.ayurCenter, data.Hospitals)
            healthInstance.homeoCells = getHospitalInstance(mUser, data[Categories.HEALTH.value()].homeoCellsId, HospitalType.homeoCells, data.Hospitals)

            try {
                if (healthInstance.validate() && healthInstance.save(flush: true)) {
                    return true
                } else {
                    log.debug "Errors in Healthdata saving:" + healthInstance.errors
                    return false
                }
            } catch (Exception e) {
                log.debug " error on saving infra object:" + e
                return false
            }
        }
      return true

    }

    /*
    * Creating Hospital instance
    * Input: user instance, hospital data, hospital type
    * Return: Hospital instance.
    * */

    def getHospitalInstance(user, hData, type, hospitalData) {
        def data
        hospitalData.each {hd ->
            if (hd.id == hData) {
                data = hd
            }
        }
        def hospitalInstance = new Hospital(data)
        hospitalInstance.userCreated = user
        hospitalInstance.userUpdated = user
        hospitalInstance.lastUpdated = new Date()
        hospitalInstance.dateCreated = new Date()
        hospitalInstance.type = type
        hospitalInstance.save()
        return hospitalInstance
    }

    /*
   *  Saving "Education" data to database
   * Return true if saved and false if not saved
   * */
    def startEducationSyncing(data){
        def village = Village.findByCode(data.villageCode)
        def mUser=User.findByUsername(data.auth.username)

        if(data[Categories.EDUCATION.value()] && data[Categories.EDUCATION.value()]!='null'){
             if((data[Categories.EDUCATION.value()]).getClass().getName()!='org.codehaus.groovy.grails.web.json.JSONObject')
                    data[Categories.EDUCATION.value()]=JSON.parse(data[Categories.EDUCATION.value()])
            def educationInstance = new Education(data[Categories.EDUCATION.value()])
            data?.noOfEnrolmentInEduList = JSON.parse(data?.noOfEnrolmentInEduList)
            def noOfEnrolmentInEduList = data?.noOfEnrolmentInEduList
            educationInstance.village = village
            educationInstance.month = (data.date.month)
            educationInstance.year = (data.date.year)
            educationInstance.userCreated = mUser
            educationInstance.userUpdated = mUser
            educationInstance.dateCreated = new Date()
            educationInstance.lastUpdated = new Date()
            educationInstance.status = DataStatus.COMPLETED.value()
            educationInstance.noOfEnrolmentInCollege = addNoOfEnrolmentInCollege(data[Categories.EDUCATION.value()].noOfEnrolmentInCollegeId, data.date, mUser, village)
            educationInstance.noOfEnrolmentInOtherTechCourse = addNoOfEnrolmentInOtherTechCourse(data[Categories.EDUCATION.value()].noOfEnrolmentInOtherTechCourseId, data.date, mUser, village)
            noOfEnrolmentInEduList.each {i ->
                if (i.prePrimaryId) {
                    educationInstance.addToPrePrimary(getNoOfEnrolmentInEduInstance(i, village, data.date, mUser, 'Pre-Primary School'))
                } else if (i.primaryId) {
                    educationInstance.addToPrimary(getNoOfEnrolmentInEduInstance(i, village, data.date, mUser, 'Primary School'))
                } else if (i.middleId) {
                    educationInstance.addToMiddle(getNoOfEnrolmentInEduInstance(i, village, data.date, mUser, 'Middle School'))
                } else if (i.highSchoolId) {
                    educationInstance.addToHighSchool(getNoOfEnrolmentInEduInstance(i, village, data.date, mUser, 'High School'))
                } else if (i.seniorSecSchoolId) {
                    educationInstance.addToSeniorSecSchool(getNoOfEnrolmentInEduInstance(i, village, data.date, mUser, 'Senior Secondary School'))
                }
            }

            try {
                if (educationInstance.validate() && educationInstance.save(flush: true)) {
                    return true
                } else {
                    log.debug "Errors in Education saving:" + educationInstance.errors
                    return false
                }
            } catch (Exception e) {
                log.debug " error on saving education object:" + e
                return false
            }
        }
       return true
    }

    def getNoOfEnrolmentInEduInstance(data,village,date,mUser,institutionType){
        def nInstance=new NoOfEnrolmentInEdu(data)
        nInstance.institutionType=institutionType
        nInstance.month=date.month
        nInstance.year=date.year
        nInstance.userCreated=mUser
        nInstance.userUpdated=mUser
        nInstance.village=village
        nInstance.save(flush:true)
        return nInstance
    }

    def addNoOfEnrolmentInCollege( data,date,mUser,village){

        data=JSON.parse(data)
        def ec=new NoOfEnrolmentInCollege(data)
        ec.month=date.month
        ec.year=date.year
        ec.userCreated=mUser
        ec.userUpdated=mUser
        ec.village=village
        ec.save(flush:true)

        return ec
    }

    def addNoOfEnrolmentInOtherTechCourse( data,date,mUser,village){
        data=JSON.parse(data)
        def eoc=new NoOfEnrolmentInOtherTechCourse(data)
        eoc.month=date.month
        eoc.year=date.year
        eoc.userCreated=mUser
        eoc.userUpdated=mUser
        eoc.village=village
        eoc.save(flush:true)

        return eoc
    }
}
