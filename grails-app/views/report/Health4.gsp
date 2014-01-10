<%@ page import="grails.converters.deep.JSON; com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/21/12
  Time: 4:03 PM
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
            $('#healthTd4').dataTable({
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
<div style="width: 1100px;margin-left: -100px" id="renderingHealth">

<div style="width: 1100px;" id="health4">
    <div style="font-weight: bold;font-size: 14px;text-transform:uppercase;width: 100%;text-align: center;margin-top: 40px">
        <CAPTION>HEALTH AND FAMILY WELFARE Page 4</CAPTION> </div>
    <table id="healthTd4">

        <thead>
        <tr>
            <th>Year:${year}</th>
            <th></th> <th></th>
            <th></th><th></th>
            <th></th> <th></th>
            <th></th>
            <th>Month:${month}</th>
            <th></th> <th></th>
            <th></th> <th></th>

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
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr class="reportHead">
            <td></td>
            <td></td>
            <td>Nurses (No.)</td>
            <td>Nurses (No.)</td>
            <td>Family Welfare Programme</td>

            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>Performance Of Immunization Programme</td>
             <td></td>
            <td></td>
            <td></td>   <td></td>  <td></td>

        </tr>
        <tr class="reportHead">
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>Sterilisation Operation (No.)</td>
            <td></td>
            <td>IUD</td>
            <td>C.C Users </td>
            <td>OP Users </td>
            <td>Infant (No.)</td>
            <td></td>
            <td></td>
            <td></td>   <td></td>
            <td>Pregnant Women (No.)</td>

        </tr>
        <tr class="reportHead">
        <td>Name of ${finalList.type}</td>
            <td>Name of ${finalList.subType}</td>
            <td>GNM </td>
            <td>ANM </td>
            <td> Men</td>
            <td> Women</td>
            <td>No.</td>   <td>No.</td>  <td>No.</td>

            <td> BCG</td>
            <td>DPT-3</td> <td> OPV-3</td> <td> Measles</td> <td> Hepatities-B</td>
            <td>T.T.(PW)</td>
        </tr>

        <tr class="reportHead">
        <td>1</td>
        <td>2</td>
        <g:each in="${59..<72}" >
            <td>${it}</td>
        </g:each>
        </tr>


        <tr>
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

            <td align="center">${finalList?.total?.health59}</td>
            <td align="center">${finalList?.total?.health60}</td>
            <td align="center">${finalList?.total?.health61}</td>
            <td align="center">${finalList?.total?.health62}</td>
            <td align="center">${finalList?.total?.health63}</td>
            <td align="center">${finalList?.total?.health64}</td>
            <td align="center">${finalList?.total?.health65}</td>
            <td align="center">${finalList?.total?.health66}</td>
            <td align="center">${finalList?.total?.health67}</td>
            <td align="center">${finalList?.total?.health68}</td>
            <td align="center">${finalList?.total?.health69}</td>
            <td align="center">${finalList?.total?.health70}</td>
            <td align="center">${finalList?.total?.health71}</td>

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

            <td align="center">${resultList?.health59}</td>
            <td align="center">${resultList?.health60}</td>
            <td align="center">${resultList?.health61}</td>
            <td align="center">${resultList?.health62}</td>
            <td align="center">${resultList?.health63}</td>
            <td align="center">${resultList?.health64}</td>
            <td align="center">${resultList?.health65}</td>
            <td align="center">${resultList?.health66}</td>
            <td align="center">${resultList?.health67}</td>
            <td align="center">${resultList?.health68}</td>
            <td align="center">${resultList?.health69}</td>
            <td align="center">${resultList?.health70}</td>
            <td align="center">${resultList?.health71}</td>

        </tr>
        </g:each>

        </tbody>

    </table>
<g:each in="${finalList.list}" var="resultList" status="i">
    <g:if test="${finalList?.type=='State'}">
        <g:form controller="report" action="renderingReports" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='District'}">
        <g:form controller="report" action="renderingReports" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Block'}">
        <g:form controller="report" action="renderingReports" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Panchayat'}">
        <g:form controller="report" action="renderingReports" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
            <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
        </g:form>
    </g:if>
</g:each>



    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 30px;height: 30px; background-image:url(../images/temp/pie.jpg)"
               onclick="displayHealthPopUp('pie',4)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 30px; height:30px;background-image:url(../images/temp/bar.jpg)"
               onclick="displayHealthPopUp('bar',4)"/>
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