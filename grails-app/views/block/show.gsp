<%@ page import="com.osrs.Block" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'block.label', default: 'Block')}"/>
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
                <td valign="top" class="name"><g:message code="block.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: blockInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.userCreated.label" default="User Created"/></td>

                <td valign="top" class="value">${blockInstance?.userCreated?.username}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.userUpdate.label" default="User Update"/></td>

                <td valign="top" class="value">${blockInstance?.userUpdated?.username}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.code.label" default="Code"/></td>

                <td valign="top" class="value">${fieldValue(bean: blockInstance, field: "code")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.dateCreated.label" default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${blockInstance?.dateCreated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.description.label" default="Description"/></td>

                <td valign="top" class="value">${fieldValue(bean: blockInstance, field: "description")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.district.label" default="District"/></td>

                <td valign="top" class="value"><g:link controller="district" action="show"
                                                       id="${blockInstance?.district?.id}">${blockInstance?.district?.name}</g:link></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.lastUpdated.label" default="Last Updated"/></td>

                <td valign="top" class="value"><g:formatDate date="${blockInstance?.lastUpdated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.name.label" default="Name"/></td>

                <td valign="top" class="value">${fieldValue(bean: blockInstance, field: "name")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="block.village.label" default="Village"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${blockInstance.village}" var="v">
                            <li><g:link controller="village" action="show"
                                        id="${v.id}">${v?.name}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${blockInstance?.id}"/>
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
