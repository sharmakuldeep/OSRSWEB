<%@ page import="com.osrs.State" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'state.label', default: 'State')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'state.id.label', default: 'Id')}"/>

                <th><g:message code="state.userCreated.label" default="User Created"/></th>

                <th><g:message code="state.userUpdated.label" default="User Updated"/></th>

                <g:sortableColumn property="code" title="${message(code: 'state.code.label', default: 'Code')}"/>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'state.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="name"
                                  title="${message(code: 'state.name.label', default: 'Name')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'state.description.label', default: 'Description')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${stateInstanceList}" status="i" var="stateInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${stateInstance.id}">${fieldValue(bean: stateInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: stateInstance, field: "userCreated")}</td>

                    <td>${fieldValue(bean: stateInstance, field: "userUpdated")}</td>

                    <td>${fieldValue(bean: stateInstance, field: "code")}</td>

                    <td><g:formatDate date="${stateInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: stateInstance, field: "name")}</td>

                    <td>${fieldValue(bean: stateInstance, field: "description")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${stateInstanceTotal}"/>
    </div>
</div>
</body>
</html>
