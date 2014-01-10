<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/5/12
  Time: 12:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/5/12
  Time: 11:04 AM
  To change this template use File | Settings | File Templates.
--%>
 <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;display: none" id="health5">
    <g:form action="updateHealth">
        <g:hiddenField name="healthDataId" value="${data?.id}"/>
        <table>
            <CAPTION><div style="font-size: 15px;font-weight: bold">HEALTH AND FAMILY WELFARE Page 5</div></CAPTION>
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
            <th rowspan="2" colspan="2">Nurses (No.)</th>
            <th colspan="5">Family Welfare Programme</th>
            <th colspan="6">Performance of immunization Programme</th>

            <tr>
                <th colspan="2">Sterilisation operation (No.)</th>
                <th>IUD</th>
                <th>C.C Users</th>
                <th>OP Users</th>
                <th colspan="5">Infant (No.)</th>
                <th>Pregnant Women (No.)</th>
            </tr>
            <tr>
                <th>GNM</th>
                <th>ANM</th>
                <th>Men</th>
                <th>Women</th>
                <th>(No.)</th>
                <th>(No.)</th>
                <th>(No.)</th>
                <th>BCG</th>
                <th>DPT-3</th>
                <th>OPV-3</th>
                <th>Measles</th>
                <th>Hepatities-B</th>
                <th>T.T.(PW)</th>
            </tr>
            <tr>
                <th>1</th>
                <th>2</th>
                <g:each var="i" in="${ (59..<72) }">
                    <th>${i}</th>
                </g:each>
            </tr>
            </thead>

            <tbody>
           <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>
                <td align="center"><input type="text" class="text" name="health59" value="${data?.health59}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health60" value="${data?.health60}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health61" value="${data?.health61}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health62" value="${data?.health62}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health63" value="${data?.health63}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health64" value="${data?.health64}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health65" value="${data?.health65}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health66" value="${data?.health66}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health67" value="${data?.health67}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health68" value="${data?.health68}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health69" value="${data?.health69}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health70" value="${data?.health70}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="health71" value="${data?.health71}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>

            </tr>


            </tbody>
        </table>


        <div style="margin-left:5px;margin-top: 20px">
            <div style="float: left;">
                <input type="button" value="Previous" class="buttonClass" onclick="display('health4')">
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