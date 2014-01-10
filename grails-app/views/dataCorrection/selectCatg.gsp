<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/22/12
  Time: 5:35 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="main"/>

  </head>
  <body>
     <h1>Select Category</h1>

  <div style="width: 800px;" align="center">
      <div>
          <div style="padding: 10px;float: left;">
              <g:link class="nodffect" action="main" controller="educationDataCollection">
                  <img src="../images/education.png" style="border: 5px solid" alt="Education" width="200"
                       height="200">
              </g:link>
          </div>

          <div style="padding: 10px;float: left;">
              <g:link class="nodffect" action="main" controller="healthDataCollection">
                  <img src="../images/health.jpg" style="border: 5px solid" alt="Education" width="200"
                       height="200">
              </g:link>
          </div>


          <div style="padding: 10px;float: left;">
              <g:link class="nodffect" action="main" controller="isfDataCollection">
                  <img src="../images/infra.jpg"  style="border: 5px solid" alt="Education" width="200"
                       height="200">
              </g:link>
          </div>
      </div>

  </div>
  </body>
</html>