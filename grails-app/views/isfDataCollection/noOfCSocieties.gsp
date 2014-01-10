<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
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

<h2>Infrastructural Facilities Forms: Nos of Co-operation of Societies</h2>

<div style="padding: 20px;border: 2px solid black">
    <g:form controller="isfDataCollection" action="saveData">

        <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Handlooms</span>
         <div class="field">    <input placeholder="Enter Number" type="text" name="isf18" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf18}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Agricultural Society</span>
         <div class="field">    <input placeholder="Enter Number" type="text" name="isf20" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf20}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Marketing Society</span>
         <div class="field">    <input placeholder="Enter Number" type="text" name="isf21" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf21}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Farming Society</span>
       <div class="field">      <input placeholder="Enter Number" type="text" name="isf22" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf22}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Primary Co-operative creadit Society</span>
      <div class="field">       <input placeholder="Enter Number" type="text" name="isf23" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf23}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">P.D.S Co-opeative Society</span>
       <div class="field">      <input placeholder="Enter Number" type="text" name="isf24" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf24}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div>
            <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
            <g:link controller="isfDataCollection" action="main">
                <input class="buttonClass" type="button" value="Back">
            </g:link>
        </div>
    </g:form>
</div>
</body>
</html>