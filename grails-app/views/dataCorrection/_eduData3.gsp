<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 1:11 PM
  To change this template use File | Settings | File Templates.
--%>
<style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
  
<div style="width: 1000px;display: none;" id="primary">
   <g:form action="updateEdu">
        <g:hiddenField name="eduId" value="${data?.id}"/>
        <g:hiddenField name="eduType" value="Primary"/>
        <table>
            <CAPTION><div style="font-size: 15px">Education Page 3</div></CAPTION>
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
            <th colspan="10">No. of Enrollment ,Primary(I-V)</th>
            <th rowspan="2" colspan="2">No of Teachers in Primary School</th>
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
            <g:each var="i" in="${ (30..<42) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>
            <g:if test="${data?.edu6}">
                <g:each in="${(0..< data?.edu6)}" var="j">

                    <tr>

                        <td align="center">${data?.village?.gramPanchayat?.name}<g:hiddenField name="primaryId${j}" value="${data.primary.id[j]}"/></td>
                        <td align="center">${data?.village?.name}</td>
                        <td align="center">
                            <input type="text" class="text" name="studentEnrolledBoys${j}" value="${data.primary.studentEnrolledBoys[j]?:null}"  onkeypress="validateIsNumber(event)"
                                    style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentEnrolledGirls${j}" value="${data.primary.studentEnrolledGirls[j]?:null}" onkeypress="validateIsNumber(event)"
                                    style="width: 40px">
                        </td>

                        <td align="center">
                            <input type="text" class="text" name="studentAttendingBoys${j}" value="${data.primary.studentAttendingBoys[j]?:null}" onkeypress="validateIsNumber(event)"
                                    style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentAttendingGirls${j}"   onkeypress="validateIsNumber(event)"
                                   value="${data.primary.studentAttendingGirls[j]?:null}" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="newEntrantsBoys${j}" value="${data.primary.newEntrantsBoys[j]?:null}"
                                   onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="newEntrantsGirls${j}" value="${data.primary.newEntrantsGirls[j]?:null}"
                                   onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentDiscontinuedStudiesBoys${j}"value="${data.primary.studentDiscontinuedStudiesBoys[j]?:null}"
                                    onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="studentDiscontinuedStudiesGirls${j}"
                                   value="${data.primary.studentDiscontinuedStudiesGirls[j]?:null}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="reasonOfDiscontinuationEconomic${j}"
                                   value="${data.primary.reasonOfDiscontinuationEconomic[j]?:null}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="reasonOfDiscontinuationNonEconomic${j}"
                                   value="${data.primary.reasonOfDiscontinuationNonEconomic[j]?:null}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfTeacherMale${j}" value="${data.primary.noOfTeacherMale[j]?:null}"
                                   onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfTeacherFemale${j}" value="${data.primary.noOfTeacherFemale[j]?:null}"
                                   onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                    </tr>
                </g:each>
            </g:if>
            </tbody>
        </table>

       <div style="margin-left: 5px;margin-top: 20px">
           <div style="float: left;">
               <input type="button" value="Previous" onclick="display('prePrimary')">
           </div>
           <div style="float: right;">
               <input type="button" value="Next" onclick="display('middle')">
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