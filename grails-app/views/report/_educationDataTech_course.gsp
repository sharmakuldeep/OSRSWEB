<%@ page import="com.osrs.Categories" %>
<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 5/25/12
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>

<div style="width: 1000px" id="rendering">
<div style="width: 1000px;display: none;" id="educationDataTech_course">
<div style="height: 30px;">
<img src="../images/icon_print.gif" alt="" title="Print" style="float: right;cursor: pointer"
onclick="window.print();">
        %{--<img src="../images/icon_pdf.gif" alt="" title="Print PDF" style="float: right;cursor: pointer">--}%
    </div>
    <table id="example6">
        <CAPTION><div style="font-size: 15px">Education Page 8</div></CAPTION>
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

        <th colspan="14">No. of Enrollment ,Other Technical course(Degree/Diploma Level)</th>

        <tr>

            <th colspan="2">No of Students Enrolled BE/B.Tech</th>
            <th colspan="2">No of Students Enrolled in MBBS</th>
            <th colspan="2">No of Students Enrolled BVSC</th>
            <th colspan="2">No of Students Enrolled in agri MSC</th>
            <th colspan="2">No Of Students Enrolled polytech Diploma</th>
            <th colspan="2">No Of Students Enrolled ITI</th>
            <th colspan="2">No Of Students Enrolled Vocational course</th>
        <tr><th>Boys</th> <th>Girls</th>
            <th>Boys</th> <th>Girls</th>
            <th>Boys</th> <th>Girls</th>
            <th>Boys</th> <th>Girls</th>
            <th>Boys</th> <th>Girls</th>
            <th>Boys</th><th>Girls</th>
            <th>Boys</th><th>Girls</th>
        </tr>
        <th>1</th>
        <th>2</th>
        <g:each in="${87..<101}">
            <th>${it}</th>
        </g:each>
        </thead>
        <tbody>

        <tr bgcolor="red">
            <g:if test="${finalList?.type=='State'}">
                <td>${finalList?.total?.village?.block?.district?.state?.name}</td>
                <td align="center">-</td>
            </g:if>
            <g:elseif test="${finalList?.type=='District'}">
                <td>${finalList?.total?.village?.block?.district?.name}</td>
                <td align="center">-</td>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Block'}">
                <td>${finalList?.total?.village?.block?.name}</td>
                <td align="center">-</td>
            </g:elseif>
            <g:elseif test="${finalList?.type=='Village'}">
                <td>${finalList?.total?.village?.name}</td>
                <td align="center">${finalList?.total?.village?.gramPanchayt}</td>
            </g:elseif>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechBoys}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechGirls}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsBoys}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsGirls}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscBoys}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscGirls}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscBoys}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscGirls}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaBoys}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaGirls}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIBoys}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIGirls}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseBoys}</td>
            <td align="center">${finalList?.total?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseGirls}</td>

        </tr>
        <g:each in="${finalList.list}" var="resultList">
            <tr>
                <td></td> <td>
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
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechBoys}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechGirls}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsBoys}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsGirls}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscBoys}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscGirls}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscBoys}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscGirls}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaBoys}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaGirls}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIBoys}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIGirls}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseBoys}</td>
                <td align="center">${resultList?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseGirls}</td>
            </tr>
        </g:each>

        </tbody>
    </table>
    <input type="button" value="Previous"
           onclick="eduPrevious('educationDataTech_course', 'educationDataDegree_level');" style="float:left;"/>

    <div align="center">
        <input type="button" id='chart' name="Pie" value=""
               style="width: 60px;height: 30px; background-image:url(../images/temp/pie.jpeg)"
               onclick="displayEduPopUp('pie', 8)"/>
        <input type="button" id='pie' name="Bar" value=""
               style="width: 60px; height:30px;background-image:url(../images/temp/bar.jpeg)"
               onclick="displayEduPopUp('bar', 8)"/>
    </div>

</div>      </div>
<script type="text/javascript">

    /*
     dataTable function is used to create a table with some more functionality, look and feel.
     Their is no sorting on any columns, and no pagination.

     The defination of dataTable is written in  jquery.dataTables.js
     */
    $(document).ready(function () {
        $('#example6').dataTable({
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