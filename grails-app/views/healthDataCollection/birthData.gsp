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
      <meta name="layout" content="main" />

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
         <h1> Department of Economics & Statistics </h1>
       </div>  <br>
          <g:render template="/layouts/dataInfo" />
        <h2>Health And Family Welfare Form:Vital Statistics(Birth)</h2>
        <div style="padding: 20px;border: 2px solid black" >
      <g:form controller="healthDataCollection" action="saveVitalStatisticsHealthData">

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Male</span>
                  <div class="field">
                  <input  placeholder="Enter Number" type="text" name="health41" style="width: 28%;font-size: 15px;" value="${healthFW?.health41}" onkeypress="validateIsNumber(event)" />
              </div>
          </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Female</span>
               <div class="field"><input  placeholder="Enter Number" type="text" name="health42" style="width: 28%;font-size: 15px;" value="${healthFW?.health42}" onkeypress="validateIsNumber(event)" />
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