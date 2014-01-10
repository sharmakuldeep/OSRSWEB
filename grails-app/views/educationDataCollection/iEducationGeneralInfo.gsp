

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="iwebkit"/>
      <title>Education Form 1</title>
      <script type="text/javascript" src="${resource(dir: 'js', file: 'application.js')}"></script>
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
      <g:render template="/layouts/dataInfo" />
      <br>
      <span class="graytitle">Education Form: General Info</span>
      <g:form controller="educationDataCollection" action="iEducationSave">
          <ul class="pageitem">

              <li class="smallfield"><span class="name">No of Adult Education Center Functioning</span>
              <input  placeholder="Enter Number" type="text" name="edu3" value="${education?.edu3}" onkeypress="validateIsNumber(event)" />
              </li>
              <li class="smallfield"><span class="name">No of Adult Educated</span>
                  <input placeholder="Enter Number" type="text" name="edu4" value="${education?.edu4}" onkeypress="validateIsNumber(event)"/>
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