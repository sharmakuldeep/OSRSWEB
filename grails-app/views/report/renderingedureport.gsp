<%@ page import="grails.converters.deep.JSON" %>

<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/7/12
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta name="layout" content="main"/>

    <style type="text/css">
         #Overlay {
              width: 100%;
              float: left;
              height: 100%;
              background: url(../images/overlay_bg.png) top left;
              position: fixed;
              z-index: 111;
              top: 0px;
              left: 0px;
              display: none;
          }

          #Outer {
              width: 500px;
              margin: 0 auto;
              margin-top: 15px;
          }

          #OvrMain {
              min-width: 500px;
              border: 10px solid #2692d0;
              /*padding: 10px;*/
              background: #fff;
              float: left;
          }
    table {
        border-collapse: collapse;
        width:100%;
    }

    table, td, th,tr {
        border: 1px solid black;
    }

    th {
        min-height:30px;
        min-width: 30px
    }
        .pointer{
            cursor: pointer;
        }
        .pointer:hover{
            text-decoration: underline;
            color: #6666ff;
        }
    </style>

    <script type="text/javascript">
        var graphData=${finalList.list as JSON} ;
        var graphLevel='${finalList?.type}';
       // alert(graphData)
        function eduNext(hide,show){
            document.getElementById(hide).style.display='none';
            document.getElementById(show).style.display='block';
        }
        function eduPrevious(hide,show){
            document.getElementById(hide).style.display='none';
            document.getElementById(show).style.display='block';
        }

        function display(data){
          hideAll();
          document.getElementById(data).style.display='block';
        }
        function hideAll() {

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
<div style="width: 1000px" id="rendering">
<g:render template="renderingEduReports" />
%{--<g:render template="educationDataPrePrimary" />--}%
%{--<g:render template="educationData1_V" />--}%
%{--<g:render template="educationDataVI_VIII" />--}%
%{--<g:render template="educationDataIX_X" />--}%
%{--<g:render template="educationDataXI_XII" />--}%
%{--<g:render template="educationDataDegree_level" />--}%
%{--<g:render template="educationDataTech_course" />--}%
 </div>


<div id="Overlay">
      <div id="Outer">
          <div id="OvrMain">
              <div style="height: 30px;background-color:#ccccff;">
                  <div style="float: left;font-weight: bold;" id="overLayHeader">Select one</div>
                  <div style="float: right;font-weight: bold;padding: 2px;cursor: pointer" onclick="hidePopUp();">X</div>

              </div>
              <div id="graphHeader"></div>
               <div id="graphicsDisplay"> </div>
          </div>

      </div>
</div>
</body>

</html>