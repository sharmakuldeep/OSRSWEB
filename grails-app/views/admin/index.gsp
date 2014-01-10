<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 9/21/12
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"/>

  </head>
  <body>
  %{-- <div align="center">
      <h2 style="text-transform: uppercase;">Administration</h2>
  </div>--}%
  <div style="border:2px solid #000000;height: 400px ">
      <div style="width: 100%;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Administration</h2>
      </div>
      <div style="margin-left: 20px;font-size: 20px;">
        %{--<ol>
            <li style="padding: 5px;">
               <g:link action="userMgmt">User Management</g:link>
            </li>
            <li style="padding: 5px;">File Management</li>
            <li></li>
        </ol>--}%
          <ol>
            <li style="padding: 5px;">
               <g:link  action="userList">User List</g:link>
            </li>
            <li style="padding: 5px;">
                <g:link  action="createUser">Create User</g:link>
            </li>
            <li>
                <g:link action="assignArea">Assign Area </g:link>
            </li>
        </ol>

      </div>

  </div>

  </body>
</html>