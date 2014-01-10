<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 11:59 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="main" />

      <style type="text/css">
          .listElement{
              padding: 10px;
              font-size: 15px;
              font-weight: bold;

          }
      </style>
  </head>
  <body>

  <div align="center">
           <h1> Department of Economics & Statistics </h1>
       </div>  <br>
  <g:render template="/layouts/dataInfo" />
      <br>
      <h2>Education Form</h2>

  <div style="padding: 20px;border: 2px solid black">
        <div class="listElement" >
            <g:link class="nodffect" action="educationGeneralInfo" controller="educationDataCollection" tabindex="0" >
            <span class="name name1" >General Info</span>
            <span class="arrow"></span>
            </g:link>
        </div>
        <div class="listElement" >
            <g:link class="nodffect" action="educationNoOfInstitution" controller="educationDataCollection" tabindex="2">
            <span class="name name1" >No of Institution</span>
            <span class="arrow"></span>
            </g:link>
        </div>

        <div class="listElement">
            <g:link class="nodffect" action="educationDistanceOfInstitution" controller="educationDataCollection" tabindex="3">
            <span class="name name1" >Distance(in Km) to the Institution from the Village</span>
            <span class="arrow"></span>
            </g:link>
        </div>
          <g:if test="${education?.edu5}">
              <%for(int i=0;i<education?.edu5;i++){ %>
              <div class="listElement">
                  <g:link class="nodffect" action="educationNoOfEnrolment" controller="educationDataCollection"  tabindex="4" params="[type:'Pre-Primary School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Pre-Primary School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </div>
              <% } %>
          </g:if>
          <g:if test="${education?.edu6}">
              <%for(int i=0;i<education?.edu6;i++){ %>
              <div class="listElement">
                  <g:link class="nodffect" action="educationNoOfEnrolment" controller="educationDataCollection" tabindex="5" params="[type:'Primary School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Primary School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </div>
              <% } %>
          </g:if>
          <g:if test="${education?.edu7}">
              <%for(int i=0;i<education?.edu7;i++){ %>
              <div class="listElement">
                  <g:link class="nodffect" action="educationNoOfEnrolment" controller="educationDataCollection" tabindex="6" params="[type:'Middle School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Middle School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </div>
              <% } %>
          </g:if>
          <g:if test="${education?.edu8}">
              <%for(int i=0;i<education?.edu8;i++){ %>
              <div class="listElement" >
                  <g:link class="nodffect" action="educationNoOfEnrolment" controller="educationDataCollection" tabindex="7" params="[type:'High School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(High School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </div>
              <% } %>
          </g:if>
          <g:if test="${education?.edu9}">
              <%for(int i=0;i<education?.edu9;i++){ %>
              <div class="listElement" >
                  <g:link class="nodffect" action="educationNoOfEnrolment" controller="educationDataCollection" tabindex="8" params="[type:'Senior Secondary School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Senior Secondary School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </div>
              <% } %>
          </g:if>

        <div class="listElement" >
            <g:link class="nodffect" action="educationEnrolmentInCollege" controller="educationDataCollection" tabindex="9">
            <span class="name name1" >No of Enrolment, College(Degree Level)</span>
            <span class="arrow"></span>
            </g:link>
        </div>
        <div class="listElement" >
            <g:link class="nodffect" action="educationEnrolmentInOtherTechCourse" controller="educationDataCollection" tabindex="10">
            <span class="name name1" >No of Enrolment, Other Technical course(Degree/Diploma Level)</span>
            <span class="arrow"></span>
            </g:link>
        </div>

  </div>
  </body>
</html>