<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
 <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;display: none;" id="college">
    <g:form action="updateEdu">
        <g:hiddenField name="eduId" value="${data?.id}"/>
        <g:hiddenField name="eduType" value="college"/>
        <table>
            <CAPTION><div style="font-size: 15px">Education Page 7</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="21">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="3">Name of GP</th>
            <th rowspan="3">Name of Village</th>
            <th colspan="10">No. of Enrollment ,College(Degree level)</th>
            <th rowspan="2" colspan="2">No of Students Enrolled in University course</th>
            %{--<th rowspan="3">No of Children aged 6-14 yrs,never enrolled in school</th>--}%
            <tr>

                <th colspan="2">No of Students Enrolled</th>
                <th colspan="2">No of Students Attending School</th>
                <th colspan="2">No of New Entrants/Fresh Entry</th>
                <th colspan="2">No of Students Discontinued Studies</th>
                <th colspan="2">Reasons for Discontinuation of studies</th>
            <tr>
                <th>Boys</th> <th>Girls</th>
                <th>Boys</th> <th>Girls</th>
                <th>Boys</th> <th>Girls</th>
                <th>Boys</th> <th>Girls</th>
                <th>Economic</th>
                <th>Others</th>
                <th>Boys</th><th>Girls</th>
            </tr>
            <th>1</th>
            <th>2</th>
            <g:each var="i" in="${ (79..<91) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>

            <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentEnrolledBoys"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentEnrolledBoys}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentEnrolledGirls"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentEnrolledGirls}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>

                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentAttendingBoys"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentAttendingBoys}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentAttendingGirls"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentAttendingGirls}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfNewEntrantsEntryBoys"
                           value="${data?.noOfEnrolmentInCollege?.noOfNewEntrantsEntryBoys}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfNewEntrantsEntryGirls"
                           value="${data?.noOfEnrolmentInCollege?.noOfNewEntrantsEntryGirls}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentDiscontinuedStudiesBoys"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentDiscontinuedStudiesBoys}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentDiscontinuedStudiesGirls"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentDiscontinuedStudiesGirls}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.reasonOfDiscontinuationEconomic"
                           value="${data?.noOfEnrolmentInCollege?.reasonOfDiscontinuationEconomic}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.reasonOfDiscontinuationNonEconomic"
                           value="${data?.noOfEnrolmentInCollege?.reasonOfDiscontinuationNonEconomic}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentsEnrolledInUniversityBoys"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentsEnrolledInUniversityBoys}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
                <td align="center">
                    <input type="text" class="text" name="noOfEnrolmentInCollege.noOfStudentsEnrolledInUniversityGirls"
                           value="${data?.noOfEnrolmentInCollege?.noOfStudentsEnrolledInUniversityGirls}"
                            onkeypress="validateIsNumber(event)" style="width: 40px">
                </td>
            </tr>

            </tbody>
        </table>

        <div style="margin-left: 5px;margin-top: 20px">
            <div style="float: left;">
                <input type="button" value="Previous" onclick="display('seniorSecSchool')">
            </div>

            <div style="float: right;">
                <input type="button" value="Next" onclick="display('otherTechCourse')">
            </div>

        </div>

        <div style="margin-left: 250px;margin-top: 50px">
            <input type="submit" value="Update" style="width: 100px">
            <g:link action="main">
                <input type="button" value="Cancel" style="width: 100px">
            </g:link>
        </div>
    </g:form>
</div>