<%@ page import="grails.converters.deep.JSON; com.osrs.Categories" %>
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
            $('#example1').dataTable({
                "bJQueryUI": true
                ,"bSort": false
//                ,"bLengthChange": false
//                ,"bAutoWidth": false
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

<div style="width: 1000px" id="renderingIsf">
<div style="width: 1000px;" id="report1">
    <div style="font-weight: bold;font-size: 14px;text-transform:uppercase;width: 100%;text-align: center;margin-top: 40px">
        <CAPTION>${category} Page 2</CAPTION> </div>
    <table cellpadding="0" cellspacing="0" border="1px;"  id="example1" style="margin: 5px;border: 1px solid #000000">
             <thead>
             <tr>
                 <th>Year:${year}</th>
                 <th></th>  <th></th>  <th></th>    <th>Month:${month}</th>     <th></th>  <th></th>     <th></th>

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
                     <th></th>
                 </g:else>
                 <th></th>


             </tr>
             </thead>
             <tbody>
             <tr class="reportHead">
                 <td></td>   <td></td>  <td></td>  <td>Sericulture & weaving</td>  <td></td>
                 <td></td>   <td></td>  <td></td>  <td>Co-operation of Societies</td>  <td></td>
             </tr>
             <tr class="reportHead">
                 <td>Name of ${finalList.type}</td>
                 <td>Name of ${finalList.subType}</td>  <td>Cottage & Village Industry/Name of Industry</td>
                 <td>Handlooms</td>
                 <td>Powerlooms</td>  <td>Agricultural Society</td>  <td>Marketing Society</td>  <td>Farming Society</td>  <td>Primary Co-operative Credit Society</td>
                 <td>P.D.S Co-Operative Society</td>

             </tr>
             <tr class="reportHead">
                 <td>1</td>
                 <td>2</td>
                 <g:each in="${17..<25}" >
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
                         <g:link action="mainReport"
                                 params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month]"
                                 target="_blank">
                             ${resultList?.village?.gramPanchayat?.block?.district?.name}</g:link>
                     </g:if>
                     <g:elseif test="${finalList?.type=='District'}">
                         <g:link action="mainReport"
                                 params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month]"
                                 target="_blank">
                             ${resultList?.village?.gramPanchayat?.block?.name}</g:link>
                     </g:elseif>
                     <g:elseif test="${finalList?.type=='Block'}">
                         <g:link action="mainReport"
                                 params="[panchayatCode: resultList?.village?.gramPanchayat?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month]"
                                 target="_blank">
                             ${resultList?.village?.gramPanchayat?.name}  </g:link>
                     </g:elseif>
                     <g:elseif test="${finalList?.type=='Panchayat'}">
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

                 </tr>
             </g:each>
             </tbody>

         </table>

    <g:each in="${finalList.list}" var="resultList" status="i">
        <g:if test="${finalList?.type=='State'}">
            <g:form controller="report" action="renderingReports" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'1']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='District'}">
            <g:form controller="report" action="renderingReports" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'1']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Block'}">
            <g:form controller="report" action="renderingReports" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'1']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Panchayat'}">
            <g:form controller="report" action="renderingReports" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'1']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
    </g:each>


         %{--<input type="button" value="Previous" onclick="isfPrevious('report1','renderingIsfReports');" style="float:left;"/>--}%

   <div align="center">
       <input type="button" id='chart' name="Pie" value=""
              style="width: 30px;height: 30px; background-image:url(../images/temp/pie.jpg)"
              onclick="displayIsfPopUp('pie',2)"/>
       <input type="button" id='pie' name="Bar" value=""
              style="width: 30px; height:30px;background-image:url(../images/temp/bar.jpg)"
              onclick="displayIsfPopUp('bar',2)"/>
   </div>




  <div id="Overlay">
      <div id="Outer">
          <div id="OvrMain">
              <div style="height: 30px;background-color:#ccccff;">
                  <div style="float: left;font-weight: bold;" id="overLayHeader">Select one</div>
                  <div style="float: right;font-weight: bold;padding: 2px;cursor: pointer" onclick="hidePopUp();">
                     X
                  </div>

              </div>
               <div id="graphHeader"></div>
               <div id="graphicsDisplay"> </div>
          </div>

      %{--</div>--}%
      %{--</div>--}%
  </div>
</div>
</body>
</html>