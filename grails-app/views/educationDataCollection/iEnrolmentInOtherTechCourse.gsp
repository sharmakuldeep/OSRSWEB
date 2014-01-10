<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/18/12
  Time: 12:25 PM
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
        <span class="graytitle">Department of Economics & Statistics</span>
    </div>  <br>
    <span class="graytitle">Village:${village.name}</span>
    <span class="graytitle">Block:${village.block.name}</span>
    <span class="graytitle">District:${village.block.district.name}</span>
    <span class="graytitle">State:${village.block.district.state.name}</span> <br>
    <span class="graytitle">Year:${year}</span>
    <span class="graytitle">Month:${month}</span><br>
    <span class="graytitle">No of Enrolment, Other Technical course (Degree/Diploma level)</span>
    <g:form controller="educationDataCollection" action="iEducationNoOfEnrolmentOtherTechCourseSave">
        <ul class="pageitem">
              <g:hiddenField name="educationId" value="${education?.id}"/>

              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of College</span>
                <input  placeholder="Enter Name" type="text" name="name" value="${education?.noOfEnrolmentInOtherTechCourse?.name}" style="width: 28%" />
              </li>
              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled BE/B tech (Boys)</span>
                <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBeBtechBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled BE/B tech (Girls)</span>
                <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBeBtechGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in MBBS (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInMbbsBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in MBBS (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInMbbsGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in BVSC (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBvscBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in BVSC (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBvscGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in Agri MSc (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInAgriMscBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No Students Enrolled in Agri MSc (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInAgriMscGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No Students Enrolled Polytech Diploma (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInPolytechDeplomaBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaBoys}" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No Students Enrolled Polytech Diploma (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInPolytechDeplomaGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in ITI (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInITIBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in ITI (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInITIGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in Vocational Course (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInVocationalCourseBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled in Vocational Course (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInVocationalCourseGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>


              <li class="button">
                  <input  class="buttonClass" name="Submit input" type="submit" value="Save"/>
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