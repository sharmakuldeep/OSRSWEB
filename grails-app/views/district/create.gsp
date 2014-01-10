<%@ page import="com.osrs.State; com.osrs.User; com.osrs.District" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'district.label', default: 'District')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${districtInstance}">
        <div class="errors">
            <g:renderErrors bean="${districtInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userCreated"><g:message code="district.userCreated.label"
                                                            default="User Created"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: districtInstance, field: 'userCreated', 'errors')}">
                        <g:select name="userCreated.id" from="${User.list()}" optionKey="id"
                                  value="${districtInstance?.userCreated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userUpdate"><g:message code="district.userUpdate.label"
                                                           default="User Update"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: districtInstance, field: 'userUpdate', 'errors')}">
                        <g:select name="userUpdated.id" from="${User.list()}" optionKey="id"
                                  value="${districtInstance?.userUpdated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="code"><g:message code="district.code.label" default="Code"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: districtInstance, field: 'code', 'errors')}">
                        <g:textField name="code" value="${districtInstance?.code}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="district.description.label"
                                                            default="Description"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: districtInstance, field: 'description', 'errors')}">
                        <g:textField name="description" value="${districtInstance?.description}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="district.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: districtInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${districtInstance?.name}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="state"><g:message code="district.state.label" default="State"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: districtInstance, field: 'state', 'errors')}">
                        <g:select name="state.id" from="${State.list()}" optionKey="id"
                                  value="${districtInstance?.state?.id}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save"
                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
