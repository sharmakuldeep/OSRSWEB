package com.osrs

import com.osrs.InProgressRecords
import com.osrs.education.Education
import com.osrs.infraFacilities.InfrastructuralFacilities
import com.osrs.health.HealthAndFamilyWelfare
import com.osrs.health.Hospital
import com.osrs.Village

import com.osrs.District
import com.osrs.State
import com.osrs.education.NoOfEnrolmentInEdu
import static com.osrs.education.NoOfEnrolmentInEdu.*
import com.osrs.education.NoOfEnrolmentInCollege
import static com.osrs.education.NoOfEnrolmentInCollege.*
import com.osrs.education.NoOfEnrolmentInOtherTechCourse
import com.osrs.Block
import javax.swing.text.DefaultStyledDocument.ElementBuffer
import org.apache.jasper.compiler.Node.ParamAction

//import org.apache.tools.ant.types.resources.comparators.Date

class DataCollectionService {

    static transactional = true


    def codeExist(params) {
        if (params.stateCode) {
            if (!State.findByCode(params.stateCode)) {
                return false
            }
        }
        else if (params.distCode) {
            if (!District.findByCode(params.distCode)) {
                return false
            }
        }
        return true
    }

    def getInProgressRecords(userName) {
        return InProgressRecords.findByUserCreated(User.findByUsername(userName))
    }

    def getVillageById(vId) {
        return Village.findById(vId)
    }

    def getDistrictByState(stateCode) {
        def state = State.findByCode(stateCode)
        def districts = District.createCriteria().list {
            eq('state', state)
            order('name')
        }
        return districts
    }

    def getBlockByDistrict(distCode) {
        def district = District.findByCode(distCode)
        def blocks = Block.createCriteria().list {
            eq('district', district)
            order('name')
        }
        return blocks
    }

    def getVillageByBlock(blockCode) {
        def block = Block.findByCode(blockCode)
        def villages = Village.createCriteria().list {
            eq('block', block)
            order('name')
        }
        return villages
    }
    /*
    * This function return map of categories
    * If data in category then their value is true
    * else false
    * */

    def getOldData(params) {
        log.debug "get old data params:" + params
        def status = [:]
        def village = Village.findByCode(params.villageCode)
        def e = Education.createCriteria()
        def h = HealthAndFamilyWelfare.createCriteria()
        def i = InfrastructuralFacilities.createCriteria()
        def iPR = InProgressRecords.createCriteria()
        def iPRData = iPR {
            eq("village", village)
            eq("year", Integer.parseInt(params.year))
            eq("month", Integer.parseInt(params.month))
        }
        if (iPRData.size()!=0) {
            status.put(Categories.INFRASTRUCTURE.value(), true)
            status.put(Categories.HEALTH.value(), true)
            status.put(Categories.EDUCATION.value(), true)
        } else {
            def iData = i {
                eq("village", village)
                eq("year", Integer.parseInt(params.year))
                eq("month", Integer.parseInt(params.month))
            }
            if (iData.size() == 0) {
                status.put(Categories.INFRASTRUCTURE.value(), false)
            } else {
                status.put(Categories.INFRASTRUCTURE.value(), true)
            }
            def hData = h {
                eq("village", village)
                eq("year", Integer.parseInt(params.year))
                eq("month", Integer.parseInt(params.month))
            }
            if (hData.size() == 0) {
                status.put(Categories.HEALTH.value(), false)
            } else {
                status.put(Categories.HEALTH.value(), true)
            }
            def eData = e {
                eq("village", village)
                eq("year", Integer.parseInt(params.year))
                eq("month", Integer.parseInt(params.month))
            }
            if (eData.size() == 0) {
                status.put(Categories.EDUCATION.value(), false)
            } else {
                status.put(Categories.EDUCATION.value(), true)
            }
        }
        return status
    }

    def getUser(user) {
        def ipRecord = InProgressRecords.findByUserCreated(user)
        if (!ipRecord) {
            return false;
        }
        else {
            return true
        }
    }

    /*
    * return education data objects with status is In-Progress
    * */

    def getCurrentIPEduData(user) {
        def ipRecord = InProgressRecords.findByUserCreated(user)
        def c = Education.createCriteria()
        def currentEduData = c {
            eq("userCreated", user)
            eq("status", DataStatus.INPROGRESS.value())
            eq("year", ipRecord.year)
            eq("month", ipRecord.month)
        }
        return currentEduData[0]
    }

    /*
   * return health data objects with status is In-Progress
   * */

    def getCurrentIHealthData(user) {

        def ipRecord = InProgressRecords.findByUserCreated(user)
        def c = HealthAndFamilyWelfare.createCriteria()
        def currentHealthData = c {
            eq("userCreated", user)
            eq("status", DataStatus.INPROGRESS.value())
            eq("year", ipRecord.year)
            eq("month", ipRecord.month)
        }

        return currentHealthData[0]
    }

    /*
    * return Infrastructural data objects with status is In-Progress
    * */

    def getCurrentIPInfData(user) {
        def ipRecord = InProgressRecords.findByUserCreated(user)
        def c = InfrastructuralFacilities.createCriteria()
        def currentInfData = c {
            eq("userCreated", user)
            eq("status", DataStatus.INPROGRESS.value())
            eq("year", ipRecord.year)
            eq("month", ipRecord.month)
        }
        return currentInfData[0]
    }

    def newEducationObj(cUser, village) {
        def ipRecord = InProgressRecords.findByUserCreated(cUser)
        def education = new Education()
        education.village = village
        education.month = ipRecord.month
        education.year = ipRecord.year
        education.userCreated = cUser
        education.userUpdated = cUser
        education.dateCreated = new Date()
        education.lastUpdated = new Date()
        education.status = DataStatus.INPROGRESS.value()
        education.save(flush: true)
        return education
    }

    def newNoOfEnrolmentInEdu(cUser, village) {
        def ipRecord = InProgressRecords.findByUserCreated(cUser)
        def noOfEnrolmentInEdu = new NoOfEnrolmentInEdu()
        noOfEnrolmentInEdu.village = village
        noOfEnrolmentInEdu.month = ipRecord.month
        noOfEnrolmentInEdu.year = ipRecord.year
        noOfEnrolmentInEdu.userCreated = cUser
        noOfEnrolmentInEdu.userUpdated = cUser
        noOfEnrolmentInEdu.dateCreated = new Date()
        noOfEnrolmentInEdu.lastUpdated = new Date()

        noOfEnrolmentInEdu.save(flush: true)
        return noOfEnrolmentInEdu
    }

    def newIsfObj(cUser, village) {
        def ipRecord = InProgressRecords.findByUserCreated(cUser)
        def isf = new InfrastructuralFacilities()
        isf.village = village
        isf.month = ipRecord.month
        isf.year = ipRecord.year
        isf.userCreated = cUser
        isf.userUpdated = cUser
        isf.dateCreated = new Date()
        isf.lastUpdated = new Date()
        isf.status = DataStatus.INPROGRESS.value()
        isf.save(flush: true)
        return isf
    }

    /*
   * Creating new object of HealthAndFamilyWelfare class and save in database.
   * */

    def newHealthObj(cUser, village) {
        def ipRecord = InProgressRecords.findByUserCreated(cUser)
        def health = new HealthAndFamilyWelfare()
        health.village = village
        health.month = ipRecord.month
        health.year = ipRecord.year
        health.govHospitals = newHealthHospitalObj(cUser, 'govHospitals')
        health.govDispensaries = newHealthHospitalObj(cUser, 'govDispensaries')
        health.primHealthCenter = newHealthHospitalObj(cUser, 'primHealthCenter')
        health.subCenter = newHealthHospitalObj(cUser, 'subCenter')
        health.commHealthCenter = newHealthHospitalObj(cUser, 'commHealthCenter')
        health.familyWelCenter = newHealthHospitalObj(cUser, 'familyWelCenter')
        health.ayurCenter = newHealthHospitalObj(cUser, 'ayurCenter')
        health.homeoCells = newHealthHospitalObj(cUser, 'homeoCells')
        health.otherCenters = newHealthHospitalObj(cUser, 'otherCenters')
        health.userCreated = cUser
        health.userUpdated = cUser
        health.dateCreated = new Date()
        health.lastUpdated = new Date()
        health.status = DataStatus.INPROGRESS.value()
        health.save(flush: true)
        return health
    }

    /*
    * Creating new object of Hospital class and save in database.
    *
    * */

    def newHealthHospitalObj(cUser, type) {
        def ipRecord = InProgressRecords.findByUserCreated(cUser)
        def hospital = new Hospital()
        hospital.userCreated = cUser
        hospital.userUpdated = cUser
        hospital.dateCreated = new Date()
        hospital.lastUpdated = new Date()
        hospital.type = type
        hospital.save(flush: true)
        return hospital
    }

    /*
    * After completion of data collection
    * this method just set flag inProgress to completed for all category.
    *
    * */

    def dataCollectionComplete(user, village) {
        def inProgressRecords = InProgressRecords.findByUserCreated(user)
        def education = Education.findByUserCreatedAndStatus(user, DataStatus.INPROGRESS.value())
        if (!education) {
            education = newEducationObj(user, village)
        }
        if (education) {
            education.status = DataStatus.COMPLETED.value()
            education.save(flush: true)
        }
        def health = HealthAndFamilyWelfare.findByUserCreatedAndStatus(user, DataStatus.INPROGRESS.value())
        if (!health) {
            health = newHealthObj(user, village)
        }
        if (health) {
            health.status = DataStatus.COMPLETED.value()
            health.save(flush: true)
        }
        def isf = InfrastructuralFacilities.findByUserCreatedAndStatus(user, DataStatus.INPROGRESS.value())
        if (!isf) {
            isf = newIsfObj(user, village)
        }
        if (isf) {
            isf.status = DataStatus.COMPLETED.value()
            isf.save(flush: true)
        }
        inProgressRecords.delete(flush: true)
    }

    /*
    * Return education data objects with status is completed
    * */

    def getEducationData(params) {
        log.debug("===getEducationData=============" + params)
        def village = Village.findByCode(params.vCode)
        def c = Education.createCriteria()
        def data = c.list {
            eq("status", DataStatus.COMPLETED.value())
            eq("year", Integer.parseInt(params.year))
            eq("month", Integer.parseInt(params.month))
            eq("village", village)
        }
        log.debug data[0]
        return data[0]
    }

    /*
    * Return health data objects with status is completed
    * */

    def getCurrentHealthData(params) {
        log.debug("===getHealthData=============" + params)
        def village = Village.findByCode(params.vCode)
        def c = HealthAndFamilyWelfare.createCriteria()
        def data = c.list {
            eq("status", DataStatus.COMPLETED.value())
            eq("year", Integer.parseInt(params.year))
            eq("month", Integer.parseInt(params.month))
            eq("village", village)
        }
        log.debug data[0]
        return data[0]
    }

    /*
    * Return infrastructural data objects with status is completed
    * */

    def getInfrastructureData(params) {
        log.debug("===getInfraData=============" + params)
        def village = Village.findByCode(params.vCode)
        def c = InfrastructuralFacilities.createCriteria()
        def data = c.list {
            eq("year", Integer.parseInt(params.year))
            eq("month", Integer.parseInt(params.month))
            eq("village", village)
        }
        return data[0]
    }


