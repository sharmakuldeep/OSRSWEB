<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 9/21/12
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.osrs.UserRole; com.osrs.Role" contentType="text/html;charset=UTF-8" %>
<html>
  <head>
     <meta name="layout" content="main"/>
     <style type="text/css">
    table {
        border-collapse: collapse;
        width:100%;
    }

    table, td, th,tr {
        border: 1px solid black;
        min-width: 100px;
    }

    th {
        border: 2px solid black;
        background-color: #ccccff;
        height: 50px;
        width: 40px;
    }
    </style>
  </head>
  <body>
  %{-- <div align="center">
      <h2 style="text-transform: uppercase;">Administration</h2>
  </div>--}%
  <div style="border:2px solid #000000;height: 400px ">
      <div style="width: 100%;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">User's List</h2>
      </div>
      <div style="font-size: 15px;">
          <div class="body">

              <g:if test="${flash.message}">
                  <div class="message">${flash.message}</div>
              </g:if>
              <div class="list">
                  <table>
                      <thead>
                      <tr>

                         %{-- <g:sortableColumn property="id" title="${message(code: 'user.id.label', default: 'Id')}"/>--}%

                          <g:sortableColumn property="username"
                                            title="${message(code: 'user.username.label', default: 'Username')}"/>

                          <th><g:message code="user.userProfile.label" default="User Profile"/></th>

                          <th><g:message code="user.userProfile.label" default="Role"/></th>

                          <g:sortableColumn property="accountExpired"
                                            title="${message(code: 'user.accountExpired.label', default: 'Account Expired')}"/>

                          <g:sortableColumn property="accountLocked"
                                            title="${message(code: 'user.accountLocked.label', default: 'Account Locked')}"/>
                          <th></th>
                          <th></th>

                      </tr>
                      </thead>
                      <tbody>
                      <g:each in="${userInstanceList}" status="i" var="userInstance">
                          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                              %{--<td><g:link action="show"
                                          id="${userInstance.id}">${fieldValue(bean: userInstance, field: "id")}</g:link></td>--}%

                              <td>${fieldValue(bean: userInstance, field: "username")}</td>

                              <td>${userInstance?.userProfile?.profileName?:'Not Created'}</td>
                              <g:if test="${UserRole.findByUser(userInstance)!=null}" >
                                 <td>${Role.findById(UserRole.findByUser(userInstance)?.role?.id)?.authority}</td>
                              </g:if>
                              <g:else><td>Null</td></g:else>

                              <td><g:formatBoolean boolean="${userInstance.accountExpired}"/></td>

                              <td><g:formatBoolean boolean="${userInstance.accountLocked}"/></td>

                              <td>
                                  <g:link action="editUser" params="[id:userInstance.id]">Edit</g:link>
                              </td>
                              <td>
                                  <g:link controller="admin" action="resetPassword" params="[id:userInstance.id]">Reset password</g:link>
                              </td>
                          </tr>
                      </g:each>
                      </tbody>
                  </table>
              </div>

              <div class="paginateButtons">
                  <g:paginate total="${userInstanceTotal}"/>
              </div>
          </div>

      </div>

  </div>

  </body>
</html>