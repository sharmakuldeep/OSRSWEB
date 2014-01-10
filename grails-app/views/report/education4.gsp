<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 5/25/12
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="grails.converters.deep.JSON; com.osrs.Categories" contentType="text/html;charset=UTF-8" %>
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
            $('#example4').dataTable({
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

<div style="width: 1150px;margin-left: -100px" id="rendering">
    <div style="width: 1150px;" id="educationDataVI_VIII">
        <div style="font-weight: bold;font-size: 14px;text-transform:uppercase;width: 100%;text-align: center;margin-top: 40px">
            <CAPTION>${category} Page 4</CAPTION> </div>

        <table id="example4" style="width: 1150px">

            <thead>
            <tr>
                <th>Year:${year}</th>
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
                <td></td>
                <td></td>
                <td></td>
                <td style="width:83px">No. of Enrollment ,Middle(VI-VIII)</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <tr class="reportHead">
                <td></td>
                <td></td>
                <td style="width:83px">No of Students Enrolled</td>
                <td style="width:83px">No of Students Enrolled</td>
                <td style="width:83px">No of Students Attending School</td>
                <td style="width:83px">No of Students Attending School</td>
                <td style="width:83px">No of New Entrants/Fresh Entry</td>
                <td style="width:83px">No of New Entrants/Fresh Entry</td>
                <td style="width:83px">No of Students Discontinued Studies</td>
                <td style="width:83px">No of Students Discontinued Studies</td>
                <td style="width:83px">Reasons for Discontinuation of studies</td>
                <td style="width:83px">Reasons for Discontinuation of studies</td>
                <td style="width:83px">No of Teachers in Middle School </td>
                <td style="width:83px">No of Teachers in Middle School</td>
            </tr>
            <tr class="reportHead">
                <td>Name of ${finalList.type}</td>
                <td>Name of ${finalList.subType}</td>
                <td>Boys</td>
                <td>Girls</td>
                <td>Boys</td>
                <td>Girls</td>
                <td>Boys</td>
                <td>Girls</td>
                <td>Boys</td>
                <td>Girls</td>
                <td>Economic</td>
                <td>Non-Economic</td>
                <td>Male</td>
                <td>Female</td>

            </tr>
            <tr class="reportHead">
                <td>1</td>
                <td>2</td>
                <g:each in="${37..<49}" >
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
                %{--<td align="center">${finalList?.total?.village?.name}</td>--}%
                </g:elseif>
                <td align="center">${finalList?.total?.middleTotal?.studentEnrolledBoys}</td>
                <td align="center">${finalList?.total?.middleTotal?.studentEnrolledGirls}</td>
                <td align="center">${finalList?.total?.middleTotal?.studentAttendingBoys}</td>
                <td align="center">${finalList?.total?.middleTotal?.studentAttendingGirls}</td>
                <td align="center">${finalList?.total?.middleTotal?.newEntrantsBoys}</td>
                <td align="center">${finalList?.total?.middleTotal?.newEntrantsGirls}</td>
                <td align="center">${finalList?.total?.middleTotal?.studentDiscontinuedStudiesBoys}</td>
                <td align="center">${finalList?.total?.middleTotal?.studentDiscontinuedStudiesGirls}</td>
                <td align="center">${finalList?.total?.middleTotal?.reasonOfDiscontinuationEconomic}</td>
                <td align="center">${finalList?.total?.middleTotal?.reasonOfDiscontinuationNonEconomic}</td>
                <td align="center">${finalList?.total?.middleTotal?.noOfTeacherMale}</td>
                <td align="center">${finalList?.total?.middleTotal?.noOfTeacherFemale}</td>

            </tr>
            <g:each in="${finalList.list}" var="resultList">
                <tr>
                    <td></td> <td>
                    <g:if test="${finalList?.type=='State'}">
                        <g:link action="mainReport"
                                params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]"
                                target="_blank">
                            ${resultList?.village?.gramPanchayat?.block?.district?.name}</g:link>
                    </g:if>
                    <g:elseif test="${finalList?.type=='District'}">
                        <g:link action="mainReport"
                                params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]"
                                target="_blank">
                            ${resultList?.village?.gramPanchayat?.block?.name}</g:link>
                    </g:elseif>
                    <g:elseif test="${finalList?.type=='Block'}">
                        <g:link action="mainReport"
                                params="[panchayatCode: resultList?.village?.gramPanchayat?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month]"
                                target="_blank">
                            ${resultList?.village?.gramPanchayat?.name}  </g:link>
                    </g:elseif>
                    <g:elseif test="${finalList?.type=='Panchayat'}">
                        ${resultList?.village?.name}
                    </g:elseif>
                </td>
                    <td align="center">${resultList?.middleTotal?.studentEnrolledBoys}</td>
                    <td align="center">${resultList?.middleTotal?.studentEnrolledGirls}</td>
                    <td align="center">${resultList?.middleTotal?.studentAttendingBoys}</td>
                    <td align="center">${resultList?.middleTotal?.studentAttendingGirls}</td>
                    <td align="center">${resultList?.middleTotal?.newEntrantsBoys}</td>
                    <td align="center">${resultList?.middleTotal?.newEntrantsGirls}</td>
                    <td align="center">${resultList?.middleTotal?.studentDiscontinuedStudiesBoys}</td>
                    <td align="center">${resultList?.middleTotal?.studentDiscontinuedStudiesGirls}</td>
                    <td align="center">${resultList?.middleTotal?.reasonOfDiscontinuationEconomic}</td>
                    <td align="center">${resultList?.middleTotal?.reasonOfDiscontinuationNonEconomic}</td>
                    <td align="center">${resultList?.middleTotal?.noOfTeacherMale}</td>
                    <td align="center">${resultList?.middleTotal?.noOfTeacherFemale}</td>
                </tr>
            </g:each>

            </tbody>
        </table>

    <g:each in="${finalList.list}" var="resultList" status="i">
        <g:if test="${finalList?.type=='State'}">
            <g:form controller="report" action="renderingReports" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='District'}">
            <g:form controller="report" action="renderingReports" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Block'}">
            <g:form controller="report" action="renderingReports" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Panchayat'}">
            <g:form controller="report" action="renderingReports" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'3']" >
                <input type="submit" value="Previous"  style="float:left" class="buttonClass"  id="prevButton${i}">
            </g:form>
        </g:if>
    </g:each>
    <g:each in="${finalList.list}" var="resultList" status="i">
        <g:if test="${finalList?.type=='State'}">
            <g:form controller="report" action="reportNextInfra" params="[stateCode:resultList?.village?.gramPanchayat?.block?.district?.state?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'5']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='District'}">
            <g:form controller="report" action="reportNextInfra" params="[distCode:resultList?.village?.gramPanchayat?.block?.district?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'5']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Block'}">
            <g:form controller="report" action="reportNextInfra" params="[blockCode:resultList?.village?.gramPanchayat?.block?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'5']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
        <g:if test="${finalList?.type=='Panchayat'}">
            <g:form controller="report" action="reportNextInfra" params="[panchayatCode:resultList?.village?.gramPanchayat?.code,category:Categories.EDUCATION.value(), year:resultList?.year, month:resultList?.month,page:'5']" >
                <input type="submit" value="Next"  style="float:right" class="buttonClass"  id="button${i}">
            </g:form>
        </g:if>
    </g:each>



    <div align="center">
            <input type="button" id='chart' name="Pie" value=""
                   style="width: 30px;height: 30px; background-repeat: no-repeat; background-image:url(../images/temp/pie.jpg)"
                   onclick="displayEduPopUp('pie',4)"/>
            <input type="button" id='pie' name="Bar" value=""
                   style="width: 30px; height:30px;background-image:url(../images/temp/bar.jpg)"
                   onclick="displayEduPopUp('bar',4)"/>
        </div>


        <div id="Overlay">
            <div id="Outer">
                <div id="OvrMain">
                    <div style="height: 30px;background-color:#ccccff;">
                        <div style="float: left;font-weight: bold;" id="overLayHeader">Select one</div>
                        <div style="float: right;font-weight: bold;padding: 2px;cursor: pointer" onclick="hidePopUp();">X
                        </div>

                    </div>
                    <div id="graphHeader"></div>
                    <div id="graphicsDisplay"> </div>
                </div>

            </div>
        </div>

    </div>
</div>
</body>
</html>