    def getIsfDataStateLevel(params) {
        def state;
        Map returnMap = [:]
        def finalList = [];
        def finalList1 = [];
        List<District> districts = District.list()

        // Now iterating through the Districts
        def HumanHospital = 0;
        def Veterinary = 0;

        def PuccaRoad = 0
        def SemiPucca = 0;
        def KatchaRoad = 0;
        def BusStop = 0;
        def PostOffice = 0;
        def Railway = 0;
        def Police = 0;
        def Hat = 0;
        def NameOfDay = 0;
        def schedulebank = 0;
        def regionalBank = 0;
        def CoOperativeBank = 0;
        def data;
        districts.each {district ->
            List<Block> blockList = Block.findAllByDistrict(district);
            blockList.each {block ->
                List<Village> villageList = Village.findAllByBlock(block);
                villageList.each {village ->
                    long id = village.id;

                    Village village1 = Village.findById(id);

                    data = InfrastructuralFacilities.createCriteria().list {
                        eq("year", Integer.parseInt(params.year1))
                        eq("month", Integer.parseInt(params.month1))
                        eq("village", village1)

                    };
                    if (data) {
                        data.each { data1->
                            int abc = data1.isf4;
                            HumanHospital += data1.isf3;
                            Veterinary += data1.isf4;
                            PuccaRoad += data1.isf5;
                            SemiPucca = data1.isf6;
                            KatchaRoad = data1.isf7;
                            BusStop = data1.isf8;
                            PostOffice = data1.isf9;
                            Railway = data1.isf10;
                            Police = data1.isf11;
                            Hat = data1.isf12;
                            NameOfDay = data1.isf13;
                            schedulebank = data1.isf14;
                            regionalBank = data1.isf15;
                            CoOperativeBank = data1.isf16;
//
                        }
                    }

                }
            }
            finalList1 = ['Assam', district.name, HumanHospital, Veterinary, PuccaRoad, SemiPucca, KatchaRoad, BusStop, PostOffice, Railway, Police, Hat, NameOfDay, schedulebank, regionalBank, CoOperativeBank, district.code];
            finalList.add(finalList1);
            HumanHospital = 0;
            Veterinary = 0;

            PuccaRoad = 0
            SemiPucca = 0;
            KatchaRoad = 0;
            BusStop = 0;
            PostOffice = 0;
            Railway = 0;
            Police = 0;
            Hat = 0;
            NameOfDay = 0;
            schedulebank = 0;
            regionalBank = 0;
            CoOperativeBank = 0;



            returnMap = [finalList: finalList, state: true];

        }

        return returnMap;
    }

    def getIsfDataBlockLevel(params) {
        def block1;
        def returnMap = [:];
        def finalList = [];
        def finalList1 = [];
        def HumanHospital = 0;
        def Veterinary = 0;
        def PuccaRoad = 0
        def SemiPucca = 0;
        def KatchaRoad = 0;
        def BusStop = 0;
        def PostOffice = 0;
        def Railway = 0;
        def Police = 0;
        def Hat = 0;
        def NameOfDay = 0;
        def schedulebank = 0;
        def regionalBank = 0;
        def CoOperativeBank = 0;

        def data;
        //to get blocks for corrp district.
        District d = District.findByCode(params.distCode)
        List blocks = Block.findAllByDistrict(d);

        blocks.each {b1 ->
            def year = Integer.parseInt(params.year1)
            def month = Integer.parseInt(params.month1);
            List villageList = Village.findAllByBlock(b1);
            villageList.each { village ->
                data = InfrastructuralFacilities.createCriteria().list {
                    eq("year", year);
                    eq("month", month);
                    eq("village", village)
                }
                if (data) {
                    data.each { data1 ->
                        HumanHospital += data1.isf3;
                        Veterinary += data1.isf4;
                        PuccaRoad += data1.isf5;
                        SemiPucca = data1.isf6;
                        KatchaRoad = data1.isf7;
                        BusStop = data1.isf8;
                        PostOffice = data1.isf9;
                        Railway = data1.isf10;
                        Police = data1.isf11;
                        Hat = data1.isf12;
                        NameOfDay = data1.isf13;
                        schedulebank = data1.isf14;
                        regionalBank = data1.isf15;
                        CoOperativeBank = data1.isf16;
                    }
                }

            }
            finalList1 = [d.name, b1.name, HumanHospital, Veterinary, PuccaRoad, SemiPucca, KatchaRoad, BusStop, PostOffice, Railway, Police, Hat, NameOfDay, schedulebank, regionalBank, CoOperativeBank, d.code, b1.code];
            finalList.add(finalList1);
            HumanHospital = 0;
            Veterinary = 0;
            PuccaRoad = 0
            SemiPucca = 0;
            KatchaRoad = 0;
            BusStop = 0;
            PostOffice = 0;
            Railway = 0;
            Police = 0;
            Hat = 0;
            NameOfDay = 0;
            schedulebank = 0;
            regionalBank = 0;
            CoOperativeBank = 0;
            returnMap = [finalList: finalList, block1: true];

        }

        return returnMap;
    }

    def getIsfDataVillageLevel(params) {
        def villagereport;
        def returnMap;
        def finalList = [];
        def finalList1 = [];
        def HumanHospital = 0;
        def Veterinary = 0;
        def PuccaRoad = 0
        def SemiPucca = 0;
        def KatchaRoad = 0;
        def BusStop = 0;
        def PostOffice = 0;
        def Railway = 0;
        def Police = 0;
        def Hat = 0;
        def NameOfDay = 0;
        def schedulebank = 0;
        def regionalBank = 0;
        def CoOperativeBank = 0;
        def data;
        //get the block corresponding to this id
        Block b = Block.findByCode(params.distCode);
        List villages = Village.findAllByBlock(b);

        villages.each {village ->
            data = InfrastructuralFacilities.createCriteria().list {
                eq("year", Integer.parseInt(params.year1));
                eq("month", Integer.parseInt(params.month1));
                eq("village", village)
            }
            if (data) {
                data.each { data1 ->
                    HumanHospital += data1.isf3;
                    Veterinary += data1.isf4;
                    PuccaRoad += data1.isf5;
                    SemiPucca = data1.isf6;
                    KatchaRoad = data1.isf7;
                    BusStop = data1.isf8;
                    PostOffice = data1.isf9;
                    Railway = data1.isf10;
                    Police = data1.isf11;
                    Hat = data1.isf12;
                    NameOfDay = data1.isf13;
                    schedulebank = data1.isf14;
                    regionalBank = data1.isf15;
                    CoOperativeBank = data1.isf16;
                }
            }

            finalList1 = [b.name, village.name, HumanHospital, Veterinary, PuccaRoad, SemiPucca, KatchaRoad, BusStop, PostOffice, Railway, Police, Hat, NameOfDay, schedulebank, regionalBank, CoOperativeBank, village.code, b.code];
            finalList.add(finalList1);
            HumanHospital = 0;
            Veterinary = 0;
            PuccaRoad = 0
            SemiPucca = 0;
            KatchaRoad = 0;
            BusStop = 0;
            PostOffice = 0;
            Railway = 0;
            Police = 0;
            Hat = 0;
            NameOfDay = 0;
            schedulebank = 0;
            regionalBank = 0;
            CoOperativeBank = 0;
            returnMap = [finalList: finalList, villagereport: true];
        }
        return returnMap;
    }

    def getIsfDataStateLevel2(params) {
        def state;
        List<District> districts = District.list()
        def cottage = 0;
        def handlooms = 0;
        def powerlooms = 0;
        def agriculture = 0;
        def marketing = 0;
        def farming = 0;
        def primaryCoperative = 0;
        def PDS = 0;
        def returnMap = [:];
        def finalList = [];
        def finalList1 = [];
        def data;
        districts.each {district ->
            List<Block> blockList = Block.findAllByDistrict(district);
            blockList.each {block ->

                List<Village> villageList = Village.findAllByBlock(block);
                def year = Integer.parseInt(params.year1);
                def month = Integer.parseInt(params.month1)
                villageList.each {village ->
                    long id = village.id;

                    Village village1 = Village.findById(id);


                    data = InfrastructuralFacilities.createCriteria().list {
                        eq("year", year)
                        eq("month", month)
                        eq("village", village1)

                    };

                    if (data) {
                        data.each { data1 ->
                            cottage = data1.isf17
                            handlooms = data1.isf18;
                            powerlooms = data1.isf19;
                            agriculture = data1.isf20;
                            marketing = data1.isf21;
                            farming = data1.isf22;
                            primaryCoperative = data1.isf23;
                            PDS = data1.isf24;
                        }
                    }


                }
            }
            finalList1 = ['Assam', district.name, cottage, handlooms, powerlooms, agriculture, marketing, farming, primaryCoperative, PDS, district.id];
            finalList.add(finalList1);
            cottage = 0;
            handlooms = 0;
            powerlooms = 0;
            agriculture = 0;
            marketing = 0;
            farming = 0;
            primaryCoperative = 0;
            PDS = 0;
            returnMap = [finalList: finalList, state: true];
        }
        return returnMap;
    }

    def getIsfDataBlockLevel2(params) {

        def block1;
        def returnMap = [:];
        def finalList = [];
        def finalList1 = [];
        def cottage = 0;
        def handlooms = 0;
        def powerlooms = 0;
        def agriculture = 0;
        def marketing = 0;
        def farming = 0;
        def primaryCoperative = 0;
        def PDS = 0;

        def data;
        //to get blocks for corrp district.
        District d = District.findByCode(params.distCode);

        List<Block> blocks = Block.findAllByDistrict(d);

        blocks.each {b1 ->
            def year = Integer.parseInt(params.year1)
            def month = Integer.parseInt(params.month1);
            List villageList = Village.findAllByBlock(b1);
            villageList.each { village ->
                data = InfrastructuralFacilities.createCriteria().list {
                    eq("year", year);
                    eq("month", month);
                    eq("village", village)
                }
                if (data) {
                    data.each { data1 ->
                        cottage = data1.isf17
                        handlooms = data1.isf18;
                        powerlooms = data1.isf19;
                        agriculture = data1.isf20;
                        marketing = data1.isf21;
                        farming = data1.isf22;
                        primaryCoperative = data1.isf23;
                        PDS = data1.isf24;
                    }
                }


            }
            finalList1 = [d.name, b1.name, cottage, handlooms, powerlooms, agriculture, marketing, farming, primaryCoperative, PDS, b1.code, d.code];
            finalList.add(finalList1);
            cottage = 0;
            handlooms = 0;
            powerlooms = 0;
            agriculture = 0;
            marketing = 0;
            farming = 0;
            primaryCoperative = 0;
            PDS = 0;
            returnMap = [finalList: finalList, block1: true];

        }

        return returnMap;et
    }

