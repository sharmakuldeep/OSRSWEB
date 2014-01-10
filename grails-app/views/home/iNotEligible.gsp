<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 10/15/12
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta content="yes" name="apple-mobile-web-app-capable"/>
       <meta content="index,follow" name="robots"/>
      <meta name="layout" content="iwebkit" />
       <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>

       <title>Not Eligible</title>
       <style type="text/css">
           .store .arrow, .list .withimage .arrow {
	top: 20px!important;

}
           .massage{
               padding: 3%;
               margin: 3%;
               font-weight: bold;
               font-size: 20px;
               background-color: #9999ff;
               -moz-border-radius: 20px;
               border-radius: 20px;
               text-align: center;
               }
       </style>

  </head>

<body class="applist">
<div id="topbar">

    <div id="rightnav">
        <g:link action="iLogOut" controller="login">Log out</g:link>
    </div>
    </div>
<div id="content">
    <div align="center">
           <span class="graytitle"> Department of Economics & Statistics </span>
       </div>  <br>
    <div class="massage">
        You are not having Data collection privilege.
         <br><br>
        Please Contact Admin to get this privilege.


    </div>

</div>


  <div id="footer">
	<a href="http://damyant.com">
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>