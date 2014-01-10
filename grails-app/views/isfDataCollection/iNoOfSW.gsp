<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/21/12
  Time: 4:10 PM
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
        <g:link controller="isfDataCollection" action="iMain">Back</g:link></div>

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

    <span class="graytitle">Infrastructural Facilities: Nos. of Sericulture & weaving</span>
    <g:form controller="isfDataCollection" action="iSaveData">
          <ul class="pageitem">

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Handlooms</span>
              <input  placeholder="Enter Number" type="text" name="isf18" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf18}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Powerlooms</span>
              <input  placeholder="Enter Number" type="text" name="isf19" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf19}" onkeypress="validateIsNumber(event)" />
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
