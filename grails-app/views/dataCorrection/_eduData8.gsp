<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
  <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;display: none;" id="otherTechCourse">
   <g:form action="updateEdu">
        <g:hiddenField name="eduId" value="${data?.id}"/>
        <g:hiddenField name="eduType" value="noOfEnrolmentInOtherTechCourse"/>
        <table>
            <CAPTION><div style="font-size: 15px">Education Page 8</div></CAPTION>
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
            <th colspan="14">No. of Enrollment ,Other Technical course(Degree/Diploma level)</th>
            %{--<th rowspan="3">No of Children aged 6-14 yrs,never enrolled in school</th>--}%
            <tr>

                <th colspan="2">No of Students Enrolled BE/B tech</th>
                <th colspan="2">No of Students Enrolled MBBS</th>
                <th colspan="2">No of Students Enrolled BVSC</th>
                <th colspan="2">No of Students Enrolled agri MSc</th>
                <th colspan="2">No of Students Enrolled polytech Diploma</th>
                <th colspan="2">No of Students Enrolled ITI</th>
                <th colspan="2">No of Students Enrolled Vocational course</th>
            <tr>
                <th>Boys</th> <th>Girls</th>
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
            <g:each var="i" in="${ (91..<105) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>
                    <tr>
                        <td align="center">${data?.village?.gramPanchayat?.name}</td>
                        <td align="center">${data?.village?.name}</td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBeBtechBoys"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechBoys}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBeBtechGirls"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBeBtechGirls}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>

                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInMbbsBoys"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsBoys}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInMbbsGirls"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInMbbsGirls}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBvscBoys"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscBoys}"   onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInBvscGirls"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInBvscGirls}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInAgriMscBoys"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscBoys}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInAgriMscGirls"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInAgriMscGirls}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInPolytechDeplomaBoys"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaBoys}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInPolytechDeplomaGirls"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInPolytechDeplomaGirls}"  onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInITIBoys"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIBoys}"    onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInITIGirls"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInITIGirls}"   onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInVocationalCourseBoys"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseBoys}"    onkeypress="validateIsNumber(event)" style="width: 40px">
                        </td>
                        <td align="center">
                            <input type="text" class="text" name="noOfEnrolmentInOtherTechCourse.noOfStudentEnrolledInVocationalCourseGirls"
                                   value="${data?.noOfEnrolmentInOtherTechCourse?.noOfStudentEnrolledInVocationalCourseGirls}"  onkeypress="validateIsNumber(event)"  style="width: 40px">
                        </td>
                    </tr>

            </tbody>
        </table>

       <div style="margin-left: 5px;margin-top: 20px">
           <div style="float: left;">
               <input type="button" value="Previous" onclick="display('seniorSecSchool')">
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