    def getIsfDataVillageLevel2(params) {
        def villagereport;
        def returnMap;
        def finalList = [];
        def finalList1 = [];
        def cottage = 0;
        def handlooms = 0;
        def powerlooms = 0;
        def agriculture = 0;
        def marketing = 0;
        def farming = 0;
        def primaryCoperative = 0;
        def PDS = 0;
        def data;
        //get the block corresponding to this id
        Block b = Block.findByCode(params.distCode);
        List villages = Village.findAllByBlock(b);

        villages.each {village ->
            data = InfrastructuralFacilities.createCriteria().list {
                eq("year", Integer.parseInt(params.year1));
                eq("month", Integer.parseInt(params.month1));
                eq("village", village)
            }
            if (data) {
                data.each { data1 ->
                    cottage = data1.isf17
                    handlooms = data1.isf18;
                    powerlooms = data1.isf19;
                    agriculture = data1.isf20;
                    marketing = data1.isf21;
                    farming = data1.isf22;
                    primaryCoperative = data1.isf23;
                    PDS = data1.isf24;
                }
            }

            finalList1 = [b.name, village.name, cottage, handlooms, powerlooms, agriculture, marketing, farming, primaryCoperative, PDS, village.code, b.code];
            finalList.add(finalList1);
            cottage = 0;
            handlooms = 0;
            powerlooms = 0;
            agriculture = 0;
            marketing = 0;
            farming = 0;
            primaryCoperative = 0;
            PDS = 0;
            returnMap = [finalList: finalList, villagereport: true];
        }
        return returnMap;
    }

    // Getting data for State Level for Education Page 2
    def getEducation2DataStateLevel(params) {

        Map returnMap = [:]
        def finalList = [];
        def finalList1 = [];


        Integer studentEnrolledBoys = 0;
        Integer studentEnrolledGirls = 0;
        Integer studentAttendingBoys = 0;
        Integer studentAttendingGirls = 0;
        Integer newEntrantsBoys = 0;
        Integer newEntrantsGirls = 0;
        Integer studentDiscontinuedStudiesBoys = 0;
        Integer studentDiscontinuedStudiesGirls = 0;
        Integer noOfTeacherMale = 0;
        Integer noOfTeacherFemale = 0;
        Integer noChildNeverEnrolled = 0;
        Integer reasonOfDiscontinuationEconomic = 0;
        Integer reasonOfDiscontinuationNonEconomic = 0;
        List<District> districts = District.list()
        def data;
        districts.each {district ->
            List<Block> blockList = Block.findAllByDistrict(district);
            blockList.each {block ->
                List<Village> villageList = Village.findAllByBlock(block);
                int year = Integer.parseInt(params.year);
                int month = Integer.parseInt(params.month)
                String type = params.type;   //This field distinguish whether the data is Primary,Pre-Primary,Secondary,Senior Secondary
                villageList.each {village ->
                    long id = village.id;
                    Village village1 = Village.findById(id);
                    data = NoOfEnrolmentInEdu.createCriteria().list {
                        eq("year", year)
                        eq("month", month)
                        eq("village", village1)
                        eq("institutionType", type);

                    };
                    if (data) {
                        data.each {data1 ->
                            studentEnrolledBoys += data1.studentEnrolledBoys;
                            studentEnrolledGirls += data1.studentEnrolledGirls
                            studentAttendingBoys += data1.studentAttendingBoys
                            studentAttendingGirls += data1.studentAttendingGirls
                            newEntrantsBoys += data1.newEntrantsBoys
                            newEntrantsGirls += data1.newEntrantsGirls;
                            studentDiscontinuedStudiesBoys += data1.studentDiscontinuedStudiesBoys
                            studentDiscontinuedStudiesGirls = data1.studentDiscontinuedStudiesGirls
                            noOfTeacherMale += data1.noOfTeacherMale;
                            noOfTeacherFemale += data1.noOfTeacherFemale;

                            reasonOfDiscontinuationEconomic += data1.reasonOfDiscontinuationEconomic
                            reasonOfDiscontinuationNonEconomic += data1.reasonOfDiscontinuationNonEconomic;
                            noChildNeverEnrolled += data1.noChildNeverEnrolled;

                        }
                    }

                }
            }

            finalList1 = ['Assam', district.name, studentEnrolledBoys, studentEnrolledGirls, studentAttendingBoys, studentAttendingGirls, newEntrantsBoys, newEntrantsGirls, studentDiscontinuedStudiesBoys, studentDiscontinuedStudiesGirls, noOfTeacherMale, noOfTeacherFemale, noChildNeverEnrolled, reasonOfDiscontinuationEconomic, reasonOfDiscontinuationNonEconomic, district.id, params.month, params.year];
            finalList.add(finalList1);
            studentEnrolledBoys = 0;
            studentEnrolledGirls = 0;
            studentAttendingBoys = 0;
            studentAttendingGirls = 0;
            newEntrantsBoys = 0;
            newEntrantsGirls = 0;
            studentDiscontinuedStudiesBoys = 0;
            studentDiscontinuedStudiesGirls = 0;
            reasonOfDiscontinuationEconomic = 0;
            reasonOfDiscontinuationNonEconomic = 0;
            noOfTeacherMale = 0;
            noOfTeacherFemale = 0;
            noChildNeverEnrolled = 0;
        }
        returnMap = [finalList: finalList, block: false, village: false, state: true];
        return returnMap;

    }
    //-------------------------------------------------------------------------------------------------//


    /* This Function gets the data for District Level */

    def getEducationDataStateLevel(params) {
        Map returnMap = [:]
        def finalList = [];
        def finalList1 = [];

        List<District> districts = District.list()
        // Now iterating through the Districts
        def noAdultCenter = 0;
        def noAdultEducated = 0;

        def noPrePrimary = 0
        def noPrimary = 0;
        def noMiddle = 0;
        def noSecondary = 0;
        def noHigherSecondary = 0;
        def data;
        districts.each {district ->
            List<Block> blockList = Block.findAllByDistrict(district);
            blockList.each {block ->
                List<Village> villageList = Village.findAllByBlock(block);
                int year = Integer.parseInt(params.year);
                int month = Integer.parseInt(params.month)
                villageList.each {village ->
                    long id = village.id;
                    Village village1 = Village.findById(id);


                    data = Education.createCriteria().list {
                        eq("year", year)
                        eq("month", month)
                        eq("village", village1)

                    };
                    if (data) {
                        data.each { data1 ->
                            int var = data1.edu3;
                            int abc = data1.edu3
                            noAdultCenter = noAdultCenter + data1.edu3;
                            noAdultEducated += data1.edu4;
                            noPrePrimary += data1.edu5;
                            noPrimary = data1.edu6;
                            noMiddle = data1.edu7;
                            noSecondary = data1.edu8;
                            noHigherSecondary = data1.edu9;
                        }
                    }

                }


            }
            finalList1 = ['Assam', district.name, noAdultCenter, noAdultEducated, noPrePrimary, noPrimary, noMiddle, noSecondary, noHigherSecondary, district.id, params.month, params.year];
            finalList.add(finalList1);
            noAdultCenter = 0;
            noAdultEducated = 0;
            noPrePrimary = 0
            noPrimary = 0;
            noMiddle = 0;
            noSecondary = 0;
            noHigherSecondary = 0;

        }

//        return data[0];
        returnMap = [finalList: finalList, block: false, village: false, state: true];
        return returnMap;


    }
    //-------------------------------------------------------------------------------------------------//

    /* Get Education Page 2 Data for Block Level*/

    def getEducation2DataBlockLevel(params) {
        Map returnMap = [:]
        def finalList = [];
        def finalList1 = [];

        Integer studentEnrolledBoys = 0;
        Integer studentEnrolledGirls = 0;
        Integer studentAttendingBoys = 0;
        Integer studentAttendingGirls = 0;
        Integer newEntrantsBoys = 0;
        Integer newEntrantsGirls = 0;
        Integer studentDiscontinuedStudiesBoys = 0;
        Integer studentDiscontinuedStudiesGirls = 0;
        Integer noOfTeacherMale = 0;
        Integer noOfTeacherFemale = 0;
        Integer noChildNeverEnrolled = 0;
        def data;
        District d = District.findById(params.id)

        List<Block> blockList = Block.findAllByDistrict(d);
        blockList.each {block ->

            List<Village> villageList = Village.findAllByBlock(block);
            int year = Integer.parseInt(params.year);

            String type = params.type;
            villageList.each {village ->
                long id = village.id;
                Village village1 = Village.findById(id);
                data = NoOfEnrolmentInEdu.createCriteria().list {
                    eq("year", year)
                    eq("month", month)
                    eq("village", village1)
                    eq("institutionType", type)

                };
                if (data) {
                    data.each { data1 ->
                        studentEnrolledBoys += data1.studentEnrolledBoys;
                        studentEnrolledGirls += data1.studentEnrolledGirls
                        studentAttendingBoys += data1.studentAttendingBoys
                        studentAttendingGirls += data1.studentAttendingGirls
                        newEntrantsBoys += data1.newEntrantsBoys
                        newEntrantsGirls += data1.newEntrantsBoys;
                        studentDiscontinuedStudiesBoys += data1.studentDiscontinuedStudiesBoys
                        studentDiscontinuedStudiesGirls = data1.studentDiscontinuedStudiesGirls
                        noOfTeacherMale += data1.noOfTeacherMale;
                        noOfTeacherFemale += data1.noOfTeacherFemale;
                        noChildNeverEnrolled += data1.noChildNeverEnrolled;
                    }
                }


            }
            finalList1 = [d.name, block.name, studentEnrolledBoys, studentEnrolledGirls, studentAttendingBoys, studentAttendingGirls, newEntrantsBoys, newEntrantsGirls, studentDiscontinuedStudiesBoys, studentDiscontinuedStudiesGirls, noOfTeacherMale, noOfTeacherFemale, noChildNeverEnrolled, block.id, params.month, params.year];
            finalList.add(finalList1);
            studentEnrolledBoys = 0;
            studentEnrolledGirls = 0;
            studentAttendingBoys = 0;
            studentAttendingGirls = 0;
            newEntrantsBoys = 0;
            newEntrantsGirls = 0;
            studentDiscontinuedStudiesBoys = 0;
            studentDiscontinuedStudiesGirls = 0;
            noOfTeacherMale = 0;
            noOfTeacherFemale = 0;
            noChildNeverEnrolled = 0;


        }
        returnMap = [finalList: finalList, block: true, village: false, state: false];
        return returnMap;

    }
    //-------------------------------------------------------------------------------------------------//

    //-------------------------------------------------------------------------------------------------//


    //Get Education Data for Block Level
    def getEducationDataBlockLevel(params) {
        def finalList = [];
        def finalList1 = [];
        def noAdultCenter = 0;
        def noAdultEducated = 0;

        def noPrePimary = 0
        def noPrimary = 0;
        def noMiddle = 0;
        def noSecondary = 0;
        def noHigherSecondary = 0;
        def data;
        //get all the blocks corresponding to this district
        District d = District.findById(params.id)
        List blocks = Block.findAllByDistrict(d);
        blocks.each {b1 ->
            def year = Integer.parseInt(params.year)

            def month = Integer.parseInt(params.month);

            List villageList = Village.findAllByBlock(b1);
            villageList.each { village ->
                data = Education.createCriteria().list {

                    eq("year", year);
                    eq("month", month);
                    eq("village", village)

                }

                if (data) {
                    data.each { data1 ->
                        int var = data1.edu3;
                        int abc = data1.edu3
                        noAdultCenter = noAdultCenter + data1.edu3;
                        noAdultEducated += data1.edu4;
                        noPrePimary += data1.edu5;
                        noPrimary = data1.edu6;
                        noMiddle = data1.edu7;
                        noSecondary = data1.edu8;
                        noHigherSecondary = data1.edu9;
                    }
                }

            }
            finalList1 = [d.name, b1.name, noAdultCenter, noAdultEducated, noPrePimary, noPrimary, noMiddle, noSecondary, noHigherSecondary, b1.id, params.month, params.year];
            finalList.add(finalList1);
        }



        def returnMap = [:];
        returnMap = [finalList: finalList, block: true];
        return returnMap
    }
    //-------------------------------------------------------------------------------------------------//


