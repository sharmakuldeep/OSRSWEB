package com.osrs
import grails.plugins.springsecurity.Secured
import groovy.sql.Sql
import  javax.sql.DataSource
import net.sf.jasperreports.engine.JasperFillManager
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource
import org.codehaus.groovy.grails.plugins.jasper.JasperExportFormat;
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef;
import org.apache.commons.io.FileUtils
import org.springframework.jdbc.datasource.DataSourceUtils;

import javax.sql.*
import java.sql.Connection

class JasperReportController {
    def dataSource
    def jasperReportDef
    def jasperService
    def userService
    def dataCollectionService
    def springSecurityService
    def blockReport = {
        def userInstance=User.findByUsername(springSecurityService.currentUser.username)
        def inProgressRecords=InProgressRecords.findByUserCreated(userInstance)
        if(inProgressRecords){
            session.village=inProgressRecords.village
            redirect(action:"selectCatg")
        }
        def state=null,district=null,block=null,districts=null,blocks=null,panchayats=null, panchayat=null,villages=null

        if(userInstance.state){
            state=userInstance.state
            districts=District.findAllByState(state)
        }else if(userInstance.district){
            district=userInstance.district
            state=district.state
            blocks=Block.findAllByDistrict(district)
        }else if(userInstance.block){

            block=userInstance.block
            district=block.district
            state=district.state
            panchayat=GramPanchayat.findAllByBlock(block)
        }  else if(userInstance.panchayat){
            panchayat=userInstance.panchayat
            block=panchayat.block
            district=block.district
            state = district.state
            villages=Village.findAllByGramPanchayat(panchayat)
        }
        def states=State.list()
        def year= (new Date()).getYear()+1900
        def startYear= grailsApplication.config.startyear

        [states:states,year:year,startyear:startYear,state:state,district:district,block:block,districts:districts,blocks:blocks, panchayat:panchayat,villages:villages]

    }
    def districtReport = {
        def userInstance=User.findByUsername(springSecurityService.currentUser.username)
        def state=null,district=null,block=null,districts=null,blocks=null, panchayat=null,villages=null

        if(userInstance.state){
            state=userInstance.state
            districts=District.findAllByState(state)
        }else if(userInstance.district){
            district=userInstance.district
            state=district.state
            blocks=Block.findAllByDistrict(district)
        }else if(userInstance.block){

            block=userInstance.block
            district=block.district
            state=district.state
            panchayat=GramPanchayat.findAllByBlock(block)
        }
//        else if(userInstance.panchayat){
//            panchayat=userInstance.panchayat
//            block=panchayat.block
//            district=block.district
//            state = district.state
//            villages=Village.findAllByGramPanchayat(panchayat)
//        }
        def states=State.list()
        def year= (new Date()).getYear()+1900
        def startYear= grailsApplication.config.startyear

        [states:states,year:year,startyear:startYear,state:state,district:district,block:block,districts:districts,blocks:block]

    }
    def stateReport = {
        println("in stateReport")
        def states=State.list()
        log.debug"===DataCorrectionController=main========="+states
        def startYear= grailsApplication.config.startyear
        def year= (new Date()).getYear()+1900
        [states:states,year:year,startyear:startYear]
    }


        def generateStateReport = {
            println("params are "+params)
            def month= params.month
            def year= params.year
            params.put("_format","XLSX")
            def state= State.list()
            def districts= state.district
            params.put("stateId",state.id)
            params.put("year",year)
            params.put("month",month)
            if(params.category=='Education'){
                params.put("_file", "stateReportEdu.jrxml")

               chain(controller: 'jasper', action:'index',data:state, params:params)
            }
            if(params.category== "HealthAndFamilyWelfare"){
                params.put("_file", "stateHealthAndFamilyWelfare.jrxml")
                chain(controller: 'jasper', action:'index',data:state, params:params)
            }
            if(params.category== "Infrastructure"){
                params.put("_file", "stateReportInfra.jrxml")
                 chain(controller: 'jasper', action:'index',data:state, params:params)
            }


        }
    def generateDistrictReport = {
        def state= State.findAllByCode(params.stateCode)
        def district=District.findByCode(params.district)
        def month= params.month
        def year= params.year
        params.put("_format","XLSX")
        params.put("districtId",district.id)
        params.put("stateId",state.id)
        params.put("year",year)
        params.put("month",month)
        params.put("_format","XLSX")
        if(params.category=='Education'){
            params.put("_file", "districtReportEdu.jrxml")
            chain(controller: 'jasper', action:'index',data:state, params:params)
        }
        if(params.category== "HealthAndFamilyWelfare"){
            params.put("_file", "districtHealthAndFamilyWelfare.jrxml")
            chain(controller: 'jasper', action:'index',data:state, params:params)
        }
        if(params.category== "Infrastructure"){
            params.put("_file", "districtReportInfra.jrxml")
            chain(controller: 'jasper', action:'index',data:state, params:params)
        }
}

