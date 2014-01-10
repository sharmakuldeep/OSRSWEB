package com.osrs

class HomeController {
    def userService
    def index = { }

    def iMain={
        if(!userService.iUserLoggedIn()){
          redirect(action:"iLogin", controller:"login")
        }else{
            def inProgressRecords=InProgressRecords.findByUserCreated(session.user)
            if(inProgressRecords){
                session.village=inProgressRecords.village
               redirect(action:"iSelectCatg" , controller: "dataCollection")
            }else{
                def userLoggedIn=User.findById(session.user.id)
                if(userLoggedIn.state){
                   redirect(action:"iSelectDist" , controller: "dataCollection",params: ['stateCode':userLoggedIn.state.code])
                }else if(userLoggedIn.district){
                   redirect(action:"iSelectBlock" , controller: "dataCollection",params: ['distCode':userLoggedIn.district.code])
                }else if(userLoggedIn.block){
                   redirect(action:"iSelectVillage" , controller: "dataCollection",params: ['blockCode':userLoggedIn.block.code])
                } else{
                   redirect(action:"iNotEligible" )
                }
            }
        }

    }


    def iNotEligible={

        }



}
