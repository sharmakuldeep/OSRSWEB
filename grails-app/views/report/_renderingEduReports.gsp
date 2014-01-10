<%@ page import="com.osrs.Categories" %>


<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 2:15 PM
  To change this template use File | Settings | File Templates.
--%>

<div style="width: 1000px" id="rendering">
<div style="width: 1000px" id="renderingEduReports">
<div style="height: 30px;">
    <div style="font-weight: bold;font-size: 14px;text-transform:uppercase;width: 100%;text-align: center;margin-top: 40px">
        <CAPTION>${category} Page 1</CAPTION> </div>
    <table id="example1">

        <thead>

        <tr>
            <th>Year:${year}</th>
            <th></th>
            <th></th>
            <th></th>

            <th>Month:${month}</th>
            <th></th>
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
            <th></th>

                </tr>

            </thead>
           <tbody>
           <tr class="reportHead">
            <td></td> <td></td><td></td><td></td><td></td>
               <td></td><td>No of Institution</td><td></td> <td></td>
           </tr>
          <tr class="reportHead">
              <td>Name of ${finalList.type}</td>
              <td>Name of ${finalList.subType}</td>
        <td>No. of Adult education center functioning</td>
        <td>No. of Adult educated</td>

        <td>Pre- primary school</td>
              <td>Primary school</td>
              <td>Middle school</td>
              <td>Secondary school</td>
              <td>Higher Secondary school</td>


        </tr>
          <tr class="reportHead">
          <g:each in="${1..<10}" >
            <td>${it}</td>
        </g:each>
        </tr>
        <tr bgcolor="red">
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
                <td align="center">${finalList?.total?.village?.name}</td>
            </g:elseif>


            <td align="center">${finalList?.total?.edu3}</td>
            <td align="center">${finalList?.total?.edu4}</td>
            <td align="center">${finalList?.total?.edu5}</td>
            <td align="center">${finalList?.total?.edu6}</td>
            <td align="center">${finalList?.total?.edu7}</td>
            <td align="center">${finalList?.total?.edu8}</td>
            <td align="center">${finalList?.total?.edu9}</td>

               </tr>

            <g:each in="${finalList.list}" var="resultList">
                  <tr>
                      <td></td> <td>
                      <g:if test="${finalList?.type=='State'}">
                        <g:link action="mainReport" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]" name="eduId" value="${data?.id}" target="_blank">
                          ${resultList?.village?.gramPanchayat?.block?.district?.name}</g:link>
                      </g:if>
                      <g:elseif test="${finalList?.type=='District'}">
                        <g:link action="mainReport" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]" target="_blank">
                          ${resultList?.village?.gramPanchayat?.block?.name}</g:link>
                      </g:elseif>
                      <g:elseif test="${finalList?.type=='Block'}">
                          <g:link action="mainReport" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]" target="_blank">
                          ${resultList?.village?.gramPanchayat?.name}</g:link>
                      </g:elseif>
                      <g:else>
                         %{--sss <g:link action="mainReport" params="[villageCode:resultList?.village?.block?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]" target="_blank">--}%
                              ${resultList?.village?.name}
                      </g:else>
                      </td>

                      <td align="center">${resultList?.edu3}</td>
                      <td align="center">${resultList?.edu4}</td>
                      <td align="center">${resultList?.edu5}</td>
                      <td align="center">${resultList?.edu6}</td>
                      <td align="center">${resultList?.edu7}</td>
                      <td align="center">${resultList?.edu8}</td>
                      <td align="center">${resultList?.edu9}</td>


                  </tr>
                  </g:each>

        </tbody>



    </table>
<g:each in="${finalList.list}" var="resultList" status="i">
    <g:if test="${finalList?.type=='State'}">
        <g:form controller="report" action="reportNextInfra" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'2']" >

            <input type="submit" value="Next"  style="float:right" class="buttonClass" id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='District'}">
        <g:form controller="report" action="reportNextInfra" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'2']" >

            <input type="submit" value="Next"  style="float:right" class="buttonClass" id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Block'}">
        <g:form controller="report" action="reportNextInfra" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'2']" >

            <input type="submit" value="Next"  style="float:right" class="buttonClass" id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Panchayat'}">
        <g:form controller="report" action="reportNextInfra" params="[panchayatCode: resultList?.village?.gramPanchayat?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'2']" >

            <input type="submit" value="Next"  style="float:right" class="buttonClass" id="button${i}">
        </g:form>
    </g:if>
</g:each>
     %{--<input type="button" value="Next" onclick="eduNext('renderingEduReports','educationDataPrePrimary')" style="float:right">--}%

    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 30px;height: 30px; background-image:url(../images/temp/pie.jpg)"
               onclick="displayEduPopUp('pie',1)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 30px; height:30px;background-image:url(../images/temp/bar.jpg)"
               onclick="displayEduPopUp('bar',1)"/>
    </div>
  </div>
</div>
</div>
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