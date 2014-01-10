<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/5/12
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>



<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <script type="text/javascript" src="${resource(dir: 'js',file: 'application.js')}"></script>
    <style type="text/css">
    table {
        border-collapse: collapse;
        width: 100%;
    }

    table, td, th, tr {
        border: 1px solid black;
    }

    th {
        height: 25px;
        width: 50px
    }

    .box_rotate {
        height: 100px;
        -moz-transform: rotate(270deg); /* FF3.5+ */
        -o-transform: rotate(270deg); /* Opera 10.5 */
        -webkit-transform: rotate(270deg); /* Saf3.1+, Chrome */
        filter: progid:DXImageTransform.Microsoft.BasicImage(rotation = 3); /* IE6,IE7 */
        -ms-filter: "progid:DXImageTransform.Microsoft.BasicImage(rotation=3)"; /* IE8 */
    }
    </style>
    <script type="text/javascript">
        function display(data){
          hideAll();
          document.getElementById(data).style.display='block';
        }
        function hideAll() {
          document.getElementById('isfData1').style.display='none';
          document.getElementById('isfData2').style.display='none';

        }
    </script>
</head>

<body>
 <g:render template="isfData1" />
 <g:render template="isfData2" />


</body>
</html>