    //-------------------------------------------------------------------------------------------------//


    // Get Education Data For Education Page 2 at Village Level
    def getEducation2DataVillageLevel(params) {

        Map returnMap = [:]
        def finalList = [];
        def finalList1 = [];


        Integer studentEnrolledBoys = 0;
        Integer studentEnrolledGirls = 0;
        Integer studentAttendingBoys = 0;
        Integer studentAttendingGirls = 0;
        Integer newEntrantsBoys = 0;
        Integer newEntrantsGirls = 0;
        Integer studentDiscontinuedStudiesBoys = 0;
        Integer studentDiscontinuedStudiesGirls = 0;
        Integer noOfTeacherMale = 0;
        Integer noOfTeacherFemale = 0;
        Integer noChildNeverEnrolled = 0;
        def data;


        Block b = Block.findByName(params.blockName);
//               Block b=Block.findByDistrict(params.id) ;
        List<Village> villageList = Village.findAllByBlock(b);
        int year = Integer.parseInt(params.year);
        int month = Integer.parseInt(params.month)
        String type = params.type;
        villageList.each {village ->
            long id = village.id;
            Village village1 = Village.findById(id);
            data = NoOfEnrolmentInEdu.createCriteria().list {
                eq("year", year)
                eq("month", month)
                eq("village", village1)
                eq("institutionType", type)

            };

            if (data) {
                data.each { data1 ->

                    studentEnrolledBoys += data1.studentEnrolledBoys;
                    studentEnrolledGirls += data1.studentEnrolledGirls
                    studentAttendingBoys += data1.studentAttendingBoys
                    studentAttendingGirls += data1.studentAttendingGirls
                    newEntrantsBoys += data1.newEntrantsBoys
                    newEntrantsGirls += data1.newEntrantsBoys;
                    studentDiscontinuedStudiesBoys += data1.studentDiscontinuedStudiesBoys
                    studentDiscontinuedStudiesGirls = data1.studentDiscontinuedStudiesGirls
                    noOfTeacherMale += data1.noOfTeacherMale;
                    noOfTeacherFemale += data1.noOfTeacherFemale;
                    noChildNeverEnrolled += data1.noChildNeverEnrolled;
                }

                finalList1 = [b.name, village.name, studentEnrolledBoys, studentEnrolledGirls, studentAttendingBoys, studentAttendingGirls, newEntrantsBoys, newEntrantsGirls, studentDiscontinuedStudiesBoys, studentDiscontinuedStudiesGirls, noOfTeacherMale, noOfTeacherFemale, noChildNeverEnrolled, village.id, params.month, params.year];
                finalList.add(finalList1);
                studentEnrolledBoys = 0;
                studentEnrolledGirls = 0;
                studentAttendingBoys = 0;
                studentAttendingGirls = 0;
                newEntrantsBoys = 0;
                newEntrantsGirls = 0;
                studentDiscontinuedStudiesBoys = 0;
                studentDiscontinuedStudiesGirls = 0;
                noOfTeacherMale = 0;
                noOfTeacherFemale = 0;
                noChildNeverEnrolled = 0;
            }


        }
        returnMap = [finalList: finalList, block: false, village: true, state: false];
        return returnMap;
    }

    //-------------------------------------------------------------------------------------------------//
    //Getting  Education Data  for Village Level  For Education Page 1
    def getEducationDataVillageLevel(params) {
        def finalList = [];
        def finalList1 = [];
        def noAdultCenter = 0;
        def noAdultEducated = 0;

        def noPrePimary = 0
        def noPrimary = 0;
        def noMiddle = 0;
        def noSecondary = 0;
        def noHigherSecondary = 0;
        def data;
        //get the block corresponding to this id
        Block b = Block.findByName(params.blockName)
        List villageList = Village.findAllByBlock(b);
        def year = Integer.parseInt(params.year);
        def month = Integer.parseInt(params.month);
        villageList.each {village ->
            data = Education.createCriteria().list {

                eq("year", year);
                eq("month", month);
                eq("village", village)

            }

            if (data) {
                data.each { data1 ->
                    int var = data1.edu3;
                    int abc = data1.edu3
                    noAdultCenter = noAdultCenter + data1.edu3;
                    noAdultEducated += data1.edu4;
                    noPrePimary += data1.edu5;
                    noPrimary = data1.edu6;
                    noMiddle = data1.edu7;
                    noSecondary = data1.edu8;
                    noHigherSecondary = data1.edu9;
                }
            }

            finalList1 = [b.name, village.name, noAdultCenter, noAdultEducated, noPrePimary, noPrimary, noMiddle, noSecondary, noHigherSecondary, village.code, params.month, params.year];
            finalList.add(finalList1);
        }
        Map returnMap = [:];
        returnMap = [finalList: finalList, village: true]
        return returnMap
    }

    def getEducationDataDegreeStateLevel(params) {

        def finalList = [];
        def finalList1 = [];

        Integer noOfStudentEnrolledBoys = 0;
        Integer noOfStudentEnrolledGirls = 0;
        Integer noOfStudentAttendingBoys = 0;
        Integer noOfStudentAttendingGirls = 0;
        Integer noOfNewEntrantsEntryBoys = 0;
        Integer noOfNewEntrantsEntryGirls = 0;
        Integer noOfStudentDiscontinuedStudiesBoys = 0;
        Integer noOfStudentDiscontinuedStudiesGirls = 0;
        Integer reasonOfDiscontinuationEconomic = 0;
        Integer reasonOfDiscontinuationNonEconomic = 0;
        Integer noOfStudentsEnrolledInUniversityBoys = 0;
        Integer noOfStudentsEnrolledInUniversityGirls = 0;
        List<District> districts = District.list()
        def data;
        def returnMap;
        districts.each {district ->
            List<Block> blockList = Block.findAllByDistrict(district);
            blockList.each {block ->
                List<Village> villageList = Village.findAllByBlock(block);
                int year = Integer.parseInt(params.year);
                int month = Integer.parseInt(params.month)
                villageList.each {village ->
                    long id = village.id;
                    Village village1 = Village.findById(id);

                    data = NoOfEnrolmentInCollege.createCriteria().list {
                        eq("year", year)
                        eq("month", month)
                        eq("village", village1)

                    };
                    if (data) {
                        data.each {data1 ->
                            noOfStudentEnrolledBoys += data1.noOfStudentEnrolledBoys;

                            noOfStudentEnrolledGirls += data1.noOfStudentEnrolledGirls;
                            noOfStudentAttendingBoys += data1.noOfStudentAttendingBoys
                            noOfStudentAttendingGirls += data1.noOfStudentAttendingGirls
                            noOfNewEntrantsEntryBoys += data1.noOfNewEntrantsEntryBoys
                            noOfNewEntrantsEntryGirls += data1.noOfNewEntrantsEntryGirls;
                            noOfStudentDiscontinuedStudiesBoys += data1.noOfStudentDiscontinuedStudiesBoys
                            noOfStudentDiscontinuedStudiesGirls = data1.noOfStudentDiscontinuedStudiesGirls
                            noOfStudentsEnrolledInUniversityBoys += data1.noOfStudentsEnrolledInUniversityBoys;
                            noOfStudentsEnrolledInUniversityGirls += data1.noOfStudentsEnrolledInUniversityGirls;
                            reasonOfDiscontinuationEconomic += data1.reasonOfDiscontinuationEconomic
                            reasonOfDiscontinuationNonEconomic += data1.reasonOfDiscontinuationNonEconomic;

                        }
                    }

                }
            }

            finalList1 = ['Assam', district.name, noOfStudentEnrolledBoys, noOfStudentEnrolledGirls, noOfStudentAttendingBoys, noOfStudentAttendingGirls, noOfNewEntrantsEntryBoys, noOfNewEntrantsEntryGirls, noOfStudentDiscontinuedStudiesBoys, noOfStudentDiscontinuedStudiesGirls, reasonOfDiscontinuationEconomic, reasonOfDiscontinuationNonEconomic, noOfStudentsEnrolledInUniversityBoys, noOfStudentsEnrolledInUniversityGirls, district.id, params.month, params.year];
            finalList.add(finalList1);
            noOfStudentEnrolledBoys = 0;
            noOfStudentEnrolledGirls = 0;
            noOfStudentAttendingBoys = 0;
            noOfStudentAttendingGirls = 0;
            noOfNewEntrantsEntryBoys = 0;
            noOfNewEntrantsEntryGirls = 0;
            noOfStudentDiscontinuedStudiesBoys = 0;
            noOfStudentDiscontinuedStudiesGirls = 0;
            reasonOfDiscontinuationEconomic = 0;
            reasonOfDiscontinuationNonEconomic = 0;
            noOfStudentsEnrolledInUniversityBoys = 0;
            noOfStudentsEnrolledInUniversityGirls = 0;
        }
        returnMap = [finalList: finalList, block: false, village: false, state: true];
        return returnMap;
    }

    //-------------------------------------------------------------------------------------------------//
    //Getting  Education Data  for Block Level  For EducationDataDegree_level
    def getEducationDataDegreeBlockLevel(params) {
        def finalList = [];
        def finalList1 = [];

        Integer noOfStudentEnrolledBoys = 0;
        Integer noOfStudentEnrolledGirls = 0;
        Integer noOfStudentAttendingBoys = 0;
        Integer noOfStudentAttendingGirls = 0;
        Integer noOfNewEntrantsEntryBoys = 0;
        Integer noOfNewEntrantsEntryGirls = 0;
        Integer noOfStudentDiscontinuedStudiesBoys = 0;
        Integer noOfStudentDiscontinuedStudiesGirls = 0;
        Integer reasonOfDiscontinuationEconomic = 0;
        Integer reasonOfDiscontinuationNonEconomic = 0;
        Integer noOfStudentsEnrolledInUniversityBoys = 0;
        Integer noOfStudentsEnrolledInUniversityGirls = 0;
        List<District> districts = District.list()
        def data;
        District d = District.findById(params.id)

        def returnMap;

        List<Block> blockList = Block.findAllByDistrict(d);
        blockList.each {block ->
            List<Village> villageList = Village.findAllByBlock(block);
            int year = Integer.parseInt(params.year);
            int month = Integer.parseInt(params.month)
            villageList.each {village ->
                long id = village.id;
                Village village1 = Village.findById(id);

                data = NoOfEnrolmentInCollege.createCriteria().list {
                    eq("year", year)
                    eq("month", month)
                    eq("village", village1)

                };
                if (data) {
                    data.each {data1 ->
                        noOfStudentEnrolledBoys += data1.noOfStudentEnrolledBoys;
                        noOfStudentEnrolledGirls += data1.noOfStudentEnrolledGirls;
                        noOfStudentAttendingBoys += data1.noOfStudentAttendingBoys
                        noOfStudentAttendingGirls += data1.noOfStudentAttendingGirls
                        noOfNewEntrantsEntryBoys += data1.noOfNewEntrantsEntryBoys
                        noOfNewEntrantsEntryGirls += data1.noOfNewEntrantsEntryGirls;
                        noOfStudentDiscontinuedStudiesBoys += data1.noOfStudentDiscontinuedStudiesBoys
                        noOfStudentDiscontinuedStudiesGirls = data1.noOfStudentDiscontinuedStudiesGirls
                        noOfStudentsEnrolledInUniversityBoys += data1.noOfStudentsEnrolledInUniversityBoys;
                        noOfStudentsEnrolledInUniversityGirls += data1.noOfStudentsEnrolledInUniversityGirls;
                        reasonOfDiscontinuationEconomic += data1.reasonOfDiscontinuationEconomic
                        reasonOfDiscontinuationNonEconomic += data1.reasonOfDiscontinuationNonEconomic;

                    }
                }

            }


            finalList1 = [d.name, block.name, noOfStudentEnrolledBoys, noOfStudentEnrolledGirls, noOfStudentAttendingBoys, noOfStudentAttendingGirls, noOfNewEntrantsEntryBoys, noOfNewEntrantsEntryGirls, noOfStudentDiscontinuedStudiesBoys, noOfStudentDiscontinuedStudiesGirls, reasonOfDiscontinuationEconomic, reasonOfDiscontinuationNonEconomic, noOfStudentsEnrolledInUniversityBoys, noOfStudentsEnrolledInUniversityGirls, block.id, params.month, params.year];
            finalList.add(finalList1);
            noOfStudentEnrolledBoys = 0;
            noOfStudentEnrolledGirls = 0;
            noOfStudentAttendingBoys = 0;
            noOfStudentAttendingGirls = 0;
            noOfNewEntrantsEntryBoys = 0;
            noOfNewEntrantsEntryGirls = 0;
            noOfStudentDiscontinuedStudiesBoys = 0;
            noOfStudentDiscontinuedStudiesGirls = 0;
            reasonOfDiscontinuationEconomic = 0;
            reasonOfDiscontinuationNonEconomic = 0;
            noOfStudentsEnrolledInUniversityBoys = 0;
            noOfStudentsEnrolledInUniversityGirls = 0;


        }
        returnMap = [finalList: finalList, block: true, village: false, state: false];
        return returnMap;
    }

