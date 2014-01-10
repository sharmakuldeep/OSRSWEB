<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/6/12
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>

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
    <meta name="layout" content="main"/>

       <style type="text/css">

        .field{
            float: right;
            width: 57%;
            height: 20px;
        }
    </style>
    <title>Department of Economics & Statistics</title>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'application.js')}"></script>
</head>

<body>

<div align="center">
    <h1>Department of Economics & Statistics</h1>
</div>  <br>

<g:render template="/layouts/dataInfo" />

<h2>Page: ${head}</h2>

<div style="padding: 20px;border: 2px solid black">

    <g:form controller="healthDataCollection" action="saveVitalStatisticsHealthData">
        <ul class="pageitem">
            <g:if test="${id=='NursesNos'}">
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">GNM</span>
             <div class="field">         <input placeholder="Enter Number" type="text" name="health59" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health59}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">ANM</span>
              <div class="field">        <input placeholder="Enter Number" type="text" name="health60" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health60}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
            </g:if>

            <g:if test="${id=='fwp'}">
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Sterilisation operation (No.)Men</span>
               <div class="field">       <input placeholder="Enter Number" type="text" name="health61" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health61}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Sterilisation operation (No.)Women</span>
              <div class="field">        <input placeholder="Enter Number" type="text" name="health62" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health62}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">IUD No's</span>
             <div class="field">         <input placeholder="Enter Number" type="text" name="health63" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health63}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">C.C. Users No's</span>
            <div class="field">          <input placeholder="Enter Number" type="text" name="health64" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health64}" onkeypress="validateIsNumber(event)"/>
                </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">OP Users No's</span>
             <div class="field">         <input placeholder="Enter Number" type="text" name="health65" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health65}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
            </g:if>

            <g:if test="${id=='pip'}">

                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(BCG)</span>
             <div class="field">         <input placeholder="Enter Number" type="text" name="health66" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health66}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(DTP-3)</span>
               <div class="field">       <input placeholder="Enter Number" type="text" name="health67" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health67}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(OPV-3)</span>
                <div class="field">      <input placeholder="Enter Number" type="text" name="health68" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health68}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(Measles)</span>
              <div class="field">        <input placeholder="Enter Number" type="text" name="health69" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health69}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Infant No.(Hepatities-B)</span>
              <div class="field">        <input placeholder="Enter Number" type="text" name="health70" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health70}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>
                <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Pregnant Women (No.)- T.T.(PW)</span>
              <div class="field">        <input placeholder="Enter Number" type="text" name="health71" style="width: 28%;font-size: 15px;"
                           value="${healthFW?.health71}" onkeypress="validateIsNumber(event)"/>
                </div>
                 </div>

            </g:if>


            <div>
            <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
            <g:link controller="healthDataCollection" action="main">
                <input class="buttonClass" type="button" value="Back">
            </g:link>
        </div>
        </ul>
    </g:form>
</div>


</body>
</html>
