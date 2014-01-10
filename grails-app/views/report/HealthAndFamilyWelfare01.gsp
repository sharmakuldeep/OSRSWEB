
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

        <th colspan="5">(5) Community Health Centres</th>
        <th colspan="5">(6) Family Welfare Centres</th>

        <th colspan="3">(7) Ayurvedic Centres</th>
        <th colspan="3">(8) Homeopathic Cells</th>

        <th colspan="2">(9) Others</th>


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


            <th colspan="2">Cases Treated</th>

            <th rowspan="2">Doctors (No.)</th>


            <th colspan="2">Cases Treated</th>

            <th rowspan="2">Beds for Women (No.)</th>
            <th rowspan="2">ASHA Workers (No.)</th>

        <tr>
            <th> Male (No.)</th><th> Female (No.)</th>
            <th> Male (No.)</th><th> Female (No.)</th>
            <th> Male (No.)</th><th> Female (No.)</th>
            <th> Male (No.)</th><th> Female (No.)</th>
        </tr>



















        </thead>
        <thead>
        <th>1</th>
        <th>2</th>
        <th>23</th>
        <th>24</th>
        <th>25</th>
        <th>26</th>
        <th>27</th>
        <th>28</th>
        <th>29</th>
        <th>30</th>
        <th>31</th>
        <th>32</th>
        <th>33</th>
        <th>34</th>
        <th>35</th>
        <th>36</th>
        <th>37</th>
        <th>38</th>
        <th>39</th>
        <th>40</th>
        </thead>
        <tbody>

        <g:each in="${finalList}" var="fin" status="i">

        <tr>
            <td>${fin[0]}</td>

            <td><g:link action="blockLevelReport" controller="report" target="blank" params="[id:fin[7],month1:fin[8],year1:fin[9]]"> ${fin[1]} </g:link></td>
            %{--<td>kitampur</td>--}%
            %{--<td>sdfhsgfjhs</td>--}%
            %{--<td><input type="text" name="a" value="${data.health39}" style="width: 40px"></td>--}%

            <td align="center">${fin[23]}</td>
            <td align="center">${fin[24]}</td>
            <td align="center">${fin[25]}</td>
            <td align="center">${fin[26]}</td>
            <td align="center">${fin[27]}</td>
            <td align="center">${fin[28]}</td>
            <td align="center">${fin[29]}</td>
            <td align="center">${fin[30]}</td>
            <td align="center">${fin[31]}</td>
            <td align="center">${fin[32]}</td>
            <td align="center">${fin[33]}</td>
            <td align="center">${fin[34]}</td>
            <td align="center">${fin[35]}</td>
            <td align="center">${fin[36]}</td>
            <td align="center">${fin[37]}</td>
            <td align="center">${fin[38]}</td>
            <td align="center">${fin[39]}</td>
            <td align="center">${fin[40]}</td>
            <td align="center">${fin[41]}</td>
            <td align="center">${fin[42]}</td>



        </tr>
        </g:each>

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

        %{--</tr>--}%
        %{--<button>Previous</button>--}%
        %{--<button>NEXT</button>--}%

        %{--<div>--}%
            %{--<button style="float:left;">PREVIOUS</button>--}%
            %{--<button style="float:right;">NEXT</button>--}%
        %{--</div>--}%

        <g:link action="HealthAndFamilyWelfare02" controller="report" params="${category}" style="float:right" target="_blank">Next</g:link>
        <g:link action="HealthAndFamilyWelfare" controller="report" params="${category}" target="_blank">PREVIOUS</g:link>

        </tbody>
    </table>

    <g:link action="HealthAndFamilyWelfare02" controller="report" params="${category}" style="float:right" target="_blank">Next</g:link>
    <g:link action="HealthAndFamilyWelfare" controller="report" params="${category}" target="_blank">PREVIOUS</g:link>

</div>
</body>
</html>