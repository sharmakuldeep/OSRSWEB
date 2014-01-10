package com.osrs

import org.springframework.web.servlet.support.RequestContextUtils as RCU
import grails.plugins.springsecurity.Secured

class TrialController {
    def dataCollectionService;

    def springSecurityService

    def index1 = {

      println "iam inn=================================================================="
    // pie chart data  for first education page1
            def category
            category='Education'
            def returnMap=dataCollectionService.getEducationDataStateLevel(params)
                println " REturnMAp ================================================"+returnMap;
            returnMap+=[category:category];
       // Map
        println " FInal LIst Size"+returnMap.finalList[0].size();
       int  i=returnMap.finalList[0].size();
        int j =returnMap.finalList.size()
        def finall=[];
        int t=0;

        for(int p=2;p<i-3;p++)
                {
                    for(int r=0;r<j;r++)
                    {
           finall+=[returnMap.finalList[r][p]]
                        println " FInal lisyt"+finall;
                    }

        }
        def  finalLabel=[]
       List abc=[1,2,3,4,5,6,7]

        for(int l=0;l<i-5;l++)
        {
         finalLabel.add(abc[l])
          for(int m=0;m<j-1;m++)
          {
                  finalLabel.add(abc[l])

          }
        }
        println " FInal LAbels-------"+finalLabel
//        'Adult Center', 'Adult Educated', 'Pre-Primary','Primary','Middle','Secondary','Higher Secondary'
//        def val=returnMap.finalList[0][1];
//        println" value---"+val;
//        def finall=[returnMap.finalList[0][2],returnMap.finalList[1][2],returnMap.finalList[0][3],returnMap.finalList[1][3],returnMap.finalList[0][4],returnMap.finalList[1][4],returnMap.finalList[0][5],returnMap.finalList[1][5],returnMap.finalList[0][6],returnMap.finalList[1][6],returnMap.finalList[0][7],returnMap.finalList[1][7],returnMap.finalList[0][8],returnMap.finalList[1][8]]
           println" finaaaaaaaaal"+finall
        List finalLast=[finall]+[finalLabel];
        println " Final Last"+finalLast ;
        def retMap=[finalLabel:finalLabel,finall:finall];
        log.debug "=====retMap================"+retMap
        render (view:"Graph" ,model:retMap);

//            render (view: "renderingEduReports",model:returnMap)


    }

    def trialService

    def index={
        def user1=User.findById(2)
        user1.block=Block.findById(1)
        user1.save()
        println"----------------"+user1.block.name
        println"----------------"+user1.state?.name

        render "OKK ADMIN "
        println"----------end----------------"
    }
    def userService
    def test={

    }



}
