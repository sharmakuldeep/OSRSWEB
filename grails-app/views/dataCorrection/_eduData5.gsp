<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
 
<div style="width: 1000px;display: none;" id="highSchool">
   <g:form action="updateEdu">
        <g:hiddenField name="eduId" value="${data?.id}"/>
        <g:hiddenField name="eduType" value="highSchool"/>
        <table>
            <CAPTION><div style="font-size: 15px">Education Page 5</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="22">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="3">Name of GP</th>
            <th rowspan="3">Name of Village</th>
            <th colspan="10">No. of Enrollment ,High School(IX-X)</th>
            <th rowspan="2" colspan="2">No of Teachers in HighSchool School</th>
            <th rowspan="3" >No of Children aged 6-14 yrs never enrolled in school</th>
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
                <th>Non-Economic</th>
                <th>Male</th><th>Female</th>
            </tr>
            <th>1</th>
            <th>2</th>
            <g:each var="i" in="${ (54..<67) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>
            <g:if test="${data?.edu8}">
                <g:each in="${(0..< data?.edu8)}" var="j">
                    <tr>
                        <td align="center">${data?.village?.gramPanchayat?.name}<g:hiddenField name="highSchoolId${j}" value="${data.highSchool.id[j]}"/></td>
                        <td align="center">${data?.village?.name}</td>
                        <td align="center">
                            <input type="text" class="text" name="studentEnrolledBoys${j}"
                                   value="${data.highSchool.studentEnrolledBoys[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentEnrolledGirls${j}"
                                   value="${data.highSchool.studentEnrolledGirls[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>

                        <td align="center">
                            <input type="text" class="text" name="studentAttendingBoys${j}"
                                   value="${data.highSchool.studentAttendingBoys[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentAttendingGirls${j}"
                                   value="${data.highSchool.studentAttendingGirls[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="newEntrantsBoys${j}" value="${data.highSchool.newEntrantsBoys[j]}"
                                   onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="newEntrantsGirls${j}" value="${data.highSchool.newEntrantsGirls[j]}"
                                    onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentDiscontinuedStudiesBoys${j}"
                                   value="${data.highSchool.studentDiscontinuedStudiesBoys[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentDiscontinuedStudiesGirls${j}"
                                   value="${data.highSchool.studentDiscontinuedStudiesGirls[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="reasonOfDiscontinuationEconomic${j}"
                                   value="${data.highSchool.reasonOfDiscontinuationEconomic[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="reasonOfDiscontinuationNonEconomic${j}"
                                   value="${data.highSchool.reasonOfDiscontinuationNonEconomic[j]}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfTeacherMale${j}" value="${data.highSchool.noOfTeacherMale[j]}"
                                   onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfTeacherFemale${j}" value="${data.highSchool.noOfTeacherFemale[j]}"
                                    onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noChildNeverEnrolled${j}" value="${data.highSchool.noChildNeverEnrolled[j]}"
                                   onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                    </tr>
                </g:each>
            </g:if>
            </tbody>
        </table>

       <div style="margin-left: 5px;margin-top: 20px">
           <div style="float: left;">
               <input type="button" value="Previous" onclick="display('middle')">
           </div>
           <div style="float: right;">
               <input type="button" value="Next" onclick="display('seniorSecSchool')">
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