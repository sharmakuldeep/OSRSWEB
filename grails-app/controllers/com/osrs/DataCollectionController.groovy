package com.osrs

import com.osrs.education.Education
import grails.plugins.springsecurity.Secured

class DataCollectionController {


    def userService
    def dataCollectionService
    def springSecurityService

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def index = {

        def userInstance=User.findByUsername(springSecurityService.currentUser.username)
        def inProgressRecords=InProgressRecords.findByUserCreated(userInstance)
            if(inProgressRecords){
                session.village=inProgressRecords.village
               redirect(action:"selectCatg")
            }
        def state=null,district=null,block=null,districts=null,blocks=null,panchayats=null, panchayat=null,villages=null

        if(userInstance.state){
           state=userInstance.state
            districts=District.findAllByState(state)
        }else if(userInstance.district){
           district=userInstance.district
            state=district.state
            blocks=Block.findAllByDistrict(district)
        }else if(userInstance.block){

            block=userInstance.block
            district=block.district
            state=district.state
            panchayat=GramPanchayat.findAllByBlock(block)
        }  else if(userInstance.panchayat){
            panchayat=userInstance.panchayat
            block=panchayat.block
            district=block.district
            state = district.state
            villages=Village.findAllByGramPanchayat(panchayat)
        }
        def states=State.list()
        def year= (new Date()).getYear()+1900
        def startYear= grailsApplication.config.startyear

        [states:states,year:year,startyear:startYear,state:state,district:district,block:block,districts:districts,blocks:blocks, panchayat:panchayat,villages:villages]
    }

    def selectCatg={
        def inProgressRecords=InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
        def village=Village.findById(session.village.id)

        [village:village,year:inProgressRecords.year,month:inProgressRecords.month]
    }

    def iSelectCatg={
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def inProgressRecords=InProgressRecords.findByUserCreated(session.user)
        def village=Village.findById(session.village.id)
        [village:village,year:inProgressRecords.year,month:inProgressRecords.month]
    }


    def updateDist={
         def state=State.findByCode(params.stateCode)
        def districts=District.createCriteria().list {
            eq('state',state)
            order('name')
        }
        [districts:districts]
    }

    def updateBlock={

        def district=District.findByCode(params.distCode)
         def blocks=Block.createCriteria().list {
            eq('district',district)
            order('name')
        }

        [blocks:blocks]
    }


    def updatePanchayat={
        println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        def block=Block.findByCode(params.blockCode)
        println(block)
         def panchayat=GramPanchayat.createCriteria().list {
            eq('block',block)
            order('name')
        }
        println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+panchayat)
        [panchayat:panchayat]
    }

    def updateVillage={
//        println("????????????????"+params.panchayatCode)
        def gramPanchayat = GramPanchayat.findByCode(params.panchayatCode)
        def villages = Village.createCriteria().list {
            eq('gramPanchayat', gramPanchayat)
            order('name')
        }
        [villages: villages]
    }

    def disableBlock={

    }

    def disablePanchayat={

    }

    def disableVillage={

    }

    def savePrimaryInfo = {
        println("<<<<<<<<<<<<<<<<<<<<<<")
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        log.debug("----save Primary Info Params:" + params)
        def collectionStatus=true
        def oldDataStatus = dataCollectionService.getOldData(params)
        oldDataStatus.each{s->
            if(s.value)
               collectionStatus=false
        }
        if (collectionStatus) {
            def tempIpr = new InProgressRecords()
            def village = Village.findByCode(params.villageCode)
            log.debug "----------Villlage :" + village;
            tempIpr.village = Village.findByCode(params.villageCode)
            tempIpr.year = Integer.parseInt(params.year)
            tempIpr.month = Integer.parseInt(params.month)
            tempIpr.userCreated = User.findByUsername(springSecurityService.currentUser.username)
            tempIpr.userUpdated = User.findByUsername(springSecurityService.currentUser.username)
            tempIpr.dateCreated = new Date()
            tempIpr.lastUpdated = new Date()
            tempIpr.save(flush: true)
            log.debug("-----------" + tempIpr.errors)
            session.village = tempIpr.village

            redirect(action: "selectCatg")
        } else {
            flash.message = "Selected Village and Time Data Already collected."
            redirect(action: "index")
        }
    }

    def iSelectState={
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def stateList=State.findAll()
        [stateList:stateList]
    }

    def iSelectDist = {
        log.debug "-----iSelectDist params:-" + params
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def districtList = District.findAll("from District as d where d.state=? order by d.name", [State.findByCode(params.stateCode)])
        [districts: districtList]
    }

    def iSelectBlock = {
        log.debug "-----iSelectBlock params:-" + params
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def blockList = Block.findAll("from Block as b where b.district=? order by name", [District.findByCode(params.distCode)])
        [blocks: blockList]
    }

    def iSelectVillage={
       log.debug"----iSelectVillage params:-"+params
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
       def villageList=Village.findAll("from Village as v where v.block=? order by name",[Block.findByCode(params.blockCode)])
        [villages:villageList]
    }

    def iSelectTime={
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def village=Village.findByCode(params.villageCode)

        def year= (new Date()).getYear()+1900
        def startYear= grailsApplication.config.startyear
        [village:village,year:year,startyear: startYear]
    }

    def iSavePrimaryInfo = {
        log.debug("-------------" + params)
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
        def collectionStatus=true
        def oldDataStatus = dataCollectionService.getOldData(params)
        oldDataStatus.each{s->
            if(s.value)
               collectionStatus=false
        }
        if (collectionStatus) {
            def tempIpr = new InProgressRecords()
            def village = Village.findByCode(params.villageCode)
            tempIpr.village = Village.findByCode(params.villageCode)
            tempIpr.year = Integer.parseInt(params.year)
            tempIpr.month = Integer.parseInt(params.month)
            tempIpr.userCreated = session.user
            tempIpr.userUpdated = session.user
            tempIpr.dateCreated = new Date()
            tempIpr.lastUpdated = new Date()
            tempIpr.save(flush: true)
            log.debug("-----------" + tempIpr.errors)
            session.village = tempIpr.village
            redirect(action: "iSelectCatg")
        } else {
            flash.message = "Selected Village and Time Data Already collected."
            redirect(action: "iSelectTime", params: [villageCode: params.villageCode])
        }
    }

    def submitEducationData={
        log.debug "--------"+params
        def education=Education.findById(params.educationId)
        education.status='complete'
        education.userUpdated=session.user
        education.lastUpdated=new Date()
        education.save(flush:true)
        log.debug("---------"+education.errors)
        redirect(action:"iMain" ,controller: 'home')
    }

    def submitDataCollectionInformation={
        log.debug "--------"+params
         def infrastructure=dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if(!infrastructure){
            redirect(action: "index",controller: 'dataCollection')
        }
        else{
         dataCollectionService.dataCollectionComplete(User.findByUsername(springSecurityService.currentUser.username),session.village)
        redirect(action:"index" )
    }
    }

    def iSubmitDataCollectionInformation={
        log.debug "--------"+params
         if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }
         dataCollectionService.dataCollectionComplete(session.user,session.village)
        redirect(action:"iMain" ,controller: 'home')
    }
}
