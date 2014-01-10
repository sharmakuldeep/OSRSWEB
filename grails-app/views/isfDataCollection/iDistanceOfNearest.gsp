<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/21/12
  Time: 2:15 PM
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

    <span class="graytitle">Infrastructural Facilities : Distance(in Km) to the nearest</span>
      <g:form controller="isfDataCollection" action="iSaveData">
          <ul class="pageitem">

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Human Hospital/Dispensary/PHC etc.</span>
              <input  placeholder="Enter Number" type="text" name="isf3" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf3}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Veterinary Hospital/Dispensary</span>
              <input  placeholder="Enter Number" type="text" name="isf4" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf4}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Motorable Road(Pucca Road)</span>
              <input  placeholder="Enter Number" type="text" name="isf5" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf5}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Motorable Road(Semipucca Road)</span>
              <input  placeholder="Enter Number" type="text" name="isf6" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf6}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Motorable Road(Katcha Road)</span>
              <input  placeholder="Enter Number" type="text" name="isf7" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf7}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bus Stop</span>
              <input  placeholder="Enter Number" type="text" name="isf8" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf8}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Post Office</span>
              <input  placeholder="Enter Number" type="text" name="isf9" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf9}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Railway Station</span>
              <input  placeholder="Enter Number" type="text" name="isf10" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf10}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Police Station</span>
              <input  placeholder="Enter Number" type="text" name="isf11" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf11}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Hat/Bazar</span>
              <input  placeholder="Enter Number" type="text" name="isf12" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf12}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Nos. of the day/Days of Hat/Bazar</span>
              <input  placeholder="Enter Number" type="text" name="isf13" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf13}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bank(Schedule Bank)</span>
              <input  placeholder="Enter Number" type="text" name="isf14" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf14}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bank(Regional Rural Bank)</span>
              <input  placeholder="Enter Number" type="text" name="isf15" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf15}" onkeypress="validateIsNumber(event)" />
              </li>

              <li class="smallfield"><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bank(Co-operative Bank)</span>
              <input  placeholder="Enter Number" type="text" name="isf16" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf16}" onkeypress="validateIsNumber(event)" />
              </li>


              <li class="button">
                  <input  class="buttonClass" name="Submit input" type="submit" value="Save"/>
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