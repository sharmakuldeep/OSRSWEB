<%@ page import="com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/21/12
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<div style="width: 1200px" id="renderingHealth">
<div style="width: 1200px" id="health1">
    <div style="font-weight: bold;font-size: 14px;text-transform:uppercase;width: 100%;text-align: center;margin-top: 40px">
        <CAPTION>HEALTH AND FAMILY WELFARE Page 1</CAPTION> </div>
    <table cellpadding="0" cellspacing="0" border="1px;" class="display" id="example12"
           style="margin: 5px;border: 1px solid #000000">

        <thead>
        <tr>
            <th>Year:${year}</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th><th></th>
            <th></th>
            <th></th>
            <th>Month:${month}</th>
            <th></th>
            <th></th>
            <th></th>
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
        %{--<thead  bgcolor="#cccccc">--}%
        %{--<g:each in="${1..<23}" >--}%
            %{--<th  class="1st">${it}</th>--}%
        %{--</g:each>--}%

        %{--</thead>--}%

        <tbody>
           <tr class="reportHead" >
              <td></td>  <td></td>   <td></td>  <td style="width: 90px">(1) Govt. Hospitals</td>    <td></td>
               <td></td>  <td></td>   <td>(2) Govt. Dispensaries</td>  <td></td>    <td></td>
               <td></td>  <td></td>   <td style="width: 150px">(3) Primary  Health Centres</td>  <td></td>    <td></td>
               <td></td>  <td></td>   <td></td>     <td>(4) Sub-Centres</td>  <td></td>
               <td></td>  <td></td>

           </tr>
        <tr class="reportHead" >
        <td></td>  <td></td>   <td></td>  <td></td>    <td></td>
        <td>Cases Treated</td>  <td>Cases Treated</td>   <td></td>  <td></td>    <td></td>
        <td>Cases Treated</td>  <td>Cases Treated</td>   <td></td>  <td></td>    <td></td>
        <td>Cases Treated</td>  <td>Cases Treated</td>   <td></td>     <td></td>  <td></td>
        <td>Cases Treated</td>  <td>Cases Treated</td>

        </tr>
        <tr class="reportHead" >
            <td>Name of ${finalList.type}</td>
            <td>Name of ${finalList.subType}</td>
            <td>Doctors (No.)</td>
            <td>Nurses (No.)</td>
            <td>Beds (No.)</td>
            <td>Male (No.)</td>
            <td>Female (No.)</td>
            %{--<th colspan="2">Cases Treated</th>--}%
            <td>Doctors (No.)</td>
            <td>Nurses (No.)</td>
            <td>Beds (No.)</td>
            <td>Male (No.)</td>
            <td>Female (No.)</td>
            %{--<th colspan="2">Cases Treated</th>--}%
            <td>Doctors (No.)</td>
            <td>Nurses (No.)</td>
            <td>Beds (No.)</td>
            <td>Male (No.)</td>
            <td>Female (No.)</td>
            %{--<th colspan="2">Cases Treated</th>--}%
            <td>Doctors (No.)</td>
            <td>Nurses (No.)</td>
            <td>Beds (No.)</td>
            <td>Male (No.)</td>
            <td>Female (No.)</td>

            %{--<th colspan="2">Cases Treated</th>--}%
        </tr>
        <tr class="reportHead" >
            <g:each in="${1..<23}" >
                <td>${it}</td>
            </g:each>

        </tr>
        <tr class="1st">
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

            <td align="center">${finalList?.total?.govHospitals?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.govHospitals?.noOfNurses}</td>
            <td align="center">${finalList?.total?.govHospitals?.noOfBeds}</td>
            <td align="center">${finalList?.total?.govHospitals?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.govHospitals?.noOfFemaleCasesTreated}</td>
            <td align="center">${finalList?.total?.govDispensaries?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.govDispensaries?.noOfNurses}</td>
            <td align="center">${finalList?.total?.govDispensaries?.noOfBeds}</td>
            <td align="center">${finalList?.total?.govDispensaries?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.govDispensaries?.noOfFemaleCasesTreated}</td>
            <td align="center">${finalList?.total?.primHealthCenter?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.primHealthCenter?.noOfNurses}</td>
            <td align="center">${finalList?.total?.primHealthCenter?.noOfBeds}</td>
            <td align="center">${finalList?.total?.primHealthCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.primHealthCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${finalList?.total?.subCenter?.noOfDoctors}</td>
            <td align="center">${finalList?.total?.subCenter?.noOfNurses}</td>
            <td align="center">${finalList?.total?.subCenter?.noOfBeds}</td>
            <td align="center">${finalList?.total?.subCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${finalList?.total?.subCenter?.noOfFemaleCasesTreated}</td>

        </tr>
        <g:each in="${finalList.list}" var="resultList">
        <tr class="1st">
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

            <td align="center">${resultList?.govHospitals?.noOfDoctors}</td>
            <td align="center">${resultList?.govHospitals?.noOfNurses}</td>
            <td align="center">${resultList?.govHospitals?.noOfBeds}</td>
            <td align="center">${resultList?.govHospitals?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.govHospitals?.noOfFemaleCasesTreated}</td>
            <td align="center">${resultList?.govDispensaries?.noOfDoctors}</td>
            <td align="center">${resultList?.govDispensaries?.noOfNurses}</td>
            <td align="center">${resultList?.govDispensaries?.noOfBeds}</td>
            <td align="center">${resultList?.govDispensaries?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.govDispensaries?.noOfFemaleCasesTreated}</td>
            <td align="center">${resultList?.primHealthCenter?.noOfDoctors}</td>
            <td align="center">${resultList?.primHealthCenter?.noOfNurses}</td>
            <td align="center">${resultList?.primHealthCenter?.noOfBeds}</td>
            <td align="center">${resultList?.primHealthCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.primHealthCenter?.noOfFemaleCasesTreated}</td>
            <td align="center">${resultList?.subCenter?.noOfDoctors}</td>
            <td align="center">${resultList?.subCenter?.noOfNurses}</td>
            <td align="center">${resultList?.subCenter?.noOfBeds}</td>
            <td align="center">${resultList?.subCenter?.noOfMaleCasesTreated}</td>
            <td align="center">${resultList?.subCenter?.noOfFemaleCasesTreated}</td>
        </tr>
        </g:each>

        </tbody>

    </table>
    %{--<input type="button" value="Next" class="buttonClass" style="float:right">--}%

<g:each in="${finalList.list}" var="resultList" status="i">
    <g:if test="${finalList?.type=='State'}">
        <g:form controller="report" action="reportNextInfra" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='District'}">
        <g:form controller="report" action="reportNextInfra" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Block'}">
        <g:form controller="report" action="reportNextInfra" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
    <g:if test="${finalList?.type=='Panchayat'}">
        <g:form controller="report" action="reportNextInfra" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.HEALTH.value(), year:resultList?.year, month:resultList?.month,page:'2']" >
            <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
        </g:form>
    </g:if>
</g:each>
    <div align="center">
        <input type="button" id='chart' name="Pie"  value=""
               style="width: 30px;height: 30px; background-image:url(../images/temp/pie.jpg)"
               onclick="displayHealthPopUp('pie',1)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 30px; height:30px;background-image:url(../images/temp/bar.jpg)"
               onclick="displayHealthPopUp('bar',1)"/>
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
        $('#example12').dataTable({
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




    });

</script>