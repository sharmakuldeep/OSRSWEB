<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/5/12
  Time: 2:26 PM
  To change this template use File | Settings | File Templates.
--%>
 <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;" id="isfData1">
    <g:form action="updateIsfDData">
        <g:hiddenField name="isfDataId" value="${data?.id}"/>
        <table>
            <CAPTION><div style="font-size: 15px;font-weight: bold">Infrastructural Facilities Page 1</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="16">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="3">Name of GP</th>
            <th rowspan="3">Name of Village</th>
            <th colspan="14">Distance (in K.M.) to the nearest</th>

            <tr>
                <th rowspan="2">Human Hospital / Dispensary/ PHC etc.</th>
                <th rowspan="2">Veterinary Hospital/ Dispensary</th>
                <th colspan="3">Motorable Road</th>
                <th rowspan="2">Bus Stop</th>
                <th rowspan="2">Post Office</th>
                <th rowspan="2">Railway Station</th>
                <th rowspan="2">Police Station</th>
                <th rowspan="2">Hat/ Bazar</th>
                <th rowspan="2">Name of the day/days of hat/Bazar</th>
                <th colspan="3">Bank</th>
            </tr>
            <tr>
                <th>Pucca Road</th>
                <th>Semipucca Road</th>
                <th>Katcha Road</th>
                <th>Schedule Bank</th>
                <th>Regional Rural Bank</th>
                <th>Co -operative Bank</th>
            </tr>
            <tr>
                <g:each var="i" in="${ (1..<17) }">
                    <th>${i}</th>
                </g:each>

            </tr>
            </thead>

            <tbody>
            <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>

                <td align="center"><input type="text" class="text" name="isf3" value="${data?.isf3}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf4" value="${data?.isf4}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf5" value="${data?.isf5}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf6" value="${data?.isf6}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf7" value="${data?.isf7}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf8" value="${data?.isf8}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf9" value="${data?.isf9}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf10" value="${data?.isf10}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf11" value="${data?.isf11}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf12" value="${data?.isf12}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf13" value="${data?.isf13}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf14" value="${data?.isf14}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf15" value="${data?.isf15}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf16" value="${data?.isf16}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
            </tr>

            </tbody>
        </table>


        <div style="margin-left: 250px;margin-top: 20px">
            <div style="float: right;">
                <input type="button" value="Next" class="buttonClass" onclick="display('isfData2')">
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