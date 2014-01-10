<%@ page import="com.osrs.Block" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'block.label', default: 'Block')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'block.id.label', default: 'Id')}"/>

                <th><g:message code="block.userCreated.label" default="User Created"/></th>

                <th><g:message code="block.userUpdated.label" default="User Updated"/></th>

                <g:sortableColumn property="code" title="${message(code: 'block.code.label', default: 'Code')}"/>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'block.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="name"
                                  title="${message(code: 'block.name.label', default: 'Name')}"/>

                <g:sortableColumn property="description"
                                  title="${message(code: 'block.description.label', default: 'Description')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${blockInstanceList}" status="i" var="blockInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${blockInstance.id}">${fieldValue(bean: blockInstance, field: "name")}</g:link></td>

                    <td>${fieldValue(bean: blockInstance, field: "userCreated")}</td>

                    <td>${fieldValue(bean: blockInstance, field: "userUpdated")}</td>

                    <td>${fieldValue(bean: blockInstance, field: "code")}</td>

                    <td><g:formatDate date="${blockInstance.dateCreated}"/></td>

                    <td>${fieldValue(bean: blockInstance, field: "name")}</td>

                    <td>${fieldValue(bean: blockInstance, field: "description")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${blockInstanceTotal}"/>
    </div>
</div>
</body>
</html>
