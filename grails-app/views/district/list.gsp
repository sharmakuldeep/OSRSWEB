<%@ page import="com.osrs.District" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'district.label', default: 'District')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="list">
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="id" title="${message(code: 'district.id.label', default: 'Id')}"/>

                <th><g:message code="district.userCreated.label" default="User Created"/></th>

                <th><g:message code="district.userUpdate.label" default="User Update"/></th>

                <g:sortableColumn property="code" title="${message(code: 'district.code.label', default: 'Code')}"/>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'district.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="name"
                                  title="${message(code: 'district.name.label', default: 'Name')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'district.description.label', default: 'Description')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${districtInstanceList}" status="i" var="districtInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${districtInstance.id}">${fieldValue(bean: districtInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: districtInstance, field: "userCreated")}</td>

                    <td>${fieldValue(bean: districtInstance, field: "userUpdated")}</td>

                    <td>${fieldValue(bean: districtInstance, field: "code")}</td>

                    <td><g:formatDate date="${districtInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: districtInstance, field: "name")}</td>

                    <td>${fieldValue(bean: districtInstance, field: "description")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${districtInstanceTotal}"/>
    </div>
</div>
</body>
</html>
