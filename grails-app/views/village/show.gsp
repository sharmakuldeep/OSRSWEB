<%@ page import="com.osrs.Village" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'village.label', default: 'Village')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
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
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tbody>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: villageInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.userCreated.label" default="User Created"/></td>

                <td valign="top" class="value">${villageInstance?.userCreated?.username}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.userUpdate.label" default="User Update"/></td>

                <td valign="top" class="value">${villageInstance?.userUpdated?.username}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.block.label" default="Block"/></td>

                <td valign="top" class="value"><g:link controller="block" action="show"
                                                       id="${villageInstance?.block?.id}">${villageInstance?.block?.name}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.code.label" default="Code"/></td>

                <td valign="top" class="value">${fieldValue(bean: villageInstance, field: "code")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.dateCreated.label" default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${villageInstance?.dateCreated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.description.label" default="Description"/></td>

                <td valign="top" class="value">${fieldValue(bean: villageInstance, field: "description")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.gramPanchayt.label"
                                                         default="Gram Panchayt"/></td>

                <td valign="top" class="value">${fieldValue(bean: villageInstance, field: "gramPanchayt")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.lastUpdated.label" default="Last Updated"/></td>

                <td valign="top" class="value"><g:formatDate date="${villageInstance?.lastUpdated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="village.name.label" default="Name"/></td>

                <td valign="top" class="value">${fieldValue(bean: villageInstance, field: "name")}</td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${villageInstance?.id}"/>
            <span class="button"><g:actionSubmit class="edit" action="edit"
                                                 value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
            <span class="button"><g:actionSubmit class="delete" action="delete"
                                                 value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                 onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>
        </g:form>
    </div>
</div>
</body>
</html>
