<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:javascript library="prototype" />
    <script type="text/javascript">

    </script>
</head>
<body>
<h1>Generating Reports</h1>
<g:form action="renderingReports" >
    <div>
        <div style="float:left;padding:20px">State :&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;              Assam</div>  <br><br><br>


        <div style="float: left; padding: 20px" >Select Month  </div>
        <div style="float: left; padding: 20px" id="month">
            <select name="month">
                <option value="1">January</option>
                <option value="2">February</option>
                <option value="3">March</option>
                <option value="4">April</option>
                <option value="5">May</option>
                <option value="6">June</option>
                <option value="7">July</option>
                <option value="8">August</option>
                <option value="9">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
            </select>
        </div>  <br><br><br>
        <div>
            <div style="float: left; padding: 20px" >Select Year  </div>
            <div style="float: left; padding: 20px" id="year">
                <g:select name="year" from="${1990..2020}" value="${age}"  />
            </div>
        </div><br><br><br>
        <div>
            <div style="float: left; padding: 20px" >Select Category  </div>
            <div style="float: left; padding: 20px" id="category">
                <select name="category">
                    <option value="edu">Education</option>
                    <option value="health">Health And Family Welfare</option>
                    <option value="isf">Infrastructural Facilities</option>
                </select>
            </div>
        </div><br><br><br>
    </div>
    <input name="Submit input" type="submit" value="Submit this Info" />
</g:form>
</body>
</html>