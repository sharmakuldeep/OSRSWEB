<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 12:31 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css">
    .listElement {
        padding: 10px;
        font-size: 15px;
        font-weight: bold;

    }
    </style>
</head>

<body>
<div align="center">
    <h1>Department of Economics & Statistics</h1>
</div>  <br>

<g:render template="/layouts/dataInfo" />

<h2>Infrastructural Facilities</h2>

<div style="padding: 20px;border: 2px solid black">
    <div class="listElement">
        <g:link class="nodffect" action="distanceOfNearest" controller="isfDataCollection">
            <span class="name">Distance(in Km) to the Nearest...</span>
            <span class="arrow"></span>
        </g:link>
    </div>

    <div class="listElement">
        <g:link class="nodffect" action="noOfSW" controller="isfDataCollection">
            <span class="name name1">Nos of Sericulture & weaving</span>
            <span class="arrow"></span>
        </g:link>
    </div>

    <div class="listElement">
        <g:link class="nodffect" action="noOfCSocieties" controller="isfDataCollection">
            <span class="name name1">No of Co-operation of Societies</span>
            <span class="arrow"></span>
        </g:link>
    </div>

</div>

</body>
</html>