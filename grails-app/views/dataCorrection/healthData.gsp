<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 4:34 PM
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 4:23 PM
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
          document.getElementById('health1').style.display='none';
          document.getElementById('health2').style.display='none';
          document.getElementById('health3').style.display='none';
          document.getElementById('health4').style.display='none';
          document.getElementById('health5').style.display='none';
          //
        }
    </script>
</head>

<body>
 <g:render template="healthData1" />
 <g:render template="healthData2" />
 <g:render template="healthData3" />
 <g:render template="healthData4" />
 <g:render template="healthData5" />

</body>
</html>