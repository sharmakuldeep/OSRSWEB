<%@ page import="com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/21/12
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<div style="width: 1000px" id="renderingHealth">
<div style="width: 1000px;display: none;" id="health4">
    <div style="height: 30px;">
           <img src="../images/icon_print.gif" alt="" title="Print" style="float: right;cursor: pointer"  onclick="window.print();" >
           %{--<img src="../images/icon_pdf.gif" alt="" title="Print PDF" style="float: right;cursor: pointer">--}%
    </div>
    <table id="healthTd4">
        <CAPTION><div style="font-size: 15px">HEALTH AND FAMILY WELFARE Page 4</div></CAPTION>
        <thead bgcolor="#cccccc">
        <tr>
                <td colspan="22" style="font-weight: bold;">
                    <div style="margin-left: 10px;float: left;width: 30%;">Year:${year}</div>
                    <div style="float: left;width: 30%;">Month:${month}</div>
                    <g:if test="${finalList?.type=='State'}">
                    <div style="float: left;width: 30%;">State:${finalList?.total?.village?.block?.district?.state?.name}</div>
                        </g:if>
                    <g:elseif test="${finalList?.type=='District'}">
                          <div style="float: left;width: 30%;">District:${finalList?.total?.village?.block?.district?.name}</div>
                        </g:elseif>
                </td>
        </tr>
  <th rowspan="3" >Name of ${finalList.type}</th>
        <th rowspan="3">Name of ${finalList.subType}</th>

        <th colspan="2">Nurses (No.)</th>
        <th colspan="5">Family Welfare Programme</th>
        <th colspan="6">Performance Of Immunization Programme</th>
        <tr>
            <th rowspan="2">GNM </th>
            <th rowspan="2">ANM </th>
            <th colspan="2">Sterilisation Operation (No.)</th>
            <th>IUD</th>
            <th>C.C Users </th>
            <th >OP Users </th>
            <th colspan="5">Infant (No.)</th>
            <th>Pregnant Women (No.)</th>
        <tr>
            <th> Men</th><th> Women</th>
            <th>(No.)</th>
            <th>(No.)</th>
            <th>(No.)</th>
            <th> BCG</th><th> DPT-3</th><th> OPV-3</th><th> Measles</th><th> Hepatities-B</th>
            <th>T.T.(PW)</th>
        </tr>
        </thead>

        <thead bgcolor="#cccccc">
        <th>1</th>
        <th>2</th>
        <g:each in="${59..<72}" >
            <th>${it}</th>
        </g:each>
        </thead>

        <tbody>

        <tr bgcolor="red">
            <g:if test="${finalList?.type=='State'}">
              <td align="center">${finalList?.total?.village?.block?.district?.state?.name}</td>
                <td align="center">-</td>
            </g:if>
            <g:elseif test="${finalList?.type=='District'}">
              <td align="center">${finalList?.total?.village?.block?.district?.name}</td>
                <td align="center">-</td>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Block'}">
              <td align="center">${finalList?.total?.village?.block?.name}</td>
                <td align="center">-</td>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Village'}">
              <td align="center">${finalList?.total?.village?.name}</td>
                <td align="center">${finalList?.total?.village?.gramPanchayt}</td>
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
              <g:link action="mainReport" params="[distCode:resultList?.village?.block?.district?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month]" target="_blank">
                ${resultList?.village?.block?.district?.name}</g:link>
            </g:if>
            <g:elseif test="${finalList?.type=='District'}">
              <g:link action="mainReport" params="[blockCode:resultList?.village?.block?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month]" target="_blank">
                ${resultList?.village?.block?.name}</g:link>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Block'}">
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
    <input type="button" value="Previous" onclick="healthPrevious('health4','health3');" style="float:left;"/>


    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 60px;height: 30px; background-image:url(../images/temp/pie.jpeg)"
               onclick="displayHealthPopUp('pie',4)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 60px; height:30px;background-image:url(../images/temp/bar.jpeg)"
               onclick="displayHealthPopUp('bar',4)"/>
    </div>
</div>  </div>
<script type="text/javascript">

    /*
     dataTable function is used to create a table with some more functionality, look and feel.
     Their is no sorting on any columns, and no pagination.

     The defination of dataTable is written in  jquery.dataTables.js
     */
    $(document).ready(function () {
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
        $('#example_filter').remove();
    });
</script>