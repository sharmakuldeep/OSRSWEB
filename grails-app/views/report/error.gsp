<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 6/19/12
  Time: 12:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css">
        .image {

        }
        </style>
        </head>
  <body>
     <div align="center">
  <p align="center">
   <img src="${resource(dir: 'images', file: 'work-in-progress.jpg')}" width="650px" height="350px" align="middle" style="border: 2px solid black" >
  </p>
         </div>
  <div align="right" style="font-size: 20px">
       <g:link controller="report" action="map">Back</g:link>
  </div>
  </body>

</html>