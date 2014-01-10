<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/15/12
  Time: 5:01 PM
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
      <span class="graytitle">Education Form: No of Institution</span>
      <g:form controller="educationDataCollection" action="iEducationSave">
          <ul class="pageitem">
             %{-- <li class="smallfield"><span class="name">Name of Block</span><input placeholder="enter text"
                                                                                   type="text" value=""/>
              </li>
              <li class="smallfield"><span class="name">Name of Village</span><input placeholder="enter text"
                                                                                     type="text"/>
              </li>--}%
              <li class="smallfield"><span class="name">Pre-Primary School</span>
              <input  placeholder="Enter Number" type="text" name="edu5" value="${education?.edu5}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Primary School</span>
                  <input placeholder="Enter Number" type="text" name="edu6" value="${education?.edu6}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Middle School</span>
                  <input placeholder="Enter Number" type="text" name="edu7" value="${education?.edu7}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">High School</span>
                  <input placeholder="Enter Number" type="text" name="edu8" value="${education?.edu8}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">Senior Secondary School</span>
                  <input placeholder="Enter Number" type="text" name="edu9" value="${education?.edu9}" onkeypress="validateIsNumber(event)" />
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