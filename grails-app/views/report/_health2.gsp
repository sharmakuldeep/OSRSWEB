<%@ page import="com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/21/12
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<div style="width: 1000px" id="renderingHealth">
<div style="width: 1000px;display: none;" id="health2">
    <div style="height: 30px;">
           <img src="../images/icon_print.gif" alt="" title="Print" style="float: right;cursor: pointer"  onclick="window.print();" >
           %{--<img src="../images/icon_pdf.gif" alt="" title="Print PDF" style="float: right;cursor: pointer">--}%
    </div>
    <table id="healthTd2">
        <CAPTION><div style="font-size: 15px">HEALTH AND FAMILY WELFARE Page 2</div></CAPTION>
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
        <th colspan="5">(5) Community Health Centres</th>
        <th colspan="5">(6) Family Welfare Centres</th>
        <th colspan="3">(7) Ayurvedic Centres</th>
        <th colspan="3">(8) Homeopathic Cells</th>
        <th colspan="2">(9) Others</th>
        <tr>
            <th rowspan="2">Doctors (No.)</th>
            <th rowspan="2">Nurses (No.)</th>
            <th rowspan="2">Beds (No.)</th>
            <th colspan="2">Cases Treated</th>
            <th rowspan="2">Doctors (No.)</th>
            <th rowspan="2">Nurses (No.)</th>
            <th rowspan="2">Beds (No.)</th>
            <th colspan="2">Cases Treated</th>
            <th rowspan="2">Doctors (No.)</th>
            <th colspan="2">Cases Treated</th>
            <th rowspan="2">Doctors (No.)</th>
            <th colspan="2">Cases Treated</th>
            <th rowspan="2">Beds for Women (No.)</th>
            <th rowspan="2">ASHA Workers (No.)</th>
        <tr>
            <th> Male (No.)</th><th> Female (No.)</th>
            <th> Male (No.)</th><th> Female (No.)</th>
            <th> Male (No.)</th><th> Female (No.)</th>
            <th> Male (No.)</th><th> Female (No.)</th>
        </tr>
        </thead>

        <thead bgcolor="#cccccc">
        <th>1</th>
        <th>2</th>
        <g:each in="${23..<41}" >
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

            <td align="center">${finalList?.total?.commHealthCenter?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.commHealthCenter?.noOfNurses}</td>
            <td align="center">${finalList?.total?.commHealthCenter?.noOfBeds}</td>
            <td align="center">${finalList?.total?.commHealthCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.commHealthCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${finalList?.total?.familyWelCenter?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.familyWelCenter?.noOfNurses}</td>
            <td align="center">${finalList?.total?.familyWelCenter?.noOfBeds}</td>
            <td align="center">${finalList?.total?.familyWelCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.familyWelCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${finalList?.total?.ayurCenter?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.ayurCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.ayurCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${finalList?.total?.homeoCells?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.homeoCells?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.homeoCells?.noOfFemaleCasesTreated}</td>
            <td align="center">${finalList?.total?.health39}</td>
            <td align="center">${finalList?.total?.health40}</td>

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
            <td align="center">${resultList?.commHealthCenter?.noOfDoctors}</td>
            <td align="center">${resultList?.commHealthCenter?.noOfNurses}</td>
            <td align="center">${resultList?.commHealthCenter?.noOfBeds}</td>
            <td align="center">${resultList?.commHealthCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.commHealthCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${resultList?.familyWelCenter?.noOfDoctors}</td>
            <td align="center">${resultList?.familyWelCenter?.noOfNurses}</td>
            <td align="center">${resultList?.familyWelCenter?.noOfBeds}</td>
            <td align="center">${resultList?.familyWelCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.familyWelCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${resultList?.ayurCenter?.noOfDoctors}</td>
            <td align="center">${resultList?.ayurCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.ayurCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${resultList?.homeoCells?.noOfDoctors}</td>
            <td align="center">${resultList?.homeoCells?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.homeoCells?.noOfFemaleCasesTreated}</td>
            <td align="center">${resultList?.health39}</td>
            <td align="center">${resultList?.health40}</td>
        </tr>
        </g:each>

        </tbody>

    </table>
    <input type="button" value="Previous" onclick="healthPrevious('health2','health1');" style="float:left;"/>
    <input type="button" value="Next" onclick="healthNext('health2','health3');" style="float:right"/>

    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 60px;height: 30px; background-image:url(../images/temp/pie.jpeg)"
               onclick="displayHealthPopUp('pie',2)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 60px; height:30px;background-image:url(../images/temp/bar.jpeg)"
               onclick="displayHealthPopUp('bar',2)"/>
    </div>
</div>  </div>
<script type="text/javascript">

    /*
     dataTable function is used to create a table with some more functionality, look and feel.
     Their is no sorting on any columns, and no pagination.

     The defination of dataTable is written in  jquery.dataTables.js
     */
    $(document).ready(function () {
        $('#healthTd2').dataTable({
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


