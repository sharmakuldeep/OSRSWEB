
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
        <CAPTION><div style="font-size: 15px">HEALTH AND FAMILY WELFARE</div></CAPTION>
        <thead>
        <th rowspan="3">Name of GP</th>
        <th rowspan="3">Name of Village</th>

        <th colspan="2">Nurses (No.)</th>
        <th colspan="5">Family Welfare Programme</th>
        <th colspan="6">Performance Of Immunization Programme</th>

        %{--<th colspan="3">Ayurvedic Centres</th>--}%
        %{--<th colspan="3">Homeopathic Cells</th>--}%

        %{--<th colspan="2">Others</th>--}%


        <tr>

            <th rowspan="2">GNM </th>
            <th rowspan="2">ANM </th>


            <th colspan="2">Sterilisation Operation (No.)</th>

            <th>IUD</th>
            <th>C.C Users </th>
            <th >OP Users </th>

            <th colspan="5">Infant (No.)</th>

            <th>Pregnant Women (No.)</th>




        <tr>
            <th> Men</th><th> Women</th>
            <th>(No.)</th>
            <th>(No.)</th>
            <th>(No.)</th>
            <th> BCG</th><th> DPT-3</th><th> OPV-3</th><th> Measles</th><th> Hepatities-B</th>
            <th>T.T.(PW)</th>


        </tr>






        </thead>
        <thead>
        <th>1</th>
        <th>2</th>
        <th>59</th>
        <th>60</th>
        <th>61</th>
        <th>62</th>
        <th>63</th>
        <th>64</th>
        <th>65</th>
        <th>66</th>
        <th>67</th>
        <th>68</th>
        <th>69</th>
        <th>70</th>
        <th>71</th>


        </thead>
        <tbody>

        %{--<tr>--}%
        %{--<td>kitampur</td>--}%
        %{--<td>sdfhsgfjhs</td>--}%
        %{--<td><input type="text" name="a" value="${data.health39}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health40}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health41}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health42}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health43}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health44}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health45}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health46}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health47}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health48}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health49}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health50}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health51}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health52}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health53}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health54}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health55}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health56}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health57}" style="width: 40px"></td>--}%
        %{--<td><input type="text" name="a" value="${data.health58}" style="width: 40px"></td>--}%





        %{--</tr>--}%

        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>



        </tr>

        %{--<button>Previous</button>--}%
        %{--<div>--}%
            %{--<button style="float:left;">PREVIOUS</button>--}%
            %{--<button style="float:right;">NEXT</button>--}%
        %{--</div>--}%
        <g:link action="HealthAndFamilyWelfare02" controller="report" params="${category}" target="_blank">PREVIOUS</g:link>

        </tbody>
    </table>
    <div>
        %{--<button style="float:left;">PREVIOUS</button>--}%
        %{--<button style="float:right;">NEXT</button>--}%
        <g:link action="HealthAndFamilyWelfare02" controller="report" params="${category}" target="_blank">PREVIOUS</g:link>
    </div>
</div>
</body>
</html>