<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/6/12
  Time: 12:12 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
     <style type="text/css">

        .field{
            float: right;
            width: 57%;
            height: 20px;
        }
    </style>
</head>

<body>

<div align="center">
    <h1>Department of Economics & Statistics</h1>
</div>  <br>

    <g:render template="/layouts/dataInfo" />

<h2>Health And Family Welfare Form: Hospitals (Others)</h2>

<div style="padding: 20px;border: 2px solid black">
    <g:form controller="healthDataCollection" action="saveVitalStatisticsHealthData">

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Beds For Women No's</span>
       <div class="field">       <input placeholder="Enter Number" type="text" name="health39" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health39}" onkeypress="validateIsNumber(event)"/>
        </div>  </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">ASHA - Workers No's</span>
           <div class="field">   <input placeholder="Enter Number" type="text" name="health40" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health40}" onkeypress="validateIsNumber(event)"/>
        </div>   </div>

        <div>
            <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
            <g:link controller="healthDataCollection" action="main">
                <input class="buttonClass" type="button" value="Back">
            </g:link>
        </div>
    </g:form>
</div>
</body>
</html>