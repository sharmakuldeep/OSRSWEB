package com.osrs


import com.osrs.education.Education
import com.osrs.education.NoOfEnrolmentInEdu
import com.osrs.infraFacilities.InfrastructuralFacilities
import com.osrs.health.HealthAndFamilyWelfare
import org.apache.commons.lang.Validate
import com.osrs.education.NoOfEnrolmentInCollege
import com.osrs.education.NoOfEnrolmentInOtherTechCourse
import com.osrs.health.Hospital


class DataCorrectionService {

    static transactional = true
    def springSecurityService

    def serviceMethod() {

    }

    def updateCorrectedEduData(params,user,village){
        log.debug("-====updateCorrectedEduData===Services===========:" + params)
        try {
            def dataInstance = Education.findById(params.eduId)
            if (params.eduType == 'PrePrimary') {
                dataInstance = savePrePrimaryData(params, dataInstance,user,village)
            } else if (params.eduType == 'Primary') {
                dataInstance = savePrimaryData(params, dataInstance,user,village)
            }else if (params.eduType == 'middle') {
                dataInstance = saveMiddleData(params, dataInstance,user,village)
            }else if (params.eduType == 'highSchool') {
                dataInstance = saveHighSchoolData(params, dataInstance,user,village)
            }else if (params.eduType == 'seniorSecSchool') {
                dataInstance = saveSeniorSecSchoolData(params, dataInstance,user,village)
            }else if(params.eduType== 'college'){
                dataInstance=saveCollegeData(params,dataInstance,user,village)
            }
            else if(params.eduType== 'noOfEnrolmentInOtherTechCourse'){
                dataInstance=saveTechData(params,dataInstance,user,village)
            }
            else {
                dataInstance.properties = params
                if (dataInstance.save()) {
                    return true
                } else {
                    return false
                }
            }
            return true
        } catch (Exception e) {
            log.debug e
            return false
        }

    }

    def savePrePrimaryData(params,Education data,user,village){
       for(int i=0;i<data.edu5;i++){
           def ppInstance=NoOfEnrolmentInEdu.findById(params['prePrimaryId'+i])
           if (!ppInstance) {
               ppInstance = new NoOfEnrolmentInEdu()
               ppInstance.village = data.village
               ppInstance.month = data.month
               ppInstance.year = data.year
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.institutionType=data.prePrimary
               ppInstance.save(flush:true)
               data.prePrimary.add(ppInstance)
               data.save()
           }
           if(params['studentEnrolledBoys'+i])
           ppInstance?.studentEnrolledBoys=Integer.parseInt(params['studentEnrolledBoys'+i])
           if(params['studentEnrolledGirls'+i])
           ppInstance?.studentEnrolledGirls=Integer.parseInt(params['studentEnrolledGirls'+i])
           if(params['studentAttendingBoys'+i])
           ppInstance?.studentAttendingBoys=Integer.parseInt(params['studentAttendingBoys'+i])
           if(params['studentAttendingGirls'+i])
           ppInstance?.studentAttendingGirls=Integer.parseInt(params['studentAttendingGirls'+i])
           if(params['newEntrantsBoys'+i])
           ppInstance?.newEntrantsBoys=Integer.parseInt(params['newEntrantsBoys'+i])
           if(params['newEntrantsGirls'+i])
           ppInstance?.newEntrantsGirls=Integer.parseInt(params['newEntrantsGirls'+i])
           if(params['studentDiscontinuedStudiesBoys'+i])
           ppInstance?.studentDiscontinuedStudiesBoys=Integer.parseInt(params['studentDiscontinuedStudiesBoys'+i])
           if(params['studentDiscontinuedStudiesGirls'+i])
           ppInstance?.studentDiscontinuedStudiesGirls=Integer.parseInt(params['studentDiscontinuedStudiesGirls'+i])
           if(params['reasonOfDiscontinuationEconomic'+i])
           ppInstance?.reasonOfDiscontinuationEconomic=Integer.parseInt(params['reasonOfDiscontinuationEconomic'+i])
           if(params['reasonOfDiscontinuationNonEconomic'+i])
           ppInstance?.reasonOfDiscontinuationNonEconomic=Integer.parseInt(params['reasonOfDiscontinuationNonEconomic'+i])
           if(params['noOfTeacherMale'+i])
           ppInstance?.noOfTeacherMale=Integer.parseInt(params['noOfTeacherMale'+i])
           if(params['noOfTeacherFemale'+i])
           ppInstance?.noOfTeacherFemale=Integer.parseInt(params['noOfTeacherFemale'+i])
           ppInstance.save(flush:true)

       }
        return  data
    }

