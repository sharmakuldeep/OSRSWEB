package com.osrs

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class UserProfileController {

    /**
     * Dependency injection for the springSecurityService.
     */
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        def userInstance = User.findById(params.userId)
        def userProfileInstance = userInstance.userProfile
        if (!userProfileInstance) {
            userProfileInstance = new UserProfile()
            userProfileInstance.profileName = userInstance.username
            userProfileInstance.lastUpdated = new Date()
            userProfileInstance
            userProfileInstance.save()
            userInstance.userProfile = userProfileInstance
            userInstance.save()
            println(userProfileInstance.errors)
            println(userInstance.errors)
        }
        redirect(action: 'show', params: [id: userProfileInstance.id])
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userProfileInstanceList: UserProfile.list(params), userProfileInstanceTotal: UserProfile.count()]
    }

    def create = {
        def userProfileInstance = new UserProfile()
        userProfileInstance.properties = params
        return [userProfileInstance: userProfileInstance]
    }

    def save = {
        def userProfileInstance = new UserProfile(params)
        if (userProfileInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])}"
            redirect(action: "show", id: userProfileInstance.id)
        }
        else {
            render(view: "create", model: [userProfileInstance: userProfileInstance])
        }
    }

    def show = {
        println("?????????????????????????????????????")
        //def userInstance=User.findById(params.userId)
        def userProfileInstance = UserProfile.findById(params.id)
        def userInstance = User.findByUserProfile(userProfileInstance)

        [userProfileInstance: userProfileInstance, userInstance: userInstance]

    }

    def edit = {
        def userProfileInstance = UserProfile.get(params.id)
        if (!userProfileInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userProfileInstance: userProfileInstance]
        }
    }

    def update = {
        def userProfileInstance = UserProfile.get(params.id)
        if (userProfileInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userProfileInstance.version > version) {

                    userProfileInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userProfile.label', default: 'UserProfile')] as Object[], "Another user has updated this UserProfile while you were editing")
                    render(view: "edit", model: [userProfileInstance: userProfileInstance])
                    return
                }
            }
            userProfileInstance.properties = params
            if (!userProfileInstance.hasErrors() && userProfileInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), userProfileInstance.id])}"
                redirect(action: "show", id: userProfileInstance.id)
            }
            else {
                log.debug "-----------" + userProfileInstance.errors
                render(view: "edit", model: [userProfileInstance: userProfileInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userProfileInstance = UserProfile.get(params.id)
        if (userProfileInstance) {
            try {
                userProfileInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userProfile.label', default: 'UserProfile'), params.id])}"
            redirect(action: "list")
        }
    }

    /**
	 * Show the Change password page.
	 */
    def changePwd = {
        def userProfileInstance = UserProfile.findById(params.id)
        def userInstance = User.findByUserProfile(userProfileInstance)

        [userInstance: userInstance]
    }
    /* *
    * Redirect to profile show page after successfully changed password.
    * If error then redirect to changePwd page with message.
    * */
    def changPwdAction = {
        log.debug("------change pwd params:" + params)
        def userProfileInstance = UserProfile.findById(params.id)
        def userInstance = User.findByUserProfile(userProfileInstance)
        if (params.newPwd == params.reNewPwd) {
            def password = springSecurityService.encodePassword(params.oldPwd)
            if (userInstance.password != password) {
                flash.message = "Old password is Not validated."
                redirect(action: 'changePwd', params: [id: userProfileInstance.id])
            } else {
                userInstance.password = params.newPwd
                if (userInstance.save(Flushable: true)) {
                    flash.message = "Password Changed Successfully."
                    redirect(action: 'show', params: [id: userProfileInstance.id])
                }
            }

        } else {
            flash.message = "New password and re entered password Not matched"
            return
        }


    }

}