    def generateBlockReport = {
        def state= State.findAllByCode(params.state)
        def district=District.findByCode(params.district)
        def block= Block.findByCode(params.block)
        def month= params.month
        def year= params.year
        params.put("_format","XLSX")
        params.put("districtId",district.id)
        params.put("blockId",block.id)
        params.put("stateId",state.id)
        params.put("year",year)
        params.put("month",month)
        params.put("_format","XLSX")
        if(params.category=='Education'){
            params.put("_file", "blockReportEdu.jrxml")
            chain(controller: 'jasper', action:'index',data:state, params:params)
        }
        if(params.category== "HealthAndFamilyWelfare"){
            params.put("_file", "blockHealthAndFamilyWelfare.jrxml")
            chain(controller: 'jasper', action:'index',data:state, params:params)
        }
        if(params.category== "Infrastructure"){
            params.put("_file", "blockReportInfra.jrxml")
            chain(controller: 'jasper', action:'index',data:state, params:params)
        }





        ////        params.put("jasper","report2")
//        params.put("gramID",2)
//            def details= [:]
//        params.put("finalList",Village.list())
        //            details.put('states', state)
//            details.put('districts',districts)
//            def level, code, category
        //       / def ab=Village.list()
//println("<<<<<<<<<<<<<"+finalList)
//        if(params.stateCode!=null){
//        level='S'
//        code=params.stateCode
//    }
//    if(params.category==Categories.EDUCATION.value()){
//                  def finalList=dataCollectionService.getEducationData1(params,'edu',level,code)
////        List ll = new ArrayList()
////        ll.add("kuldeep");
////        ll.add("sharma")
//////        println("Name of state is<<<<<< "+finalList.total.village.gramPanchayat.block.district.state.name)
//////        println("type of list "+finalList.type)
//////        println("subtype of finalList "+finalList.subType)
//////        Map result =[:]
//////        result.data=[finalList:finalList]
//////        result.data<<[name:'kuldeep', surname:'sharma']
//        InputStream stream = this.class.getResourceAsStream("/reports/test.jrxml")
//        JRBeanCollectionDataSource data= new JRBeanCollectionDataSource(result)
//        def report = JasperFillManager.fillReport(stream, params, data)
//        def reportDef= jasperService.buildReportDefinition(params,request.getLocale(),result)
//        response.setHeader("Content-disposition", "attachment; filename=\"Report."+reportDef.fileFormat.extension+"\"")
//        response.contentType= reportDef.fileFormat.mimeTyp
//        response.characterEncoding='UTF-8'
//        response.outputStream << reportDef.contentStream.toByteArray()
//        params.data='report2'
//        JasperReportDef rep = jasperService.buildReportDefinition(params, request.locale,result)
//        ByteArrayOutputStream stream = jasperService.generateReport(rep)
//        response.setHeader("Content-disposition", "attachment; filename="+'jasperReport'+".pdf")
//        response.contentType='application/pdf'
//        response.outputStream <<stream.toByteArray()
//            def myappsql = new Sql(dataSource)
//            Connection conn = myappsql.getConnection()
//            println("connection is "+ conn)
//    report = JasperFillManager.fillReport(stream, params, connection)
//    DataSourceUtils.releaseConnection(connection, dataSource)
    }

    }