    def savePrimaryData(params,Education data,user,village){
       for(int i=0;i<data.edu6;i++){
           def ppInstance=NoOfEnrolmentInEdu.findById(params['primaryId'+i])
           if (!ppInstance) {
               ppInstance = new NoOfEnrolmentInEdu()
               ppInstance.village= data.village
               ppInstance.month = data.month
               ppInstance.year = data.year
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
               data.primary.add(ppInstance)
               data.save()
           }
           if (params['studentEnrolledBoys' +i])
               ppInstance?.studentEnrolledBoys = Integer.parseInt(params['studentEnrolledBoys' + i])
           if (params['studentEnrolledGirls' +i])
               ppInstance?.studentEnrolledGirls = Integer.parseInt(params['studentEnrolledGirls' + i])
           if (params['studentAttendingBoys' + i])
               ppInstance?.studentAttendingBoys = Integer.parseInt(params['studentAttendingBoys' + i])
           if (params['studentAttendingGirls' + i])
               ppInstance?.studentAttendingGirls = Integer.parseInt(params['studentAttendingGirls' + i])
           if (params['newEntrantsBoys' + i])
               ppInstance?.newEntrantsBoys = Integer.parseInt(params['newEntrantsBoys' + i])
           if (params['newEntrantsGirls' + i])
               ppInstance?.newEntrantsGirls = Integer.parseInt(params['newEntrantsGirls' + i])
           if (params['studentDiscontinuedStudiesBoys' + i])
               ppInstance?.studentDiscontinuedStudiesBoys = Integer.parseInt(params['studentDiscontinuedStudiesBoys' + i])
           if (params['studentDiscontinuedStudiesGirls' + i])
               ppInstance?.studentDiscontinuedStudiesGirls = Integer.parseInt(params['studentDiscontinuedStudiesGirls' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationEconomic = Integer.parseInt(params['reasonOfDiscontinuationEconomic' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationNonEconomic = Integer.parseInt(params['reasonOfDiscontinuationNonEconomic' + i])
           if (params['noOfTeacherMale' + i])
               ppInstance?.noOfTeacherMale = Integer.parseInt(params['noOfTeacherMale' + i])
           if (params['noOfTeacherFemale' + i])
               ppInstance?.noOfTeacherFemale = Integer.parseInt(params['noOfTeacherFemale' + i])
           ppInstance.save(flush: true)
       }
        return  data
    }

    def saveMiddleData(params,Education data,user,village){
       for(int i=0;i<data.edu7;i++){
           def ppInstance=NoOfEnrolmentInEdu.findById(params['middleId'+i])
            if (!ppInstance) {
               ppInstance = new NoOfEnrolmentInEdu()
               ppInstance.village = data.village
               ppInstance.month = data.month
               ppInstance.year = data.year
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
               data.middle.add(ppInstance)
               data.save()
           }
           if (params['studentEnrolledBoys' + i])
               ppInstance?.studentEnrolledBoys = Integer.parseInt(params['studentEnrolledBoys' + i])
           if (params['studentEnrolledGirls' + i])
               ppInstance?.studentEnrolledGirls = Integer.parseInt(params['studentEnrolledGirls' + i])
           if (params['studentAttendingBoys' + i])
               ppInstance?.studentAttendingBoys = Integer.parseInt(params['studentAttendingBoys' + i])
           if (params['studentAttendingGirls' + i])
               ppInstance?.studentAttendingGirls = Integer.parseInt(params['studentAttendingGirls' + i])
           if (params['newEntrantsBoys' + i])
               ppInstance?.newEntrantsBoys = Integer.parseInt(params['newEntrantsBoys' + i])
           if (params['newEntrantsGirls' + i])
               ppInstance?.newEntrantsGirls = Integer.parseInt(params['newEntrantsGirls' + i])
           if (params['studentDiscontinuedStudiesBoys' + i])
               ppInstance?.studentDiscontinuedStudiesBoys = Integer.parseInt(params['studentDiscontinuedStudiesBoys' + i])
           if (params['studentDiscontinuedStudiesGirls' + i])
               ppInstance?.studentDiscontinuedStudiesGirls = Integer.parseInt(params['studentDiscontinuedStudiesGirls' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationEconomic = Integer.parseInt(params['reasonOfDiscontinuationEconomic' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationNonEconomic = Integer.parseInt(params['reasonOfDiscontinuationNonEconomic' + i])
           if (params['noOfTeacherMale' + i])
               ppInstance?.noOfTeacherMale = Integer.parseInt(params['noOfTeacherMale' + i])
           if (params['noOfTeacherFemale' + i])
               ppInstance?.noOfTeacherFemale = Integer.parseInt(params['noOfTeacherFemale' + i])
           ppInstance.save(flush: true)
       }
        return  data
    }

    def saveHighSchoolData(params,Education data,user,village){
       for(int i=0;i<data.edu8;i++){
           def ppInstance=NoOfEnrolmentInEdu.findById(params['highSchoolId'+i])
            if (!ppInstance) {
               ppInstance = new NoOfEnrolmentInEdu()
               ppInstance.village = data.village
               ppInstance.month = data.month
               ppInstance.year = data.year
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
                data.highSchool.add(ppInstance)
                data.save()
           }
           if (params['studentEnrolledBoys' + i])
               ppInstance?.studentEnrolledBoys = Integer.parseInt(params['studentEnrolledBoys' + i])
           if (params['studentEnrolledGirls' + i])
               ppInstance?.studentEnrolledGirls = Integer.parseInt(params['studentEnrolledGirls' + i])
           if (params['studentAttendingBoys' + i])
               ppInstance?.studentAttendingBoys = Integer.parseInt(params['studentAttendingBoys' + i])
           if (params['studentAttendingGirls' + i])
               ppInstance?.studentAttendingGirls = Integer.parseInt(params['studentAttendingGirls' + i])
           if (params['newEntrantsBoys' + i])
               ppInstance?.newEntrantsBoys = Integer.parseInt(params['newEntrantsBoys' + i])
           if (params['newEntrantsGirls' + i])
               ppInstance?.newEntrantsGirls = Integer.parseInt(params['newEntrantsGirls' + i])
           if (params['studentDiscontinuedStudiesBoys' + i])
               ppInstance?.studentDiscontinuedStudiesBoys = Integer.parseInt(params['studentDiscontinuedStudiesBoys' + i])
           if (params['studentDiscontinuedStudiesGirls' + i])
               ppInstance?.studentDiscontinuedStudiesGirls = Integer.parseInt(params['studentDiscontinuedStudiesGirls' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationEconomic = Integer.parseInt(params['reasonOfDiscontinuationEconomic' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationNonEconomic = Integer.parseInt(params['reasonOfDiscontinuationNonEconomic' + i])
           if (params['noOfTeacherMale' + i])
               ppInstance?.noOfTeacherMale = Integer.parseInt(params['noOfTeacherMale' + i])
           if (params['noOfTeacherFemale' + i])
               ppInstance?.noOfTeacherFemale = Integer.parseInt(params['noOfTeacherFemale' + i])
           if (params['noChildNeverEnrolled' + i])
               ppInstance.noChildNeverEnrolled = Integer.parseInt(params['noChildNeverEnrolled' + i])
           ppInstance.save(flush: true)
       }
        return  data
    }

    def saveSeniorSecSchoolData(params,Education data,user,village){
       for(int i=0;i<data.edu9;i++){
           def ppInstance=NoOfEnrolmentInEdu.findById(params['seniorSecSchoolId'+i])
            if (!ppInstance) {
               ppInstance = new NoOfEnrolmentInEdu()
               ppInstance.village = data.village
               ppInstance.month = data.month
               ppInstance.year = data.year
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
                data.seniorSecSchool.add(ppInstance)
                data.save()
           }
           if (params['studentEnrolledBoys' + i])
               ppInstance?.studentEnrolledBoys = Integer.parseInt(params['studentEnrolledBoys' + i])
           if (params['studentEnrolledGirls' + i])
               ppInstance?.studentEnrolledGirls = Integer.parseInt(params['studentEnrolledGirls' + i])
           if (params['studentAttendingBoys' + i])
               ppInstance?.studentAttendingBoys = Integer.parseInt(params['studentAttendingBoys' + i])
           if (params['studentAttendingGirls' + i])
               ppInstance?.studentAttendingGirls = Integer.parseInt(params['studentAttendingGirls' + i])
           if (params['newEntrantsBoys' + i])
               ppInstance?.newEntrantsBoys = Integer.parseInt(params['newEntrantsBoys' + i])
           if (params['newEntrantsGirls' + i])
               ppInstance?.newEntrantsGirls = Integer.parseInt(params['newEntrantsGirls' + i])
           if (params['studentDiscontinuedStudiesBoys' + i])
               ppInstance?.studentDiscontinuedStudiesBoys = Integer.parseInt(params['studentDiscontinuedStudiesBoys' + i])
           if (params['studentDiscontinuedStudiesGirls' + i])
               ppInstance?.studentDiscontinuedStudiesGirls = Integer.parseInt(params['studentDiscontinuedStudiesGirls' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationEconomic = Integer.parseInt(params['reasonOfDiscontinuationEconomic' + i])
           if (params['reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationNonEconomic = Integer.parseInt(params['reasonOfDiscontinuationNonEconomic' + i])
           if (params['noOfTeacherMale' + i])
               ppInstance?.noOfTeacherMale = Integer.parseInt(params['noOfTeacherMale' + i])
           if (params['noOfTeacherFemale' + i])
               ppInstance?.noOfTeacherFemale = Integer.parseInt(params['noOfTeacherFemale' + i])
           ppInstance.save(flush: true)
       }
        return  data
    }

    def saveCollegeData(params,Education data,user,village){
        for(int i=0;i<data.noOfEnrolmentInCollege;i++){
           def ppInstance=NoOfEnrolmentInCollege.findById(params['collegeId'+i])
            if (!ppInstance) {
               ppInstance = new NoOfEnrolmentInCollege()
               ppInstance.village = data.village
               ppInstance.month = data.month
               ppInstance.year = data.year
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
                ppInstance=data.noOfEnrolmentInCollege.save()
                ppInstance.save()
                data.save()
           }
           if (params['noOfEnrolmentInCollege.noOfStudentEnrolledBoys' + i])
               ppInstance?.noOfStudentEnrolledBoys = Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentEnrolledBoys' + i])
           if (params['noOfEnrolmentInCollege.noOfStudentEnrolledGirls' + i])
               ppInstance?.noOfStudentEnrolledGirls = Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentEnrolledGirls' + i])
           if (params['noOfEnrolmentInCollege.noOfStudentAttendingBoys' + i])
               ppInstance?.noOfStudentAttendingBoys = Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentAttendingBoys' + i])
           if (params['noOfEnrolmentInCollege.noOfStudentAttendingGirls' + i])
               ppInstance?.noOfStudentAttendingGirls = Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentAttendingGirls' + i])
           if (params['noOfEnrolmentInCollege.noOfNewEntrantsEntryBoys' + i])
               ppInstance?.noOfNewEntrantsEntryBoys = Integer.parseInt(params['noOfEnrolmentInCollege.noOfNewEntrantsEntryBoys' + i])
           if (params['noOfEnrolmentInCollege.noOfNewEntrantsEntryGirls' + i])
               ppInstance?.noOfNewEntrantsEntryGirls= Integer.parseInt(params['noOfEnrolmentInCollege.noOfNewEntrantsEntryGirls' + i])
           if (params['noOfEnrolmentInCollege.noOfStudentDiscontinuedStudiesBoys' + i])
               ppInstance?.noOfStudentDiscontinuedStudiesBoys = Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentDiscontinuedStudiesBoys' + i])
           if (params['noOfEnrolmentInCollege.noOfStudentDiscontinuedStudiesGirls' + i])
               ppInstance?.noOfStudentDiscontinuedStudiesGirls = Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentDiscontinuedStudiesGirls' + i])
           if (params['noOfEnrolmentInCollege.reasonOfDiscontinuationEconomic' + i])
               ppInstance?.reasonOfDiscontinuationEconomic = Integer.parseInt(params['noOfEnrolmentInCollege.reasonOfDiscontinuationEconomic' + i])
           if (params['noOfEnrolmentInCollege.reasonOfDiscontinuationNonEconomic' + i])
               ppInstance?.reasonOfDiscontinuationNonEconomic = Integer.parseInt(params['noOfEnrolmentInCollege.reasonOfDiscontinuationNonEconomic' + i])
           if (params['noOfEnrolmentInCollege.noOfStudentsEnrolledInUniversityBoys' + i])
               ppInstance?.noOfStudentsEnrolledInUniversityBoys= Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentsEnrolledInUniversityBoys' + i])
           if (params['noOfEnrolmentInCollege.noOfStudentsEnrolledInUniversityGirls' + i])
               ppInstance?.noOfStudentsEnrolledInUniversityGirls= Integer.parseInt(params['noOfEnrolmentInCollege.noOfStudentsEnrolledInUniversityGirls' + i])
           ppInstance.save(flush: true)
       }
        return  data
    }

    def saveTechData(params,Education data,user,village){
     for(int i=0;i<data.noOfEnrolmentInOtherTechCourse;i++){
           def ppInstance=NoOfEnrolmentInOtherTechCourse.findById(params['noOfEnrolmentInOtherTechCourseId'+i])
            if (!ppInstance) {
               ppInstance = new NoOfEnrolmentInOtherTechCourse()
               ppInstance.village = data.village
               ppInstance.month = data.month
               ppInstance.year = data.year
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
               data.noOfEnrolmentInOtherTechCourse.add(ppInstance)
                data.save()
           }
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBeBtechBoys' + i])
               ppInstance?.noOfStudentEnrolledInBeBtechBoys = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBeBtechBoys' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBeBtechGirls' + i])
               ppInstance?.noOfStudentEnrolledInBeBtechGirls = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBeBtechGirls' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInMbbsBoys' + i])
               ppInstance?.noOfStudentEnrolledInMbbsBoys = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInMbbsBoys' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInMbbsGirls' + i])
               ppInstance?.noOfStudentEnrolledInMbbsGirls = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInMbbsGirls' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBvscBoys' + i])
               ppInstance?.noOfStudentEnrolledInBvscBoys = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBvscBoys' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBvscGirls' + i])
               ppInstance?.noOfStudentEnrolledInBvscGirls= Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBvscGirls' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInAgriMscBoys' + i])
               ppInstance?.noOfStudentEnrolledInAgriMscBoys = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInAgriMscBoys' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInAgriMscGirls' + i])
               ppInstance?.noOfStudentEnrolledInAgriMscGirls = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInAgriMscGirls' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInPolytechDeplomaBoys' + i])
               ppInstance?.noOfStudentEnrolledInPolytechDeplomaBoys= Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInPolytechDeplomaBoys' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInPolytechDeplomaGirls' + i])
               ppInstance?.noOfStudentEnrolledInPolytechDeplomaGirls = Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInPolytechDeplomaGirls' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInITIBoys' + i])
               ppInstance?.noOfStudentEnrolledInITIBoys= Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInITIBoys' + i])
           if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInITIGirls' + i])
               ppInstance?.noOfStudentEnrolledInITIGirls= Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInITIGirls' + i])
          if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInVocationalCourseBoys' + i])
               ppInstance?.noOfStudentEnrolledInVocationalCourseBoys= Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInVocationalCourseBoys' + i])
          if (params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInVocationalCourseGirls' + i])
               ppInstance?.noOfStudentEnrolledInVocationalCourseGirls= Integer.parseInt(params['noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInVocationalCourseGirls' + i])
           ppInstance.save(flush: true)
       }
        return  data
    }

    def updateCorrectedHealthData(params,user,village){
        log.debug "--updateCorrectedHealthData params:"+params;
        try{
            def dataInstance=HealthAndFamilyWelfare.findById(params.healthDataId)
            dataInstance.properties = params
                if (dataInstance.save()) {
                    return true
                } else {
                    return false
                }

        }catch(Exception e){
            log.debug e
            return  false
        }
    }

    def updateHospitalData(params, HealthAndFamilyWelfare data,user,village){

    }

    def saveGovtHospital(params, HealthAndFamilyWelfare data,user,village){
       for(int i=0;i<data.govHospitals;i++){
           def ppInstance=Hospital.findById(params['govtHospitalId'+i])
            if (!ppInstance) {
               ppInstance = new Hospital()
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
                data.govHospitals.add(ppInstance)
                data.save()
           }
           if (params['govHospitals.noOfDoctors' + i])
               ppInstance?.noOfDoctors = Integer.parseInt(params['govHospitals.noOfDoctors' + i])
           if (params['govHospitals.noOfNurses' + i])
               ppInstance?.noOfNurses = Integer.parseInt(params['govHospitals.noOfNurses' + i])
           if (params['govHospitals.noOfBeds' + i])
               ppInstance?.noOfBeds = Integer.parseInt(params['govHospitals.noOfBeds' + i])
           if (params['govHospitals.noOfMaleCasesTreated' + i])
               ppInstance?.noOfMaleCasesTreated = Integer.parseInt(params['govHospitals.noOfMaleCasesTreated' + i])
           if (params['govHospitals.noOfFemaleCasesTreated' + i])
               ppInstance?.noOfFemaleCasesTreated = Integer.parseInt(params['govHospitals.noOfFemaleCasesTreated' + i])
            if (params['govDispensaries.noOfDoctors' + i])
               ppInstance?.noOfDoctors = Integer.parseInt(params['govDispensaries.noOfDoctors' + i])
           if (params['govDispensaries.noOfNurses' + i])
               ppInstance?.noOfNurses = Integer.parseInt(params['govDispensaries.noOfNurses' + i])
           if (params['govDispensaries.noOfBeds' + i])
               ppInstance?.noOfBeds = Integer.parseInt(params['govDispensaries.noOfBeds' + i])
           if (params['govDispensaries.noOfMaleCasesTreated' + i])
               ppInstance?.noOfMaleCasesTreated = Integer.parseInt(params['govDispensaries.noOfMaleCasesTreated' + i])
           if (params['govDispensaries.noOfFemaleCasesTreated' + i])
               ppInstance?.noOfFemaleCasesTreated = Integer.parseInt(params['govDispensaries.noOfFemaleCasesTreated' + i])
           ppInstance.save(flush: true)
       }
        return  data

    }

     def saveSubCenter(params, HealthAndFamilyWelfare data,user,village){
       for(int i=0;i<data.subCenter;i++){
           def ppInstance=Hospital.findById(params['subCenterId'+i])
            if (!ppInstance) {
               ppInstance = new Hospital()
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
                data.subCenter.add(ppInstance)
                data.save()
           }
           if (params['subCenter.noOfDoctors' + i])
               ppInstance?.noOfDoctors = Integer.parseInt(params['subCenter.noOfDoctors' + i])
           if (params['subCenter.noOfNurses' + i])
               ppInstance?.noOfNurses = Integer.parseInt(params['subCenter.noOfNurses' + i])
           if (params['subCenter.noOfBeds' + i])
               ppInstance?.noOfBeds = Integer.parseInt(params['subCenter.noOfBeds' + i])
           if (params['subCenter.noOfMaleCasesTreated' + i])
               ppInstance?.noOfMaleCasesTreated = Integer.parseInt(params['subCenter.noOfMaleCasesTreated' + i])
           if (params['subCenter.noOfFemaleCasesTreated' + i])
               ppInstance?.noOfFemaleCasesTreated = Integer.parseInt(params['subCenter.noOfFemaleCasesTreated' + i])
            if (params['commHealthCenter.noOfDoctors' + i])
               ppInstance?.noOfDoctors = Integer.parseInt(params['commHealthCenter.noOfDoctors' + i])
           if (params['commHealthCenter.noOfNurses' + i])
               ppInstance?.noOfNurses = Integer.parseInt(params['commHealthCenter.noOfNurses' + i])
           if (params['commHealthCenter.noOfBeds' + i])
               ppInstance?.noOfBeds = Integer.parseInt(params['commHealthCenter.noOfBeds' + i])
           if (params['commHealthCenter.noOfMaleCasesTreated' + i])
               ppInstance?.noOfMaleCasesTreated = Integer.parseInt(params['commHealthCenter.noOfMaleCasesTreated' + i])
           if (params['commHealthCenter.noOfFemaleCasesTreated' + i])
               ppInstance?.noOfFemaleCasesTreated = Integer.parseInt(params['commHealthCenter.noOfFemaleCasesTreated' + i])
           ppInstance.save(flush: true)
       }
        return  data

    }

    def saveFamilyCenter(params, HealthAndFamilyWelfare data,user,village){
       for(int i=0;i<data.familyWelCenter;i++){
           def ppInstance=Hospital.findById(params['familyWelCenterId'+i])
            if (!ppInstance) {
               ppInstance = new Hospital()
               ppInstance.userCreated = user
               ppInstance.userUpdated = user
               ppInstance.dateCreated = new Date()
               ppInstance.lastUpdated = new Date()
               ppInstance.save(flush: true)
                data.familyWelCenter.add(ppInstance)
                data.save()
           }
           if (params['familyWelCenter.noOfDoctors' + i])
               ppInstance?.noOfDoctors = Integer.parseInt(params['familyWelCenter.noOfDoctors' + i])
           if (params['familyWelCenter.noOfNurses' + i])
               ppInstance?.noOfNurses = Integer.parseInt(params['familyWelCenter.noOfNurses' + i])
           if (params['familyWelCenter.noOfBeds' + i])
               ppInstance?.noOfBeds = Integer.parseInt(params['familyWelCenter.noOfBeds' + i])
           if (params['familyWelCenter.noOfMaleCasesTreated' + i])
               ppInstance?.noOfMaleCasesTreated = Integer.parseInt(params['familyWelCenter.noOfMaleCasesTreated' + i])
           if (params['familyWelCenter.noOfFemaleCasesTreated' + i])
               ppInstance?.noOfFemaleCasesTreated = Integer.parseInt(params['familyWelCenter.noOfFemaleCasesTreated' + i])
            if (params['ayurCenter.noOfDoctors' + i])
               ppInstance?.noOfDoctors = Integer.parseInt(params['ayurCenter.noOfDoctors' + i])
           if (params['ayurCenter.noOfNurses' + i])
               ppInstance?.noOfNurses = Integer.parseInt(params['ayurCenter.noOfNurses' + i])
           if (params['ayurCenter.noOfBeds' + i])
               ppInstance?.noOfBeds = Integer.parseInt(params['ayurCenter.noOfBeds' + i])
           if (params['ayurCenter.noOfMaleCasesTreated' + i])
               ppInstance?.noOfMaleCasesTreated = Integer.parseInt(params['ayurCenter.noOfMaleCasesTreated' + i])
           if (params['ayurCenter.noOfFemaleCasesTreated' + i])
               ppInstance?.noOfFemaleCasesTreated = Integer.parseInt(params['ayurCenter.noOfFemaleCasesTreated' + i])
            if (params['homeoCells.noOfDoctors' + i])
               ppInstance?.noOfDoctors = Integer.parseInt(params['homeoCells.noOfDoctors' + i])
           if (params['homeoCells.noOfNurses' + i])
               ppInstance?.noOfNurses = Integer.parseInt(params['homeoCells.noOfNurses' + i])
           if (params['homeoCells.noOfBeds' + i])
               ppInstance?.noOfBeds = Integer.parseInt(params['homeoCells.noOfBeds' + i])
           if (params['homeoCells.noOfMaleCasesTreated' + i])
               ppInstance?.noOfMaleCasesTreated = Integer.parseInt(params['homeoCells.noOfMaleCasesTreated' + i])
           if (params['homeoCells.noOfFemaleCasesTreated' + i])
               ppInstance?.noOfFemaleCasesTreated = Integer.parseInt(params['homeoCells.noOfFemaleCasesTreated' + i])
           ppInstance.save(flush: true)
       }
        return  data

    }

    def updateCorrectedIsfData(params){
        log.debug "@@@@@@@@@@:"+params.isfDataId
        try{
            def dataInstance=InfrastructuralFacilities.findById(params.isfDataId)
            dataInstance.properties = params
                if (dataInstance.save()) {
                    return true
                } else {
                    return false
                }
        }catch(Exception e){
            log.debug e
            return  false
        }
    }

    def findVillage(data){
        def userInstance=User.findByUsername(springSecurityService.currentUser.username)

        def panchayatList=[]
        if(userInstance.panchayat){

            panchayatList.add(userInstance.panchayat)
        }else if(userInstance.block){

           def list= GramPanchayat.findAllByBlock(userInstance.block)
            panchayatList.add(list[0])
        }else if(userInstance.district){
            panchayatList=userInstance.district.block
         }else if(userInstance.state){

             userInstance.state.district.each {d->
                 d.block.each{b->
                     panchayatList.add(b)
                 }
             }
         } else{

            panchayatList=GramPanchayat.list()
         }

        def c=Village.createCriteria()
        def result=c.list {
            'in'("gramPanchayat",panchayatList)
            ilike('name',"%"+data.village+"%")
        }
        return result
    }

}
