package com.osrs


import grails.plugins.springsecurity.Secured

class IsfDataCollectionController {

    def userService
    def dataCollectionService
    def springSecurityService

    def index = { }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def main={
        if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

        [village:village,year:ipRecord?.year,month:ipRecord?.month]
    }

    def iMain={
       if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        //def isf=InfrastructuralFacilities.findByUserCreatedAndStatus(session.user,'IP')
        def isf=dataCollectionService.getCurrentIPInfData(session.user)
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(session.user)
        [village:village,year:ipRecord?.year,month:ipRecord?.month,infFaciliti:isf]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def distanceOfNearest={
       if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
         def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def isf=dataCollectionService.getCurrentIPInfData(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

        [village:village,year:ipRecord?.year,month:ipRecord?.month,infFaciliti:isf]
    }
    }

    def iDistanceOfNearest={
        if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        //def isf=InfrastructuralFacilities.findByUserCreatedAndStatus(session.user,'IP')
        def isf=dataCollectionService.getCurrentIPInfData(session.user)
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(session.user)
        [village:village,year:ipRecord?.year,month:ipRecord?.month,infFaciliti:isf]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def noOfCSocieties={
        if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
         def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def isf=dataCollectionService.getCurrentIPInfData(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

        [village:village,year:ipRecord?.year,month:ipRecord?.month,infFaciliti:isf]
    }
    }

    def iNoOfCSocieties={
        if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        //def isf=InfrastructuralFacilities.findByUserCreatedAndStatus(session.user,'IP')
        def isf=dataCollectionService.getCurrentIPInfData(session.user)
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(session.user)
        [village:village,year:ipRecord?.year,month:ipRecord?.month,infFaciliti:isf]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def noOfSW={
        if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
         def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
        def isf=dataCollectionService.getCurrentIPInfData(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

        [village:village,year:ipRecord?.year,month:ipRecord?.month,infFaciliti:isf]
    }
    }

    def iNoOfSW={
        if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        //def isf=InfrastructuralFacilities.findByUserCreatedAndStatus(session.user,'IP')
        def isf=dataCollectionService.getCurrentIPInfData(session.user)
        def village=Village.findById(session.village.id)
        def ipRecord=InProgressRecords.findByUserCreated(session.user)
        [village:village,year:ipRecord?.year,month:ipRecord?.month,infFaciliti:isf]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def saveData={
        if(!session.village){
          redirect(action:"index", controller: 'dataCollection')
        }
       def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(infrastructure=="false"){
            redirect(action: "index",controller: 'dataCollection')
        }
        def isf=dataCollectionService.getCurrentIPInfData(User.findByUsername(springSecurityService.currentUser.username))
        if(!isf){
           isf=dataCollectionService.newIsfObj(User.findByUsername(springSecurityService.currentUser.username),session.village)
        }
        isf.properties=params
        isf.userUpdated=User.findByUsername(springSecurityService.currentUser.username)
        isf.lastUpdated=new Date()

        isf.save(Flush:true)
        log.debug(isf.errors)
        redirect(action:"main")


        [village:session.village,infFaciliti:isf]
    }

    def iSaveData={
        if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        //def isf=InfrastructuralFacilities.findByUserCreatedAndStatus(session.user,'IP')
        def isf=dataCollectionService.getCurrentIPInfData(session.user)
        if(!isf){
           isf=dataCollectionService.newIsfObj(session.user,session.village)
        }
        isf.properties=params
        isf.userUpdated=session.user
        isf.lastUpdated=new Date()

        isf.save(Flush:true)
        log.debug(isf.errors)
        redirect(action:"iMain")


        [village:session.village,infFaciliti:isf]
    }


}
