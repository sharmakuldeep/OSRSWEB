<%@ page import="com.osrs.Block; com.osrs.User; com.osrs.Village" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'village.label', default: 'Village')}"/>
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
    <g:hasErrors bean="${villageInstance}">
        <div class="errors">
            <g:renderErrors bean="${villageInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userCreated"><g:message code="village.userCreated.label"
                                                            default="User Created"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: villageInstance, field: 'userCreated', 'errors')}">
                        <g:select name="userCreated.id" from="${User.list()}" optionKey="id"
                                  value="${villageInstance?.userCreated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="userUpdate"><g:message code="village.userUpdate.label"
                                                           default="User Update"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: villageInstance, field: 'userUpdate', 'errors')}">
                        <g:select name="userUpdated.id" from="${User.list()}" optionKey="id"
                                  value="${villageInstance?.userUpdated?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="block"><g:message code="village.block.label" default="Block"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: villageInstance, field: 'block', 'errors')}">
                        <g:select name="block.id" from="${Block.list()}" optionKey="id"
                                  value="${villageInstance?.block?.id}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="code"><g:message code="village.code.label" default="Code"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: villageInstance, field: 'code', 'errors')}">
                        <g:textField name="code" value="${villageInstance?.code}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="description"><g:message code="village.description.label"
                                                            default="Description"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: villageInstance, field: 'description', 'errors')}">
                        <g:textField name="description" value="${villageInstance?.description}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="gramPanchayt"><g:message code="village.gramPanchayt.label"
                                                             default="Gram Panchayt"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: villageInstance, field: 'gramPanchayt', 'errors')}">
                        <g:textField name="gramPanchayt" value="${villageInstance?.gramPanchayt}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="name"><g:message code="village.name.label" default="Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: villageInstance, field: 'name', 'errors')}">
                        <g:textField name="name" value="${villageInstance?.name}"/>
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