    //-------------------------------------------------------------------------------------------------//
    //Getting  Education Data  for Village Level  For EducationDataDegree_level
    def getEducationDataDegreeVillageLevel(params) {

        def finalList = [];
        def finalList1 = [];

        Integer noOfStudentEnrolledBoys = 0;
        Integer noOfStudentEnrolledGirls = 0;
        Integer noOfStudentAttendingBoys = 0;
        Integer noOfStudentAttendingGirls = 0;
        Integer noOfNewEntrantsEntryBoys = 0;
        Integer noOfNewEntrantsEntryGirls = 0;
        Integer noOfStudentDiscontinuedStudiesBoys = 0;
        Integer noOfStudentDiscontinuedStudiesGirls = 0;
        Integer reasonOfDiscontinuationEconomic = 0;
        Integer reasonOfDiscontinuationNonEconomic = 0;
        Integer noOfStudentsEnrolledInUniversityBoys = 0;
        Integer noOfStudentsEnrolledInUniversityGirls = 0;
        Block b = Block.findByName(params.blockName);
//    Block b=Block.findById(params.id) ;
        def data;
        List villageList = Village.findAllByBlock(b);
        def returnMap;

        int year = Integer.parseInt(params.year);
        int month = Integer.parseInt(params.month)
        villageList.each {village ->
            long id = village.id;
            Village village1 = Village.findById(id);

            data = NoOfEnrolmentInCollege.createCriteria().list {
                eq("year", year)
                eq("month", month)
                eq("village", village1)

            };
            if (data) {
                data.each {data1 ->
                    noOfStudentEnrolledBoys += data1.noOfStudentEnrolledBoys;
                    noOfStudentEnrolledGirls += data1.noOfStudentEnrolledGirls;
                    noOfStudentAttendingBoys += data1.noOfStudentAttendingBoys
                    noOfStudentAttendingGirls += data1.noOfStudentAttendingGirls
                    noOfNewEntrantsEntryBoys += data1.noOfNewEntrantsEntryBoys
                    noOfNewEntrantsEntryGirls += data1.noOfNewEntrantsEntryGirls;
                    noOfStudentDiscontinuedStudiesBoys += data1.noOfStudentDiscontinuedStudiesBoys
                    noOfStudentDiscontinuedStudiesGirls = data1.noOfStudentDiscontinuedStudiesGirls
                    noOfStudentsEnrolledInUniversityBoys += data1.noOfStudentsEnrolledInUniversityBoys;
                    noOfStudentsEnrolledInUniversityGirls += data1.noOfStudentsEnrolledInUniversityGirls;
                    reasonOfDiscontinuationEconomic += data1.reasonOfDiscontinuationEconomic
                    reasonOfDiscontinuationNonEconomic += data1.reasonOfDiscontinuationNonEconomic;

                }
            }

            finalList1 = [b.name, village.name, noOfStudentEnrolledBoys, noOfStudentEnrolledGirls, noOfStudentAttendingBoys, noOfStudentAttendingGirls, noOfNewEntrantsEntryBoys, noOfNewEntrantsEntryGirls, noOfStudentDiscontinuedStudiesBoys, noOfStudentDiscontinuedStudiesGirls, reasonOfDiscontinuationEconomic, reasonOfDiscontinuationNonEconomic, noOfStudentsEnrolledInUniversityBoys, noOfStudentsEnrolledInUniversityGirls, village.id, params.month, params.year];
            finalList.add(finalList1);
            noOfStudentEnrolledBoys = 0;
            noOfStudentEnrolledGirls = 0;
            noOfStudentAttendingBoys = 0;
            noOfStudentAttendingGirls = 0;
            noOfNewEntrantsEntryBoys = 0;
            noOfNewEntrantsEntryGirls = 0;
            noOfStudentDiscontinuedStudiesBoys = 0;
            noOfStudentDiscontinuedStudiesGirls = 0;
            reasonOfDiscontinuationEconomic = 0;
            reasonOfDiscontinuationNonEconomic = 0;
            noOfStudentsEnrolledInUniversityBoys = 0;
            noOfStudentsEnrolledInUniversityGirls = 0;
        }


        returnMap = [finalList: finalList, block: true, village: false, state: false];
        return returnMap;
    }

    //-------------------------------------------------------------------------------------------------//
    //Getting  Education Data  for State Level For EducationDataTech_course
    def getEducationDataTech_CourseStateLevel(params) {

        def finalList = [];
        def finalList1 = [];

        Integer noOfStudentEnrolledInBeBtechBoys = 0;
        Integer noOfStudentEnrolledInBeBtechGirls = 0;
        Integer noOfStudentEnrolledInMbbsBoys = 0;
        Integer noOfStudentEnrolledInMbbsGirls = 0;
        Integer noOfStudentEnrolledInBvscBoys = 0;
        Integer noOfStudentEnrolledInBvscGirls = 0;
        Integer noOfStudentEnrolledInAgriMscBoys = 0;
        Integer noOfStudentEnrolledInAgriMscGirls = 0;
        Integer noOfStudentEnrolledInPolytechDeplomaBoys = 0;
        Integer noOfStudentEnrolledInPolytechDeplomaGirls = 0;
        Integer noOfStudentEnrolledInITIBoys = 0;
        Integer noOfStudentEnrolledInITIGirls = 0;
        Integer noOfStudentEnrolledInVocationalCourseBoys = 0;
        Integer noOfStudentEnrolledInVocationalCourseGirls = 0;
        List<District> districts = District.list()
        def data;
        def returnMap;
        districts.each {district ->
            List<Block> blockList = Block.findAllByDistrict(district);
            blockList.each {block ->
                List<Village> villageList = Village.findAllByBlock(block);
                int year = Integer.parseInt(params.year);
                int month = Integer.parseInt(params.month)
                villageList.each {village ->
                    long id = village.id;
                    Village village1 = Village.findById(id);

                    data = NoOfEnrolmentInOtherTechCourse.createCriteria().list {
                        eq("year", year)
                        eq("month", month)
                        eq("village", village1)
                    };
                    if (data) {
                        data.each {data1 ->
                            noOfStudentEnrolledInBeBtechBoys += data1.noOfStudentEnrolledInBeBtechBoys;

                            noOfStudentEnrolledInBeBtechGirls += data1.noOfStudentEnrolledInBeBtechGirls;
                            noOfStudentEnrolledInMbbsBoys += data1.noOfStudentEnrolledInMbbsBoys
                            noOfStudentEnrolledInMbbsGirls += data1.noOfStudentEnrolledInMbbsGirls
                            noOfStudentEnrolledInBvscBoys += data1.noOfStudentEnrolledInBvscBoys
                            noOfStudentEnrolledInBvscGirls += data1.noOfStudentEnrolledInBvscGirls;
                            noOfStudentEnrolledInAgriMscBoys += data1.noOfStudentEnrolledInAgriMscBoys
                            noOfStudentEnrolledInAgriMscGirls = data1.noOfStudentEnrolledInAgriMscGirls
                            noOfStudentEnrolledInPolytechDeplomaBoys += data1.noOfStudentEnrolledInPolytechDeplomaBoys;
                            noOfStudentEnrolledInITIBoys += data1.noOfStudentEnrolledInITIBoys;
                            noOfStudentEnrolledInPolytechDeplomaGirls += data1.noOfStudentEnrolledInPolytechDeplomaGirls
                            noOfStudentEnrolledInVocationalCourseBoys += data1.noOfStudentEnrolledInVocationalCourseBoys;

                        }
                    }

                }
            }

            finalList1 = ['Assam', district.name, noOfStudentEnrolledInBeBtechBoys, noOfStudentEnrolledInBeBtechGirls, noOfStudentEnrolledInMbbsBoys, noOfStudentEnrolledInMbbsGirls, noOfStudentEnrolledInBvscBoys, noOfStudentEnrolledInBvscGirls, noOfStudentEnrolledInAgriMscBoys, noOfStudentEnrolledInAgriMscGirls, noOfStudentEnrolledInPolytechDeplomaBoys, noOfStudentEnrolledInPolytechDeplomaGirls, noOfStudentEnrolledInITIBoys, noOfStudentEnrolledInITIGirls, noOfStudentEnrolledInVocationalCourseBoys, noOfStudentEnrolledInVocationalCourseGirls, district.id, params.month, params.year];
            finalList.add(finalList1);
            noOfStudentEnrolledInBeBtechBoys = 0;
            noOfStudentEnrolledInBeBtechGirls = 0;
            noOfStudentEnrolledInMbbsBoys = 0;
            noOfStudentEnrolledInMbbsGirls = 0;
            noOfStudentEnrolledInBvscBoys = 0;
            noOfStudentEnrolledInBvscGirls = 0;
            noOfStudentEnrolledInAgriMscBoys = 0;
            noOfStudentEnrolledInAgriMscGirls = 0;
            noOfStudentEnrolledInPolytechDeplomaBoys = 0;
            noOfStudentEnrolledInPolytechDeplomaGirls = 0;
            noOfStudentEnrolledInITIBoys = 0;
            noOfStudentEnrolledInITIGirls = 0;
            noOfStudentEnrolledInVocationalCourseBoys = 0;
            noOfStudentEnrolledInVocationalCourseGirls = 0;

        }
        returnMap = [finalList: finalList, block: false, village: false, state: true];
        return returnMap;
    }

