<%@ page import="com.osrs.UserProfile" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}"/>
    <style type="text/css">
    table{

    }
    tr{}
    td{
        padding: 10px;
        padding-left: 30px;
    }
    </style>

</head>

<body>
<div style="border:2px solid #000000;height: 500px;">
      <div style="width: 100%;height:50px;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">
              <span style="float: left">
                  <g:message code="default.edit.label" args="[entityName]"/>
              </span>

          </h2>
      </div>

      <div style="margin-left: 20px;font-size: 15px;">
          <div class="body">
              <h1></h1>

              <g:form method="post"  action="update" name="update">
                  <g:hiddenField name="id" value="${userProfileInstance?.id}"/>
                  <g:hiddenField name="version" value="${userProfileInstance?.version}"/>
                  <div class="dialog">
                      <table>
                          <tbody>

                          <tr class="prop">
                              <td valign="top" class="name">
                                  <label for="firstName"><g:message code="userProfile.firstName.label"  default="First Name"/></label>
                                  <span name="lable" style="color: red;">*</span>
                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'firstName', 'errors')}">
                                  <g:textField name="firstName" maxlength="64" id="firstName" value="${userProfileInstance?.firstName}"/>
                                  <div id="firstMsg" style="display: none; color: red">Please Enter FirstName</div>
                              </td>
                              %{-- <td style="width: 200px"><div id="firstMsg" style="display: none; color: red">Please Enter FirstName</div></td>--}%
                              <td valign="top" class="name">
                                  <label for="middleName"><g:message code="userProfile.middleName.label"
                                                                     default="Middle Name"/></label>
                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'middleName', 'errors')}">
                                  <g:textField name="middleName" maxlength="64" id="middleName"
                                               value="${userProfileInstance?.middleName}"/>
                              </td>
                          </tr>

                          <tr class="prop">
                              <td valign="top" class="name">
                                  <label for="lastName"><g:message code="userProfile.lastName.label"
                                                                   default="Last Name"/></label>

                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'lastName', 'errors')}">
                                  <g:textField name="lastName" maxlength="10"  id="lastName" value="${userProfileInstance?.lastName}"/>
                              </td>
                              <td valign="top" class="name">
                                  <label for="homePhone"><g:message code="userProfile.homePhone.label"
                                                                    default="Telephone No(Home)"/></label>
                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'homePhone', 'errors')}">
                                  <g:textField name="homePhone" maxlength="10" id="homePhone"
                                               value="${userProfileInstance?.homePhone}"/>
                                  <div id="homeMsg" style="display: none; color: red"></div>
                              </td>

                          </tr>

                          <tr class="prop">
                              <td valign="top" class="name">
                                  <label for="mobilePhone"><g:message code="userProfile.mobilePhone.label"
                                                                      default="Mobile No "/></label>
                                  <span name="lable" style="color: red;">*</span>
                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'mobilePhone', 'errors')}">
                                  <g:textField name="mobilePhone" maxlength="10" id="mobilePhone"
                                               value="${userProfileInstance?.mobilePhone}"/>
                                  <div id="mobileMsg" style="display: none; color: red"></div>
                              </td>
                              <td valign="top" class="name">
                                  <label for="workPhone"><g:message code="userProfile.workPhone.label"
                                                                    default="Telephone No(Office)"/></label>

                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'workPhone', 'errors')}">
                                  <g:textField name="workPhone" maxlength="10" id="workPhone"
                                               value="${userProfileInstance?.workPhone}"/>
                                 <div id="workMsg" style="display: none; color: red"></div>
                              </td>
                          </tr>

                          <tr class="prop">
                              <td valign="top" class="name">
                                  <label for="address"><g:message code="userProfile.address.label"
                                                                  default="Address"/></label>
                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'address', 'errors')}">
                                  <g:textArea name="address" cols="40" rows="5"
                                              value="${userProfileInstance?.address}"/>
                              </td>
                              <td valign="top" class="name">
                                  <label for="street"><g:message code="userProfile.street.label"  default="Street"/></label>
                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'street', 'errors')}">
                                  <g:textField name="street" maxlength="64"  value="${userProfileInstance?.street}"/>
                              </td>

                          </tr>

                          <tr class="prop">
                              <td valign="top" class="name">
                                  <label for="city"><g:message code="userProfile.city.label" default="City"/></label>
                              </td>
                              <td valign="top"    class="value ${hasErrors(bean: userProfileInstance, field: 'city', 'errors')}">
                                  %{--<g:textArea name="city" cols="40" rows="5" value="${userProfileInstance?.city}"/>--}%
                                  <g:textField name="city" maxlength="64"  id="city" value="${userProfileInstance?.city}"/>
                              </td>
                              <td valign="top" class="name">
                                  <label for="state"><g:message code="userProfile.state.label" default="State"/></label>
                              </td>
                              <td valign="top"  class="value ${hasErrors(bean: userProfileInstance, field: 'state', 'errors')}">
                                  %{--<g:textArea name="state" cols="40" rows="5" value="${userProfileInstance?.state}"/>--}%
                                  <g:textField name="state"  maxlength="64" id="state" value="${userProfileInstance?.state}"/>
                              </td>

                          </tr>

                          <tr class="prop">
                              <td valign="top" class="name">
                                  <label for="country"><g:message code="userProfile.country.label"
                                                                  default="Country"/></label>
                              </td>
                              <td valign="top"  class="value ${hasErrors(bean: userProfileInstance, field: 'country', 'errors')}">
                                  <g:textField name="country" maxlength="64" id="country" value="${userProfileInstance?.country}"/>
                              </td>
                              <td valign="top" class="name">
                                  <label for="postalCode"><g:message code="userProfile.postalCode.label"
                                                                     default="Postal Code"/></label>
                              </td>
                              <td valign="top"
                                  class="value ${hasErrors(bean: userProfileInstance, field: 'postalCode', 'errors')}">
                                  <g:textField name="postalCode" maxlength="6" id="postalCode" value="${userProfileInstance?.postalCode}"/>
                                  <div id="postalMsg" style="display: none; color: red"></div>
                              </td>
                          </tr>

                          </tbody>
                      </table>
                  </div>

                  <div class="buttons">
                      <span class="button">
                         %{-- <g:actionSubmit class="save" action="update"  style="width: 200px;height: 50px;margin-left: 200px;font-size: 20px;font-weight: bold;"
                                                           value="${message(code: 'default.button.update.label', default: 'Update')}"/>--}%
                      <input type="button" id="saveBtn" class="save" style="width:  200px; height: 50px; margin-left: 200px; font-size: 20px; font-weight: bold;" value="${message(code: 'default.button.update.label', default: 'Update')}"/>

                      </span>

                      <g:link action="show" params="[id:userProfileInstance.id]">
                          <input type="button" value="Cancel" style="width: 200px;height: 50px;margin-left: 200px;font-size: 20px;font-weight: bold;">
                      </g:link>
                      %{--<span class="button"><g:actionSubmit class="delete" action="delete"
                                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>--}%
                  </div>
              </g:form>
          </div>
      </div>

  </div>


</body>
</html>
