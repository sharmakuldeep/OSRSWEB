<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/21/12
  Time: 5:06 PM
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
        <span class="graytitle">Health And Family Welfare: Vital Statistics( Nos of Death)</span>
      <g:form controller="healthDataCollection" action="iSaveVitalStatisticsHealthData">
          <ul class="pageitem">

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Still Birth (Male)</span>
              <input  placeholder="Enter Number" type="text" name="health43" style="width: 28%;font-size: 15px;" value="${healthFW?.health43}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Less Than 1 Year (Male)</span>
              <input  placeholder="Enter Number" type="text" name="health44" style="width: 28%;font-size: 15px;" value="${healthFW?.health44}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">1 to 4 Year (Male)</span>
              <input  placeholder="Enter Number" type="text" name="health45" style="width: 28%;font-size: 15px;" value="${healthFW?.health45}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">5 to 14 Year (Male)</span>
              <input  placeholder="Enter Number" type="text" name="health46" style="width: 28%;font-size: 15px;" value="${healthFW?.health46}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">15 to 59 Year (Male)</span>
              <input  placeholder="Enter Number" type="text" name="health47" style="width: 28%;font-size: 15px;" value="${healthFW?.health47}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">60 and Above (Male)</span>
              <input  placeholder="Enter Number" type="text" name="health48" style="width: 28%;font-size: 15px;" value="${healthFW?.health48}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Still Birth (Female)</span>
              <input  placeholder="Enter Number" type="text" name="health49" style="width: 28%;font-size: 15px;" value="${healthFW?.health49}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Less Than 1 Year (Female)</span>
              <input  placeholder="Enter Number" type="text" name="health50" style="width: 28%;font-size: 15px;" value="${healthFW?.health50}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">1 to 4 Year (Female)</span>
              <input  placeholder="Enter Number" type="text" name="health51" style="width: 28%;font-size: 15px;" value="${healthFW?.health51}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">5 to 14 Year (Female)</span>
              <input  placeholder="Enter Number" type="text" name="health52" style="width: 28%;font-size: 15px;" value="${healthFW?.health52}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">15 to 59 Year (Female)</span>
              <input  placeholder="Enter Number" type="text" name="health53" style="width: 28%;font-size: 15px;" value="${healthFW?.health53}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">60 and Above (Female)</span>
              <input  placeholder="Enter Number" type="text" name="health54" style="width: 28%;font-size: 15px;" value="${healthFW?.health54}" onkeypress="validateIsNumber(event)" />
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
