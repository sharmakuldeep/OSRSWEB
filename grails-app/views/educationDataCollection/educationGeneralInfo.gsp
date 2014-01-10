<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 12:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main" />
       <g:javascript library="prototype"/>
    <style type="text/css">

        .field{
            float: right;
            width: 57%;
            height: 20px;
        }

    </style>
  </head>

  <body>

  <div id="content">
      <div align="center">

           <h1> Department of Economics & Statistics </h1>
       </div>  <br>
      <g:render template="/layouts/dataInfo" />
      <h2>Education Form : General Info</h2>

      <div style="padding: 20px;border: 2px solid black">
      <g:form controller="educationDataCollection" action="educationSave">
              <div>
                  <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">
                      No of Adult education center functioning
                  </span>
                  <div class="field">
                     <input  placeholder="enter text" type="text" class="text_field" name="edu3" value="${education?.edu3}" onkeypress="validateIsNumber(event)" />
                  </div>
                      </div>
          <div>
                 <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No of Adult educated</span>
                  <div class="field">
                      <input placeholder="enter text" type="text" class="text_field" name="edu4" value="${education?.edu4}" onkeypress="validateIsNumber(event)"/>
                  </div>

              </div>

              <div >
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
                  <g:link controller="educationDataCollection" action="main">
                      <input class="buttonClass" type="button" value="Back">
                  </g:link>
              </div>

      </g:form>
      </div>
  </div>
  </body>
</html>