package com.osrs.templates

import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.apache.log4j.Logger

/**
 * Created by IntelliJ IDEA.
 * User: aman
 * Date: 9/24/12
 * Time: 1:04 PM
 * To change this template use File | Settings | File Templates.
 */
class MailTemplates {

    static Logger log = Logger.getLogger(MailTemplates.class.getName())
    public static String forgotPasswordTemplate(String password, username){
		def config = ConfigurationHolder.config
        println("-------------:"+config.startyear)
		def sFolderPath =  config.mail.template.folder_path
        println"====================:"+sFolderPath
		def sFilePath = (sFolderPath).toString() + "forgot_pass_mail.txt"
        println "-----------------"+sFilePath
		def sStr = new File(sFilePath).text

		def engine = new groovy.text.SimpleTemplateEngine()
		def template = engine.createTemplate(sStr)
		def binding = [
					password: password,
					username: username
				]
		String sMail =  template.make(binding).toString()
		log.debug("Mail Content :"+sMail)
		return sMail
	}
}
