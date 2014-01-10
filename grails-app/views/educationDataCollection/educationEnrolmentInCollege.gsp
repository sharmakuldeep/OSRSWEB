<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 12:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta content="main" name="layout">
        <style type="text/css">
        /*.name{*/
            /*float: left;*/
            /*font-size: 15px;*/
            /*white-space:normal;*/
            /*line-height:20px;*/
            /*width: 40%;*/
            /*height: 20px;*/
        /*}*/
        .field{
            float: right;
            width: 57%;
            height: 20px;
        }
    </style>
  </head>
  <body>

  <div id="content">
      <div align="center">
           <h1> Department of Economics & Statistics </h1>
       </div>  <br>
      <g:render template="/layouts/dataInfo" /><br>
      <h2>Education Form : No of Enrolment, College(Degree Level)</h2>

      <div style="padding: 20px;border: 2px solid black">
      <g:form controller="educationDataCollection" action="educationNoOfEnrolmentCollegeSave">
              <g:hiddenField name="educationId" value="${education?.id}"/>

              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of College</span>
                  <div class="field">
                  <input  placeholder="Enter Name" type="text" name="name" value="${education?.noOfEnrolmentInCollege?.name}" style="width: 28%" />
              </div></div>
              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled (Boys)</span>
                 <div class="field">
                <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentEnrolledBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled (Girls)</span>
                  <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentEnrolledGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Attending School (Boys)</span>
                 <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentAttendingBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentAttendingBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Attending School (Girls)</span>

                 <div class="field"> <input  placeholder="Enter Number" type="text" name="noOfStudentAttendingGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentAttendingGirls}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new entrants/fresh entry (Boys)</span>

                  <div class="field"><input  placeholder="Enter Number" type="text" name="noOfNewEntrantsEntryBoys" value="${education?.noOfEnrolmentInCollege?.noOfNewEntrantsEntryBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of new entrants/fresh entry (Girls)</span>
                  <div class="field"><input  placeholder="Enter Number" type="text" name="noOfNewEntrantsEntryGirls" value="${education?.noOfEnrolmentInCollege?.noOfNewEntrantsEntryGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student discontinued Studies (Boys)</span>
                 <div class="field"> <input  placeholder="Enter Number" type="text" name="noOfStudentDiscontinuedStudiesBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentDiscontinuedStudiesBoys}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student discontinued Studies (Girls)</span>
                <div class="field"> <input  placeholder="Enter Number" type="text" name="noOfStudentDiscontinuedStudiesGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentDiscontinuedStudiesGirls}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for discontinuation of studies Economic </span>
                <div class="field">  <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationEconomic" value="${education?.noOfEnrolmentInCollege?.reasonOfDiscontinuationEconomic}" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
          </div>
          <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Reason for discontinuation of studies Non-Economic</span>
               <div class="field">   <input  placeholder="Enter Number" type="text" name="reasonOfDiscontinuationNonEconomic" value="${education?.noOfEnrolmentInCollege?.reasonOfDiscontinuationNonEconomic}" style="width: 28%"  onkeypress="validateIsNumber(event)" />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in University course (Boys)</span>
              <div class="field">    <input  placeholder="Enter Number" type="text" name="noOfStudentsEnrolledInUniversityBoys" value="${education?.noOfEnrolmentInCollege?.noOfStudentsEnrolledInUniversityBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in University course (Girls)</span>
               <div class="field">   <input  placeholder="Enter Number" type="text" name="noOfStudentsEnrolledInUniversityGirls" value="${education?.noOfEnrolmentInCollege?.noOfStudentsEnrolledInUniversityGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>


             <div>
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
                  <g:link controller="educationDataCollection" action="main">
                      <input class="buttonClass" type="button" value="Back">
                  </g:link>
              </div>
      </g:form>
      </div>
  </div>
  </body>
</html>