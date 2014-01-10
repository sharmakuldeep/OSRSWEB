<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/5/12
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
   <style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>
<div style="width: 1000px;display: none" id="isfData2">
    <g:form action="updateIsfDData">
        <g:hiddenField name="isfDataId" value="${data?.id}"/>
        <table>
            <CAPTION><div style="font-size: 15px;font-weight: bold">Infrastructural Facilities Page 2</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="10">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="3">Name of GP</th>
            <th rowspan="3">Name of Village</th>
            <th rowspan="3">Cottage & village Industry/ Name of industry</th>
            <th colspan="2">Sericulture & weaving</th>
            <th colspan="2">Co-operation of Societies</th>

            <tr>
                <th>Handlooms</th>
                <th>Powerlooms</th>
                <th>Agricultural society</th>
                <th>Marketing Society</th>
                <th>Farming Society</th>
                <th>Primary Co- operative credit Society</th>
                <th>P.D.S. Co- operative society</th>
            </tr>
            <tr>
                <th>Nos.</th>
                <th>Nos.</th>
                <th>Nos.</th>
                <th>Nos.</th>
                <th>Nos.</th>
                <th>Nos.</th>
                <th>Nos.</th>
            </tr>

            <tr>
                <th>1</th>
                <th>2</th>
                <g:each var="i" in="${ (17..<25) }">
                    <th>${i}</th>
                </g:each>

            </tr>
            </thead>

            <tbody>
            <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>


                <td align="center"><input type="text" class="text" name="isf17" value="${data?.isf17}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf18" value="${data?.isf18}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf19" value="${data?.isf19}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf20" value="${data?.isf20}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf21" value="${data?.isf21}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf22" value="${data?.isf22}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf23" value="${data?.isf23}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text" class="text" name="isf24" value="${data?.isf24}"
                            onkeypress="validateIsNumber(event)" style="width: 40px"></td>
            </tr>

            </tbody>
        </table>


        <div style="margin-left: 5px;margin-top: 20px">
            <div style="float: left">
                <input type="button" value="Previous" class="buttonClass" onclick="display('isfData1')">
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