package com.osrs

import osrs.MyJobsJob

class JobScheduleController {

    def schedule = {
        println("KKKKKKKKKKKKKKK "+params.value)
        if(params.value=="1"){
            println("value of params "+ params.value)
            MyJobsJob.schedule("0 15 10 * * ?")
//            MyJobsJob.schedule("0 * 17 * * ?")
//            MyJobsJob.schedule("* * 12 * * ?")
        }
      if(params.value=="2"){
       println('value of params '+params.value)
        MyJobsJob.schedule("0 0 0 ? * MON")
      }
        redirect(controller: 'home', action: 'index')
    }
}
