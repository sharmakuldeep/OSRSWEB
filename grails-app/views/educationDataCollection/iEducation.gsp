<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/14/12
  Time: 1:31 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
           <meta name="layout" content="iwebkit" />
            <title>Department of Economics & Statistics</title>
       <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'iStyle.css')}"/>


  </head>
  <body>
   <div id="topbar">
	<div id="leftnav">
		<g:link controller="home" action="iMain">
            <img alt="home" src="${resource(dir: 'images', file: 'home.png')}" />
        </g:link>
        <g:link controller="home" action="iMain">Home</g:link>
    </div>
	   %{--<div align="center"><span class="graytitle">Education Form 1</span></div>--}%
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

      <span class="graytitle">Education Forms</span>
      <ul class="pageitem ">

        <li class="store store1" >
            <g:link class="nodffect" action="iEducationGeneralInfo" controller="educationDataCollection">
            <span class="name name1" >General Info</span>
            <span class="arrow"></span>
            </g:link>
        </li>
        <li class="store store1" >
            <g:link class="nodffect" action="iEducationNoOfInstitution" controller="educationDataCollection">
            <span class="name name1" >No of Institution</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iDistanceOfInstitution" controller="educationDataCollection">
            <span class="name name1" >Distance(in Km) to the Institution From the Village</span>
            <span class="arrow"></span>
            </g:link>
        </li>
          <g:if test="${education?.edu5}">
              <%for(int i=0;i<education?.edu5;i++){ %>
              <li class="store store1" >
                  <g:link class="nodffect" action="iNoOfEnrolment" controller="educationDataCollection" params="[type:'Pre-Primary School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Pre-Primary School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </li>
              <% } %>
          </g:if>
          <g:if test="${education?.edu6}">
              <%for(int i=0;i<education?.edu6;i++){ %>
              <li class="store store1" >
                  <g:link class="nodffect" action="iNoOfEnrolment" controller="educationDataCollection" params="[type:'Primary School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Primary School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </li>
              <% } %>
          </g:if>
          <g:if test="${education?.edu7}">
              <%for(int i=0;i<education?.edu7;i++){ %>
              <li class="store store1" >
                  <g:link class="nodffect" action="iNoOfEnrolment" controller="educationDataCollection" params="[type:'Middle School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Middle School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </li>
              <% } %>
          </g:if>
          <g:if test="${education?.edu8}">
              <%for(int i=0;i<education?.edu8;i++){ %>
              <li class="store store1" >
                  <g:link class="nodffect" action="iNoOfEnrolment" controller="educationDataCollection" params="[type:'High School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(High School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </li>
              <% } %>
          </g:if>
          <g:if test="${education?.edu9}">
              <%for(int i=0;i<education?.edu9;i++){ %>
              <li class="store store1" >
                  <g:link class="nodffect" action="iNoOfEnrolment" controller="educationDataCollection" params="[type:'Senior Secondary School',no:(i+1)]">
                      <span class="name name1" >No of Enrolment(Senior Secondary School ${i+1})</span>
                      <span class="arrow"></span>
                  </g:link>
              </li>
              <% } %>
          </g:if>

        <li class="store store1" >
            <g:link class="nodffect" action="iEnrolmentInCollege" controller="educationDataCollection" >
            <span class="name name1" >No of Enrolment, College(Degree Level)</span>
            <span class="arrow"></span>
            </g:link>
        </li>
        <li class="store store1" >
            <g:link class="nodffect" action="iEnrolmentInOtherTechCourse" controller="educationDataCollection">
            <span class="name name1" >No of Enrolment, Other Technical Course(Degree/Diploma Level)</span>
            <span class="arrow"></span>
            </g:link>
        </li>

      </ul>


  </div>

   <div id="footer">
		<a href="http://www.damyant.com" target=_blank>
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>