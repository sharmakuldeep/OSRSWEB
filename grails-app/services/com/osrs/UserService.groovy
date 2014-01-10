package com.osrs

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsHttpSession
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsWebRequest
import org.springframework.web.context.request.RequestContextHolder
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class UserService {

    static transactional = true
    def springSecurityService
    def grailsApplication

    def serviceMethod() {

    }

    def iUserLoggedInAction(params){
        def c=User.createCriteria()
        def userInstance=c.list {
            eq('username',params.username)
            eq('password',springSecurityService.encodePassword(params.password))
            eq('enabled',true)
            eq('accountExpired',false)
            eq('accountLocked',false)
            eq('passwordExpired',false)
        }[0]
       //def userInstance=User.findByUsernameAndPassword(params.username,springSecurityService.encodePassword(params.password))
       def role=Role.findByAuthority('ROLE_USER')
       def userRole=UserRole.findByUserAndRoleNotEqual(userInstance,role)
        if(userInstance && userRole){
            return userInstance
        }else{
            return false
        }
    }

    def iUserLoggedIn(){
        try {
            GrailsWebRequest request = RequestContextHolder.currentRequestAttributes()
            GrailsHttpSession session = request.session
            if(session.user){
                return session.user
            }else{ return false}
        }
        catch (IllegalStateException ise) {
            log.warn ("No WebRequest available!")
            return false
        }
    }

    def iUserLogOut(){
       try {
            GrailsWebRequest request = RequestContextHolder.currentRequestAttributes()
            GrailsHttpSession session = request.session
            session.user=""

        }
        catch (IllegalStateException ise) {
            log.warn ("No WebRequest available!")
        }
    }

    def updateUserRole(user,role){
        //UserRole.create userInstance, role
       def uRole= UserRole.findAllByUser(user)
        uRole.each{ur->
            ur.delete(flush:true)
        }
        UserRole.create user, role
    }

    def newPwd(Integer len=10){
        def AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
         Random rnd = new Random();
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++)
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        return sb.toString();
    }

    /*
    * Return role list below the current role.
    * */
    def getRoleList() {
        def role=springSecurityService.getPrincipal().authorities*.authority[0]
        def rolesGrated=[]
        def rolesList =Role.list()
        rolesList.each {r ->
            if(SpringSecurityUtils.ifAnyGranted(r.authority) && r.authority!=role){
             rolesGrated.add(r)
            }
        }
       return rolesGrated
    }

    /*
    * Return user list below the current user role.
    * */
    def getUsersList(){
       def roleList=getRoleList()
       def userList=[]
       User.list().each{u->
           def flag=true
           roleList.each{r->
             if(r.authority==u.getAuthorities().authority[0])flag=false
           }
           if(!flag)userList.add(u)
       }
        return userList
    }

    def getDistrictList(){
      def user=springSecurityService.getCurrentUser()
        if(user.state){
           return District.findAllByState(user.state)
        }else{
            return null
        }
    }

    def updateUsersArea(params){
        log.debug "--------updateUsersArea:"+params
        def user=User.findByUsername(params.username)

        def state
        if(params.block && params.block!='null'){
          user.block=Block.findByCode(params.block)
          user.state=null
          user.district=null
        }else if(params.district && params.district!='null'){
          user.district=District.findByCode(params.district)
          user.state=null
          user.block=null
        }else if(params.state){
            user.state=State.findByCode(params.state)
            user.district=null
            user.block=null
        }

        if(user.validate() && user.save(flush:true)){
            return true
        }else{
            log.debug "------error:"+user.errors
            return false
        }
        //println"--------------"+user.properties
    }

}
