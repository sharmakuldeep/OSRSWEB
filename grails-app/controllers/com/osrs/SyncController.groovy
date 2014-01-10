package com.osrs

import grails.converters.deep.JSON
import org.codehaus.groovy.grails.web.json.JSONObject
import grails.converters.JSON
//import com.google.gson.Gson
import com.osrs.infraFacilities.InfrastructuralFacilities
import org.codehaus.groovy.grails.web.json.JSONException


class SyncController {

    def userService
    def syncService
    def index = { }


   /*
   * Call By Mobile Application
   * request:  JSON
   * Response: JSON
   * */
    def mobileAppSync = {
        def syncMsg = '', syncPassMsg = ''
        def syncStatus = SyncStatus.COMPLETE
        try {
            def jData = request?.JSON
            log.debug "-------request JSON:" + jData
            (jData)?.date = JSON.parse((jData)?.date)

            log.debug "----i------" + jData[Categories.INFRASTRUCTURE.value()]
            log.debug "----h------" + jData[Categories.HEALTH.value()]
            log.debug "-----e-----" + jData[Categories.EDUCATION.value()]

            def userAuth = syncService.userAuthResponse(jData?.auth)

            if (!userAuth) {
                redirect(action: 'failAuthentication')
            }


            else  {
                def userAuthBlock = syncService.userAuthBlockResponse(jData)
                println("+++++++++"+userAuthBlock)
                 if (!userAuthBlock) {

                    redirect(action: 'failBlockAuthentication')
                }
                else{

                log.debug("--Auth Pass Going for sync...........")
                def sync = syncService.syncDataStatus(jData.date, jData.villageCode)
                log.debug "====old data Status:" + sync
                sync.each {sy ->
                    if (sy.value && !(jData[sy.key] == 'null' || jData[sy.key] == null)) {
                        syncStatus = SyncStatus.INCOMPLETE
                    }
                }
                sync.each {sy ->
                    if (sy.value && !(jData[sy.key] == 'null' || jData[sy.key] == null)) {
                        syncMsg += ' "' + sy.key + "\" ${message(code: 'sync.response.incomplete', default: "Category data is already exist, and not allows to override.")}"
                    } else if (!sy.value && !(jData[sy.key] == 'null' || jData[sy.key] == null)) {
                        syncPassMsg += ' "' + sy.key + "\" ${message(code: 'sync.response.pass', default: "Category Data Successfully Synchronized.")}"
                    }
                }
                if (syncStatus != SyncStatus.INCOMPLETE && syncPassMsg == '') {
                    syncPassMsg += " ${message(code: 'sync.response.pass1', default: "Data Successfully Synchronized.")}"
                }

                if (!(sync[Categories.INFRASTRUCTURE.value()])) {
                    if (!syncService.startInfraSyncing(jData)) {
                        syncStatus = SyncStatus.FAIL
                        syncMsg = "${message(code: 'sync.response.fail', default: 'Fail')}"
                        syncPassMsg = ''
                    }
                }
                if (!(sync[Categories.HEALTH.value()])) {
                    if (!syncService.startHealthSyncing(jData)) {
                        syncStatus = SyncStatus.FAIL
                        syncMsg = "${message(code: 'sync.response.fail', default: 'Fail')}"
                        syncPassMsg = ''
                    }
                }
                if (!(sync[Categories.EDUCATION.value()])) {
                    if (!syncService.startEducationSyncing(jData)) {
                        syncStatus = SyncStatus.FAIL
                        syncMsg = "${message(code: 'sync.response.fail', default: 'Fail')}"
                        syncPassMsg = ''
                    }
                }
                log.debug syncMsg + " " + syncPassMsg
                render(contentType: "text/json") {
                    responseOSRS = {
                        userAuthentication = 'PASS'
                        userBlockAuthentication = 'PASS'
                        statusCode = (syncStatus).toString()
                        statusMessage = syncMsg + " " + syncPassMsg
                    }
                }
                 }
            }
        } catch (Exception jsonException) {
            log.debug(jsonException)
            redirect(action: 'failAuthentication')
        }

    }

    /*
    * Mobile response for Fail user Authentication.
    * */
    def failAuthentication = {
        render(contentType: "text/json") {
            responseOSRS = {

                userAuthentication = ('FAIL')

            }
        }
    }

    def failBlockAuthentication={
        render(contentType: "text/json") {
            responseOSRS = {
                userAuthentication=('PASS')
                userBlockAuthentication = ('FAIL')
            }
        }
    }

    def syncState={
        def state=State.list()
        def district=District.list()
        render(contentType: "text/json") {
            States=State.list()
            Districts=District.list()
            Blocks=Block.list()
            Villages=Village.list()
        }


    }


}
