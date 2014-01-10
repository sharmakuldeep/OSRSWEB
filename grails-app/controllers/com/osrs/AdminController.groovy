package com.osrs

import grails.plugins.springsecurity.Secured
import grails.converters.JSON

@Secured(['ROLE_STATE_ADMIN'])
class AdminController {

    def userService
    def springSecurityService
    def mailerService

    def index = { }
    def userMgmt = {

    }

    def userList={
       params.max = Math.min(params.max ? params.int('max') : 10, 100)
         def userList=userService.getUsersList()
        [userInstanceList: userList, userInstanceTotal: userList.size()]
    }

    def createUser={
       def userInstance = new User()
        userInstance.properties = params
        def roleList=userService.getRoleList()
         [userInstance: userInstance,roles:roleList]
    }

    def saveUser = {

           def userInstance = new User(params)
           def role=Role.findByAuthority(params?.userRole)
           if (userInstance.save(flush: true)) {

               flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
               UserRole.create userInstance, role
               redirect(action: "userList", id: userInstance.id)
           }
           else {

               render(view: "create", model: [userInstance: userInstance])
           }
       }


    def editUser={
        def userInstance = User.get(params.id)
        def role
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"

            redirect(action: "userList")
        }
        else {
            role=UserRole.findByUser(userInstance)
            return [userInstance: userInstance,role:role.role]
        }
    }

    def updateUser={
        def userInstance = User.get(params.id)
        def role=Role.findByAuthority(params?.userRole)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
                if(role)
                  userService.updateUserRole(userInstance,role)
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.username])}"
                redirect(action: "userList", id: userInstance.id)
            }
            else {
                render(view: "editUser", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "userList")
        }
    }

    def resetPwd={
        println("?????????????????????"+params)
        def userInstance=User.findById(params.id)
         userInstance.password=params.newPwd
        userInstance.save(flush: true)
//        println newPassword
//        userInstance.password=newPassword
//         if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
//             mailerService.sendForgetPassword(newPassword,userInstance)

             flash.message = "${message(code:'password.reset.msg',args:[userInstance.username,userInstance.email])}"
             redirect(action: "userList")
//         }
           /* flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "userList")*/
    }

    def assignArea={
        def userList=userService.getUsersList()
        def district=userService.getDistrictList()
        [userInstanceList: userList, userInstanceTotal: userList.size(),district:district]
    }

    def assignAreaAction={
        userService.updateUsersArea(params)
        redirect(action: 'assignArea')
    }

    def resetPassword={

    }

    def findUser={
     def msg=[:]
     def userIns=   User.findByUsername(params.userName)
        if(userIns){
        msg.status="true"
        }
        else{
             msg.status="false"
        }

        render msg as JSON

    }

}
