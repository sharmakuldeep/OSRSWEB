<%@ page import="com.osrs.District; com.osrs.User; com.osrs.Block" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'block.label', default: 'Block')}"/>
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
    <g:hasErrors bean="${blockInstance}">
        <div class="errors">
            <g:renderErrors bean="${blockInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form method="post">
        <g:hiddenField name="id" value="${blockInstance?.id}"/>
        <g:hiddenField name="version" value="${blockInstance?.version}"/>
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userCreated"><g:message code="block.userCreated.label"
                                                            default="User Created"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: blockInstance, field: 'userCreated', 'errors')}">
                        <g:select name="userCreated.id" from="${User.list()}" optionKey="id"
                                  value="${blockInstance?.userCreated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userUpdate"><g:message code="block.userUpdate.label" default="User Update"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: blockInstance, field: 'userUpdate', 'errors')}">
                        <g:select name="userUpdated.id" from="${User.list()}" optionKey="id"
                                  value="${blockInstance?.userUpdated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="code"><g:message code="block.code.label" default="Code"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: blockInstance, field: 'code', 'errors')}">
                        <g:textField name="code" value="${blockInstance?.code}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="block.description.label"
                                                            default="Description"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: blockInstance, field: 'description', 'errors')}">
                        <g:textField name="description" value="${blockInstance?.description}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="district"><g:message code="block.district.label" default="District"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: blockInstance, field: 'district', 'errors')}">
                        <g:select name="district.id" from="${District.list()}" optionKey="id"
                                  value="${blockInstance?.district?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="block.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: blockInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${blockInstance?.name}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="village"><g:message code="block.village.label" default="Village"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: blockInstance, field: 'village', 'errors')}">

                        <ul>
                            <g:each in="${blockInstance?.village?}" var="v">
                                <li><g:link controller="village" action="show"
                                            id="${v.id}">${v?.name}</g:link></li>
                            </g:each>
                        </ul>
                        <g:link controller="village" action="create"
                                params="['block.id': blockInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'village.label', default: 'Village')])}</g:link>

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
