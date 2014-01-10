<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main" />
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
         <h1> Department of Economics & Statistics </h1>
       </div>  <br>
          <g:render template="/layouts/dataInfo" />
        <h2>Health And Family Welfare Form:Vital Statistics(Maternal Mortality)</h2>
        <div style="padding: 20px;border: 2px solid black" >
      <g:form controller="healthDataCollection" action="saveVitalStatisticsHealthData">

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Post delivery death</span>
             <div class="field"> <input  placeholder="Enter Number" type="text" name="health55" style="width: 28%;font-size: 15px;" value="${healthFW?.health55}" onkeypress="validateIsNumber(event)" />
              </div>
          </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">0 to 7 days</span>
              <div class="field">  <input  placeholder="Enter Number" type="text" name="health56" style="width: 28%;font-size: 15px;" value="${healthFW?.health56}" onkeypress="validateIsNumber(event)" />
              </div>
           </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">8 to 30 days</span>
            <div class="field">    <input  placeholder="Enter Number" type="text" name="health57" style="width: 28%;font-size: 15px;" value="${healthFW?.health57}" onkeypress="validateIsNumber(event)" />
              </div>
           </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">31 to 42 days</span>
             <div class="field">   <input  placeholder="Enter Number" type="text" name="health58" style="width: 28%;font-size: 15px;" value="${healthFW?.health58}" onkeypress="validateIsNumber(event)" />
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