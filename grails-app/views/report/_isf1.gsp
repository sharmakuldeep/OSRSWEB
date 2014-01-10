<%@ page import="com.osrs.Categories" %>
<%--
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
<div style="width: 1000px" id="renderingIsfReports">

    <div style="font-weight: bold;font-size: 14px;text-transform:uppercase;width: 100%;text-align: center;margin-top: 40px">
    <CAPTION>${category} Page 1</CAPTION> </div>
          <table cellpadding="0" cellspacing="0" border="1px;"  id="example11"
                 style="margin: 5px;border: 1px solid #000000">

          <thead>
           <tr>
              <th>Year:${year}</th>
              <th></th>
              <th></th>
              <th></th>
              <th></th>
              <th>Month:${month}</th>
              <th></th>
              <th></th>
              <th></th>
              <th></th>
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
             <th></th>  <th></th>    <th></th>

         </tr>


          </thead>
          <tbody>

          <tr class="reportHead">
           <td></td> <td></td> <td></td> <td></td>
              <td></td> <td>Motorable Road</td> <td></td> <td></td>
              <td></td> <td></td> <td></td> <td></td>
              <td></td> <td></td> <td>Bank</td> <td></td>
          </tr>
          <tr class="reportHead">
              <td>Name of ${finalList.type}</td>
              <td>Name of ${finalList.subType}</td>  <td>Human Hospital/Dispensary/PHC etc.</td>
              <td>Veterinary Hospital/Dispensary</td>
              <td>Pucca Road</td>  <td>Semipucca Road</td>  <td>Katcha Road</td>  <td>Bus Stop</td>  <td>Post Office</td>
              <td>Railway Station</td>  <td>Police Station</td>  <td>Hat/Bazar</td>
              <td>Name of the Day/Days of Har/Bazar</td>  <td>Schedule Bank</td>  <td>Regional Rural Bank</td>  <td>Co-Operative Bank</td>

          </tr>
          <tr class="reportHead">
          <g:each in="${1..<17}" >
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


              <td align="center">${finalList?.total?.isf3}</td>
            <td align="center">${finalList?.total?.isf4}</td>
            <td align="center">${finalList?.total?.isf5}</td>
            <td align="center">${finalList?.total?.isf6}</td>
            <td align="center">${finalList?.total?.isf7}</td>
            <td align="center">${finalList?.total?.isf8}</td>
            <td align="center">${finalList?.total?.isf9}</td>
            <td align="center">${finalList?.total?.isf10}</td>
            <td align="center">${finalList?.total?.isf11}</td>
            <td align="center">${finalList?.total?.isf12}</td>
            <td align="center">${finalList?.total?.isf13}</td>
            <td align="center">${finalList?.total?.isf14}</td>
            <td align="center">${finalList?.total?.isf15}</td>
            <td align="center">${finalList?.total?.isf16}</td>


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
            <td align="center">${resultList?.isf3}</td>
            <td align="center">${resultList?.isf4}</td>
            <td align="center">${resultList?.isf5}</td>
            <td align="center">${resultList?.isf6}</td>
            <td align="center">${resultList?.isf7}</td>
            <td align="center">${resultList?.isf8}</td>
            <td align="center">${resultList?.isf9}</td>
            <td align="center">${resultList?.isf10}</td>
            <td align="center">${resultList?.isf11}</td>
            <td align="center">${resultList?.isf12}</td>
            <td align="center">${resultList?.isf13}</td>
            <td align="center">${resultList?.isf14}</td>
            <td align="center">${resultList?.isf15}</td>
            <td align="center">${resultList?.isf16}</td>


        </tr>
        </g:each>
          </tbody>
      </table>
    %{--<input type="button" value="Next" onclick="isfNext('renderingIsfReports','report1')" style="float:right">--}%
    <g:each in="${finalList.list}" var="resultList" status="i">
        <g:if test="${finalList?.type=='State'}">
            <g:form controller="report" action="reportNextInfra" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='District'}">
            <g:form controller="report" action="reportNextInfra" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Block'}">
            <g:form controller="report" action="reportNextInfra" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Panchayat'}">
            <g:form controller="report" action="reportNextInfra" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.INFRASTRUCTURE.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
    </g:each>
    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 30px;height: 30px; background-image:url(../images/temp/pie.jpg)"
               onclick="displayIsfPopUp('pie',1)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 30px; height:30px;background-image:url(../images/temp/bar.jpg)"
               onclick="displayIsfPopUp('bar',1)"/>
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

//        jQuery('#button1').hide();

        hideButtons()
        $('#example11').dataTable({
            "bJQueryUI": true
            ,"bSort": false
//            ,"bLengthChange": false
//            ,"bAutoWidth": false
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
</script>