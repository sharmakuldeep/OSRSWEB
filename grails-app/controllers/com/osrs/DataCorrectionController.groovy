package com.osrs

import grails.plugins.springsecurity.Secured



@Secured(['ROLE_STATE_ADMIN'])
class DataCorrectionController {

    def dataCollectionService
    def dataCorrectionService
    def springSecurityService

    def index = { }
    def main={

        log.debug"===DataCorrectionController=main========="
        def userInstance=User.findByUsername(springSecurityService.currentUser.username)
        def inProgressRecords=InProgressRecords.findByUserCreated(userInstance)
            if(inProgressRecords){
                session.village=inProgressRecords.village
               redirect(action:"selectCatg")
            }
        def state=null,district=null,block=null,districts=null,blocks=null,panchayat=null,villages=null

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

        [states:states,year:year,startyear:startYear,state:state,district:district,block:block,districts:districts,blocks:blocks,panchayat:panchayat,villages:villages]
        //def states=State.list()

        /*def year= (new Date()).getYear()+1900
        def startyear= grailsApplication.config.startyear*/
       // [states:states,year:year,startyear:startyear]
    }

    def selectCatg={

    }
    def dataRendering={
        log.debug "=======dataRendering params:"+params
        def category
         if(params.category=='edu'){
             category='Education'
             def data=dataCollectionService.getEducationData(params)
             if(data==null){
                 flash.message = "No data Available "
                 redirect action: "main"
             }else
                 println("<<<<<<<<<<<<"+category+"====================================="+data)
             render view: "educationData" ,model: [category:category,data:data]
         }else if(params.category=='health'){
             category='Health And Family Welfare'
             def data=dataCollectionService.getCurrentHealthData(params)
              if(data==null){
                 flash.message = "No data Available "
                 redirect action: "main"
             }
             else{
             render view: "healthData",model: [category:category,data:data]
             }
         }else if(params.category=='isf'){
             category='Infrastructural Facilities'
              def data=dataCollectionService.getInfrastructureData(params)
              if(data==null){
                 flash.message = "No data Available "
                 redirect action: "main"
             }
             else{

             render view: "isfData",model: [category:category,data:data]
              }
         }else{
             redirect(action: "main" ,controller: 'dataCorrection')
         }
//        }
    }

    def updateEdu={
       log.debug"-------------updateEdu:"+params
         def status =dataCorrectionService.updateCorrectedEduData(params,User.findByUsername(springSecurityService.currentUser.username),session.village)
        log.debug("==========status:"+status)
        [status:status,type:"Education"]
    }

    def updateHealth={
       log.debug"-------updateHealth params:"+params
         def status =dataCorrectionService.updateCorrectedHealthData(params,User.findByUsername(springSecurityService.currentUser.username),session.village)
        log.debug("=====updateHealth status:"+status)
        [status:status,type:"Health & Family Welfare"]
    }

    def updateIsfDData={
       log.debug"-------------updateIsf:"+params
         def status =dataCorrectionService.updateCorrectedIsfData(params)
        log.debug("==========status:"+status)
        [status:status,type:"Infrastructural Facilities"]
    }



    def findVillage={
        println("?????????????????"+params)
        def villageList=dataCorrectionService.findVillage(params)

        [villageList:villageList]
    }

    def villageDescription={
        [village:Village.findByCode(params.villageCode)]
    }
}
