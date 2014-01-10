<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
      <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;display: none" id="health2">
    <g:form action="updateHealth">
        <g:hiddenField name="healthDataId" value="${data?.id}"/>
        <g:hiddenField name="hospitalType" value="subCenter"/>

        <table>
            <CAPTION><div style="font-size: 15px;font-weight: bold">HEALTH AND FAMILY WELFARE Page 2</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="12">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="3">Name of GP</th>
            <th rowspan="3">Name of Village</th>
            <th colspan="5">4) Sub-Centers</th>
            <th colspan="5">(5) Community Health Centers</th>
            <tr>
                <th rowspan="2" class="box_rotate" width="20px">Doctors(No.)</th>
                <th rowspan="2" class="box_rotate">Nurses(No.)</th>
                <th rowspan="2" class="box_rotate">Beds(No.)</th>
                <th colspan="2">Cases treated</th>
                <th rowspan="2" class="box_rotate">Doctors(No.)</th>
                <th rowspan="2" class="box_rotate">Nurses(No.)</th>
                <th rowspan="2" class="box_rotate">Beds(No.)</th>
                <th colspan="2">Cases treated</th>
            </tr>
            <tr>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
            </tr>
            </thead>
            <thead>
             <th>1</th>
            <th>2</th>
            <g:each var="i" in="${ (18..<28) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>
            <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>
                <td align="center"><input type="text" class="text" name="subCenter.noOfDoctors" value="${data?.subCenter?.noOfDoctors}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="subCenter.noOfNurses" value="${data?.subCenter?.noOfNurses}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="subCenter.noOfBeds" value="${data?.subCenter?.noOfBeds}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="subCenter.noOfMaleCasesTreated" value="${data?.subCenter?.noOfMaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="subCenter.noOfFemaleCasesTreated" value="${data?.subCenter?.noOfFemaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="commHealthCenter.noOfDoctors" value="${data?.commHealthCenter?.noOfDoctors}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="commHealthCenter.noOfNurses" value="${data?.commHealthCenter?.noOfNurses}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="commHealthCenter.noOfBeds" value="${data?.commHealthCenter?.noOfBeds}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="commHealthCenter.noOfMaleCasesTreated" value="${data?.commHealthCenter?.noOfMaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="commHealthCenter.noOfFemaleCasesTreated" value="${data?.commHealthCenter?.noOfFemaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
            </tr>


            </tbody>
        </table>


        <div style="margin-left:5px;margin-top: 20px">
            <div style="float: left;">
                <input type="button" value="Previous" class="buttonClass" onclick="display('health1')">
            </div>
            <div style="float: right;">
                <input type="button" value="Next" class="buttonClass" onclick="display('health3')">
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