package com.osrs

import com.osrs.education.NoOfEnrolmentInEdu
import com.osrs.education.Education
import com.osrs.education.NoOfEnrolmentInCollege
import com.osrs.education.NoOfEnrolmentInOtherTechCourse
import grails.plugins.springsecurity.Secured



class EducationDataCollectionController {

    def dataCollectionService
    def springSecurityService
    def userService

    def index = { }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def main={
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
         def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def education=dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
        [village:village,education:education,year:ipRecord?.year,month:ipRecord?.month]
    }
    }
    @Secured(['ROLE_ADMIN', 'ROLE_DATA_ENTRY_OPERATOR'])
    def educationGeneralInfo = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def education = dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
            [village: village, education: education, year: ipRecord?.year, month: ipRecord?.month]
        }
    }



    def iEducationSave = {
        log.debug("--iEducationSave:" + params)
        //def tempEducation = Education.findByUserCreatedAndStatus(session.user, 'IP')
        def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)
        def education
        if (tempEducation) {
            if (params?.edu5 && (tempEducation.prePrimary.size() > Integer.parseInt(params?.edu5))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "iEducationFormPage2")
                return
            }
            else if (params.edu6 &&(tempEducation.primary.size() > Integer.parseInt(params.edu6))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "iEducation")
                return
            }
            else if (params.edu7 &&(tempEducation.middle.size() > Integer.parseInt(params.edu7))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "iEducation")
                return
            }
            else if(params.edu8 && (tempEducation.highSchool.size() > Integer.parseInt(params.edu8))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "iEducation")
                return
            }
            else if(params.edu9 && (tempEducation.seniorSecSchool.size() > Integer.parseInt(params.edu9))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "iEducation")
                return
            }
        }

        if(tempEducation){
           education=tempEducation
        }else{
            education=dataCollectionService.newEducationObj(session.user,session.village)

        }
        education.properties=params
        education.userUpdated=session.user
        education.lastUpdated=new Date()

        education.save(Flush:true)
        log.debug(education.errors)
        redirect(action:"iEducation")
    }

    def iEducationGeneralInfo={
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        //def tempEducation = Education.findByUserCreatedAndStatus(session.user,'IP')
        def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(session.user)
         [village:village,education:tempEducation,year:ipRecord?.year,month:ipRecord?.month]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationNoOfInstitution={
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def tempEducation = dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
         [village:village,education:tempEducation,year:ipRecord?.year,month:ipRecord?.month]
    }
    }
    def iEducationNoOfInstitution={
        if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
         def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)
         def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(session.user)
         [village:village,education:tempEducation,year:ipRecord?.year,month:ipRecord?.month]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationDistanceOfInstitution={
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def tempEducation = dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
         [village:village,education:tempEducation,year:ipRecord?.year,month:ipRecord?.month]
    }
    }
    def iDistanceOfInstitution={
        if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(session.user)
         [village:village,education:tempEducation,year:ipRecord?.year,month:ipRecord?.month]
    }

    def iDistanceOfInstitutionSave={
        log.debug("!!!!!!!!!!!!!!"+params)
        def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)
        def education

        if(tempEducation){
           education=tempEducation
        }else{
            education=dataCollectionService.newEducationObj(session.user,session.village)
        }
        education.properties=params
        education.userUpdated=session.user
        education.lastUpdated=new Date()

        education.save(Flush:true)
        log.debug(education.errors)
        redirect(action:"iEducation")
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationNoOfEnrolment={
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        log.debug "--- education No of Enrolment params:"+params
        def tempEducation = dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))
        def noOfEnrolment
        if(params.type=='Pre-Primary School'){
            if(tempEducation.prePrimary){
               noOfEnrolment= tempEducation.prePrimary
            }
        }else if(params.type=='Primary School'){
            if(tempEducation.primary){
               noOfEnrolment= tempEducation.primary
            }
        }else if(params.type=='Middle School'){
            if(tempEducation.middle.size()>0){
               noOfEnrolment= tempEducation.middle
            }
        }else if(params.type=='High School'){
            if(tempEducation.highSchool){
               noOfEnrolment= tempEducation.highSchool
            }
        }else if(params.type=='Senior Secondary School'){
            if(tempEducation.seniorSecSchool){
               noOfEnrolment= tempEducation.seniorSecSchool
            }
        }
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
       [village:village,type:params.type,no:(Integer.parseInt(params.no)-1),education:tempEducation,noOfEnrolment:noOfEnrolment,year:ipRecord?.year,month:ipRecord?.month]
    }
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationSave={
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        def tempEducation = dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))
        def education
        if (tempEducation) {
            if (params?.edu5 && (tempEducation.prePrimary.size() > Integer.parseInt(params?.edu5))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "main")
                return
            }
            else if (params.edu6 &&(tempEducation.primary.size() > Integer.parseInt(params.edu6))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "main")
                return
            }
            else if (params.edu7 &&(tempEducation.middle.size() > Integer.parseInt(params.edu7))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "main")
                return
            }
            else if(params.edu8 && (tempEducation.highSchool.size() > Integer.parseInt(params.edu8))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "main")
                return
            }
            else if(params.edu9 && (tempEducation.seniorSecSchool.size() > Integer.parseInt(params.edu9))) {
                flash.message = "Not Allowed . Please Try with diffrent values"
                redirect(action: "main")
                return
            }
        }

        if(tempEducation){
           education=tempEducation
        }else{
            education=dataCollectionService.newEducationObj(User.findByUsername(springSecurityService.currentUser.username),session.village)

        }
        education.properties=params
        education.userUpdated=User.findByUsername(springSecurityService.currentUser.username)
        education.lastUpdated=new Date()

        education.save(Flush:true)
        log.debug(education.errors)
        redirect(action:"main")
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationNoOfEnrolmentSave={
        log.debug("--iEducationNoOfEnrolmentSave params:"+params)
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }

        def education=Education.findById(params.educationId)
        if(!education){
           education=dataCollectionService.newEducationObj(User.findByUsername(springSecurityService.currentUser.username),session.village)
        }
        def noOfEnrolmentInEdu
        if(params.id){
             noOfEnrolmentInEdu=NoOfEnrolmentInEdu.findById(params.id)
        }else{
             noOfEnrolmentInEdu= dataCollectionService.newNoOfEnrolmentInEdu(User.findByUsername(springSecurityService.currentUser.username),session.village)
        }
           noOfEnrolmentInEdu.properties=params
           noOfEnrolmentInEdu.userUpdated=User.findByUsername(springSecurityService.currentUser.username)
           noOfEnrolmentInEdu.lastUpdated=new Date()

           noOfEnrolmentInEdu.save(flash:true)
          log.debug"--------error noOfEnrolmentInEdu-------"+noOfEnrolmentInEdu.errors
         if(!params.id){
            if(params.institutionType=='Pre-Primary School'){
                education.prePrimary.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='Primary School'){
                education.primary.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='Middle School'){
                education.middle.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='High School'){
                education.highSchool.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='Senior Secondary School'){
                education.seniorSecSchool.add(noOfEnrolmentInEdu)
              }

              education.save(flash:true)

         }
         redirect(action:"main")


    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationEnrolmentInCollege={
        log.debug "---Edu no of enrol in college params:"+params
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def education
        def tempEducation = dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))

        if(tempEducation){
           education=tempEducation
        }else{
            education=dataCollectionService.newEducationObj(User.findByUsername(springSecurityService.currentUser.username),session.village)
        }
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
        [village:village,education:tempEducation,year:ipRecord?.year,month:ipRecord?.month]
    }
    }


    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationNoOfEnrolmentCollegeSave = {
        log.debug("--iEducationNoOfEnrolmentCollegeSave params:" + params)
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
        def education = Education.findById(params.educationId)
        if (!education) {
            education = dataCollectionService.newEducationObj(User.findByUsername(springSecurityService.currentUser.username), session.village)
        }
        def noOfEnrolmentInCollege
        if (education.noOfEnrolmentInCollege == null) {
            noOfEnrolmentInCollege = new NoOfEnrolmentInCollege()
            noOfEnrolmentInCollege.dateCreated = new Date()
            noOfEnrolmentInCollege.userCreated = User.findByUsername(springSecurityService.currentUser.username)
            noOfEnrolmentInCollege.village = village
            noOfEnrolmentInCollege.year = ipRecord.year
            noOfEnrolmentInCollege.month = ipRecord.month
            education.noOfEnrolmentInCollege= noOfEnrolmentInCollege
        } else {
            noOfEnrolmentInCollege = education.noOfEnrolmentInCollege
        }
        noOfEnrolmentInCollege.properties = params
        noOfEnrolmentInCollege.userUpdated = User.findByUsername(springSecurityService.currentUser.username)
        noOfEnrolmentInCollege.lastUpdated = new Date()

        education.save(flash: true)
        redirect(action: "main")
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationEnrolmentInOtherTechCourse={
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def tempEducation = dataCollectionService.getCurrentIPEduData(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
        [village:village,education:tempEducation,year:ipRecord?.year,month:ipRecord?.month]
    }
    }
    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def educationNoOfEnrolmentOtherTechCourseSave={
        log.debug("--iEducationNoOfEnrolmentCollegeSave params:"+params)
         if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
        def education=Education.findById(params.educationId)
        if(!education){
           education=dataCollectionService.newEducationObj(User.findByUsername(springSecurityService.currentUser.username),session.village)
        }
         def  noOfEnrolmentInOtherTechCourse
        if(education?.noOfEnrolmentInOtherTechCourse==null){
          noOfEnrolmentInOtherTechCourse=new NoOfEnrolmentInOtherTechCourse()
          noOfEnrolmentInOtherTechCourse.dateCreated=new Date()
          noOfEnrolmentInOtherTechCourse.userCreated=User.findByUsername(springSecurityService.currentUser.username)
          noOfEnrolmentInOtherTechCourse.village=village
          noOfEnrolmentInOtherTechCourse.month=ipRecord.month
          noOfEnrolmentInOtherTechCourse.year=ipRecord.year
          education.noOfEnrolmentInOtherTechCourse=noOfEnrolmentInOtherTechCourse
        }else{
            noOfEnrolmentInOtherTechCourse= education.noOfEnrolmentInOtherTechCourse
        }
           noOfEnrolmentInOtherTechCourse.properties=params
           noOfEnrolmentInOtherTechCourse.userUpdated=User.findByUsername(springSecurityService.currentUser.username)
           noOfEnrolmentInOtherTechCourse.lastUpdated=new Date()

        education.save(flash:true)
        redirect(action:"main")
    }

     def iEducation={
       if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def education=dataCollectionService.getCurrentIPEduData(session.user)
        def village=Village.findById(session.village.id)
         def inProgressRecords=InProgressRecords.findByUserCreated(session.user)
        [village:village,year:inProgressRecords.year,month:inProgressRecords.month,education:education]
    }

    def iNoOfEnrolment={
        log.debug "---noOfEnrolment params:"+params
        def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)
        def noOfEnrolment
        if(params.type=='Pre-Primary School'){
            if(tempEducation.prePrimary){
               noOfEnrolment= tempEducation.prePrimary
            }
        }else if(params.type=='Primary School'){
            if(tempEducation.primary){
               noOfEnrolment= tempEducation.primary
            }
        }else if(params.type=='Middle School'){
            if(tempEducation.middle.size()>0){
               noOfEnrolment= tempEducation.middle
            }
        }else if(params.type=='High School'){
            if(tempEducation.highSchool){
               noOfEnrolment= tempEducation.highSchool
            }
        }else if(params.type=='Senior Secondary School'){
            if(tempEducation.seniorSecSchool){
               noOfEnrolment= tempEducation.seniorSecSchool
            }
        }
        def village=Village.findById(session.village.id)
        def inProgressRecords=InProgressRecords.findByUserCreated(session.user)
       [village:village,type:params.type,year:inProgressRecords.year,month:inProgressRecords.month,no:(Integer.parseInt(params.no)-1),education:tempEducation,noOfEnrolment:noOfEnrolment]
    }



    def iEducationNoOfEnrolmentSave={
        log.debug("--iEducationNoOfEnrolmentSave params:"+params)
        def village=Village.findById(session.village.id)
        def inProgressRecords=InProgressRecords.findByUserCreated(session.user)

        def education=Education.findById(params.educationId)
        if(!education){
           education=dataCollectionService.newEducationObj(session.user,session.village)
        }
        def noOfEnrolmentInEdu
        if(params.id){
             noOfEnrolmentInEdu=NoOfEnrolmentInEdu.findById(params.id)
        }else{
             noOfEnrolmentInEdu= new NoOfEnrolmentInEdu()
             noOfEnrolmentInEdu.dateCreated=new Date()
             noOfEnrolmentInEdu.userCreated=session.user
        }
           noOfEnrolmentInEdu.properties=params
           noOfEnrolmentInEdu.userUpdated=session.user
           noOfEnrolmentInEdu.lastUpdated=new Date()
           noOfEnrolmentInEdu.year=inProgressRecords.year
           noOfEnrolmentInEdu.month=inProgressRecords.month
           noOfEnrolmentInEdu.village=village

           noOfEnrolmentInEdu.save(flash:true)
         if(!params.id){
            if(params.institutionType=='Pre-Primary School'){
                education.prePrimary.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='Primary School'){
                education.primary.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='Middle School'){
                education.middle.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='High School'){
                education.highSchool.add(noOfEnrolmentInEdu)
              }else if(params.institutionType=='Senior Secondary School'){
                education.seniorSecSchool.add(noOfEnrolmentInEdu)
              }

              education.save(flash:true)

         }
         redirect(action:"iEducation")


    }

    def iEnrolmentInCollege={
       log.debug "---noOfEnrolment params:"+params
        //def tempEducation = Education.findByUserCreatedAndStatus(session.user,'IP')
        def education
        def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)

        if(tempEducation){
           education=tempEducation
        }else{
            education=dataCollectionService.newEducationObj(session.user,session.village)
        }
        def village = Village.findById(session.village.id)
        def inProgressRecords = InProgressRecords.findByUserCreated(session.user)

        [village:village,year:inProgressRecords.year,month:inProgressRecords.month,education:tempEducation]
    }

    def iEducationNoOfEnrolmentCollegeSave = {
        log.debug("--iEducationNoOfEnrolmentCollegeSave params:" + params)

        def village = Village.findById(session.village.id)
        def inProgressRecords = InProgressRecords.findByUserCreated(session.user)
        def education = Education.findById(params.educationId)
        if (!education) {
            education = dataCollectionService.newEducationObj(session.user, session.village)
        }
        def noOfEnrolmentInCollege
        if (education.noOfEnrolmentInCollege == null) {
            noOfEnrolmentInCollege = new NoOfEnrolmentInCollege()
            noOfEnrolmentInCollege.dateCreated = new Date()
            noOfEnrolmentInCollege.userCreated = session.user
            noOfEnrolmentInCollege.year = inProgressRecords.year
            noOfEnrolmentInCollege.month = inProgressRecords.month
            noOfEnrolmentInCollege.village = village
            education.noOfEnrolmentInCollege = noOfEnrolmentInCollege
        } else {
            noOfEnrolmentInCollege = education.noOfEnrolmentInCollege
        }
        noOfEnrolmentInCollege.properties = params
        noOfEnrolmentInCollege.userUpdated = session.user
        noOfEnrolmentInCollege.lastUpdated = new Date()
        education.save(flash: true)

        redirect(action: "iEducation")
    }

    def iEnrolmentInOtherTechCourse={
       log.debug "---noOfEnrolment params:"+params
        //def tempEducation = Education.findByUserCreatedAndStatus(session.user,'IP')
        def tempEducation = dataCollectionService.getCurrentIPEduData(session.user)
        def village=Village.findById(session.village.id)
        def inProgressRecords=InProgressRecords.findByUserCreated(session.user)

        [village:village,year:inProgressRecords.year,month:inProgressRecords.month,education:tempEducation]
    }

    def iEducationNoOfEnrolmentOtherTechCourseSave = {
        log.debug("--iEducationNoOfEnrolmentCollegeSave params:" + params)

        def village = Village.findById(session.village.id)
        def inProgressRecords = InProgressRecords.findByUserCreated(session.user)

        def education = Education.findById(params.educationId)
        if (!education) {
            education = dataCollectionService.newEducationObj(session.user, session.village)
        }
        def noOfEnrolmentInOtherTechCourse
        if (education?.noOfEnrolmentInOtherTechCourse == null) {
            noOfEnrolmentInOtherTechCourse = new NoOfEnrolmentInOtherTechCourse()
            noOfEnrolmentInOtherTechCourse.dateCreated = new Date()
            noOfEnrolmentInOtherTechCourse.userCreated = session.user
            noOfEnrolmentInOtherTechCourse.year = inProgressRecords.year
            noOfEnrolmentInOtherTechCourse.month = inProgressRecords.month
            noOfEnrolmentInOtherTechCourse.village = village
            education.noOfEnrolmentInOtherTechCourse = noOfEnrolmentInOtherTechCourse
        } else {
            noOfEnrolmentInOtherTechCourse = education.noOfEnrolmentInOtherTechCourse
        }
        noOfEnrolmentInOtherTechCourse.properties = params
        noOfEnrolmentInOtherTechCourse.userUpdated = session.user
        noOfEnrolmentInOtherTechCourse.lastUpdated = new Date()
        education.save(flash: true)

        redirect(action: "iEducation")
    }

}
