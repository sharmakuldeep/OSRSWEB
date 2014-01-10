package com.osrs


class ChartController {

    def abc ={

        println " IAm in anbcccccccccc"
    }
    def Graph= {
        println " IAM innnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnChart"
        List<Demo> dataObjects = makeData()
        println " DATA OBJECTS" +dataObjects;

        Integer totalPrimarySchools = getTotalPrimarySchools(dataObjects)
        Integer totalSecondarySchools = getTotalSecondarySchools(dataObjects)
        Integer totalSeniorSecondarySchools = getTotalSeniorSecondarySchools(dataObjects)
        Integer totalColleges = getTotalColleges(dataObjects)
        println ">>>>>> dataobjects1 ${dataObjects[0].districtName}"
//        println ">>>>>> dataobjects2${dataObjects[1].districtName}"
//        println ">>>>>> dataobjects3 ${dataObjects[2].districtName}"
        println ">>>>>> totalPrimarySchools ${totalPrimarySchools}"
        println ">>>>>> totalSecondarySchools ${totalSecondarySchools}"
        println ">>>>>> totalSeniorSecondarySchools ${totalSeniorSecondarySchools}"
        println ">>>>>> totalColleges ${totalColleges}"
        println " nvvvvvvvvvvv ${dataObjects}";
        List l1;

       def returnMap=[:];
        List show = [totalPrimarySchools, totalSecondarySchools, totalSeniorSecondarySchools, totalColleges]
    returnMap+=[dataObjects: dataObjects, primarySchools: totalPrimarySchools, secondarySchools: totalSecondarySchools, seniorSecondarySchools: totalSeniorSecondarySchools, colleges:totalColleges,  show:show]
             render( view: "/trial/Graph",model:returnMap);
    }
        /*
    def getTotalPrimarySchools(def objects) {
         int result = 0
        objects.each {
            result += it.primarySchool
        }
        return result
    }

    def getTotalSecondarySchools(def objects) {
        int result = 0
        objects.each {
            result += it.secondarySchool
        }
        return result
    }
    def getTotalSeniorSecondarySchools(def objects) {
        int result = 0
        objects.each {
            result += it.seniorSecondarySchool
        }
        return result
    }

    def getTotalColleges(def objects) {
        int result = 0
        objects.each {
            result += it.college
        }
        return result
    }



    def makeData() {
        List<Demo>list = []
//          Demo object1=new Demo();
//          object1.districtName="kamrup" ;
//          object1.primarySchool=43;
//          object1.secondarySchool=56;
//          object1.seniorSecondarySchool=34
//        object1.college=34;
//        object1.save();
        Demo object1 = new Demo(districtName:"Kamrup", primarySchool:10, secondarySchool:20, seniorSecondarySchool:10, college: 1)
        object1.college = 1
        if(!object1.save()) {
            println "Errors.. "
            object1.errors.allErrors.each {
                println "Error >> ${it}"
            }
        }
        Demo object2 = new Demo(districtName:"Bongaingaon", primarySchool:5,secondarySchool:00,seniorSecondarySchool:12,college:11).save()
        Demo object3 = new Demo(districtName:"Bijni", primarySchool:9,secondarySchool:10,seniorSecondarySchool:6,college:15).save()
        Demo object4 = new Demo(districtName:"Darrang", primarySchool:12,secondarySchool:2,seniorSecondarySchool:14,college:0).save()
        println " object1 " +object1;

        list.add(object1)
        list.add(object2)
        list.add(object3)
        list.add(object4)
        println "Here ********"+list.size()
        return list

    }       */


}
