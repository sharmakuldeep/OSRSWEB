<%@ page import="com.osrs.UserProfile" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}"/>
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
    <g:hasErrors bean="${userProfileInstance}">
        <div class="errors">
            <g:renderErrors bean="${userProfileInstance}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="firstName"><g:message code="userProfile.firstName.label"
                                                          default="First Name"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userProfileInstance, field: 'firstName', 'errors')}">
                        <g:textField name="firstName" maxlength="64" value="${userProfileInstance?.firstName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="middleName"><g:message code="userProfile.middleName.label"
                                                           default="Middle Name"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userProfileInstance, field: 'middleName', 'errors')}">
                        <g:textField name="middleName" maxlength="64" value="${userProfileInstance?.middleName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="lastName"><g:message code="userProfile.lastName.label" default="Last Name"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userProfileInstance, field: 'lastName', 'errors')}">
                        <g:textField name="lastName" maxlength="64" value="${userProfileInstance?.lastName}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="address"><g:message code="userProfile.address.label" default="Address"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userProfileInstance, field: 'address', 'errors')}">
                        <g:textArea name="address" cols="40" rows="5" value="${userProfileInstance?.address}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="street"><g:message code="userProfile.street.label" default="Street"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userProfileInstance, field: 'street', 'errors')}">
                        <g:textArea name="street" cols="40" rows="5" value="${userProfileInstance?.street}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="city"><g:message code="userProfile.city.label" default="City"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userProfileInstance, field: 'city', 'errors')}">
                        <g:textArea name="city" cols="40" rows="5" value="${userProfileInstance?.city}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="state"><g:message code="userProfile.state.label" default="State"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userProfileInstance, field: 'state', 'errors')}">
                        <g:textArea name="state" cols="40" rows="5" value="${userProfileInstance?.state}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="postalCode"><g:message code="userProfile.postalCode.label"
                                                           default="Postal Code"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userProfileInstance, field: 'postalCode', 'errors')}">
                        <g:textField name="postalCode" maxlength="40" value="${userProfileInstance?.postalCode}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="country"><g:message code="userProfile.country.label" default="Country"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: userProfileInstance, field: 'country', 'errors')}">
                        <g:textArea name="country" cols="40" rows="5" value="${userProfileInstance?.country}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="homePhone"><g:message code="userProfile.homePhone.label"
                                                          default="Home Phone"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userProfileInstance, field: 'homePhone', 'errors')}">
                        <g:textField name="homePhone" maxlength="20" value="${userProfileInstance?.homePhone}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="mobilePhone"><g:message code="userProfile.mobilePhone.label"
                                                            default="Mobile Phone"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userProfileInstance, field: 'mobilePhone', 'errors')}">
                        <g:textField name="mobilePhone" maxlength="20" value="${userProfileInstance?.mobilePhone}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="workPhone"><g:message code="userProfile.workPhone.label"
                                                          default="Work Phone"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: userProfileInstance, field: 'workPhone', 'errors')}">
                        <g:textField name="workPhone" maxlength="20" value="${userProfileInstance?.workPhone}"/>
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
