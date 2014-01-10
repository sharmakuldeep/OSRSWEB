<%@ page import="com.osrs.UserProfile" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}"/>
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

                <g:sortableColumn property="id" title="${message(code: 'userProfile.id.label', default: 'Id')}"/>

                <g:sortableColumn property="firstName"
                                  title="${message(code: 'userProfile.firstName.label', default: 'First Name')}"/>

                <g:sortableColumn property="middleName"
                                  title="${message(code: 'userProfile.middleName.label', default: 'Middle Name')}"/>

                <g:sortableColumn property="lastName"
                                  title="${message(code: 'userProfile.lastName.label', default: 'Last Name')}"/>

                <g:sortableColumn property="address"
                                  title="${message(code: 'userProfile.address.label', default: 'Address')}"/>

                <g:sortableColumn property="street"
                                  title="${message(code: 'userProfile.street.label', default: 'Street')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${userProfileInstanceList}" status="i" var="userProfileInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                    <td><g:link action="show"
                                id="${userProfileInstance.id}">${fieldValue(bean: userProfileInstance, field: "id")}</g:link></td>

                    <td>${fieldValue(bean: userProfileInstance, field: "firstName")}</td>

                    <td>${fieldValue(bean: userProfileInstance, field: "middleName")}</td>

                    <td>${fieldValue(bean: userProfileInstance, field: "lastName")}</td>

                    <td>${fieldValue(bean: userProfileInstance, field: "address")}</td>

                    <td>${fieldValue(bean: userProfileInstance, field: "street")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>
    </div>

    <div class="paginateButtons">
        <g:paginate total="${userProfileInstanceTotal}"/>
    </div>
</div>
</body>
</html>
