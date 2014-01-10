
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
        <th rowspan="5">Name of GP</th>
        <th rowspan="5">Name of Village</th>

        <th colspan="18">Vital Statistics</th>
        <tr>
            <th colspan="2">Birth</th>
            <th colspan="6">Death</th>
            <th colspan="6">Death</th>
            <th colspan="4">Maternal Mortality</th>




            <tr>

                    <th rowspan="2"> Male</th><th rowspan="2"> Female</th>
                    <th colspan="6">Male</th>
                    <th colspan="6">Female</th>
                    <th rowspan="2"> Post Delivery Death</th><th rowspan="2"> 0 To 7 Days</th><th rowspan="2">8 To 30 Days</th><th rowspan="2">31 To 42 Days</th>


            </tr>



        <tr>


            <th colspan="1"> Still Birth</th><th colspan="1"> Less Than 1 Year</th><th colspan="1"> 1 To 4 Year</th><th colspan="1"> 5 To 14 year</th><th colspan="1"> 15 To 59 Year</th><th colspan="1"> 60 And Above</th>

            <th colspan="1"> Still Birth</th><th colspan="1"> Less Than 1 Year</th><th colspan="1"> 1 To 4 Year</th><th colspan="1"> 5 To 14 year</th><th colspan="1"> 15 To 59 Year</th><th colspan="1"> 60 And Above</th>


        </tr>


                     <tr>
                         <th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th><th> No.</th>



                     </tr>









        </tr>














        </thead>
        <thead>
        <th>1</th>
        <th>2</th>
        <th>41</th>
        <th>42</th>
        <th>43</th>
        <th>44</th>
        <th>45</th>
        <th>46</th>
        <th>47</th>
        <th>48</th>
        <th>49</th>
        <th>50</th>
        <th>51</th>
        <th>52</th>
        <th>53</th>
        <th>54</th>
        <th>55</th>
        <th>56</th>
        <th>57</th>
        <th>58</th>

        </thead>
        <tbody>
        %{--<tr>--}%
        %{--<td>kitampur</td>--}%
        %{--<td>sdfhsgfjhs</td>--}%
        %{--<td><input type="text" name="a" value="${data.health39}" style="width: 40px"></td>--}%



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
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>


            </tr>
        %{--<button>Previous</button>--}%
        %{--<button>NEXT</button>--}%
        %{--<div>--}%
            %{--<button style="float:left;">PREVIOUS</button>--}%
            %{--<button style="float:right;">NEXT</button>--}%
        %{--</div>--}%
        <g:link action="HealthAndFamilyWelfare03" controller="report" params="${category}" style="float:right" target="_blank">Next</g:link>
        <g:link action="HealthAndFamilyWelfare01" controller="report" params="${category}" target="_blank">PREVIOUS</g:link>
        </tbody>
    </table>

    %{--<div>--}%
        %{--<button style="float:left;">PREVIOUS</button>--}%
        %{--<button style="float:right;">NEXT</button>--}%
    %{--</div>--}%
    <g:link action="HealthAndFamilyWelfare03" controller="report" params="${category}" style="float:right" target="_blank">Next</g:link>
    <g:link action="HealthAndFamilyWelfare01" controller="report" params="${category}" target="_blank">PREVIOUS</g:link>

</div>
</body>
</html>