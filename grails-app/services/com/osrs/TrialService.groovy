package com.osrs

import org.springframework.context.i18n.LocaleContextHolder as LCH

class TrialService {

    static transactional = false

    def serviceMethod() {

    }

    def grailsApplication
    Locale locale
    def messageSource
    def msgi18(local){
       println"-------------------------" +local


        def msg=   messageSource.getMessage('trial.code', ["myArg"].toArray(), LCH.getLocale())

        println"--msg:"+msg
    }
}
