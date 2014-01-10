import org.codehaus.groovy.grails.commons.GrailsApplication

// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// whether to install the java.util.logging bridge for sl4j. Disable for AppEngine!
grails.logging.jul.usebridge = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.changeme.com"
        grails.attachmentable.uploadDir = "/usr/share/tomcat6/apache-tomcat-6.0.29/webapps/osrs-0.1/docs/"             //Todo change according to server setting

    }
    development {
        grails.serverURL = "http://localhost:8080/${appName}"
        grails.attachmentable.uploadDir = "D:/myspace/Dev Project/osrs/docs/"

    }
    test {
        grails.serverURL = "http://localhost:8080/${appName}"
    }

}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

      debug 'grails.app.controller',
            'grails.app.service',
            'grails.app.domain',
            'grails.app.filter'


    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
           'org.codehaus.groovy.grails.web.pages', //  GSP
           'org.codehaus.groovy.grails.web.sitemesh', //  layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping', // URL mapping
           'org.codehaus.groovy.grails.commons', // core / classloading
           'org.codehaus.groovy.grails.plugins', // plugins
           'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'

    warn   'org.mortbay.log'
}

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'com.osrs.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'com.osrs.UserRole'
grails.plugins.springsecurity.authority.className = 'com.osrs.Role'
grails.plugins.springsecurity.requestMap.className = 'com.osrs.UserRole'
grails.plugins.springsecurity.securityConfigType = 'Annotation'
grails.plugins.springsecurity.roleHierarchy = '''
	ROLE_ADMIN > ROLE_STATE_ADMIN
    ROLE_STATE_ADMIN > ROLE_DATA_ENTRY_OPERATOR
    ROLE_DATA_ENTRY_OPERATOR > ROLE_USER
'''
// Added by the Spring Security Core plugin:

grails.plugins.springsecurity.successHandler.defaultTargetUrl = '/home/index'

mail.template.folder_path="D:\\myspace\\Current Project\\osrs\\grails-app\\conf\\doc\\mail_formats\\"
grails {
    mail {
         from="info.osrs@gmail.com"
        host = "smtp.gmail.com"
        port = "465"



//        username = "nikhils@damyant.com" // Please Change This To Some Valid Value
        //        password = "damyantnikhil"       // Please Change This Corresponding To The Above Value
        username = "info.osrs@gmail.com" // Please Change This To Some Valid Value
        password = "damyant@456"       // Please Change This Corresponding To The Above Value

        props = ["mail.smtp.auth": "true",
                "mail.smtp.socketFactory.port": "465",
                "mail.smtp.socketFactory.class": "javax.net.ssl.SSLSocketFactory",
                "mail.smtp.socketFactory.fallback": "false"]
    }
}

from.email_id="info.osrs@gmail.com"
//year =  (new Date()).getYear()+1900
startyear=1990
////// Attachmentable Plugin settings
grails.attachmentable.maxInMemorySize = 1024
grails.attachmentable.maxUploadSize = 1024000000
grails.attachmentable.poster.evaluator = { "unknown" }

