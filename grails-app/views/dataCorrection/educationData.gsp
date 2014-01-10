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
        height: 50px;
        width: 50px
    }
    </style>
    <script type="text/javascript">
        function display(data){
          hideAll();
          document.getElementById(data).style.display='block';
        }
        function hideAll() {
          document.getElementById('eduGen').style.display='none';
          document.getElementById('prePrimary').style.display='none';
          document.getElementById('primary').style.display='none';
          document.getElementById('middle').style.display='none';
          document.getElementById('highSchool').style.display='none';
          document.getElementById('seniorSecSchool').style.display='none';
          document.getElementById('college').style.display='none';
          document.getElementById('otherTechCourse').style.display='none';
        }
    </script>

</head>

<body>
 <g:render template="eduData1" />
 <g:render template="eduData2" />
 <g:render template="eduData3" />
 <g:render template="eduData4" />
 <g:render template="eduData5" />
 <g:render template="eduData6" />
 <g:render template="eduData7" />
 <g:render template="eduData8" />

</body>
</html>