package com.osrs

import grails.plugins.springsecurity.Secured
//import com.sun.deploy.config.Config
import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

@Secured(['ROLE_USER'])
class ReportController {

    static navigation = true;
    def dataCollectionService
    def index = { }

    def admin1={
        def states=State.list()
        log.debug"===DataCorrectionController=main========="+states
        def startYear= grailsApplication.config.startyear
         def year= (new Date()).getYear()+1900
        [states:states,year:year,startyear:startYear]
    }

    def report={
        def states=State.list()
        log.debug"===DataCorrectionController=main========="+states
        def startYear= grailsApplication.config.startyear
         def year= (new Date()).getYear()+1900
        [states:states,year:year,startyear:startYear]
    }
    def error = {}

    def map={
        def states=State.list()
        log.debug"===DataCorrectionController=main========="+states
       def startYear= grailsApplication.config.startyear
          def year= (new Date()).getYear()+1900

        [states:states,year:year,startyear:startYear]
    }

    def mainReport={

        log.debug "---mainReport params:-" +params;
        if(!dataCollectionService.codeExist(params)){
            redirect(action:'map')
        }

        def category ,level ,code
        if(params.villageCode!=null){
            level='V'
            code=params.villageCode
        }
        else if(params.panchayatCode!=null){
            level='P'
            code=params.panchayatCode
        }else if(params.blockCode!=null){
            level='B'
            code=params.blockCode
        }else if(params.distCode!=null){

            level='D'
            code=params.distCode
        } else{
            level='S'
            code=params.stateCode
        }
        if(params.category==Categories.EDUCATION.value()){
             category='Education'

                   def finalList=dataCollectionService.getEducationData1(params,'edu',level,code)

                 render (view: "renderingedureport",model:[category:category,finalList:finalList,year:params.year,month:params?.month])
        }

        else if(params.category==Categories.HEALTH.value()){
             category='Health And Family Welfare'
            def finalList=dataCollectionService.getHealthData(params,'health',level,code)        //finalList contains total:[],list:[]
            render view: "renderingHealthReports" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
        }

        else if(params.category==Categories.INFRASTRUCTURE.value()){
            category='Infrastructural Facilities'
            def finalList=dataCollectionService.getIsfData1(params,'isf',level,code)
            render (view: "renderIsfReport" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month])
              }
    }


     def renderingReports={

//        log.debug " params"+params;
           def category ,level ,code
         if(params.villageCode!=null){
             level='V'
             code=params.villageCode
         }
         else if(params.panchayatCode!=null){
             level='P'
             code=params.panchayatCode
         }else if(params.blockCode!=null){
             level='B'
             code=params.blockCode
         }else if(params.distCode!=null){

             level='D'
             code=params.distCode
         } else{
             level='S'
             code=params.stateCode
         }

       if(params.category==Categories.EDUCATION.value()){
             category='Education'
             def finalList=dataCollectionService.getEducationData1(params,'edu',level,code)

           if(params.page=='1') {

               render view: "renderingedureport" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else if(params.page=='2') {

               render view: "education2" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else if(params.page=='3') {
               render view: "education3" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else if(params.page=='4') {
               render view: "education4" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else if(params.page=='5') {
               render view: "education5" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else if(params.page=='6') {
               render view: "education6" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else if(params.page=='7') {
               render view: "education7" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else{

               render (view: "renderingedureport",model:[category:category,finalList:finalList,year:params.year,month:params?.month])
           }
        }

        else if(params.category==Categories.HEALTH.value()){
             category='Health And Family Welfare'
            def finalList=dataCollectionService.getHealthData(params,'health',level,code)        //finalList contains total:[],list:[]
           if(params.page=='1') {
            render view: "renderingHealthReports" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
          else if(params.page=='2') {
               render view: "Health2" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }

           else if(params.page=='3') {
               render view: "Health3" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
           else{
               render view: "renderingHealthReports" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
           }
        }

       else if(params.category==Categories.INFRASTRUCTURE.value()){
            category='Infrastructural Facilities'
            def finalList=dataCollectionService.getIsfData1(params,'isf',level,code)
          render (view: "renderIsfReport" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month])
              }
            else{
           redirect(action: "report",controller: 'report')
       }
    }


    def reportNextInfra={
        def category ,level ,code
        if(params.villageCode!=null){
            level='V'
            code=params.villageCode
        }
        else if(params.panchayatCode!=null){
            level='P'
            code=params.panchayatCode
        }else if(params.blockCode!=null){
            level='B'
            code=params.blockCode
        }else if(params.distCode!=null){

            level='D'
            code=params.distCode
        } else{
            level='S'
            code=params.stateCode
        }

        if(params.category==Categories.EDUCATION.value()){
            category='Education'
            def finalList=dataCollectionService.getEducationData1(params,'edu',level,code)
            if(params.page=='2') {
                render view: "education2" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='3'){
                render view: "education3" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='4'){
                render view: "education4" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='5'){
                render view: "education5" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='6'){
                render view: "education6" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='7'){
                render view: "education7" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='8'){
                render view: "education8" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
        }
        else if(params.category==Categories.HEALTH.value()){
            category='Health And Family Welfare'
            def finalList=dataCollectionService.getHealthData(params,'health',level,code)
            if(params.page=='2') {
                render view: "Health2" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='3'){
                render view: "Health3" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
            else if(params.page=='4'){
                render view: "Health4" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month]
            }
        }
        else if(params.category==Categories.INFRASTRUCTURE.value()){
        category='Infrastructural Facilities'
        def finalList=dataCollectionService.getIsfData1(params,'isf',level,code)
        render (view: "reportNextInfra" ,model: [category:category,finalList:finalList,year:params.year,month:params?.month])
        }
    }

/*     def blockLevelReport={
        log.debug "params-------"+params;
        def category
          category='Infrastructural Facilities';
          params.year1=params.year
            println"yr"+params.year1;
            params.month1=params.month
            def returnMap=dataCollectionService.getIsfDataBlockLevel(params) ;
         returnMap+=[category:category,year:params.year1,month:params.month1];
            println " final list"+returnMap;
            render (view : '_isf1', model:returnMap);

//        }

        }



    def educationDataDegreeLevel={
           println 'IAM in DEgree LEVEL============';
           def category="Education"
           def returnMap=dataCollectionService.getEducationDataDegreeStateLevel(params);
           println " return MAp"+returnMap;
           returnMap+=[category:category] ;
           render(view: "_educationDataDegree_level",model:returnMap) ;

       }
      def educationDataDegreeBlockLevel={
          def category="Education"
           def returnMap=dataCollectionService.getEducationDataDegreeBlockLevel(params);
           returnMap+=[category:category] ;
           render(view: "_educationDataDegree_level",model:returnMap) ;

      }


      def educationDataDegreeVillageLevel={

            def category="Education"
           def returnMap=dataCollectionService.getEducationDataDegreeVillageLevel(params);
           returnMap+=[category:category] ;
           render(view: "_educationDataDegree_level",model:returnMap) ;
      }

      def educationDataTech_Course={
             def category="Education"
           def returnMap=dataCollectionService.getEducationDataTech_CourseStateLevel(params);
           returnMap+=[category:category] ;
           render(view: "_educationDataTech_course",model:returnMap) ;

      }
      def educationDataTech_CourseBlockLevelReport={

            def category="Education"
           def returnMap=dataCollectionService.getEducationDataTech_CourseBlockLevel(params);
           returnMap+=[category:category] ;
           render(view: "_educationDataTech_course",model:returnMap) ;
      }
      def educationDataTech_CourseVillageLevelReport={

            def category="Education"
           def returnMap=dataCollectionService.getEducationDataTech_CourseVillageLevel(params);
           returnMap+=[category:category] ;
           render(view: "_educationDataTech_course",model:returnMap) ;
      }



      def educationDataPrePrimary={
                    String type="SeniorSecondary"
                    def  category="Education"
           def var=params;
                         var+=[type:type] ;
       println " var "+var;
                    def returnMap=dataCollectionService.getEducation2DataStateLevel(var)
                    returnMap+=[category:category,type:type];
                    println "return...."+returnMap;
                    render (view: "_educationDataPrePrimary",model:returnMap) ;

      }
     def educationDataPrePrimaryBlock={
                    String type="SeniorSecondary"
                    def  category="Education"
           def var=params;
                         var+=[type:type] ;
       println " var "+var;
                    def returnMap=dataCollectionService.getEducation2DataBlockLevel(var)
                    returnMap+=[category:category,type:type];
                    render (view: "_educationDataPrePrimary",model:returnMap) ;

      }
     def educationDataPrePrimaryVillage={
                    String type="SeniorSecondary"
                    def  category="Education"
                    def var=params;
                    var+=[type:type] ;
                    println " var "+var;
                    def returnMap=dataCollectionService.getEducation2DataVillageLevel(var)
                    returnMap+=[category:category,type:type];
                    render (view: "_educationDataPrePrimary",model:returnMap) ;

      }
      *//* This action finds Senior Secondary School Page 5*/
     /* def educationDataXI_XII={
                    String type="SeniorSecondary"
                    def  category="Education"
           def var=params;
                         var+=[type:type] ;
       println " var "+var;
                    def returnMap=dataCollectionService.getEducation2DataStateLevel(var)
                    returnMap+=[category:category,type:type];
                    render (view: "_educationDataXI_XII",model:returnMap)



      }*/
       /* This Action finds Block Level Report for education page5 */
    /*  def educationDataXI_XIIBlockLevelReport={
                             String type="SeniorSecondary"
                                def category='Education';
           def var=params;
            var+=[type:type] ;
            println " var "+var;
                                 def  returnMap=dataCollectionService.getEducation2DataBlockLevel(var) ;
                                 returnMap+=[category:category,type:type];
                                 render (view : "_educationDataXI_XII", model:returnMap);


      }*/
       /* This Action finds Village Level Report for education page5 */
    /*  def educationDataXI_XIIVillageLevelReport ={
                             String type="SeniorSecondary"
                             def category
                             def var=params;
                            var+=[type:type] ;
                            println " var "+var;
                             category='Education';
                             def returnMap=dataCollectionService.getEducation2DataVillageLevel(var) ;
                             returnMap+=[category:category,type:type] ;
                             render (view : "_educationDataXI_XII", model:returnMap);


      }*/

       /* This Action finds the state level report for secondary school page4 */
      /* def educationDataIX_X={
          println " PARAMSSSSS"+params;
                                          String type="Secondary"
                                          def  category="Education"
                                          def returnMap=dataCollectionService.getEducation2DataStateLevel(params)
                                          returnMap+=[category:category];
                                          render (view: "_educationDataIX_X",model:returnMap)


      }*/
       /* This Action finds Block Level Report for education page4(Secondary) */
 /*  def   educationDataIX_XBlockLevelReport={
        println " PRAMS==========================================="+params;
                         String type="Secondary"
                         def category='Education';
       def var=params;
                         var+=[type:type] ;
       println " var "+var;
                         def  returnMap=dataCollectionService.getEducation2DataBlockLevel(var) ;

                         returnMap+=[category:category,type:type];
                         render (view : "_educationDataIX_X", model:returnMap);


      }*/
      /* This Action finds Village Level Report for education page4 */
    /*  def educationDataIX_XVillageLevelReport={
                       println " PRAMS==========================================="+params;
                       String type="Secondary"
           def var=params;
                         var+=[type:type] ;
       println " var "+var;
                       def category
                       category='Education';
                       def returnMap=dataCollectionService.getEducation2DataVillageLevel(var) ;
                       returnMap+=[category:category,type:type] ;
                       render (view : "_educationDataIX_X", model:returnMap);

      }*/
      /* This Action finds State Level report for middle School*/

   /*   def educationDataVI_VIII={
                                  String type="Middle"
                                  def  category="Education"
                                  def var=params;
                                  var+=[type:type] ;
                                  println " var "+var;
                                  def returnMap=dataCollectionService.getEducation2DataStateLevel(var)
                                  returnMap+=[category:category,type:type];
                                  render (view: "_educationDataVI_VIII",model:returnMap)
      }*/
       /* This Action finds Block Level Report for education page3 */
  /*    def educationDataVI_VIIIBlockLevelReport ={
                     String type="Middle"
                    def category='Education';
           def var=params;
                         var+=[type:type] ;
       println " var "+var;
                    def  returnMap=dataCollectionService.getEducation2DataBlockLevel(var) ;
                    returnMap+=[category:category,type:type];
                    render (view : "_educationDataVI_VIII", model:returnMap);


      }*/
      /* This Action finds Village Level Report for education page3 */
  /*    def  educationDataVI_VIIIVillageLevelReport ={
                      String type="Middle"
                       def category
                       category='Education';
                       println " params"+params;
                       def var=params;
                         var+=[type:type] ;
                       println " var "+var;
                       def returnMap=dataCollectionService.getEducation2DataVillageLevel(var) ;
                       returnMap+=[category:category] ;
                       render (view : "_educationDataVI_VIII", model:returnMap);
                          }*/
        /* This action finds State Level Report*/
    /*  def educationData1_V={
                            String type="Primary";
                            def  category="Education"
                            def var=params;
                            var+=[type:type] ;
                            println " var "+var;
                            def returnMap=dataCollectionService.getEducation2DataStateLevel(var)
                            returnMap+=[category:category,type:type];
                            render (view: "_educationData1_V",model:returnMap)
      }*/
       /* This Action finds Block Level Report for education page2 */
   /*   def educationData1_VBlockLevelReport={
                    String type="Primary";
                    def category='Education';
                    def var=params;
                    var+=[type:type] ;
                    println " var "+var;
                    def  returnMap=dataCollectionService.getEducation2DataBlockLevel(var) ;
                    returnMap+=[category:category,type:type];
                    render (view : "_educationData1_V", model:returnMap);

      }*/

      /* This Action finds Village Level Report for education page2 */
     /* def educationData1_VVillageLevelReport ={
                        String type="Primary";
                        def category
                       category='Education';
                       def var=params;
                        var+=[type:type] ;
                       println " var "+var;
                       def returnMap=dataCollectionService.getEducation2DataVillageLevel(var) ;
                       returnMap+=[category:category,type:type] ;
                       render (view : "_educationData1_V", model:returnMap);


      }*/




}






























