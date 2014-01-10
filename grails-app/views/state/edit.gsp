<%@ page import="com.osrs.State" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'state.label', default: 'State')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
    <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label"
                                                                               args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${stateInstance}">
        <div class="errors">
            <g:renderErrors bean="${stateInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${stateInstance?.id}"/>
        <g:hiddenField name="version" value="${stateInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userCreated"><g:message code="state.userCreated.label"
                                                            default="User Created"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'userCreated', 'errors')}">
                        <g:select name="userCreated.id" from="${com.osrs.User.list()}" optionKey="id"
                                  value="${stateInstance?.userCreated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userUpdate"><g:message code="state.userUpdate.label" default="User Update"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'userUpdate', 'errors')}">
                        <g:select name="userUpdated.id" from="${com.osrs.User.list()}" optionKey="id"
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
                        <label for="Description"><g:message code="state.description.label"
                                                               default="Description"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'descescription', 'errors')}">
                        <g:textField name="description" value="${stateInstance?.description}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="district"><g:message code="state.district.label" default="District"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'district', 'errors')}">

                        <ul>
                            <g:each in="${stateInstance?.district?}" var="d">
                                <li><g:link controller="district" action="show"
                                            id="${d.id}">${d?.name}</g:link></li>
                            </g:each>
                        </ul>
                        <g:link controller="district" action="create"
                                params="['state.id': stateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'district.label', default: 'District')])}</g:link>

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
            <span class="button"><g:actionSubmit class="save" action="update"
                                                 value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
