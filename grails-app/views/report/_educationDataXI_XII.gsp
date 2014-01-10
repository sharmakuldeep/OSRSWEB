<%@ page import="com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 5/25/12
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>

<div style="width: 1000px" id="rendering">
<div style="width: 1000px;display: none;" id="educationDataXI_XII">
    <div style="height: 30px;">
        <img src="../images/icon_print.gif" alt="" title="Print" style="float: right;cursor: pointer"
             onclick="window.print();">
        %{--<img src="../images/icon_pdf.gif" alt="" title="Print PDF" style="float: right;cursor: pointer">--}%
    </div>
    <table id="example8">
        <CAPTION><div style="font-size: 15px">Education Page 6</div></CAPTION>
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
        <th rowspan="3">Name of ${finalList.type}</th>
        <th rowspan="3">Name of ${finalList.subType}</th>

        <th colspan="10">No. of Enrollment ,Senior Secondary(XI-XII)</th>
        <th rowspan="2" colspan="2">No of Teachers in Senior Secondary School</th>
        <tr>

            <th colspan="2">No of Students Enrolled</th>
            <th colspan="2">No of Students Attending School</th>
            <th colspan="2">No of New Entrants/Fresh Entry</th>
            <th colspan="2">No of Students Discontinued Studies</th>
            <th colspan="2">Reasons for Discontinuation of studies</th>
        <tr><th>Boys</th> <th>Girls</th>
            <th>Boys</th> <th>Girls</th>
            <th>Boys</th> <th>Girls</th>
            <th>Boys</th> <th>Girls</th>
            <th>Economic</th> <th>Non-Economic</th>
            <th>Male</th><th>Female</th>

        </tr>

        <th>1</th>
        <th>2</th>
        <g:each in="${63..<75}">
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
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.studentEnrolledBoys}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.studentEnrolledGirls}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.studentAttendingBoys}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.studentAttendingGirls}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.newEntrantsBoys}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.newEntrantsGirls}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.studentDiscontinuedStudiesBoys}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.studentDiscontinuedStudiesGirls}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.reasonOfDiscontinuationEconomic}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.reasonOfDiscontinuationNonEconomic}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.noOfTeacherMale}</td>
            <td align="center">${finalList?.total?.seniorSecSchoolTotal?.noOfTeacherFemale}</td>

        </tr>
        <g:each in="${finalList.list}" var="resultList">
            <tr>
                <td align="center"></td> <td align="center">
                <g:if test="${finalList?.type=='State'}">
                    <g:link action="mainReport"
                            params="[distCode:resultList?.village?.block?.district?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]"
                            target="_blank">
                        ${resultList?.village?.block?.district?.name}</g:link>
                </g:if>
                <g:elseif test="${finalList?.type=='District'}">
                    <g:link action="mainReport"
                            params="[blockCode:resultList?.village?.block?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]"
                            target="_blank">
                        ${resultList?.village?.block?.name}</g:link>
                </g:elseif>
                <g:elseif test="${finalList?.type=='Block'}">
                    ${resultList?.village?.name}
                </g:elseif>
            </td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.studentEnrolledBoys}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.studentEnrolledGirls}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.studentAttendingBoys}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.studentAttendingGirls}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.newEntrantsBoys}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.newEntrantsGirls}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.studentDiscontinuedStudiesBoys}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.studentDiscontinuedStudiesGirls}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.reasonOfDiscontinuationEconomic}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.reasonOfDiscontinuationNonEconomic}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.noOfTeacherMale}</td>
                <td align="center">${resultList?.seniorSecSchoolTotal?.noOfTeacherFemale}</td>

            </tr>
        </g:each>

        </tbody>
    </table>
    <input type="button" value="Previous" onclick="eduPrevious('educationDataXI_XII', 'educationDataIX_X');"
           style="float:left;"/>
    <input type="button" value="Next" onclick="eduNext('educationDataXI_XII', 'educationDataDegree_level');"
           style="float:right"/>

    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 60px;height: 30px; background-image:url(../images/temp/pie.jpeg)"
               onclick="displayEduPopUp('pie', 6)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 60px; height:30px;background-image:url(../images/temp/bar.jpeg)"
               onclick="displayEduPopUp('bar', 6)"/>
    </div>

</div>  </div>
<script type="text/javascript">

    /*
     dataTable function is used to create a table with some more functionality, look and feel.
     Their is no sorting on any columns, and no pagination.

     The defination of dataTable is written in  jquery.dataTables.js
     */
    $(document).ready(function () {
        $('#example8').dataTable({
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
