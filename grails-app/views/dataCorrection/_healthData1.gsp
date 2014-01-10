<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 5:40 PM
  To change this template use File | Settings | File Templates.
--%>
   <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;" id="health1">
    <g:form action="updateHealth">
        <g:hiddenField name="healthDataId" value="${data?.id}"/>
        <g:hiddenField name="hospitalType1" value="govtHospital"/>
        <g:hiddenField name="hospitalType2" value="govtDispensaries"/>
        <g:hiddenField name="hospitalType3" value="primaryHealthCenters"/>
        <table align="center" >
            <CAPTION><div style="font-size: 15px;font-weight: bold">HEALTH AND FAMILY WELFARE Page 1</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="17">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="3">Name of GP</th>
            <th rowspan="3">Name of Village</th>
            <th colspan="5">(1) Govt. Hospitals</th>
            <th colspan="5">(2) Govt. Dispensaries</th>
            <th colspan="5">(3) Primary Health Centers</th>
            %{--<th colspan="5">(4) Sub-Centers</th>--}%
            <tr>
                <th rowspan="2" class="box_rotate" width="20px">Doctors(No.)</th>
                <th rowspan="2" class="box_rotate">Nurses(No.)</th>
                <th rowspan="2" class="box_rotate">Beds(No.)</th>
                <th colspan="2">Cases treated</th>
                <th rowspan="2" class="box_rotate">Doctors(No.)</th>
                <th rowspan="2" class="box_rotate">Nurses(No.)</th>
                <th rowspan="2" class="box_rotate">Beds(No.)</th>
                <th colspan="2">Cases treated</th>
                <th rowspan="2" class="box_rotate">Doctors(No.)</th>
                <th rowspan="2" class="box_rotate">Nurses(No.)</th>
                <th rowspan="2" class="box_rotate">Beds(No.)</th>
                <th colspan="2">Cases treated</th>
                %{--<th rowspan="2" class="box_rotate">Doctors(No.)</th>
                <th rowspan="2" class="box_rotate">Nurses(No.)</th>
                <th rowspan="2" class="box_rotate">Beds(No.)</th>
                <th colspan="2">Cases treated</th>--}%
            </tr>
            <tr>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
                %{-- <th>Males(No.)</th>
                <th>Females(No.)</th>--}%

            </tr>
            </thead>
            <thead>
            <g:each var="i" in="${ (1..<18) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>
            <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>
                <td align="center"><input type="text" class="text" name="govHospitals.noOfDoctors" value="${data?.govHospitals?.noOfDoctors}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govHospitals.noOfNurses" value="${data?.govHospitals?.noOfNurses}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govHospitals.noOfBeds" value="${data?.govHospitals?.noOfBeds}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govHospitals.noOfMaleCasesTreated"
                            onkeypress="validateIsNumber(event)" value="${data?.govHospitals?.noOfMaleCasesTreated}" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govHospitals.noOfFemaleCasesTreated"
                            onkeypress="validateIsNumber(event)" value="${data?.govHospitals?.noOfFemaleCasesTreated}" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govDispensaries.noOfDoctors" value="${data?.govDispensaries?.noOfDoctors}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govDispensaries.noOfNurses" value="${data?.govDispensaries?.noOfNurses}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govDispensaries.noOfBeds" value="${data?.govDispensaries?.noOfBeds}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govDispensaries.noOfMaleCasesTreated"
                            onkeypress="validateIsNumber(event)" value="${data?.govDispensaries?.noOfMaleCasesTreated}" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="govDispensaries.noOfFemaleCasesTreated"
                           value="${data?.govDispensaries?.noOfFemaleCasesTreated}" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="primHealthCenter.noOfDoctors"
                            onkeypress="validateIsNumber(event)" value="${data?.primHealthCenter?.noOfDoctors}" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="primHealthCenter.noOfNurses" value="${data?.primHealthCenter?.noOfNurses}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="primHealthCenter.noOfBeds" value="${data?.primHealthCenter?.noOfBeds}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="primHealthCenter.noOfMaleCasesTreated"
                            onkeypress="validateIsNumber(event)" value="${data?.primHealthCenter?.noOfMaleCasesTreated}" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="primHealthCenter.noOfFemaleCasesTreated"
                            onkeypress="validateIsNumber(event)" value="${data?.primHealthCenter?.noOfFemaleCasesTreated}" style="width: 40px"></td>

            </tr>

            </tbody>
        </table>


        <div style="margin-left: 290px;margin-top: 20px">
            <div style="float: right;">
                <input type="button" value="Next" class="buttonClass" onclick="display('health2')">
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