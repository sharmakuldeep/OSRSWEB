package com.osrs


import grails.plugins.springsecurity.Secured

class HealthDataCollectionController {

    def springSecurityService
    def userService
    def dataCollectionService


    def index = { }

    /*@Secured(['ROLE_USER'])*/
    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def main = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def cUser = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!cUser) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def healthFW = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
            if (!healthFW) {
                healthFW = dataCollectionService.newHealthObj(User.findByUsername(springSecurityService.currentUser.username), session.village)
            }
            healthFW.properties = params
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
            [village: village, year: ipRecord?.year, month: ipRecord?.month]
        }
    }
    def iMain = {
        if (!userService.iUserLoggedIn()) {
            redirect(action: "iLogin", controller: "login")
        }
        if (!session.village) {
            redirect(action: "iSelectCatg", controller: 'dataCollection')
        }
        def healthFW = dataCollectionService.getCurrentIHealthData(session.user)
        if (!healthFW) {
            healthFW = dataCollectionService.newHealthObj(session.user, session.village)
        }
        healthFW.properties = params
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)
        [village: village, year: ipRecord?.year, month: ipRecord?.month]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def birthData = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def healthFW = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))
            [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
        }
    }
    def iBirthData = {
        if (!userService.iUserLoggedIn()) {
            redirect(action: "iLogin", controller: "login")
        }
        def healthFW = dataCollectionService.getCurrentIHealthData(session.user)
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)

        [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def others = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def healthFW = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

            [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
        }
    }
    def iOthers = {
        if (!userService.iUserLoggedIn()) {
            redirect(action: "iLogin", controller: "login")
        }
        def healthFW = dataCollectionService.getCurrentIHealthData(session.user)
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)
        [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
    }

    def iHealthLastPage = {
        def healthFW = dataCollectionService.getCurrentIHealthData(session.user)
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)
        [village: village, year: ipRecord?.year, month: ipRecord?.month, head: params.head, id: params.id, healthFW: healthFW]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def healthLastPage = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def healthFW = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

            [village: village, year: ipRecord?.year, month: ipRecord?.month, head: params.head, id: params.id, healthFW: healthFW]
        }
    }
    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def deathData = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def healthFW = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

            [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
        }
    }
    def iDeathData = {
        if (!userService.iUserLoggedIn()) {
            redirect(action: "iLogin", controller: "login")
        }
        def healthFW = dataCollectionService.getCurrentIHealthData(session.user)
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)
        [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def maternalMortality = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def healthFW = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

            [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
        }
    }
    def iMaternalMortality = {
        if (!userService.iUserLoggedIn()) {
            redirect(action: "iLogin", controller: "login")
        }
        def healthFW = dataCollectionService.getCurrentIHealthData(session.user)
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)
        [village: village, year: ipRecord?.year, month: ipRecord?.month, healthFW: healthFW]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def saveVitalStatisticsHealthData = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def healthFW = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
        if (!healthFW) {
            healthFW = dataCollectionService.newHealthObj(User.findByUsername(springSecurityService.currentUser.username), session.village)
        }
        healthFW.properties = params
        healthFW.userUpdated = User.findByUsername(springSecurityService.currentUser.username)
        healthFW.lastUpdated = new Date()

        healthFW.save(Flush: true)
        log.debug(healthFW.errors)
        redirect(action: "main")

        [village: session.village, infFaciliti: healthFW]
    }

    def iSaveVitalStatisticsHealthData = {
        if (!userService.iUserLoggedIn()) {
            redirect(action: "iLogin", controller: "login")
        }
        def healthFW = dataCollectionService.getCurrentIHealthData(session.user)
        if (!healthFW) {
            healthFW = dataCollectionService.newHealthObj(session.user, session.village)
        }
        healthFW.properties = params
        healthFW.userUpdated = session.user
        healthFW.lastUpdated = new Date()

        healthFW.save(Flush: true)
        log.debug(healthFW.errors)
        redirect(action: "iMain")

        [village: session.village, infFaciliti: healthFW]
    }

    def iGovHospitalData = {
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)
        [village: village, year: ipRecord?.year, month: ipRecord?.month]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def hospitalData = {
        log.debug "hospitalData params:" + params;
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        else {
            def healthHospital = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
            def hospitalData = healthHospital[params.id]
            def village = Village.findById(session.village.id)
            def ipRecord = InProgressRecords.findByUserCreated(User.findByUsername(springSecurityService.currentUser.username))

            [village: village, year: ipRecord?.year, month: ipRecord?.month, hospitalType: params.hospital, id: params.id, hospital: hospitalData]
        }
    }
    def iHospitalData = {
        def healthHospital = dataCollectionService.getCurrentIHealthData(session.user)
        def hospital = healthHospital[params.id]
        def village = Village.findById(session.village.id)
        def ipRecord = InProgressRecords.findByUserCreated(session.user)
        [village: village, year: ipRecord?.year, month: ipRecord?.month, hospitalType: params.hospital, id: params.id, hospital: hospital]
    }

    @Secured(['ROLE_DATA_ENTRY_OPERATOR'])
    def saveHospitalData = {
        if (!session.village) {
            redirect(action: "index", controller: 'dataCollection')
        }
        log.debug "-iSaveHospitalData params:" + params
        def infrastructure = dataCollectionService.getUser(User.findByUsername(springSecurityService.currentUser.username))
        if (!infrastructure) {
            redirect(action: "index", controller: 'dataCollection')
        }
        def healthHospital = dataCollectionService.getCurrentIHealthData(User.findByUsername(springSecurityService.currentUser.username))
        if (!healthHospital) {
            healthHospital = dataCollectionService.newHealthObj(User.findByUsername(springSecurityService.currentUser.username), session.village)
        }
//       healthFW.properties=params
        if (healthHospital[params.hospitalId]) {
            healthHospital[params.hospitalId]?.properties = params
        } else {
            def hospitalData = dataCollectionService.newHealthHospitalObj(User.findByUsername(springSecurityService.currentUser.username), params.hospitalType)
            hospitalData.properties = params
            hospitalData.save(flush: true)
            healthHospital[params.hospitalId] = hospitalData
        }

        healthHospital.userUpdated = User.findByUsername(springSecurityService.currentUser.username)
        healthHospital.lastUpdated = new Date()
        healthHospital.save(Flush: true)
        log.debug(healthHospital.errors)
        redirect(action: "main")
    }

    def iSaveHospitalData = {
        log.debug "-iSaveHospitalData params:" + params
        if (!userService.iUserLoggedIn()) {
            redirect(action: "iLogin", controller: "login")
        }
        def healthHospital = dataCollectionService.getCurrentIHealthData(session.user)
        if (!healthHospital) {
            healthHospital = dataCollectionService.newHealthObj(session.user, session.village)
        }
        // healthFW.properties=params
        if (healthHospital[params.hospitalId]) {
            healthHospital[params.hospitalId]?.properties = params
        } else {
            def hospitalData = dataCollectionService.newHealthHospitalObj(session.user, params.hospitalType)
            hospitalData.properties = params
            hospitalData.save(flush: true)
            healthHospital[params.hospitalId] = hospitalData
        }



        healthHospital.userUpdated = session.user
        healthHospital.lastUpdated = new Date()
        healthHospital.save(Flush: true)
        log.debug(healthHospital.errors)
        redirect(action: "iMain")
    }

}
