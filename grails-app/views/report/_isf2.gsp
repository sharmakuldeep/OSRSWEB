<%@ page import="com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 5/28/12
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
-<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>
<div style="width: 1000px" id="renderingIsf">
<div style="width: 1000px;display: none;" id="report1">
<div style="height: 30px;">
<img src="../images/icon_print.gif" alt="" title="Print" style="float: right;cursor: pointer"  onclick="window.print();" >
           %{--<img src="../images/icon_pdf.gif" alt="" title="Print PDF" style="float: right;cursor: pointer">--}%
      </div>
      <table id="isf2">
         <CAPTION><div style="font-size: 15px">${category}</div></CAPTION>
          <thead  bgcolor="#cccccc">
               %{--<g:if test='${block1}'>--}%
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
               %{--<th rowspan="3">Name of District</th>--}%
               %{--<th rowspan="3">Name of Block</th>--}%
           %{--</g:if>--}%
        %{--<g:elseif test='${villagereport}'>--}%
            %{--<th rowspan="3">Name of Block</th>--}%
            %{--<th rowspan="3">Name of Village</th>--}%
        %{--</g:elseif>--}%
          %{--<g:elseif test='${state}'>--}%
                  <th rowspan="3" >Name of ${finalList.type}</th>
        <th rowspan="3">Name of ${finalList.subType}</th>
          <th rowspan="3">Cottage & Village Industry/Name of Industry</th>
                <th colspan="2" rowspan="1">Sericulture & weaving</th>
          <th colspan="5" rowspan="1">Co-operation of Societies</th>

                         <tr>
                             <th rowspan="1" colspan="1">Handlooms</th>
                             <th rowspan="1" colspan="1">Powerlooms</th>

                             <th rowspan="1" colspan="1">Agricultural Society</th>
                             <th rowspan="1" colspan="1">Marketing Society</th>
                             <th rowspan="1" colspan="1">Farming Society</th>
                             <th rowspan="1" colspan="1">Primary Co-operative Credit Society</th><th rowspan="1" colspan="1">P.D.S Co-Operative Society</th>
                             <tr><th rowspan="1">Nos.</th><th rowspan="1">Nos.</th><th rowspan="1">Nos.</th><th rowspan="1">Nos.</th><th rowspan="1">Nos.</th><th rowspan="1">Nos.</th><th rowspan="1">Nos.</th></tr>

                         </tr>

        <th>1</th>
        <th>2</th>
        <g:each in="${17..<25}" >
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

             <td align="center">${finalList?.total?.isf17}</td>
            <td align="center">${finalList?.total?.isf18}</td>
            <td align="center">${finalList?.total?.isf19}</td>
            <td align="center">${finalList?.total?.isf20}</td>
            <td align="center">${finalList?.total?.isf21}</td>
            <td align="center">${finalList?.total?.isf22}</td>
            <td align="center">${finalList?.total?.isf23}</td>
            <td align="center">${finalList?.total?.isf24}</td>

        </tr>
        <g:each in="${finalList.list}" var="resultList">
        <tr>
            <td align="center"></td> <td align="center">
            <g:if test="${finalList?.type=='State'}">
              <g:link action="mainReport" params="[distCode:resultList?.village?.block?.district?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month]" target="_blank">
                ${resultList?.village?.block?.district?.name}</g:link>
            </g:if>
            <g:elseif test="${finalList?.type=='District'}">
              <g:link action="mainReport" params="[blockCode:resultList?.village?.block?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month]" target="_blank">
                ${resultList?.village?.block?.name}</g:link>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Block'}">
                ${resultList?.village?.name}
            </g:elseif>
            </td>

            <td align="center">${resultList?.isf17}</td>
            <td align="center">${resultList?.isf18}</td>
            <td align="center">${resultList?.isf19}</td>
            <td align="center">${resultList?.isf20}</td>
            <td align="center">${resultList?.isf21}</td>
            <td align="center">${resultList?.isf22}</td>
            <td align="center">${resultList?.isf23}</td>
             <td align="center">${resultList?.isf24}</td>
            %{--<td align="center">${resultList?.isf24}</td>--}%
        </tr>
        </g:each>
          </tbody>
      </table>

       <input type="button" value="Previous" onclick="isfPrevious('report1','renderingIsfReports');" style="float:left;"/>

   <div align="center">
       <input type="button" id='chart' name="Pie" value=""
              style="width: 60px;height: 30px; background-image:url(../images/temp/pie.jpeg)"
              onclick="displayIsfPopUp('pie',2)"/>
       <input type="button" id='pie' name="Bar" value=""
              style="width: 60px; height:30px;background-image:url(../images/temp/bar.jpeg)"
              onclick="displayIsfPopUp('bar',2)"/>
   </div>




  %{--<div id="Overlay">--}%
      %{--<div id="Outer">--}%
          %{--<div id="OvrMain">--}%
              %{--<div style="height: 30px;background-color:#ccccff;">--}%
                  %{--<div style="float: left;font-weight: bold;" id="overLayHeader">Select one</div>--}%
                  %{--<div style="float: right;font-weight: bold;padding: 2px;cursor: pointer" onclick="hidePopUp();">--}%
                     %{--X--}%
                  %{--</div>--}%

              %{--</div>--}%
               %{--<div id="graphHeader"></div>--}%
               %{--<div id="graphicsDisplay"> </div>--}%
          %{--</div>--}%

      %{--</div>--}%
  </div>  </div>
<script type="text/javascript">

    /*
     dataTable function is used to create a table with some more functionality, look and feel.
     Their is no sorting on any columns, and no pagination.

     The defination of dataTable is written in  jquery.dataTables.js
     */
    $(document).ready(function () {
        $('#isf2').dataTable({
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