<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/14/12
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
      <meta name="layout" content="iwebkit" />
      <link href="${resource(dir: 'images/temp', file: 'homescreen.gif')}" rel="apple-touch-icon"/>
      <title>User Login</title>
  </head>
  <body>
  <div id="topbar">
	<div id="leftnav">

    </div>
       <div align="center">
           <span class="graytitle"> Department of Economics & Statistics </span>
       </div>

	<div id="rightnav">

    </div>
    </div>


  <span class="graytitle">Please Login..</span>
      <font size='1' color='green'>
        <g:if test="${params.message}">
            <div class="message">&nbsp;&nbsp;&nbsp;&nbsp;${params.message}</div>
        </g:if>
      </font>
      <font size='1' color='red'>
        <g:if test="${params.error}">
            <div class="message">&nbsp;&nbsp;&nbsp;&nbsp;${params.error}</div>
        </g:if>
      </font>
    <g:form action="iLoginAction" controller="login" >
     <ul class="pageitem">
       <li class="bigfield"><input name="username" placeholder="User Name" type="text" /></li>
       <li class="bigfield"><input name="password" placeholder="Password" type="password" /></li>
     </ul>
     <ul class="pageitem">
       <li class="button"><input value="Login" class="button" type="submit">
        </li>
     </ul>
    </g:form>

    <br>
   <div id="footer">
		<a href="http://www.damyant.com" target=_blank>
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>