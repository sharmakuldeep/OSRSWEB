<%@ page import="com.osrs.District" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'district.label', default: 'District')}"/>
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
                <td valign="top" class="name"><g:message code="district.id.label" default="Id"/></td>

                <td valign="top" class="value">${fieldValue(bean: districtInstance, field: "id")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.userCreated.label" default="User Created"/></td>

                <td valign="top" class="value">${districtInstance?.userCreated?.username}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.userUpdate.label" default="User Update"/></td>

                <td valign="top" class="value">${districtInstance?.userUpdated?.username}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.block.label" default="Block"/></td>

                <td valign="top" style="text-align: left;" class="value">
                    <ul>
                        <g:each in="${districtInstance.block}" var="b">
                            <li><g:link controller="block" action="show" id="${b.id}">${b?.name}</g:link></li>
                        </g:each>
                    </ul>
                </td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.code.label" default="Code"/></td>

                <td valign="top" class="value">${fieldValue(bean: districtInstance, field: "code")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.dateCreated.label" default="Date Created"/></td>

                <td valign="top" class="value"><g:formatDate date="${districtInstance?.dateCreated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.description.label" default="Description"/></td>

                <td valign="top" class="value">${fieldValue(bean: districtInstance, field: "description")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.lastUpdated.label" default="Last Updated"/></td>

                <td valign="top" class="value"><g:formatDate date="${districtInstance?.lastUpdated}"/></td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.name.label" default="Name"/></td>

                <td valign="top" class="value">${fieldValue(bean: districtInstance, field: "name")}</td>

            </tr>

            <tr class="prop">
                <td valign="top" class="name"><g:message code="district.state.label" default="State"/></td>

                <td valign="top" class="value"><g:link controller="state" action="show"
                                                       id="${districtInstance?.state?.id}">${districtInstance?.state?.name}</g:link></td>

            </tr>

            </tbody>
        </table>
    </div>

    <div class="buttons">
        <g:form>
            <g:hiddenField name="id" value="${districtInstance?.id}"/>
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
