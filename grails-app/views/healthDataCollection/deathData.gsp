<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 5:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

       <style type="text/css">
        /*.name{*/
            /*float: left;*/
            /*font-size: 15px;*/
            /*white-space:normal;*/
            /*line-height:20px;*/
            /*width: 40%;*/
            /*height: 20px;*/
        /*}*/
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

<h2>Health And Family Welfare Form:Vital Statistics( Nos of Death)</h2>

<div style="padding: 20px;border: 2px solid black">
    <g:form controller="healthDataCollection" action="saveVitalStatisticsHealthData">

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Still Birth (Male)</span>
            <div class="field">
            <input placeholder="Enter Number" type="text" name="health43" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health43}" onkeypress="validateIsNumber(event)"/>
                   </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Less Than 1 Year (Male)</span>
           <div class="field">  <input placeholder="Enter Number" type="text" name="health44" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health44}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">1 to 4 year (Male)</span>
          <div class="field">   <input placeholder="Enter Number" type="text" name="health45" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health45}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">5 to 14 year (Male)</span>
          <div class="field">   <input placeholder="Enter Number" type="text" name="health46" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health46}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">15 to 59 year (Male)</span>
          <div class="field">   <input placeholder="Enter Number" type="text" name="health47" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health47}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">60 and above (Male)</span>
         <div class="field">    <input placeholder="Enter Number" type="text" name="health48" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health48}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Still Birth (Female)</span>
          <div class="field">   <input placeholder="Enter Number" type="text" name="health49" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health49}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Less than 1 year (Female)</span>
        <div class="field">     <input placeholder="Enter Number" type="text" name="health50" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health50}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">1 to 4 year (Female)</span>
         <div class="field">    <input placeholder="Enter Number" type="text" name="health51" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health51}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">5 to 14 year (Female)</span>
          <div class="field">   <input placeholder="Enter Number" type="text" name="health52" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health52}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">15 to 59 year (Female)</span>
           <div class="field">  <input placeholder="Enter Number" type="text" name="health53" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health53}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>

        <div><span class="name"
                   style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">60 and above (Female)</span>
        <div class="field">     <input placeholder="Enter Number" type="text" name="health54" style="width: 28%;font-size: 15px;"
                   value="${healthFW?.health54}" onkeypress="validateIsNumber(event)"/>
        </div>
        </div>


        <div>
            <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
            <g:link controller="healthDataCollection" action="main">
                <input class="buttonClass" type="button" value="Back">
            </g:link>
        </div>
    </g:form>
</div>
</div>
</body>
</html>