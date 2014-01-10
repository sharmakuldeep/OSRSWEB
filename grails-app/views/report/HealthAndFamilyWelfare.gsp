
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <style type="text/css">
    table {
        border-collapse: collapse;
        width:100%;
    }

    table, td, th,tr {
        border: 1px solid black;
    }

    th {
        height: 50px;
        width: 50px
    }
    </style>
</head>
<body>
<div style="width: 1000px">

    <table>
        <CAPTION><div style="font-size: 15px">HEALTH AND FAMILY WELFARE </div></CAPTION>
        <thead>
        <th rowspan="3">Name of GP</th>
        <th rowspan="3">Name of Village</th>

        <th colspan="5">(1) Govt. Hospitals</th>
        <th colspan="5">(2) Govt. Dispensaries</th>

        <th colspan="5">(3) Primary Health Centres</th>
        <th colspan="5">(4) Sub-Centres</th>


        <tr>

            <th rowspan="2">Doctors (No.)</th>
            <th rowspan="2">Nurses (No.)</th>
            <th rowspan="2">Beds (No.)</th>

            <th colspan="2">Cases Treated</th>
            <th rowspan="2">Doctors (No.)</th>
            <th rowspan="2">Nurses (No.)</th>
            <th rowspan="2">Beds (No.)</th>
            <th colspan="2">Cases Treated</th>
            <th rowspan="2">Doctors (No.)</th>
            <th rowspan="2">Nurses (No.)</th>
            <th rowspan="2">Beds (No.)</th>
            <th colspan="2">Cases Treated</th>
            <th rowspan="2">Doctors (No.)</th>
            <th rowspan="2">Nurses (No.)</th>
            <th rowspan="2">Beds (No.)</th>
            <th colspan="2">Cases Treated</th>

            <tr>
            <th>
                Male (No.)</th><th> Female (No.)
            </th>
                <th>
                    Male (No.)</th><th> Female (No.)
            </th>
            <th>
                Male (No.)</th><th> Female (No.)
            </th>

            <th>
                Male (No.)</th><th> Female (No.)
            </th>
        </tr>










        </thead>
        <thead>
        <th>1</th>
        <th>2</th>
        <th>3</th>
        <th>4</th>
        <th>5</th>
        <th>6</th>
        <th>7</th>
        <th>8</th>
        <th>9</th>
        <th>10</th>
        <th>11</th>
        <th>12</th>
        <th>13</th>
        <th>14</th>
        <th>15</th>
        <th>16</th>
        <th>17</th>
        <th>18</th>
        <th>19</th>
        <th>20</th>
        <th>21</th>
        <th>22</th>
        </thead>

        <tbody>

        <g:each in="${finalList}" var="fin" status="i">
            <tr>
                <td>${fin[0]}</td>
                %{--<g:if test ="${block1}">--}%
                    %{--<td><g:link action="villageLevelReport" controller="report" target="blank" params="[id:fin[16],month:fin[17],year:fin[18]]"> ${fin[1]} </g:link> </td>--}%
                %{--</g:if>--}%
                %{--<g:elseif test="${village1}">--}%
                    %{--<td><g:link action="villageLevelReport" controller="report" target="blank" params="[id:fin[16],month:fin[17],year:fin[18]]"> ${fin[1]} </g:link> </td>--}%
                %{--</g:elseif>--}%
                %{--<g:else>--}%
                    <td><g:link action="blockLevelReport" controller="report" target="blank" params="[id:fin[7],month1:fin[8],year1:fin[9]]"> ${fin[1]} </g:link></td>
                %{--<td><g:link action="blockLevelReport" controller="report" target="blank" params="[id:fin[9]]"> ${fin[1]} </g:link></td>--}%
                <td align="center">${fin[2]}</td>
                <td align="center">${fin[3]}</td>
                <td align="center">${fin[4]}</td>
                <td align="center">${fin[5]}</td>
                <td align="center">${fin[6]}</td>
                <td align="center">${fin[7]}</td>
                <td align="center">${fin[8]}</td>
                <td align="center">${fin[9]}</td>
                <td align="center">${fin[10]}</td>
                <td align="center">${fin[11]}</td>
                <td align="center">${fin[12]}</td>
                <td align="center">${fin[13]}</td>
                <td align="center">${fin[14]}</td>
                <td align="center">${fin[15]}</td>
                <td align="center">${fin[16]}</td>
                <td align="center">${fin[17]}</td>
                <td align="center">${fin[18]}</td>
                <td align="center">${fin[19]}</td>
                <td align="center">${fin[20]}</td>
                <td align="center">${fin[21]}</td>

                %{--<td align="center">${fin[11]}</td>--}%
                %{--<td align="center">${fin[12]}</td>--}%
                %{--<td align="center">${fin[13]}</td>--}%
                %{--<td align="center">${fin[14]}</td>--}%
                %{--<td align="center">${fin[15]}</td>--}%

            </tr>
        </g:each>
        %{--</tr>--}%
        %{--<tr>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
            %{--<td>&nbsp;</td>--}%
        %{--</tr>--}%


        %{--<div>--}%

            %{--<button style="float:right;">NEXT</button>--}%
        %{--</div>--}%
        <g:link action="HealthAndFamilyWelfare01" controller="report" params="${category}" style="float:right" target="_blank">Next</g:link>

        </tbody>

    </table>

    <g:link action="HealthAndFamilyWelfare01" controller="report" params="${category}" style="float:right" target="_blank">Next</g:link>

</div>

</body>

</html>