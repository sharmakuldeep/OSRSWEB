import org.springframework.security.core.context.SecurityContextHolder as SCH

import grails.converters.JSON
import javax.servlet.http.HttpServletResponse
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter
import com.osrs.User
import com.osrs.DataStatus
import com.osrs.Role
import com.osrs.UserRole
import org.springframework.mail.MailSender
import com.osrs.State
import com.osrs.Village

class LoginController {
    def userService
    def mailService
	/**
	 * Dependency injection for the authenticationTrustResolver.
	 */
	def authenticationTrustResolver

	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService

	/**
	 * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
	 */
	def index = {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'auth', params: params
        }
	}

	/**
	 * Show the login page.
	 */

	def auth = {
		println "params are ${params}"
        def config = SpringSecurityUtils.securityConfig

        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
//            redirect(controller: "statsAnalysis",action: "home")
            return

        }

        String view = 'auth'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl: postUrl,
                rememberMeParameter: config.rememberMe.parameter]
	}

	/**
	 * The redirect action for Ajax requests.
	 */
	def authAjax = {
		response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
		response.sendError HttpServletResponse.SC_UNAUTHORIZED
	}

	/**
	 * Show denied page.
	 */
	def denied = {
		if (springSecurityService.isLoggedIn() &&
				authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
			// have cookie but the page is guarded with ROLE_USER
			redirect action: 'full', params: params
		}
	}

	/**
	 * Login page for users with a remember-me cookie but accessing a ROLE_USER page.
	 */
	def full = {
		def config = SpringSecurityUtils.securityConfig
		render view: 'auth', params: params,
			model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
			        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
	}

	/**
	 * Callback after a failed login. Redirects to the auth page with a warning message.
	 */
	def authfail = {

		def username = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
		String msg = ''
		def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
		if (exception) {
			if (exception instanceof AccountExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.expired")
			}
			else if (exception instanceof CredentialsExpiredException) {
				msg = g.message(code: "springSecurity.errors.login.passwordExpired")
			}
			else if (exception instanceof DisabledException) {
				msg = g.message(code: "springSecurity.errors.login.disabled")
			}
			else if (exception instanceof LockedException) {
				msg = g.message(code: "springSecurity.errors.login.locked")
			}
			else {
				msg = g.message(code: "springSecurity.errors.login.fail")
			}
		}

		if (springSecurityService.isAjax(request)) {
			render([error: msg] as JSON)
		}
		else {
			flash.message = msg
			redirect action: 'auth', params: params
		}
	}

	/**
	 * The Ajax success redirect url.
	 */
	def ajaxSuccess = {
        println("successsssssssssss")
		render([success: true, username: springSecurityService.authentication.name] as JSON)
	}

	/**
	 * The Ajax denied redirect url.
	 */
	def ajaxDenied = {
		render([error: 'access denied'] as JSON)
	}


    def iLogin={
        if(userService.iUserLoggedIn()){
          redirect(action:"iMain", controller:"home", params:[username:session.user])
        }
    }

    def iLoginAction={

       def userInstance=userService.iUserLoggedInAction(params)
       //def userInstance=User.findByUsernameAndPassword(params.username,springSecurityService.encodePassword(params.password))
       //def role=Role.findByAuthority('ROLE_USER')
       //def userRole=UserRole.findByUserAndRoleNotEqual(userInstance,role)
       if(userInstance){
           session.user=userInstance
          redirect(action:"iMain", controller:"home")
       }else{
         def error="User name and Password is not valid"
          redirect(action:"iLogin", controller:"login",params:[error:error])
       }
    }

    def iLogOut={
       userService.iUserLogOut()
        def message="User Successfully Logged Out"
       redirect(action:"iLogin", controller:"login",params:[message:message])
    }
      def forgotPassword = {
        log.debug "On Forgot Passowrddddddddd" + params
        String to1 = '', from = '', senderName = '', subject1 = '', message = '', renderMessage = '', emailId=''
        Boolean send = false
          def userInstance=User.findByUsername(params.userName)

          if(userInstance){
              emailId=userInstance.email
              send =true
//              from='ajay30singh@gmail.com'
          }
          else{
              renderMessage= 'Sorry,we are not able to find the username.'
          }
//           if (params.userName == 'user'||params.userName=='user_deo') {
//               User user= User.findByUsername("user");
//                to1 =user.email
//                from1 = user .email
//                send = true
//           }
//            else if(params.userName=='user_hq'){
//                send = false
//                renderMessage = 'Sorry, User ' + params.userName.trim() + ' does not exists  '
//           }
//          else if(params.userName!= 'user' || params.userName!= 'user_deo'){
//               send=false
//               renderMessage= 'Sorry,Please check the ' +params.userName.trim()+ ' name '
//           }

          if (send) {
             userInstance.password= 'damyant@123!#'
              subject1 = "Password Reset"
              message = """Dear User,\n
                     Your password for the user name  "${params.userName.trim()}"  has been reset to 'damyant@123!#', Now you can login by using this password.\n
          \n\nThanks and Regards,\n
       Administrative  Team"""


              mailService.sendMail {
                  to(emailId)
                  subject(subject1)
                  body(message)
              }
              render "Mail Sent"
          }
          else {
              render renderMessage
          }
      }


}