    //-------------------------------------------------------------------------------------------------//
    //Getting  Education Data  for Block Level  For EducationDataTech_course
    def getEducationDataTech_CourseBlockLevel(params) {

        def finalList = [];
        def finalList1 = [];

        Integer noOfStudentEnrolledInBeBtechBoys = 0;
        Integer noOfStudentEnrolledInBeBtechGirls = 0;
        Integer noOfStudentEnrolledInMbbsBoys = 0;
        Integer noOfStudentEnrolledInMbbsGirls = 0;
        Integer noOfStudentEnrolledInBvscBoys = 0;
        Integer noOfStudentEnrolledInBvscGirls = 0;
        Integer noOfStudentEnrolledInAgriMscBoys = 0;
        Integer noOfStudentEnrolledInAgriMscGirls = 0;
        Integer noOfStudentEnrolledInPolytechDeplomaBoys = 0;
        Integer noOfStudentEnrolledInPolytechDeplomaGirls = 0;
        Integer noOfStudentEnrolledInITIBoys = 0;
        Integer noOfStudentEnrolledInITIGirls = 0;
        Integer noOfStudentEnrolledInVocationalCourseBoys = 0;
        Integer noOfStudentEnrolledInVocationalCourseGirls = 0;


        def data;
        District d = District.findById(params.id)

        def returnMap;

        List<Block> blockList = Block.findAllByDistrict(d);


        blockList.each {block ->
            List<Village> villageList = Village.findAllByBlock(block);
            int year = Integer.parseInt(params.year);
            int month = Integer.parseInt(params.month)
            villageList.each {village ->
                long id = village.id;
                Village village1 = Village.findById(id);

                data = NoOfEnrolmentInOtherTechCourse.createCriteria().list {
                    eq("year", year)
                    eq("month", month)
                    eq("village", village1)

                };
                if (data) {
                    data.each {data1 ->
                        noOfStudentEnrolledInBeBtechBoys += data1.noOfStudentEnrolledInBeBtechBoys;
                        noOfStudentEnrolledInBeBtechGirls += data1.noOfStudentEnrolledInBeBtechGirls;
                        noOfStudentEnrolledInMbbsBoys += data1.noOfStudentEnrolledInMbbsBoys
                        noOfStudentEnrolledInMbbsGirls += data1.noOfStudentEnrolledInMbbsGirls
                        noOfStudentEnrolledInBvscBoys += data1.noOfStudentEnrolledInBvscBoys
                        noOfStudentEnrolledInBvscGirls += data1.noOfStudentEnrolledInBvscGirls;
                        noOfStudentEnrolledInAgriMscBoys += data1.noOfStudentEnrolledInAgriMscBoys
                        noOfStudentEnrolledInAgriMscGirls = data1.noOfStudentEnrolledInAgriMscGirls
                        noOfStudentEnrolledInPolytechDeplomaBoys += data1.noOfStudentEnrolledInPolytechDeplomaBoys;
                        noOfStudentEnrolledInITIBoys += data1.noOfStudentEnrolledInITIBoys;
                        noOfStudentEnrolledInPolytechDeplomaGirls += data1.noOfStudentEnrolledInPolytechDeplomaGirls
                        noOfStudentEnrolledInVocationalCourseBoys += data1.noOfStudentEnrolledInVocationalCourseBoys;

                    }
                }

            }

            finalList1 = [d.name, block.name, noOfStudentEnrolledInBeBtechBoys, noOfStudentEnrolledInBeBtechGirls, noOfStudentEnrolledInMbbsBoys, noOfStudentEnrolledInMbbsGirls, noOfStudentEnrolledInBvscBoys, noOfStudentEnrolledInBvscGirls, noOfStudentEnrolledInAgriMscBoys, noOfStudentEnrolledInAgriMscGirls, noOfStudentEnrolledInPolytechDeplomaBoys, noOfStudentEnrolledInPolytechDeplomaGirls, noOfStudentEnrolledInITIBoys, noOfStudentEnrolledInITIGirls, noOfStudentEnrolledInVocationalCourseBoys, noOfStudentEnrolledInVocationalCourseGirls, block.id, params.month, params.year];
            finalList.add(finalList1);
            noOfStudentEnrolledInBeBtechBoys = 0;
            noOfStudentEnrolledInBeBtechGirls = 0;
            noOfStudentEnrolledInMbbsBoys = 0;
            noOfStudentEnrolledInMbbsGirls = 0;
            noOfStudentEnrolledInBvscBoys = 0;
            noOfStudentEnrolledInBvscGirls = 0;
            noOfStudentEnrolledInAgriMscBoys = 0;
            noOfStudentEnrolledInAgriMscGirls = 0;
            noOfStudentEnrolledInPolytechDeplomaBoys = 0;
            noOfStudentEnrolledInPolytechDeplomaGirls = 0;
            noOfStudentEnrolledInITIBoys = 0;
            noOfStudentEnrolledInITIGirls = 0;
            noOfStudentEnrolledInVocationalCourseBoys = 0;
            noOfStudentEnrolledInVocationalCourseGirls = 0;

        }
        returnMap = [finalList: finalList, block: false, village: false, state: true];
        return returnMap;

    }

    //-------------------------------------------------------------------------------------------------//
    //Getting  Education Data  for Village Level  For EducationDataTech_course
    def getEducationDataTech_CourseVillageLevel(params) {

        def finalList = [];
        def finalList1 = [];

        Integer noOfStudentEnrolledInBeBtechBoys = 0;
        Integer noOfStudentEnrolledInBeBtechGirls = 0;
        Integer noOfStudentEnrolledInMbbsBoys = 0;
        Integer noOfStudentEnrolledInMbbsGirls = 0;
        Integer noOfStudentEnrolledInBvscBoys = 0;
        Integer noOfStudentEnrolledInBvscGirls = 0;
        Integer noOfStudentEnrolledInAgriMscBoys = 0;
        Integer noOfStudentEnrolledInAgriMscGirls = 0;
        Integer noOfStudentEnrolledInPolytechDeplomaBoys = 0;
        Integer noOfStudentEnrolledInPolytechDeplomaGirls = 0;
        Integer noOfStudentEnrolledInITIBoys = 0;
        Integer noOfStudentEnrolledInITIGirls = 0;
        Integer noOfStudentEnrolledInVocationalCourseBoys = 0;
        Integer noOfStudentEnrolledInVocationalCourseGirls = 0;
        Block b = Block.findByName(params.blockName);

        List<Village> villageList = Village.findAllByBlock(b);
        def data
        def returnMap;
        int year = Integer.parseInt(params.year);
        int month = Integer.parseInt(params.month)
        villageList.each {village ->
            long id = village.id;
            Village village1 = Village.findById(id);

            data = NoOfEnrolmentInOtherTechCourse.createCriteria().list {
                eq("year", year)
                eq("month", month)
                eq("village", village1)

            }
            if (data) {
                data.each {data1 ->
                    noOfStudentEnrolledInBeBtechBoys += data1.noOfStudentEnrolledInBeBtechBoys;
                    noOfStudentEnrolledInBeBtechGirls += data1.noOfStudentEnrolledInBeBtechGirls;
                    noOfStudentEnrolledInMbbsBoys += data1.noOfStudentEnrolledInMbbsBoys
                    noOfStudentEnrolledInMbbsGirls += data1.noOfStudentEnrolledInMbbsGirls
                    noOfStudentEnrolledInBvscBoys += data1.noOfStudentEnrolledInBvscBoys
                    noOfStudentEnrolledInBvscGirls += data1.noOfStudentEnrolledInBvscGirls;
                    noOfStudentEnrolledInAgriMscBoys += data1.noOfStudentEnrolledInAgriMscBoys
                    noOfStudentEnrolledInAgriMscGirls = data1.noOfStudentEnrolledInAgriMscGirls
                    noOfStudentEnrolledInPolytechDeplomaBoys += data1.noOfStudentEnrolledInPolytechDeplomaBoys;
                    noOfStudentEnrolledInITIBoys += data1.noOfStudentEnrolledInITIBoys;
                    noOfStudentEnrolledInPolytechDeplomaGirls += data1.noOfStudentEnrolledInPolytechDeplomaGirls
                    noOfStudentEnrolledInVocationalCourseBoys += data1.noOfStudentEnrolledInVocationalCourseBoys;

                }
            }

            finalList1 = [b.name, village.name, noOfStudentEnrolledInBeBtechBoys, noOfStudentEnrolledInBeBtechGirls, noOfStudentEnrolledInMbbsBoys, noOfStudentEnrolledInMbbsGirls, noOfStudentEnrolledInBvscBoys, noOfStudentEnrolledInBvscGirls, noOfStudentEnrolledInAgriMscBoys, noOfStudentEnrolledInAgriMscGirls, noOfStudentEnrolledInPolytechDeplomaBoys, noOfStudentEnrolledInPolytechDeplomaGirls, noOfStudentEnrolledInITIBoys, noOfStudentEnrolledInITIGirls, noOfStudentEnrolledInVocationalCourseBoys, noOfStudentEnrolledInVocationalCourseGirls, village.id, params.month, params.year];
            finalList.add(finalList1);
            noOfStudentEnrolledInBeBtechBoys = 0;
            noOfStudentEnrolledInBeBtechGirls = 0;
            noOfStudentEnrolledInMbbsBoys = 0;
            noOfStudentEnrolledInMbbsGirls = 0;
            noOfStudentEnrolledInBvscBoys = 0;
            noOfStudentEnrolledInBvscGirls = 0;
            noOfStudentEnrolledInAgriMscBoys = 0;
            noOfStudentEnrolledInAgriMscGirls = 0;
            noOfStudentEnrolledInPolytechDeplomaBoys = 0;
            noOfStudentEnrolledInPolytechDeplomaGirls = 0;
            noOfStudentEnrolledInITIBoys = 0;
            noOfStudentEnrolledInITIGirls = 0;
            noOfStudentEnrolledInVocationalCourseBoys = 0;
            noOfStudentEnrolledInVocationalCourseGirls = 0;

        }
        returnMap = [finalList: finalList, block: false, village: false, state: true];
        return returnMap;
    }

    // Block
    def getEducationDataBlockGraphicalLevel(params) {

        def finalList = [];
        def finalList1 = [];
        def noAdultCenter = 0;
        def noAdultEducated = 0;

        def noPrePimary = 0
        def noPrimary = 0;
        def noMiddle = 0;
        def noSecondary = 0;
        def noHigherSecondary = 0;
        def data;
        //get all the blocks corresponding to this district
        District d = District.findByCode(params.distCode);
        List blocks = Block.findAllByDistrict(d);
        blocks.each {b1 ->
            def year = Integer.parseInt(params.year)
            def month = Integer.parseInt(params.month);
            List villageList = Village.findAllByBlock(b1);
            villageList.each { village ->
                data = Education.createCriteria().list {
                    eq("year", year);
                    eq("month", month);
                    eq("village", village)
                }

                if (data) {
                    data.each { data1 ->
                        int var = data1.edu3;
                        int abc = data1.edu3
                        noAdultCenter = noAdultCenter + data1.edu3;
                        noAdultEducated += data1.edu4;
                        noPrePimary += data1.edu5;
                        noPrimary = data1.edu6;
                        noMiddle = data1.edu7;
                        noSecondary = data1.edu8;
                        noHigherSecondary = data1.edu9;
                    }
                }
                else {
                }
            }
            finalList1 = [d.name, b1.name, noAdultCenter, noAdultEducated, noPrePimary, noPrimary, noMiddle, noSecondary, noHigherSecondary, b1.id, params.month, params.year];
            finalList.add(finalList1);

        }
        def returnMap = [:];
        returnMap = [finalList: finalList, block: true];
        return returnMap
    }

