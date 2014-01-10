<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/17/12
  Time: 5:22 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="iwebkit"/>
    <title>Education Form 1</title>
    <script type="text/javascript" src="${resource(dir: 'js',file: 'application.js')}"></script>
</head>

<body>
<div id="topbar">
    <div id="leftnav">
        <g:link controller="educationDataCollection" action="iEducation">Back</g:link>
    </div>

    <div id="rightnav">
        <g:link action="iLogOut" controller="login">Log out</g:link>
    </div>
</div>

<div id="content">
      <div align="center">
           <span class="graytitle"> Department of Economics & Statistics </span>
       </div>  <br>
      <span class="graytitle">Village:${village.name}</span>
    <span class="graytitle">Block:${village.block.name}</span>
    <span class="graytitle">District:${village.block.district.name}</span>
    <span class="graytitle">State:${village.block.district.state.name}</span> <br>
    <span class="graytitle">Year:${year}</span>
    <span class="graytitle">Month:${month}</span><br>
      <span class="graytitle">No of Enrolment, College (Degree level)</span>
      <g:form controller="educationDataCollection" action="iEducationNoOfEnrolmentCollegeSave">
             <ul class="pageitem">
              <g:hiddenField name="educationId" value="${education?.id}"/>

              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of College</span>
                <input  placeholder="Enter Name" type="text" name="name" value="${education?.noOfEnrolmentInCollege?.name}" style="width: 28%" />
              </li>
              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled (Boys)</span>
                <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentEnrolledBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled (Girls)</span>
                <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentEnrolledGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Attending School (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentAttendingBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentAttendingBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Attending School (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentAttendingGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentAttendingGirls}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new Entrants/Fresh Entry (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfNewEntrantsEntryBoys" value="${education?.noOfEnrolmentInCollege?.noOfNewEntrantsEntryBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new Entrants/Fresh Entry (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfNewEntrantsEntryGirls" value="${education?.noOfEnrolmentInCollege?.noOfNewEntrantsEntryGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Discontinued Studies (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentDiscontinuedStudiesBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentDiscontinuedStudiesBoys}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Discontinued Studies (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentDiscontinuedStudiesGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentDiscontinuedStudiesGirls}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for Discontinuation of Studies Economic </span>
                  <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationEconomic" value="${education?.noOfEnrolmentInCollege?.reasonOfDiscontinuationEconomic}" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for Discontinuation of Studies Non-Economic</span>
                  <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationNonEconomic" value="${education?.noOfEnrolmentInCollege?.reasonOfDiscontinuationNonEconomic}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in University Course (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentsEnrolledInUniversityBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentsEnrolledInUniversityBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in University Course (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentsEnrolledInUniversityGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentsEnrolledInUniversityGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>


              <li class="button">
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
              </li>
          </ul>
      </g:form>
  </div>

   <div id="footer">
		<a href="http://www.damyant.com" target=_blank>
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>