package com.osrs

class AnalyticsController {

    def index = { }

    def performanceGraphIndex={
         def states=State.list()
        log.debug"===DataCorrectionController=main========="+states
        def startYear= grailsApplication.config.startyear
         def year= (new Date()).getYear()+1900
        [states:states,year:year,startyear:startYear]
    }

    def performanceGraph={

    }


}
