<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 10/9/12
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 9/21/12
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.osrs.State" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:javascript library="prototype" />
    <style type="text/css">
    table {
        width: 100%;
        border-collapse: collapse;
    }

    table, td, th, tr, thead {
        border: 2px solid black;
    }

    tr.trupdate {
        border: none;
        height: 50px;
    }

    td {
        width: 50%
    }

    td.update {
        width: 12%;
        border: none;
    }

    table.updatetable {
        background-color: #f5f5dc;
        margin-top: 20px;
    }
        .selectBox{
            width: 150px;height: 25px;
            font-size: 15px;
        }

    </style>
    <script type="text/javascript">
        function updateDist(data) {
            var url = contextPath + '/dataCollection/updateDist?stateCode=' + data.value;
            myAjax = new Ajax.Updater('district', url, {
                        method : "post",
                        onComplete:disableBlock,
                        evalScripts : true
                    });
        }
        function disableBlock() {
            var url = contextPath + '/dataCollection/disableBlock';
            myAjax = new Ajax.Updater('blocks', url, {
                        method : "post",
                        evalScripts : true
                    });
        }
        function updateBlock(data) {
            var url = contextPath + '/dataCollection/updateBlock?distCode=' + data.value;
            myAjax = new Ajax.Updater('blocks', url, {
                        method : "post",
                        evalScripts : true
                    });
        }

    </script>
</head>

<body>
%{-- <div align="center">
    <h2 style="text-transform: uppercase;">Administration</h2>
</div>--}%
<div style="border:2px solid #000000;min-height: 400px; ">
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Assign Work Location</h2>
    </div>

    <div>
        <div style="min-height: 230px">
            <table>
                <thead>
                <th>User Name</th>
                <th>Area</th>
                </thead>
                <g:each in="${userInstanceList}" var="user">
                    <tr>
                        <td>${user.username}</td>
                        <g:if test="${user.state}">
                            <td>State(${user?.state?.name})</td>
                        </g:if>
                        <g:elseif test="${user?.district}">
                            <td>District(${user?.district?.name})</td>
                        </g:elseif>
                        <g:elseif test="${user?.block}">
                            <td>Block(${user?.block?.name})</td>
                        </g:elseif>
                        <g:else>
                            <td>null</td>
                        </g:else>
                    </tr>
                </g:each>

            </table>
        </div>

        <div style="min-height: 100px">
            <g:form action="assignAreaAction">
                <table class="updatetable">
                    <tr>
                        <td colspan="8" align="center"
                            style="font-weight: bold;text-transform: uppercase;">Updating Work Location</td>
                    </tr>
                    <tr class="trupdate">
                        <td class="update">
                            Select User:
                        </td>
                        <td class="update">
                            <div style="float: left;width: 30%">
                                <g:select from="${userInstanceList}" name="username" optionKey="username" optionValue="username" class="selectBox" noSelection="${['':'Select One...']}" />

                            </div>
                        </td>
                        <td class="update">
                            Select State
                        </td>
                        <td class="update">
                            <g:select from="${State.list()}" optionKey="code" optionValue="name" name="state"
                                                noSelection="['':'Select State']" class="selectBox" onchange="updateDist(this)"/>
                        </td>

                        <td class="update">
                            Select District
                        </td>
                        <td class="update">
                            <div id="district">
                                <g:select from="${states}" name="dist" value="" optionKey="code" optionValue="name"
                                           noSelection="${['null':'Select One...']}"
                                          disabled="true" class="selectBox"/>
                            </div>
                        </td>

                        <td class="update">
                            Select Block
                        </td>
                        <td class="update">
                            <div id="blocks">
                                <input type="hidden" name="blockCode" value="">
                                <g:select from="${states}" name="block" value="" optionKey="code"
                                          optionValue="name" style="height:25px"
                                          noSelection="${['null':'Select One...']}" disabled="true"
                                          class="selectBox"/>
                            </div>
                        </td>
                    </tr>
                    <tr class="trupdate">
                        <td class="update" align="center" colspan="8">
                            <div style=" padding:10px;">
                                <input name="Submit input" type="submit" value="Update Work Location"
                                       style="height: 30px;width: 200px;font-size: 15px;font-weight: bold;"/>
                            </div>

                        </td>
                    </tr>
                </table>
            %{-- <div style="width: 100%;height: 50px;margin-top: 20px;">
                <div style="float: left;width: 30%">
                    Select User: <select name="username" onchange="updateArea(this.value)">
                    <g:each in="${userInstanceList}" var="user">
                        <option value="${user.username}">${user.username}</option>
                    </g:each>
                </select>
                    --}%%{--<g:select from="${userInstanceList}" optionKey="username" optionValue="username" onchange="updateArea(this)"/>--}%%{--
                </div>
            --}%%{-- <div style="float: left;width: 30%">
                Select Area: <select name="area" disabled=""></select>
            </div>--}%%{--
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <div style="float: left;width: 25%">
                        Select State: <g:select from="${State.list()}" optionKey="code" optionValue="name" name="stateCode"
                                                noSelection="['':'Select State']"/>
                    </div>
                </sec:ifAnyGranted>
                <div style="float: left;width: 25%">
                    Select District: <g:select from="${district}" optionKey="name" optionValue="name" name="district"
                                               noSelection="['':'Select District']"/>
                </div>
                <div style="float: left;width: 25%">
                    Select District: <g:select from="${district}" optionKey="name" optionValue="name" name="district"
                                               noSelection="['':'Select District']"/>
                </div>
                --}%%{-- <div style="float: left;width: 30%">
               Select State: <g:select from="${State.list()}" optionKey="name" optionValue="name" name="state" noSelection="['':'Select State']"/>
                </div>--}%%{--

            </div>

            <div style="margin-top: 10px">
                <input type="submit" value="Update">
            </div>--}%
            </g:form>
        </div>
    </div>

</div>

</body>
</html>