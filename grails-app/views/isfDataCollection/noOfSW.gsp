<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 12:47 PM
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

<h2>Infrastructural Facilities Forms: Nos of Sericulture & weaving</h2>

<div style="padding: 20px;border: 2px solid black">
    <g:form controller="isfDataCollection" action="saveData">

        <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Handlooms</span>
      <div class="field">       <input placeholder="Enter Number" type="text" name="isf18" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf18}" onkeypress="validateIsNumber(event)"/>
        </div>
         </div>

        <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Powerlooms</span>
   <div class="field">          <input placeholder="Enter Number" type="text" name="isf19" style="width: 28%;font-size: 15px;"
                   value="${infFaciliti?.isf19}" onkeypress="validateIsNumber(event)"/>
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