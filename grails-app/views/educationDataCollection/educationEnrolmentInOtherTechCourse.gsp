<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 2:31 PM
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
      <g:render template="/layouts/dataInfo" />
      <br>
      <h2>Education Form : No Of Enrolment, Other Technical course (Degree/Diploma level)</h2>
      <div style="padding: 20px;border: 2px solid black">
      <g:form controller="educationDataCollection" action="educationNoOfEnrolmentOtherTechCourseSave">
              <g:hiddenField name="educationId" value="${education?.id}"/>

              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of College</span>
                   <div class="field">
                <input  placeholder="Enter Name" type="text" name="name" value="${education?.noOfEnrolmentInOtherTechCourse?.name}" style="width: 28%" />
                  </div>
              </div>
              <div >
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled BE/B tech (Boys)</span>
                   <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBeBtechBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
                   </div >
              </div>
              <div>
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled BE/B tech (Girls)</span>
                   <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBeBtechGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in MBBS (Boys)</span>
                   <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInMbbsBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in MBBS (Girls)</span>
                  <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInMbbsGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in BVSC (Boys)</span>
                  <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBvscBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in BVSC (Girls)</span>
                 <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInBvscGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in agri MSc (Boys)</span>
                   <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInAgriMscBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in agri MSc (Girls)</span>

                  <div class="field"> <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInAgriMscGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled polytech Diploma (Boys)</span>
                 <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInPolytechDeplomaBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaBoys}" style="width: 28%" onkeypress="validateIsNumber(event)" />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled polytech Diploma (Girls)</span>

                  <div class="field"> <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInPolytechDeplomaGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in ITI (Boys)</span>
                  <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInITIBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in ITI (Girls)</span>
                   <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInITIGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>

              <div >
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in Vocational course (Boys)</span>
                  <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInVocationalCourseBoys" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseBoys}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
              </div>
          </div>
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Student Enrolled in Vocational course (Girls)</span>
                    <div class="field">
                  <input  placeholder="Enter Number" type="text" name="noOfStudentEnrolledInVocationalCourseGirls" value="${education?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseGirls}" style="width: 28%" onkeypress="validateIsNumber(event)"  />
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