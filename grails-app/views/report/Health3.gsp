<%@ page import="grails.converters.deep.JSON; com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/21/12
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta name="layout" content="main"/>
    <script type="text/javascript">

        /*
         dataTable function is used to create a table with some more functionality, look and feel.
         Their is no sorting on any columns, and no pagination.

         The defination of dataTable is written in  jquery.dataTables.js
         */
        jQuery(document).ready(function($) {

            hideButtons();
            $('#healthTd3').dataTable({
                "bJQueryUI": true
                ,"bSort": false
                ,"bLengthChange": false
                ,"bAutoWidth": false
                ,"bPaginate": false
                ,"sDom": '<"H"Tfr>t<"F"ip>'
                ,"oTableTools": {
                    "sSwfPath": "${resource(dir: 'TableTools-2.0.1', file: 'media/swf/copy_cvs_xls_pdf.swf')}"
                }
            });
            /*
             search functionality removed  from dataTables.
             */
//        $('#example_filter').remove();
        });
        var graphData=${finalList.list as JSON} ;
        var graphLevel='${finalList?.type}';
    </script>
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
</head>
<body>
<div style="width: 1000px" id="renderingHealth">
<div style="width: 1000px;" id="health3">
    <div style="font-weight: bold;font-size: 14px;text-transform:uppercase;width: 100%;text-align: center;margin-top: 40px">
        <CAPTION>HEALTH AND FAMILY WELFARE Page 3</CAPTION> </div>
    <table id="healthTd3">
        <thead>
        <tr>
            <th>Year:${year}</th>
            <th></th> <th></th>
            <th></th><th></th>
            <th></th> <th></th>
            <th></th> <th></th>
            <th>Month:${month}</th>
            <th></th> <th></th>
            <th></th> <th></th>
            <th></th> <th></th>
            <th></th>


            <g:if test="${finalList?.type=='State'}">
                <th>State:${finalList?.total?.village?.gramPanchayat?.block?.district?.state?.name}</th>
            </g:if>
            <g:elseif test="${finalList?.type=='District'}">
                <th>District:${finalList?.total?.village?.gramPanchayat?.block?.district?.name}</th>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Block'}">
                <th>Block:${finalList?.total?.village?.gramPanchayat?.block?.name}</th>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Panchayat'}">
                <th>Gram Panchayat:${finalList?.total?.village?.gramPanchayat?.name}</th>
            </g:elseif>
            <g:else>

                <th> </th>
            </g:else>
            <th></th> <th></th>
        </tr>
        </thead>
        %{--<tbody>--}%
        %{--<tr>--}%
            %{--<td></td> <td></td>--}%
            %{--<td></td><td></td><td></td>--}%
            %{--<td></td><td></td> <td></td>   <td></td>--}%
            %{--<td></td><td></td>--}%
            %{--<td style="width: 100px">Vital Statistics</td><td></td>  <td></td>  <td></td>--}%
            %{--<td></td>  <td></td>--}%
            %{--<td></td><td></td>  <td></td>--}%

        %{--</tr>--}%
       <tr>
           <td></td> <td></td>
           <td class="reportHead">Birth</td><td class="reportHead">Birth</td><td></td>
           <td class="reportHead">Death</td><td></td> <td></td>   <td></td>
           <td></td><td></td>  <td class="reportHead">Death</td>
           <td></td><td></td>  <td></td>  <td></td>
           <td style="width: 108px" class="reportHead">Maternal Mortality</td><td></td>  <td></td>  <td></td>

       </tr>
        <tr>
            <td></td> <td></td>
            <td></td><td></td><td></td>
            <td class="reportHead">Male</td><td></td> <td></td>   <td></td>
            <td></td><td></td>  <td class="reportHead">Female</td>
            <td></td><td></td>  <td></td>  <td></td>
            <td></td><td></td>  <td></td>  <td></td>

        </tr>

        <tr class="reportHead">
            <td>Name of ${finalList.type}</td>
            <td>Name of ${finalList.subType}</td>
            %{--<td>Birth</td>--}%
            %{--<td>Death</td>--}%
            %{--<td>Death</td>--}%
            %{--<td>Maternal Mortality</td>--}%

        <td> Male</td>
        <td> Female</td>
        %{--<td>Male</td>--}%
        %{--<td>Female</td>--}%
        %{--<td>Post Delivery Death</td>--}%
        %{--<td> 0 To 7 Days</td>--}%
        %{--<td>8 To 30 Days</td>--}%
        %{--<td>31 To 42 Days</td>--}%

            <td> Still Birth</td><td> Less Than 1 Year</td><td> 1 To 4 Year</td><td> 5 To 14 year</td><td>15 To 59 Year</td><td> 60 And Above</td>
            <td> Still Birth</td><td>Less Than 1 Year</td><td> 1 To 4 Year</td><td> 5 To 14 year</td><td> 15 To 59 Year</td><td>60 And Above</td>
            <td>Post Delivery Death</td>
            <td> 0 To 7 Days</td>
            <td>8 To 30 Days</td>
            <td>31 To 42 Days</td>
        </tr>
                     %{--<tr>--}%
                         %{--<th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th>--}%
                     %{--</tr>--}%




        <tr class="reportHead">
            <td>1</td>
            <td>2</td>
            <g:each in="${41..<59}" >
                <td>${it}</td>
            </g:each>
        </tr>

        <tr >
            <g:if test="${finalList?.type=='State'}">
                <td>${finalList?.total?.village?.gramPanchayat?.block?.district?.state?.name}</td>
                <td align="center">-</td>
            </g:if>
            <g:elseif test="${finalList?.type=='District'}">
                <td>${finalList?.total?.village?.gramPanchayat?.block?.district?.name}</td>
                <td align="center">-</td>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Block'}">
                <td>${finalList?.total?.village?.gramPanchayat?.block?.name}</td>
                <td align="center">-</td>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Panchayat'}">
                <td>${finalList?.total?.village?.gramPanchayat?.name}</td>
                <td align="center">-</td>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Village'}">
                <td>${finalList?.total?.village?.name}</td>
            %{--<td align="center">${finalList?.total?.village?.gramPanchayt}</td>--}%
            </g:elseif>

            <td align="center">${finalList?.total?.health41}</td>
            <td align="center">${finalList?.total?.health42}</td>
            <td align="center">${finalList?.total?.health43}</td>
            <td align="center">${finalList?.total?.health44}</td>
            <td align="center">${finalList?.total?.health45}</td>
            <td align="center">${finalList?.total?.health46}</td>
            <td align="center">${finalList?.total?.health47}</td>
            <td align="center">${finalList?.total?.health48}</td>
            <td align="center">${finalList?.total?.health49}</td>
            <td align="center">${finalList?.total?.health50}</td>
            <td align="center">${finalList?.total?.health51}</td>
            <td align="center">${finalList?.total?.health52}</td>
            <td align="center">${finalList?.total?.health53}</td>
            <td align="center">${finalList?.total?.health54}</td>
            <td align="center">${finalList?.total?.health55}</td>
            <td align="center">${finalList?.total?.health56}</td>
            <td align="center">${finalList?.total?.health57}</td>
            <td align="center">${finalList?.total?.health58}</td>

        </tr>
        <g:each in="${finalList.list}" var="resultList">
        <tr>
            <td align="center"></td> <td align="center">
            <g:if test="${finalList?.type=='State'}">
                <g:link action="mainReport"
                        params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month]"
                        target="_blank">
                    ${resultList?.village?.gramPanchayat?.block?.district?.name}</g:link>
            </g:if>
            <g:elseif test="${finalList?.type=='District'}">
                <g:link action="mainReport"
                        params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month]"
                        target="_blank">
                    ${resultList?.village?.gramPanchayat?.block?.name}</g:link>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Block'}">
                <g:link action="mainReport"
                        params="[panchayatCode: resultList?.village?.gramPanchayat?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month]"
                        target="_blank">
                    ${resultList?.village?.gramPanchayat?.name}  </g:link>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Panchayat'}">
                ${resultList?.village?.name}
            </g:elseif>
            </td>

            <td align="center">${resultList?.health41}</td>
            <td align="center">${resultList?.health42}</td>
            <td align="center">${resultList?.health43}</td>
            <td align="center">${resultList?.health44}</td>
            <td align="center">${resultList?.health45}</td>
            <td align="center">${resultList?.health46}</td>
            <td align="center">${resultList?.health47}</td>
            <td align="center">${resultList?.health48}</td>
            <td align="center">${resultList?.health49}</td>
            <td align="center">${resultList?.health50}</td>
            <td align="center">${resultList?.health51}</td>
            <td align="center">${resultList?.health52}</td>
            <td align="center">${resultList?.health53}</td>
            <td align="center">${resultList?.health54}</td>
            <td align="center">${resultList?.health55}</td>
            <td align="center">${resultList?.health56}</td>
            <td align="center">${resultList?.health57}</td>
            <td align="center">${resultList?.health58}</td>
        </tr>
        </g:each>

        </tbody>

    </table>
