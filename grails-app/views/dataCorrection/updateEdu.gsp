<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/2/12
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"/>
  </head>
  <body>
  <div align="center">
      <g:if test="${status}">
          <div style=";margin-top: 100px;color: green; font-size: 25px; font-weight: bold;  margin-top: 100px;">
            ${type} Data Successfully Updated
      </div>
      </g:if>
      <g:else>
          <div style=";margin-top: 100px;color: red; font-size: 25px; font-weight: bold;  margin-top: 100px;">
           Error in Updating ${type} data <br><br>Please Try Again
      </div>
      </g:else>


  </div>
  </body>
</html>