    ///////////////Health report
    ////By Aman

    def getHealthData(params, category, level, code) {
        log.debug "!!!!!!!!!!!!params.blockCode!!!!!!!!!!!!!!" + params + "!!!!category:" + category + "--level:" + level + "--code:" + code

        def dist, blockList,panchayatList, villageList, data = [:], list = []


        if (level == 'V') {

            villageList = Village.findAllByCode(code)
            data.type = 'Village'
            data.subType = 'no'
        }
        else if (level == 'P') {

            data.type = 'Panchayat'
            data.subType = 'Village'
            panchayatList = GramPanchayat.findAllByCode(code)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        }
        else if (level == 'B') {
            data.type = 'Block'
            data.subType = 'Panchayat'
            blockList = Block.findAllByCode(code)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        } else if (level == 'D') {
            data.type = 'District'
            data.subType = 'Block'
            dist = District.findByCode(code)
            blockList = Block.findAllByDistrict(dist)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        } else {
            dist = District.findAllByState(State.findByCode(code))
            blockList = Block.findAllByDistrictInList(dist)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
            data.type = 'State'
            data.subType = 'District'
        }

        def c = HealthAndFamilyWelfare.createCriteria()
        def resultSet
        if (villageList) {
            resultSet = c.list {
                eq("year", Integer.parseInt(params.year))
                eq("month", Integer.parseInt(params.month))
                and {
                    'in'("village", villageList)
                }
            }
        }
        def total = new HealthAndFamilyWelfare()
        total?.govHospitals = new Hospital()
        total.govDispensaries = new Hospital()
        total.primHealthCenter = new Hospital()
        total.subCenter = new Hospital()
        total.commHealthCenter = new Hospital()
        total.familyWelCenter = new Hospital()
        total.ayurCenter = new Hospital()
        total.homeoCells = new Hospital()
        total.year = Integer.parseInt(params.year)
        total.month = Integer.parseInt(params.month)
        resultSet.each {r ->
            addTotal(r, total)
            data.total = total
        }


        if (level == 'V') {
            list = []
        }
        else if(level == 'P'){

            panchayatList = GramPanchayat.findAllByCode(code)

            villageList = Village.findAllByGramPanchayatInList(panchayatList)

            villageList.each {v ->
                code = v.code
                def element = (getHealthData(params, category, 'V', code))?.total
                if (element) {
                    list.add(element)
                }
            }
        }
        else if (level == 'B') {
            blockList = Block.findAllByCode(code)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
//            villageList = Village.findAllByGramPanchayatInList(panchayatList)
            panchayatList.each {p ->
                code = p.code
                def element = (getHealthData(params, category, 'P', code))?.total
                if (element) {
                    list.add(element)
                }
            }
        } else if (level == 'D') {
            dist = District.findByCode(code)
            blockList = Block.findAllByDistrict(dist)

            blockList.each {b ->
                params.distCode = null
                code = b.code
                def element = (getHealthData(params, category, 'B', code))?.total

                if (element) {
                    list.add(element)
                }

            }
        } else {
            District.findAllByState(State.findByCode(code)).each {d ->
                params.stateCode = null
                code = d.code
                def element = (getHealthData(params, category, 'D', code))?.total
                if (element)
                    if (element != null) {
                        list.add(element)
                    }
            }
            data.type = 'State'
            data.subType = 'District'
        }

        data.list = list
        return data
    }

    def addTotal(HealthAndFamilyWelfare r, HealthAndFamilyWelfare t) {
        t?.village = r?.village
        addTotalHospital(r?.govHospitals, t?.govHospitals)
        addTotalHospital(r?.govDispensaries, t?.govDispensaries)
        addTotalHospital(r?.primHealthCenter, t?.primHealthCenter)
        addTotalHospital(r?.subCenter, t?.subCenter)
        addTotalHospital(r?.commHealthCenter, t?.commHealthCenter)
        addTotalHospital(r?.familyWelCenter, t?.familyWelCenter)
        addTotalHospital(r?.ayurCenter, t?.ayurCenter)
        addTotalHospital(r?.homeoCells, t?.homeoCells)
//          t.properties = ((t.properties) ?: 0) + (r.properties ?: 0)
        for (int i = 39; i <= 71; i++) {
            t[('health' + i)] = ((t[('health' + i)]) ?: 0) + ((r[('health' + i)]) ?: 0)
        }

    }

    def addTotalHospital(Hospital r, Hospital t) {
        t?.noOfDoctors = ((t?.noOfDoctors) ?: 0) + ((r?.noOfDoctors) ?: 0)
        t?.noOfBeds = ((t?.noOfBeds) ?: 0) + ((r?.noOfBeds) ?: 0)
        t?.noOfNurses = ((t?.noOfNurses) ?: 0) + ((r?.noOfNurses) ?: 0)
        t?.noOfMaleCasesTreated = ((t?.noOfMaleCasesTreated) ?: 0) + ((r?.noOfMaleCasesTreated) ?: 0)
        t?.noOfFemaleCasesTreated = ((t?.noOfFemaleCasesTreated) ?: 0) + ((r?.noOfFemaleCasesTreated) ?: 0)
    }
    //By Ankita
    //,,Education Report
    def getEducationData1(params, category, level, code) {
         println("parameters year ="+params.year+" parameters month "+params.month+" code"+code)
//        log.debug "!!!!!!!!!!!!params.blockCode!!!!!!AAAAAAA!!!!!!!!" + params + "!!!!category*****(*:" + category + "--level+++++:" + level + "--code---:" + code

        def dist, blockList,panchayatList, villageList, data = [:], list = []
//        println("?????????????????????"+code)
        if (level == 'V') {

            villageList = Village.findAllByCode(code)
            data.type = 'Village'
            data.subType = 'no'
        }
        else if (level == 'P') {

            data.type = 'Panchayat'
            data.subType = 'Village'
            panchayatList = GramPanchayat.findAllByCode(code)
//            println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+panchayatList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        }
        else if (level == 'B') {
            data.type = 'Block'
            data.subType = 'Panchayat'
            blockList = Block.findAllByCode(code)
            def test=[]
            blockList.each{
                it.id
            }
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)

             println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>??????????????????????????"+panchayatList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        } else if (level == 'D') {
            data.type = 'District'
            data.subType = 'Block'
            dist = District.findByCode(code)
            blockList = Block.findAllByDistrict(dist)
            println("*********"+blockList)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        } else {
            println("in else statement")
            dist = District.findAllByState(State.findByCode(code))
            println("total district are "+dist.size())
            blockList = Block.findAllByDistrictInList(dist)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
            data.type = 'State'
            data.subType = 'District'
        }

        def c = Education.createCriteria()
        def resultSet
        if (villageList) {

            resultSet = c.list {
                eq("year", Integer.parseInt(params.year))
                eq("month", Integer.parseInt(params.month))
                and {
                    'in'("village", villageList)
                }
            }
        }
        def total = new Education()
        total?.noOfEnrolmentInCollege = new NoOfEnrolmentInCollege()
        total?.noOfEnrolmentInOtherTechCourse = new NoOfEnrolmentInOtherTechCourse()
        total?.prePrimaryTotal = new NoOfEnrolmentInEdu()
        total?.primaryTotal = new NoOfEnrolmentInEdu()
        total?.middleTotal = new NoOfEnrolmentInEdu()
        total?.highSchoolTotal = new NoOfEnrolmentInEdu()
        total?.seniorSecSchoolTotal = new NoOfEnrolmentInEdu()
        total?.collegeTotal = new NoOfEnrolmentInEdu()
        total.year = Integer.parseInt(params.year)
        total.month = Integer.parseInt(params.month)
        resultSet.each {r ->
            addTotal1(r, total)
            data.total = total
        }

        if (level == 'V') {
            list = []
        }
        else if(level == 'P'){

            panchayatList = GramPanchayat.findAllByCode(code)

            villageList = Village.findAllByGramPanchayatInList(panchayatList)

            villageList.each {v ->
                code = v.code
                def element = (getEducationData1(params, category, 'V', code))?.total
                if (element) {
                    list.add(element)
                }
            }
        }
        else if (level == 'B') {
            blockList = Block.findAllByCode(code)
            println("bbbbbbbbbbbb==="+blockList)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            println("pppp==="+panchayatList)
//            villageList = Village.findAllByGramPanchayatInList(panchayatList)
            panchayatList.each {p ->
                code = p.code
                def element = (getEducationData1(params, category, 'P', code))?.total
                if (element) {
                    list.add(element)
                }
            }
        } else if (level == 'D') {
            dist = District.findByCode(code)
            blockList = Block.findAllByDistrict(dist)

            blockList.each {b ->
                params.distCode = null
                code = b.code
                def element = (getEducationData1(params, category, 'B', code))?.total

                if (element) {
                    list.add(element)
                }

            }

        } else {
            District.findAllByState(State.findByCode(code)).each {d ->
                params.stateCode = null
                code = d.code
                def element = (getEducationData1(params, category, 'D', code))?.total
                if (element)
                    if (element != null) {
                        println("adding element to the list");
                        list.add(element)
                        println("size of the list "+list.size())
                    }
            }
            data.type = 'State'
            data.subType = 'District'
        }
        println("last==="+list)
        data.list = list

        return data
//
    }

    def addTotal1(Education r, Education t) {
        t?.village = r?.village
        for (int i = 3; i <= 17; i++) {
            t[('edu' + i)] = ((t[('edu' + i)]) ?: 0) + ((r[('edu' + i)]) ?: 0)
        }



        println("<<<<<<<<<<<<<<<<<<"+t)
        addTotalNoOfEnrolmentInOtherTechCourse(r?.noOfEnrolmentInOtherTechCourse, t?.noOfEnrolmentInOtherTechCourse)
        addTotalNoOfEnrolmentInCollege(r?.noOfEnrolmentInCollege, t?.noOfEnrolmentInCollege)
        addTotalNoOfEnrolmentInEdu(r, t)

    }

