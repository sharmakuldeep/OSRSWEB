<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/18/12
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="iwebkit"/>
    <title>Department of Economics & Statistics</title>
    <script type="text/javascript" src="${resource(dir: 'js',file: 'application.js')}"></script>
</head>

<body>
<div id="topbar">
    <div id="leftnav">
        <g:link controller="educationDataCollection" action="iEducation">Back</g:link></div>

    <div id="rightnav">
        <g:link action="iLogOut" controller="login">Log out</g:link>
    </div>
</div>

<div id="content">
      <div align="center">
           <span class="graytitle"> Department of Economics & Statistics </span>
       </div>  <br>
    <font size='1' color='red'>
        <g:if test="${flash.message}">
            <div class="message">&nbsp;&nbsp;&nbsp;&nbsp;${flash.message}</div>
        </g:if>
      </font>
      <span class="graytitle">Village:${village.name}</span><br>
      <span class="graytitle">Education Form: Distance(in Km) from Institution</span>
      <g:form controller="educationDataCollection" action="iDistanceOfInstitutionSave">
          <ul class="pageitem">
             %{-- <li class="smallfield"><span class="name">Name of Block</span><input placeholder="enter text"
                                                                                   type="text" value=""/>
              </li>
              <li class="smallfield"><span class="name">Name of Village</span><input placeholder="enter text"
                                                                                     type="text"/>
              </li>--}%
              <li class="smallfield"><span class="name">College with Degree Course</span>
              <input  placeholder="Enter Number" type="text" name="edu10" value="${education?.edu10}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">College with Master Degree/University</span>
                  <input placeholder="Enter Number" type="text" name="edu11" value="${education?.edu11}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Industrial Training Institute (ITI)</span>
                  <input placeholder="Enter Number" type="text" name="edu12" value="${education?.edu12}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Non-Formal Education Center</span>
                  <input placeholder="Enter Number" type="text" name="edu13" value="${education?.edu13}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Special School for Blind</span>
                  <input placeholder="Enter Number" type="text" name="edu14" value="${education?.edu14}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Special School for Mentally Retarded</span>
                  <input placeholder="Enter Number" type="text" name="edu15" value="${education?.edu15}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Vocational Training Center/School</span>
                  <input placeholder="Enter Number" type="text" name="edu16" value="${education?.edu16}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Institute for Rehabilitation of Disable Person</span>
                  <input placeholder="Enter Number" type="text" name="edu17" value="${education?.edu17}" onkeypress="validateIsNumber(event)" />
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