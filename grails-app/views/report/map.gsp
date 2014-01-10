<%@ page import="com.osrs.Categories" %>
%{--<%@ page import="org.codehaus.groovy.grails.plugins.jquery.JQueryConfig" %>--}%
<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 6/5/12
  Time: 12:31 PM
  To change this template use File | Settings | File Templates.
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
<!DOCTYPE html>
<html>
<head>
     <meta name="layout" content="main"/>
    <script src="${resource(dir:'js',file:'dataCollection.js')}" ></script>
    <style type="text/css">
        .floatleft {
            float: left;
        }
        .floatRight{
            float: right;

        }
        .image{
            border: 1px;
        }
    </style>

    <script>
        function submitform(dist){
            //alert(dist);
            document.getElementById('distCode').value=dist;
            document.forms["myform"].submit();
        }
         function submit(stateCode){
//           alert(stateCode);
           document.getElementById('stateCode').value=stateCode;
            document.forms["myform"].submit();
        }
    </script>
</head>
<body>
<g:form action="mainReport" name="myform">
    <input type="hidden" name="distCode" value='' id="distCode"/>
    <input type="hidden" name="stateCode" value='' id="stateCode"/>
    <table align="center" style="min-width: 1000px; border: 0px none;">
        <CAPTION><div style="font-size: 15px">${category}</div></CAPTION>
        <thead>
        <tr>
            <td style="text-align:center;font-weight:bold;">
                <div style="float: left; padding: 20px" align="center">&nbsp;Select Category</div>
                <div style="float: left; padding: 20px" id="category1">
                    <select name="category" id="category" style="height: 25px;font-size: 15px;width: 200px">
                        <option value="${Categories.EDUCATION.value()}">${Categories.EDUCATION.value()}</option>
                        <option value="${Categories.HEALTH.value()}">${Categories.HEALTH.value()}</option>
                        <option value="${Categories.INFRASTRUCTURE.value()}" selected="">${Categories.INFRASTRUCTURE.value()} Facilities</option>
                    </select>
                </div>
            </td>

            <td style="text-align: center;font-weight: bold;">
                <div style="float: left; padding: 20px">Select Year</div>

                <div style="float: left; padding: 20px" id="year">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <g:select name="year" id="year1" from="${startyear..year}"
                                            value="${params?.year?:year}"  onchange="updateMonth(this.value)" />

                </div>

            <td style="text-align: center;font-weight: bold;">
                <div style="float: left; padding: 20px">Select Month &nbsp;&nbsp;&nbsp;</div>

                <div style="float: left; padding: 20px" id="month1">
                    &nbsp; <select name="month" id="month">
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                </div>
            </td>
        </td>
        </tr>
        </thead>
    </table>
</g:form>
<script type="text/javascript">
    var cat= $('#category').val();
    var mn=$('#month').val();
    var yr=$('#year1').val();
   updateMonth(${year}) ;
      if('${flash.message}'){
        alert('${flash.message}');
    }
      </script>

   <div style="margin-left: 125px;text-decoration: underline ;float:left">

    <img src="${resource(dir: 'images', file: 'assam39s.png')}" width="450px" height="350px" alt="assam39s" style="border: 2px solid black"
         usemap="#assamMap" align="left">

    <map name="assamMap">
          <area shape=Rect Coords="50,140,105,120" Href="javascript: submitform('ASKK')" title="Kokrajhar" draggable="false">
          <area shape=Rect Coords="40,160,59,190" Href="javascript: submitform('ASDB')" title="Dhubri" draggable="false">
          <area shape=Rect Coords="85,160,100,145" Href="javascript: submitform('ASBO')" title="Bongaigaon">
          <area shape=Rect Coords="110,178,70,185" Href="javascript: submitform('ASGP')" title="Goalpara">
          <area shape=Rect Coords="125,200,189,177" Href="javascript: submitform('ASKM')" title="Kamrup">
          <area shape=Rect Coords="150,120,140,160" Href="javascript: submitform('ASBK')" title="Baksa">
          <area shape=Rect Coords="130,120,115,175" Href="javascript: submitform('ASBA')" title="Barpeta">
          <area shape=Rect Coords="343,120,380,85" Href="javascript: submitform('ASSI')" title="Sivasagar">
          <area shape=Rect Coords="340,135,315,100" Href="javascript: submitform('ASJO')" title="Jorhat">
          <area shape=Rect Coords="315,200,300,120" Href="javascript: submitform('ASGG')" title="Golaghat">
          <area shape=Rect Coords="170,160,184,120" Href="javascript: submitform('ASDA')" title="Darrang">
         <area shape=Rect Coords="159,168,200,130" Href="javascript: submitform('ASMA')" title="Marigaon">
          <area shape=Rect Coords="260,230,295,140" Href="javascript: submitform('ASKA')" title="Karbi Anglong (Diphu)">
          <area shape=Rect Coords="220,191,245,145" Href="javascript: submitform('ASNG')" title="Nagaon">
          %{--<area shape=Rect Coords=190,190,235,210 Href="javascript: submitform('KA')" title="Karbi Anglong">--}%
          <area shape=Rect Coords="280,260,230,220" Href="javascript: submitform('ASCA')" title="North Cachar Hills (Haflong)">
          %{--<area shape=Rect Coords=233,270,260,320 Href="javascript: submitform('SC')" title="Silchar">--}%
          <area shape=Rect Coords="215,280,230,340" Href="javascript: submitform('ASHA')" title="Hailakandi">
          <area shape=Rect Coords="200,290,220,335" Href="javascript: submitform('ASKR')" title="Karimganj">
          <area shape=Rect Coords="340,70,300,95" Href="javascript: submitform('ASLA')" title="Lakhimpur">
          <area shape=Rect Coords="360,25,390,45" Href="javascript: submitform('ASDM')" title="Dhemaji">
          <area shape=Rect Coords="360,85,390,60" Href="javascript: submitform('DIASDI')" title="Dibrugarh">
          <area shape=Rect Coords="270,100,210,132" Href="javascript: submitform('ASSO')" title="Sonitpur (Tezpur)">
          <area shape=Rect Coords="401,85,440,20" Href="javascript: submitform('ASTI')" title="Tinsukia">




    </map>
       </div>
  <div style="margin-left: 125px;text-decoration: underline ;float:right;">
        <img src="${resource(dir: 'images', file: 'assam21s.gif')}" width="250px" height="200px" alt="assam21s"  style="border: 1px solid black"
         usemap="#assamMap2" class="floatRight">
       <map name="assamMap2">
           <area shape=Rect Coords=10,10,270,190 Href="javascript: submit('AS')" title="Assam">
       </map>
    </div>

     </body>
</html>