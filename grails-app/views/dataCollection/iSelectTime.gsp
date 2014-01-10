<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/19/12
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="index,follow" name="robots"/>
    <meta name="layout" content="iwebkit"/>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
    <g:javascript library="jquery" plugin="jquery"/>
    <title>Select Year for which data is collected</title>
    <style type="text/css">
    .store .arrow, .list .withimage .arrow {
        top: 20px !important;
    }
    </style>
    <script src="${resource(dir: 'js', file: 'dataCollection.js')}"/>

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
        <span class="graytitle">Department of Economics & Statistics</span>
    </div>  <br>
    <font size='1' color='red'>
        <g:if test="${flash.message}">
            <div class="message">&nbsp;&nbsp;&nbsp;&nbsp;${flash.message}</div>
        </g:if>
    </font>
    <g:form action="iSavePrimaryInfo">

        <g:hiddenField name="villageCode" value="${village.code}"/>
        <span class="graytitle">Select Year for which data is collected</span>
        <ul class="pageitem">
            <li class="select">
                <g:select name="year" from="${1990..year}" value="${params?.year?:year}"
                          onchange="updateMonth(this.value)"/>
                <span class="arrow"></span>
            </li>
        </ul>

        <span class="graytitle">Select Month for which data is collected</span>
        <ul class="pageitem">
            <li class="select">

                <select name="month" id="month">

                </select>
                <span class="arrow"></span>
            </li>
        </ul>
        <ul class="pageitem">
            <li class="button">
                <input name="Submit input" type="submit" value="Submit primary Info"/></li>
        </ul>

    </g:form>
</div>
<script type="text/javascript">
    updateMonth(${year});
</script>

<div id="footer">
    <a href="http://www.damyant.com" target=_blank>
        Copyright © 2012 Damyant - All Rights Reserved
        %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
</div>
</body>
</html>