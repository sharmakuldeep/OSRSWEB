<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 6:30 PM
  To change this template use File | Settings | File Templates.
--%>
      <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;display: none" id="health3">
    <g:form action="updateHealth">
        <g:hiddenField name="healthDataId" value="${data?.id}"/>
        <g:hiddenField name="hospitalType" value="familyWelCenter"/>
        <table>
            <CAPTION><div style="font-size: 15px;font-weight: bold">HEALTH AND FAMILY WELFARE Page 3</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="15">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="3">Name of GP</th>
            <th rowspan="3">Name of Village</th>
            <th colspan="5">(6) Family Welfare Centers</th>
            <th colspan="3">(7) Ayurvedic Centers </th>
            <th colspan="3">(8) Homeopathic Centers </th>
            <th colspan="2">(9) Others </th>
            <tr>
                <th rowspan="2" class="box_rotate" width="20px">Doctors(No.)</th>
                <th rowspan="2" class="box_rotate">Nurses(No.)</th>
                <th rowspan="2" class="box_rotate">Beds(No.)</th>
                <th colspan="2">Cases treated</th>
                <th rowspan="2" class="box_rotate">Doctors(No.)</th>
                <th colspan="2">Cases treated</th>
                <th rowspan="2" class="box_rotate">Doctors(No.)</th>
                <th colspan="2">Cases treated</th>
                <th class="box_rotate"  rowspan="2">BedsForWomen (No.)</th>
                <th class="box_rotate"  rowspan="2">ASHA-Workers (No.)</th>
            </tr>
            <tr>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
                <th>Males(No.)</th>
                <th>Females(No.)</th>
            </tr>
            </thead>
            <thead>
            <th>1</th>
            <th>2</th>
            <g:each var="i" in="${ (28..<41) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>
            <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>
                <td align="center"><input type="text" class="text" name="familyWelCenter.noOfDoctors" value="${data?.familyWelCenter?.noOfDoctors}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="familyWelCenter.noOfNurses" value="${data?.familyWelCenter?.noOfNurses}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="familyWelCenter.noOfBeds" value="${data?.familyWelCenter?.noOfBeds}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="familyWelCenter.noOfMaleCasesTreated" value="${data?.familyWelCenter?.noOfMaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="familyWelCenter.noOfFemaleCasesTreated" value="${data?.familyWelCenter?.noOfFemaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="ayurCenter.noOfDoctors" value="${data?.ayurCenter?.noOfDoctors}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="ayurCenter.noOfMaleCasesTreated" value="${data?.ayurCenter?.noOfMaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="ayurCenter.noOfFemaleCasesTreated" value="${data?.ayurCenter?.noOfFemaleCasesTreated}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="homeoCells.noOfDoctors" value="${data?.homeoCells?.noOfDoctors}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="homeoCells.noOfMaleCasesTreated" value="${data?.homeoCells?.noOfMaleCasesTreated}" onkeypress="validateIsNumber(event)"  style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="homeoCells.noOfFemaleCasesTreated" value="${data?.homeoCells?.noOfFemaleCasesTreated}" onkeypress="validateIsNumber(event)"  style="width: 40px"></td>

                <td align="center"><input type="text" class="text" name="health39" value="${data?.health39}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health40" value="${data?.health40}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>

            </tr>


            </tbody>
        </table>


        <div style="margin-left:5px;margin-top: 20px">
            <div style="float: left;">
                <input type="button" value="Previous" class="buttonClass" onclick="display('health2')">
            </div>
            <div style="float: right;">
                <input type="button" value="Next" class="buttonClass" onclick="display('health4')">
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