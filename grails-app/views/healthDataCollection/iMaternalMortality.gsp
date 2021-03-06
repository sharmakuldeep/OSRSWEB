<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/21/12
  Time: 5:16 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="iwebkit"/>
    <title>Department of Economics & Statistics</title>
    <script type="text/javascript" src="${resource(dir:'js',file:'application.js')}"></script>
</head>

<body>
<div id="topbar">
    <div id="leftnav">
        <g:link controller="healthDataCollection" action="iMain">Back</g:link></div>

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
        <span class="graytitle">Village:${village.name}</span>
        <span class="graytitle">Block:${village.block.name}</span>
        <span class="graytitle">District:${village.block.district.name}</span>
        <span class="graytitle">State:${village.block.district.state.name}</span> <br>
        <span class="graytitle">Year:${year}</span>
        <span class="graytitle">Month:${month}</span><br>
        <span class="graytitle">Health And Family Welfare: Vital Statistics(Maternal Mortality)</span>
      <g:form controller="healthDataCollection" action="iSaveVitalStatisticsHealthData">
          <ul class="pageitem">

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Post Delivery Death</span>
              <input  placeholder="Enter Number" type="text" name="health55" style="width: 28%;font-size: 15px;" value="${healthFW?.health55}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">0 to 7 Days</span>
              <input  placeholder="Enter Number" type="text" name="health56" style="width: 28%;font-size: 15px;" value="${healthFW?.health56}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">8 to 30 Days</span>
              <input  placeholder="Enter Number" type="text" name="health57" style="width: 28%;font-size: 15px;" value="${healthFW?.health57}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">31 to 42 Days</span>
              <input  placeholder="Enter Number" type="text" name="health58" style="width: 28%;font-size: 15px;" value="${healthFW?.health58}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="button">
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
              </li>
          </ul>
      </g:form>
  </div>

   <div id="footer">
	<a href="http://www.damyant.com" target="_blank">
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>
