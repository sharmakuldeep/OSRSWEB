<%@ page import="com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/21/12
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>
<div style="width: 1000px" id="renderingHealth">
<div style="width: 1000px;display: none;" id="health3">
<div style="height: 30px;">
<img src="../images/icon_print.gif" alt="" title="Print" style="float: right;cursor: pointer"  onclick="window.print();" >
           %{--<img src="../images/icon_pdf.gif" alt="" title="Print PDF" style="float: right;cursor: pointer">--}%
    </div>
    <table id="healthTd3">
        <CAPTION><div style="font-size: 15px">HEALTH AND FAMILY WELFARE Page 3</div></CAPTION>
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
         <th rowspan="5" >Name of ${finalList.type}</th>
        <th rowspan="5">Name of ${finalList.subType}</th>

        <th colspan="18">Vital Statistics</th>
        <tr>
            <th colspan="2">Birth</th>
            <th colspan="6">Death</th>
            <th colspan="6">Death</th>
            <th colspan="4">Maternal Mortality</th>
            <tr>
                    <th rowspan="2"> Male</th><th rowspan="2"> Female</th>
                    <th colspan="6">Male</th>
                    <th colspan="6">Female</th>
                    <th rowspan="2"> Post Delivery Death</th><th rowspan="2"> 0 To 7 Days</th><th rowspan="2">8 To 30 Days</th><th rowspan="2">31 To 42 Days</th>
            </tr>
        <tr>
            <th colspan="1"> Still Birth</th><th colspan="1"> Less Than 1 Year</th><th colspan="1"> 1 To 4 Year</th><th colspan="1"> 5 To 14 year</th><th colspan="1"> 15 To 59 Year</th><th colspan="1"> 60 And Above</th>
            <th colspan="1"> Still Birth</th><th colspan="1"> Less Than 1 Year</th><th colspan="1"> 1 To 4 Year</th><th colspan="1"> 5 To 14 year</th><th colspan="1"> 15 To 59 Year</th><th colspan="1"> 60 And Above</th>
        </tr>
                     <tr>
                         <th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th>
                     </tr>
        </thead>
        <thead bgcolor="#cccccc">
        <th>1</th>
        <th>2</th>
        <g:each in="${41..<59}" >
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
    <input type="button" value="Previous" onclick="healthPrevious('health3','health2');" style="float:left;"/>
    <input type="button" value="Next" onclick="healthNext('health3','health4');" style="float:right"/>


    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 60px;height: 30px; background-image:url(../images/temp/pie.jpeg)"
               onclick="displayHealthPopUp('pie',3)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 60px; height:30px;background-image:url(../images/temp/bar.jpeg)"
               onclick="displayHealthPopUp('bar',3)"/>
    </div>
</div>
<script type="text/javascript">

    /*
     dataTable function is used to create a table with some more functionality, look and feel.
     Their is no sorting on any columns, and no pagination.

     The defination of dataTable is written in  jquery.dataTables.js
     */
    $(document).ready(function () {
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
        $('#example_filter').remove();
    });
</script>