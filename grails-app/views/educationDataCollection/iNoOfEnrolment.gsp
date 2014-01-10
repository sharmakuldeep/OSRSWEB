<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/16/12
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="iwebkit"/>
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
    <span class="graytitle">No of Enrolment (${type} ${no + 1})</span>
      <g:form controller="educationDataCollection" action="iEducationNoOfEnrolmentSave">
         <g:if test="${noOfEnrolment}">
             <ul class="pageitem">
              <g:hiddenField name="educationId" value="${education?.id}"/>
              <g:hiddenField name="id" value="${noOfEnrolment?.id[no]}"/>
              <g:hiddenField name="institutionType" value="${type}"/>

              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of Institution</span>
                <input  placeholder="Enter Name" type="text" name="name" value="${noOfEnrolment?.name[no]}" style="width: 28%" />
              </li>
              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled (Boys)</span>
                <input  placeholder="Enter Number" type="text" name="studentEnrolledBoys" value="${noOfEnrolment?.studentEnrolledBoys[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled (Girls)</span>
                <input  placeholder="Enter Number" type="text" name="studentEnrolledGirls" value="${noOfEnrolment?.studentEnrolledGirls[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Attending School (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="studentAttendingBoys" value="${noOfEnrolment?.studentAttendingBoys[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Attending School (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="studentAttendingGirls" value="${noOfEnrolment?.studentAttendingGirls[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of New Entrants/Fresh Entry (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="newEntrantsBoys" value="${noOfEnrolment?.newEntrantsBoys[no]}" style="width: 28%;" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of New Entrants/Fresh Entry (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="newEntrantsGirls" value="${noOfEnrolment?.newEntrantsGirls[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Discontinued Studies (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesBoys" value="${noOfEnrolment?.studentDiscontinuedStudiesBoys[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Discontinued Studies (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesGirls" value="${noOfEnrolment?.studentDiscontinuedStudiesGirls[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for Discontinuation of Studies Economic </span>
                  <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationEconomic" value="${noOfEnrolment?.reasonOfDiscontinuationEconomic[no]}" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for Discontinuation of Studies Non-Economic</span>
                  <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationNonEconomic" value="${noOfEnrolment?.reasonOfDiscontinuationNonEconomic[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Teachers ${type} (Male)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfTeacherMale" value="${noOfEnrolment?.noOfTeacherMale[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Teachers ${type} (Female)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfTeacherFemale" value="${noOfEnrolment?.noOfTeacherFemale[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>

              <g:if test="${type=='High School'}">
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Child Aged 6-14yrs, Never Enrolled in School </span>
                  <input  placeholder="Enter Number" type="text" name="noChildNeverEnrolled" value="${noOfEnrolment?.noChildNeverEnrolled[no]}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </li>
              </g:if>

              <li class="button">
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
              </li>
          </ul>
         </g:if>
          <g:else>
             <ul class="pageitem">
              <g:hiddenField name="educationId" value="${education?.id}"/>
              <g:hiddenField name="id" value="${noOfEnrolment?.id}"/>
              <g:hiddenField name="institutionType" value="${type}"/>

              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of Institution</span>
                <input  placeholder="Enter Name" type="text" name="name" value="" style="width: 28%" />
              </li>
              <li class="smallfield" >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled (Boys)</span>
                <input  placeholder="Enter Number" type="text" name="studentEnrolledBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Enrolled (Girls)</span>
                <input  placeholder="Enter Number" type="text" name="studentEnrolledGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Attending School (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="studentAttendingBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Attending School (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="studentAttendingGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of New Entrants/Fresh Entry (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="newEntrantsBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of New Entrants/Fresh Entry (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="newEntrantsGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Discontinued Studies (Boys)</span>
                  <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesBoys" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Students Discontinued Studies (Girls)</span>
                  <input  placeholder="Enter Number" type="text" name="studentDiscontinuedStudiesGirls" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for Discontinuation of Studies Economic </span>
                  <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationEconomic" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for Discontinuation of Studies Non-Economic</span>
                  <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationNonEconomic" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield" >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Teachers ${type} (Male)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfTeacherMale" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Teachers ${type} (Female)</span>
                  <input  placeholder="Enter Number" type="text" name="noOfTeacherFemale" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              <g:if test="${type=='High School'}">
              <li class="smallfield">
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Child Aged 6-14yrs, Never Enrolled in School </span>
                  <input  placeholder="Enter Number" type="text" name="noChildNeverEnrolled" value="" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </li>
              </g:if>

              <li class="button">
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
              </li>
          </ul>
          </g:else>
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