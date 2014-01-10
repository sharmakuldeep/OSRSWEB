<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/15/12
  Time: 1:15 PM
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta content="yes" name="apple-mobile-web-app-capable"/>
       <meta content="index,follow" name="robots"/>
      <meta name="layout" content="iwebkit" />
       <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>

       <title>Select Village</title>
       <style type="text/css">
           .store .arrow, .list .withimage .arrow {
	               top: 20px!important;
                  }
       </style>

  </head>

<body class="applist">
<div id="topbar">
    %{--<div id="leftnav">
        <g:link controller="home" action="iMain"><img alt="home"
                                                        src="${resource(dir: 'iwebkit/demo/images', file: 'home.png')}"/></g:link>
        <g:link controller="home" action="iMain">Home</g:link>

    </div>--}%

    <div id="rightnav">
        <g:link action="iLogOut" controller="login">Log out</g:link>
    </div>
    </div>
<div id="content">
    <div align="center">
           <span class="graytitle"> Department of Economics & Statistics </span>
       </div>  <br>
    <span class="graytitle">Select Village</span>

       <g:each in="${villages}" var="village">
           <ul class="pageitem">
        <li class="store" style="height: 50px;">
            <g:link class="nodffect" action="iSelectTime"  params="[villageCode:village.code]">
                <span class="name" style="top: 17px;left: 50px">${village.name}</span>
                <span class="arrow" style="top: 20px"></span>
            </g:link>
        </li>
           </ul>
        </g:each>

</div>


  <div id="footer">
		<a href="http://www.damyant.com" target=_blank>
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>