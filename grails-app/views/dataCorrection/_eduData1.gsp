<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/4/12
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<style type="text/css">
    .text {
    width: 40px;
    text-align: center;
}
</style>

<div style="width: 1000px;" id="eduGen">
    <g:form action="updateEdu">
        <g:hiddenField name="eduId" value="${data?.id}"/>
        <table>
            <CAPTION><div style="font-size: 15px">Education Page 1</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="17">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                    %{--<div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.name}</div>--}%
                </td>
            </tr>
            <th rowspan="2">Name of GP</th>
            <th rowspan="2">Name of Village</th>
            <th rowspan="2">No. of Adult education center functioning</th>
            <th rowspan="2">No. of Adult educated</th>
            <th colspan="5">No of institution</th>
            <th colspan="8">Distance (in Km) to the Institution from the village</th>
            <tr>
                <th>Pre- primary school</th>
                <th>Primary school</th>
                <th>Middle school</th>
                <th>Secondary school</th>
                <th>Higher Secondary school</th>

                <th>College with degree course</th>
                <th>College with Master/Degree University</th>
                <th>Industrial Training Institute(ITI)</th>
                <th>Non formal education center</th>
                <th>Special school for Blind</th>
                <th>Special school for Mentally retarded</th>
                <th>Vocational training center/school</th>
                <th>Institution for rehabilitation of disable person</th>
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
                <td align="center"><input type="text"  class="text" name="edu3" value="${data?.edu3?:null}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu4" value="${data?.edu4}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu5" value="${data?.edu5}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu6" value="${data?.edu6}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu7" value="${data?.edu7}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu8" value="${data?.edu8}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu9" value="${data?.edu9}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu10" value="${data?.edu10}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu11" value="${data?.edu11}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu12" value="${data?.edu12}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu13" value="${data?.edu13}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu14" value="${data?.edu14}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu15" value="${data?.edu15}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text"  class="text" name="edu16" value="${data?.edu16}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
                <td align="center"><input type="text" class="text" name="edu17" value="${data?.edu17}" style="width: 40px" onkeypress="validateIsNumber(event)" ></td>
            </tr>

            </tbody>
        </table>


        <div style="margin-left: 250px;margin-top: 20px">
            <div style="float: right;">
                <input type="button" value="Next" onclick="display('prePrimary')">
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