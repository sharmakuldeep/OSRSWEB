package com.osrs

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import com.osrs.templates.MailTemplates

class MailerService {

    def mailService

    static transactional = true

    def serviceMethod() {

    }

    def sendForgetPassword(password, User userInstance) {
		String sMailContent = MailTemplates.forgotPasswordTemplate(password,userInstance.username)

		mailService.sendMail {
			to userInstance.email
			from ConfigurationHolder.config.from.email_id
			subject "Password for Statistical application!"
			body sMailContent
		}
	}

}
