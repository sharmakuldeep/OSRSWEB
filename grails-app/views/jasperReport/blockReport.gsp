<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 10/3/12
  Time: 5:50 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.osrs.Categories" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--<g:javascript library="prototype"/>--}%
    <script src="${resource(dir: 'js', file: 'dataCollection.js')}"/>
    %{--<script src="${resource(dir: 'js', file: 'tables.js')}" ></script>--}%
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            alert("hhhh")
        })
    </script>
    <style type="text/css">
    .selectOne {
        height: 30px;
        font-size: 15px;
        width: 200px;
    }
    .button{
        color: #8a2be2;
        width: 200px;
        height: 40px;
        cursor: pointer;
    }
    table{

    }
    tr{
        padding: 10px;
    }
    td{
        width: 300px;
        height: 40px;
    }
    </style>
    %{--<script type="text/javascript"--}%
    %{--src="${resource(dir: 'js', file: 'jquery.ui.core.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
    %{--src="${resource(dir: 'DataTables-1.8.2', file: 'media/js/jquery.dataTables.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
    %{--src="${resource(dir: 'DataTables-1.8.2', file: 'media/js/jquery.jquery.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
    %{--src="${resource(dir: 'TableTools-2.0.1', file: 'media/js/TableTools.js')}"></script>--}%
    %{--<script type="text/javascript"--}%
    %{--src="${resource(dir: 'TableTools-2.0.1', file: 'media/js/ZeroClipboard.js')}"></script>--}%
    %{--<link rel="stylesheet" type="text/css"--}%
    %{--href="${resource(dir: 'DataTables-1.8.2', file: 'media/css/demo_table.css')}"/>--}%
    %{--<link rel="stylesheet" type="text/css"--}%
    %{--href="${resource(dir: 'DataTables-1.8.2', file: 'media/css/demo_page.css')}"/>--}%
    %{--<link rel="stylesheet" type="text/css"--}%
    %{--href="${resource(dir: 'DataTables-1.8.2', file: 'examples/examples_support/themes/redmond/jquery-ui-1.8.16.custom.css')}"/>--}%
    %{--<link rel="stylesheet" type="text/css"--}%
    %{--href="${resource(dir: 'TableTools-2.0.1', file: 'media/css/TableTools.css')}"/>--}%
</head>

<body>
<div style="border:2px solid #000000;height: 400px ">
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Report</h2>
    </div>

    <div style="margin-left: 20px;font-size: 20px;">
        <div class="body">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
        %{--<g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list"/>
            </div>
        </g:hasErrors>--}%
            <g:form controller="jasperReport" action="generateBlockReport" name="myform" onsubmit="return validateFormBlockReport(this)">
            %{--<input type="hidden"  value="" id="stateCode">--}%
                <table>
                    <tbody>
                    <tr><td></td><td></td></tr>
                    <tr class="prop">
                        <td>
                            Select Category
                        </td>
                        <td>
                            <select name="category" id="category" class="selectOne">
                                <option value="${Categories.EDUCATION.value()}">${Categories.EDUCATION.value()}</option>
                                <option value="${Categories.HEALTH.value()}">${Categories.HEALTH.value()}</option>
                                <option value="${Categories.INFRASTRUCTURE.value()}" selected="">${Categories.INFRASTRUCTURE.value()} Facilities</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            Select Year
                        </td>
                        <td class="right">
                            <g:select name="year" from="${startyear..year}" value="${params?.year?:year}"
                                      onchange="updateMonth(this.value)" class="selectOne"/>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            Select Month
                        </td>
                        <td>
                            <select name="month" id="month" class="selectOne"></select>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            Select State
                        </td>
                        <td class="right">
                            <g:if test="${state}">
                                <select  name="state" style="height:25px" class="selectBox" >
                                    <option value="${state.code}">${state.name}</option>
                                </select>
                                <input type="hidden" name="state" value="${state.code}">
                            </g:if>
                            <g:elseif test="${!district && !block}">
                                <g:select from="${states}" name="state" value="" optionKey="code" optionValue="name"
                                          style="height:25px" noSelection="${['null':'Select One...']}"
                                          onchange="updateDist(this)" class="selectBox"/>
                            </g:elseif>
                            <g:else>
                                <select  name="state" style="height:25px" class="selectBox" disabled="disabled" >
                                    <option value="${state.code}">${state.name}</option>
                                </select>
                                <input type="hidden" name="state" value="${state.code}">
                            </g:else>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            Select District
                        </td>
                        <td class="right">
                            <div id="district">
                                <g:if test="${district}">
                                    <select  name="district" style="height:25px" class="selectBox" disabled="disabled" >
                                        <option value="${district.code}">${district.name}</option>
                                    </select>
                                    <input type="hidden" name="district" value="${district.code}">

                                </g:if>
                                <g:elseif test="${!block}">
                                    <g:select from="${districts}" name="district" value="" optionKey="code" optionValue="name" style="height:25px"
                                              noSelection="${['null':'Select One...']}" onchange="abc()" class="selectBox"/>
                                </g:elseif>
                            %{--<g:select from="${districts}" name="district" value="" optionKey="code" optionValue="name" style="height:25px"
                               noSelection="${['null':'Select One...']}" onchange="updateBlock(this)" class="selectBox"/>--}%
                            %{--<g:select from="${states}" name="dist" value="" optionKey="code" optionValue="name"
                                      style="height:25px" noSelection="${['null':'Select One...']}"
                                      disabled="true" class="selectBox"/>--}%
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="left">
                            Select Block
                        </td>
                        <td class="right">
                            <div id="blocks">
                                <g:if test="${blocks}">
                                    <g:select from="${blocks}" name="block" value="" optionKey="code"
                                              optionValue="name" style="height:25px"
                                              noSelection="${['null':'Select One...']}"
                                              onchange="updatePanchayat(this)" class="selectBox"/>
                                </g:if>
                                <g:elseif test="${block}">
                                    <input type="hidden" name="block" value="${block.code}">
                                    <select name="blockCode" id="blockCode" style="height:25px" class="selectBox"
                                            >
                                        <option value="${block.code}">${block.name}</option>

                                        %{--                                          disabled="disabled">
                                                                              <option value="${block.code}">${block.name}</option>--}%

                                    </select>
                                </g:elseif>
                                <g:else>
                                    <select name="blockCode" style="height:25px" class="selectBox"
                                           >
                                        <option>Select One...</option>
                                    </select>
                                </g:else>
                            %{-- <g:select from="${states}" name="block" value="" optionKey="code"
                                       optionValue="name" style="height:25px"
                                       noSelection="${['null':'Select One...']}" disabled="true"
                                       class="selectBox"/>--}%
                            </div>
                        </td>
                    </tr>
                    <tr><td></td><td></td></tr>
                    <tr>

                        <td colspan="2">
                            <input name="Submit" class="button" type="submit" value="Submit this Info"/>
                            <input type="reset" class="button" value="Cancel" onclick="reset1()"/>
                        </td>
                    </tr>

                    </tbody>
                </table>

            </g:form>
        </div>

    </div>

</div>
<script type="text/javascript">
    updateMonth(${year});
    if ('${flash.message}') {
        alert('${flash.message}');
    }
</script>
</body>
</html>