<g:each in="${finalList.list}" var="resultList" status="i">
    <g:if test="${finalList?.type=='State'}">
        <g:form controller="report" action="renderingReports" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='District'}">
        <g:form controller="report" action="renderingReports" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Block'}">
        <g:form controller="report" action="renderingReports" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Panchayat'}">
        <g:form controller="report" action="renderingReports" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
</g:each>
<g:each in="${finalList.list}" var="resultList" status="i">
    <g:if test="${finalList?.type=='State'}">
        <g:form controller="report" action="reportNextInfra" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'4']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='District'}">
        <g:form controller="report" action="reportNextInfra" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'4']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Block'}">
        <g:form controller="report" action="reportNextInfra" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'4']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Panchayat'}">
        <g:form controller="report" action="reportNextInfra" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'4']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
</g:each>
    %{--<input type="button" value="Previous" onclick="healthPrevious('health3','health2');" style="float:left;"/>--}%
    %{--<input type="button" value="Next" onclick="healthNext('health3','health4');" style="float:right"/>--}%


    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 30px;height: 30px; background-image:url(../images/temp/pie.jpg)"
               onclick="displayHealthPopUp('pie',3)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 30px; height:30px;background-image:url(../images/temp/bar.jpg)"
               onclick="displayHealthPopUp('bar',3)"/>
    </div>
<div id="Overlay">
    <div id="Outer">
        <div id="OvrMain">
            <div style="height: 30px;background-color:#ccccff;">
                <div style="float: left;font-weight: bold;" id="overLayHeader">Select one</div>
                <div style="float: right;font-weight: bold;padding: 2px;cursor: pointer" onclick="hidePopUp();">X
                </div>

            </div>
            <div id="graphHeader"></div>
            <div id="graphicsDisplay"> </div>
        </div>

    </div>
</div>
</div>
    </div>

</body>
</html>