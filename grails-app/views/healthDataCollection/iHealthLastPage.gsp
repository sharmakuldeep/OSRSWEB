<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/6/12
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="iwebkit"/>
    <title>Department of Economics & Statistics</title>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'application.js')}"></script>
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
        <span class="graytitle">Department of Economics & Statistics</span>
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
    <span class="graytitle">Health And Family Welfare: ${head}</span>

    <g:form controller="healthDataCollection" action="iSaveVitalStatisticsHealthData">
        <ul class="pageitem">
            <g:if test="${id=='NursesNos'}">
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">GNM</span>
                    <input placeholder="Enter Number" type="text" name="health59" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health59}" onkeypress="validateIsNumber(event)"/>
                </li>

                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">ANM</span>
                    <input placeholder="Enter Number" type="text" name="health60" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health60}" onkeypress="validateIsNumber(event)"/>
                </li>

            </g:if>

            <g:if test="${id=='fwp'}">
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Sterilisation Operation(No.) Men</span>
                    <input placeholder="Enter Number" type="text" name="health61" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health61}" onkeypress="validateIsNumber(event)"/>
                </li>

                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Sterilisation Operation(No.) Women</span>
                    <input placeholder="Enter Number" type="text" name="health62" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health62}" onkeypress="validateIsNumber(event)"/>
                </li>

                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">IUD Nos</span>
                    <input placeholder="Enter Number" type="text" name="health63" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health63}" onkeypress="validateIsNumber(event)"/>
                </li>

                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">C.C. Users Nos</span>
                    <input placeholder="Enter Number" type="text" name="health64" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health64}" onkeypress="validateIsNumber(event)"/>
                </li>

                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">OP Users Nos</span>
                    <input placeholder="Enter Number" type="text" name="health65" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health65}" onkeypress="validateIsNumber(event)"/>
                </li>
            </g:if>

            <g:if test="${id=='pip'}">
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(BCG) </span>
                    <input placeholder="Enter Number" type="text" name="health66" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health66}" onkeypress="validateIsNumber(event)"/>
                </li>
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(DTP-3)</span>
                    <input placeholder="Enter Number" type="text" name="health67" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health67}" onkeypress="validateIsNumber(event)"/>
                </li>
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(OPV-3)</span>
                    <input placeholder="Enter Number" type="text" name="health68" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health68}" onkeypress="validateIsNumber(event)"/>
                </li>
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(Measles)</span>
                    <input placeholder="Enter Number" type="text" name="health69" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health69}" onkeypress="validateIsNumber(event)"/>
                </li>
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(Hepatities-B)</span>
                    <input placeholder="Enter Number" type="text" name="health70" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health70}" onkeypress="validateIsNumber(event)"/>
                </li>
                <li class="smallfield">
                    <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Pregnant Women (No.)- T.T.(PW)</span>
                    <input placeholder="Enter Number" type="text" name="health71" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health71}" onkeypress="validateIsNumber(event)"/>
                </li>

            </g:if>


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