    def addToTotalNOE(NoOfEnrolmentInEdu r, NoOfEnrolmentInEdu t) {
        t?.studentEnrolledBoys = ((t?.studentEnrolledBoys) ?: 0) + ((r?.studentEnrolledBoys) ?: 0)

        t?.studentEnrolledGirls = ((t?.studentEnrolledGirls) ?: 0) + ((r?.studentEnrolledGirls) ?: 0)
        t?.studentAttendingBoys = ((t?.studentAttendingBoys) ?: 0) + ((r?.studentAttendingBoys) ?: 0)
        t?.studentAttendingGirls = ((t?.studentAttendingGirls) ?: 0) + ((r?.studentAttendingGirls) ?: 0)
        t?.newEntrantsBoys = ((t?.newEntrantsBoys) ?: 0) + ((r?.newEntrantsBoys) ?: 0)
        t?.newEntrantsGirls = ((t?.newEntrantsGirls) ?: 0) + ((r?.newEntrantsGirls) ?: 0)
        t?.studentDiscontinuedStudiesBoys = ((t?.studentDiscontinuedStudiesBoys) ?: 0) + ((r?.studentDiscontinuedStudiesBoys) ?: 0)
        t?.studentDiscontinuedStudiesGirls = ((t?.studentDiscontinuedStudiesGirls) ?: 0) + ((r?.studentDiscontinuedStudiesGirls) ?: 0)
        t?.reasonOfDiscontinuationEconomic = ((t?.reasonOfDiscontinuationEconomic) ?: 0) + ((r?.reasonOfDiscontinuationEconomic) ?: 0)
        t?.reasonOfDiscontinuationNonEconomic = ((t?.reasonOfDiscontinuationNonEconomic) ?: 0) + ((r?.reasonOfDiscontinuationNonEconomic) ?: 0)
        t?.noOfTeacherMale = ((t?.noOfTeacherMale) ?: 0) + ((r?.noOfTeacherMale) ?: 0)
        t?.noOfTeacherFemale = ((t?.noOfTeacherFemale) ?: 0) + ((r?.noOfTeacherFemale) ?: 0)
        t?.noChildNeverEnrolled = ((t?.noChildNeverEnrolled) ?: 0) + ((r?.noChildNeverEnrolled) ?: 0)
    }

    def addTotalNoOfEnrolmentInEdu(Education r, Education t) {
        if (r?.prePrimary) {
            r?.prePrimary?.each {pp ->
                addToTotalNOE(pp, t.prePrimaryTotal)
            }
        }
        if (r?.primary) {
            r?.primary?.each {pp ->
                addToTotalNOE(pp, t.primaryTotal)
            }
        }
        if (r?.middle) {
            r?.middle?.each {pp ->
                addToTotalNOE(pp, t.middleTotal)
            }
        }
        if (r?.highSchool) {
            r?.highSchool?.each {pp ->
                addToTotalNOE(pp, t.highSchoolTotal)
            }
        }
        if (r?.seniorSecSchool) {
            r?.seniorSecSchool?.each {pp ->
                addToTotalNOE(pp, t.seniorSecSchoolTotal)
            }
        }
    }

    def addTotalNoOfEnrolmentInCollege(NoOfEnrolmentInCollege r, NoOfEnrolmentInCollege t) {
        if (r?.properties)
            t?.noOfStudentEnrolledBoys = ((t?.noOfStudentEnrolledBoys) ?: 0) + ((r?.noOfStudentEnrolledBoys) ?: 0)
        t?.noOfStudentEnrolledGirls = ((t?.noOfStudentEnrolledGirls) ?: 0) + ((r?.noOfStudentEnrolledGirls) ?: 0)
        t?.noOfStudentAttendingBoys = ((t?.noOfStudentAttendingBoys) ?: 0) + ((r?.noOfStudentAttendingBoys) ?: 0)
        t?.noOfStudentAttendingGirls = ((t?.noOfStudentAttendingGirls) ?: 0) + ((r?.noOfStudentAttendingGirls) ?: 0)
        t?.noOfNewEntrantsEntryBoys = ((t?.noOfNewEntrantsEntryBoys) ?: 0) + ((r?.noOfNewEntrantsEntryBoys) ?: 0)
        t?.noOfNewEntrantsEntryGirls = ((t?.noOfNewEntrantsEntryGirls) ?: 0) + ((r?.noOfNewEntrantsEntryGirls) ?: 0)
        t?.noOfStudentDiscontinuedStudiesBoys = ((t?.noOfStudentDiscontinuedStudiesBoys) ?: 0) + ((r?.noOfStudentDiscontinuedStudiesBoys) ?: 0)
        t?.noOfStudentDiscontinuedStudiesGirls = ((t?.noOfStudentDiscontinuedStudiesGirls) ?: 0) + ((r?.noOfStudentDiscontinuedStudiesGirls) ?: 0)
        t?.reasonOfDiscontinuationEconomic = ((t?.reasonOfDiscontinuationEconomic) ?: 0) + ((r?.reasonOfDiscontinuationEconomic) ?: 0)
        t?.reasonOfDiscontinuationNonEconomic = ((t?.reasonOfDiscontinuationNonEconomic) ?: 0) + ((r?.reasonOfDiscontinuationNonEconomic) ?: 0)
        t?.noOfStudentsEnrolledInUniversityBoys = ((t?.noOfStudentsEnrolledInUniversityBoys) ?: 0) + ((r?.noOfStudentsEnrolledInUniversityBoys) ?: 0)
        t?.noOfStudentsEnrolledInUniversityGirls = ((t?.noOfStudentsEnrolledInUniversityGirls) ?: 0) + ((r?.noOfStudentsEnrolledInUniversityGirls) ?: 0)
    }

    def addTotalNoOfEnrolmentInOtherTechCourse(NoOfEnrolmentInOtherTechCourse r, NoOfEnrolmentInOtherTechCourse t) {
        if (r?.properties)
            t?.noOfStudentEnrolledInBeBtechBoys = ((t?.noOfStudentEnrolledInBeBtechBoys) ?: 0) + ((r?.noOfStudentEnrolledInBeBtechBoys) ?: 0)
        t?.noOfStudentEnrolledInBeBtechGirls = ((t?.noOfStudentEnrolledInBeBtechGirls) ?: 0) + ((r?.noOfStudentEnrolledInBeBtechGirls) ?: 0)
        t?.noOfStudentEnrolledInMbbsBoys = ((t?.noOfStudentEnrolledInMbbsBoys) ?: 0) + ((r?.noOfStudentEnrolledInMbbsBoys) ?: 0)
        t?.noOfStudentEnrolledInMbbsGirls = ((t?.noOfStudentEnrolledInMbbsGirls) ?: 0) + ((r?.noOfStudentEnrolledInMbbsGirls) ?: 0)
        t?.noOfStudentEnrolledInBvscBoys = ((t?.noOfStudentEnrolledInBvscBoys) ?: 0) + ((r?.noOfStudentEnrolledInBvscBoys) ?: 0)
        t?.noOfStudentEnrolledInBvscGirls = ((t?.noOfStudentEnrolledInBvscGirls) ?: 0) + ((r?.noOfStudentEnrolledInBvscGirls) ?: 0)
        t?.noOfStudentEnrolledInAgriMscBoys = ((t?.noOfStudentEnrolledInAgriMscBoys) ?: 0) + ((r?.noOfStudentEnrolledInAgriMscBoys) ?: 0)
        t?.noOfStudentEnrolledInAgriMscGirls = ((t?.noOfStudentEnrolledInAgriMscGirls) ?: 0) + ((r?.noOfStudentEnrolledInAgriMscGirls) ?: 0)
        t?.noOfStudentEnrolledInPolytechDeplomaBoys = ((t?.noOfStudentEnrolledInPolytechDeplomaBoys) ?: 0) + ((r?.noOfStudentEnrolledInPolytechDeplomaBoys) ?: 0)
        t?.noOfStudentEnrolledInPolytechDeplomaGirls = ((t?.noOfStudentEnrolledInPolytechDeplomaGirls) ?: 0) + ((r?.noOfStudentEnrolledInPolytechDeplomaGirls) ?: 0)
        t?.noOfStudentEnrolledInITIBoys = ((t?.noOfStudentEnrolledInITIBoys) ?: 0) + ((r?.noOfStudentEnrolledInITIBoys) ?: 0)
        t?.noOfStudentEnrolledInITIGirls = ((t?.noOfStudentEnrolledInITIGirls) ?: 0) + ((r?.noOfStudentEnrolledInITIGirls) ?: 0)
        t?.noOfStudentEnrolledInVocationalCourseBoys = ((t?.noOfStudentEnrolledInVocationalCourseBoys) ?: 0) + ((r?.noOfStudentEnrolledInVocationalCourseBoys) ?: 0)
        t?.noOfStudentEnrolledInVocationalCourseGirls = ((t?.noOfStudentEnrolledInVocationalCourseGirls) ?: 0) + ((r?.noOfStudentEnrolledInVocationalCourseGirls) ?: 0)


    }
    //Infrastructure ...
    //By Ankita
    def getIsfData1(params, category, level, code) {


        def dist, blockList,panchayatList, villageList, data = [:], list = []

        if (level == 'V') {

            villageList = Village.findAllByCode(code)
            data.type = 'Village'
            data.subType = 'no'
        }
        else if (level == 'P') {

            data.type = 'Panchayat'
            data.subType = 'Village'
            panchayatList = GramPanchayat.findAllByCode(code)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        }
        else if (level == 'B') {
            data.type = 'Block'
            data.subType = 'Panchayat'
            blockList = Block.findAllByCode(code)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        } else if (level == 'D') {
            data.type = 'District'
            data.subType = 'Block'
            dist = District.findByCode(code)
            blockList = Block.findAllByDistrict(dist)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
        } else {
            dist = District.findAllByState(State.findByCode(code))
            blockList = Block.findAllByDistrictInList(dist)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
            villageList = Village.findAllByGramPanchayatInList(panchayatList)
            data.type = 'State'
            data.subType = 'District'
        }


        def c = InfrastructuralFacilities.createCriteria()
        def resultSet
        if (villageList) {
            resultSet = c.list {
                eq("year", Integer.parseInt(params.year))
                eq("month", Integer.parseInt(params.month))
                and {
                    'in'("village", villageList)
                }
            }
        }
        def total = new InfrastructuralFacilities()
        total.year = Integer.parseInt(params.year)
        total.month = Integer.parseInt(params.month)
        resultSet.each {r ->
            addTotal3(r, total)
            data.total = total
        }

        if (level == 'V') {
            list = []
        }
        else if(level == 'P'){

            panchayatList = GramPanchayat.findAllByCode(code)

            villageList = Village.findAllByGramPanchayatInList(panchayatList)

            villageList.each {v ->
                code = v.code
                def element = (getIsfData1(params, category, 'V', code))?.total
                if (element) {
                    list.add(element)
                }
            }
        }
        else if (level == 'B') {
            blockList = Block.findAllByCode(code)
            panchayatList = GramPanchayat.findAllByBlockInList(blockList)
//            villageList = Village.findAllByGramPanchayatInList(panchayatList)
            panchayatList.each {p ->
                code = p.code
                def element = (getIsfData1(params, category, 'P', code))?.total
                if (element) {
                    list.add(element)
                }
            }
        } else if (level == 'D') {
            dist = District.findByCode(code)
            blockList = Block.findAllByDistrict(dist)

            blockList.each {b ->
                params.distCode = null
                code = b.code
                def element = (getIsfData1(params, category, 'B', code))?.total

                if (element) {
                    list.add(element)
                }

            }
        } else {


            District.findAllByState(State.findByCode(code)).each {d ->
                params.stateCode = null
                code = d.code
                def element = (getIsfData1(params, category, 'D', code))?.total
                if (element)
                    if (element != null) {
                        list.add(element)
                    }
            }
            data.type = 'State'
            data.subType = 'District'
        }

        data.list = list
        return data
    }

    def addTotal3(InfrastructuralFacilities r, InfrastructuralFacilities t) {
        t?.village = r?.village
        for (int i = 3; i <= 24; i++) {
            t[('isf' + i)] = ((t[('isf' + i)]) ?: 0) + ((r[('isf' + i)]) ?: 0)
        }
    }

    def serviceMethod() {

    }
}
