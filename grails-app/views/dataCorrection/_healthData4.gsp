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
<div style="width: 1000px;display: none" id="health4">
    <g:form action="updateHealth">
        <g:hiddenField name="healthDataId" value="${data?.id}"/>
        <table>
            <CAPTION><div style="font-size: 15px;font-weight: bold">HEALTH AND FAMILY WELFARE Page 4</div></CAPTION>
            <thead>
            <tr bgcolor="#cccccc">
                <td colspan="20">
                    <div style="margin-left: 10px;float: left;width: 10%;">Year:${data?.year}</div>
                    <div style="float: left;width: 20%;">Month:${data?.month}</div>
                    <div style="float: left;width: 20%;">State:${data?.village?.gramPanchayat?.block?.district?.state?.name}</div>
                    <div style="float: left;width: 20%;">District:${data?.village?.gramPanchayat?.block?.district?.name}</div>
                    <div style="float: left;width: 20%;">Block:${data?.village?.gramPanchayat?.block?.name}</div>
                </td>
            </tr>
            <th rowspan="5">Name of GP</th>
            <th rowspan="5">Name of Village</th>
            <th colspan="18">Vital Statistics</th>

            <tr>
                <th colspan="2">Birth</th>
                <th colspan="6">Death</th>
                <th colspan="6">Death</th>
                <th colspan="4">Maternal Mortality</th>

            </tr>
            <tr>
                <th rowspan="2">Males</th>
                <th rowspan="2">Female</th>
                <th colspan="6">Males</th>
                <th colspan="6">Female</th>
                <th rowspan="2">Post Delivery death</th>
                <th rowspan="2">0 to 7 days</th>
                <th rowspan="2">8 to 30 days</th>
                <th rowspan="2">31 to 42 days</th>
            </tr>
            <tr>
                <th>Still birth</th>
                <th>Less then 1 year</th>
                <th>1 to 4 years</th>
                <th>5 to 14 year</th>
                <th>15 to 59 year</th>
                <th>60 and above</th>
                <th>Still birth</th>
                <th>Less then 1 year</th>
                <th>1 to 4 years</th>
                <th>5 to 14 year</th>
                <th>15 to 59 year</th>
                <th>60 and above</th>
            </tr>
            <tr>
                <g:each var="i" in="${ (41..<59) }">
                <th>No.</th>
            </g:each>
            </tr>
            </thead>
            <thead>
            <th>1</th>
            <th>2</th>
            <g:each var="i" in="${ (41..<59) }">
                <th>${i}</th>
            </g:each>

            </thead>
            <tbody>
           <tr>
                <td align="center">${data?.village?.gramPanchayat?.name}</td>
                <td align="center">${data?.village?.name}</td>
                <td align="center"><input type="text"  class="text" name="health41" value="${data?.health41}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health42" value="${data?.health42}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health43" value="${data?.health43}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health44" value="${data?.health44}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health45" value="${data?.health45}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health46" value="${data?.health46}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health47" value="${data?.health47}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health48" value="${data?.health48}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health49" value="${data?.health49}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health50" value="${data?.health50}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health51" value="${data?.health51}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health52" value="${data?.health52}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health53" value="${data?.health53}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health54" value="${data?.health54}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health55" value="${data?.health55}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health56" value="${data?.health56}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health57" value="${data?.health57}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>
                <td align="center"><input type="text"  class="text" name="health58" value="${data?.health58}"  onkeypress="validateIsNumber(event)" style="width: 40px"></td>

            </tr>


            </tbody>
        </table>


        <div style="margin-left:5px;margin-top: 20px">
            <div style="float: left;">
                <input type="button" value="Previous" class="buttonClass" onclick="display('health3')">
            </div>
            <div style="float: right;">
                <input type="button" value="Next" class="buttonClass" onclick="display('health5')">
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