<%@ page import="com.osrs.User; com.osrs.State" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'state.label', default: 'State')}"/>
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
    <g:hasErrors bean="${stateInstance}">
        <div class="errors">
            <g:renderErrors bean="${stateInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userCreated"><g:message code="state.userCreated.label"
                                                            default="User Created"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'userCreated', 'errors')}">
                        <g:select name="userCreated.id" from="${User.list()}" optionKey="id"
                                  value="${stateInstance?.userCreated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userUpdated"><g:message code="state.userUpdate.label" default="User Update"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'userUpdate', 'errors')}">
                        <g:select name="userUpdated.id" from="${User.list()}" optionKey="id"
                                  value="${stateInstance?.userUpdated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="code"><g:message code="state.code.label" default="Code"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'code', 'errors')}">
                        <g:textField name="code" value="${stateInstance?.code}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="descescription"><g:message code="state.descescription.label"
                                                               default="Description"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'descescription', 'errors')}">
                        <g:textField name="description" value="${stateInstance?.description}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="state.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${stateInstance?.name}"/>
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
