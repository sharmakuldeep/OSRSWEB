<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/27/12
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/27/12
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/27/12
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"/>
    <style type="text/css">

        table{
            /*border: 2px solid #000000;*/
            border-collapse: collapse;
            width: 100%
        }
        th{
            background-color: #999999;
            width: 20%;
            border: 1px solid #000000;
            padding: 5px;
        }
        tr{
            border: 1px solid #000000;
        }
        td{
            border: 1px solid #000000;
            padding: 4px;
        }
    </style>
  </head>
  <body>
  <div align="center">
      <h2>MY DOCUMENT</h2>
  </div>
  <div style="border:2px solid #000000;height: 400px ">
        <div style="width: 100%;background-color: #666666;">
            <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;">Private File List</h2>
        </div>
           <table>
                <thead>
                <th>Name</th>
                <th>Comment</th>
                <th>User Created</th>
                <th>Date Created</th>
                <th>Date Updated</th>
                </thead>
                <tbody>
                <g:each in="${fileAssetInstanceList}" var="files">
                <tr>
                    <td>
                        <g:if test="${(files?.name).size() > 15}">
                            <span class="Name">
                                <g:link action="show"
                                        params="[fileId:files?.id]">${(files?.name).substring(0, 15)}...</g:link>
                            </span>
                        </g:if>
                        <g:else>
                            <span class="Name">
                                <g:link action="show" params="[fileId:files?.id]">${files?.name}</g:link>
                            </span>
                        </g:else>
                    </td>
                    <td>
                        <g:if test="${files?.comment==null}">
                            <span class="Comment">Null</span>
                        </g:if>
                        <g:else>
                            <g:if test="${(files?.comment).size() > 15}">
                                <span class="Comment">${(files?.comment).substring(0, 15)}...</span>
                            </g:if>
                            <g:else>
                                <span class="Comment">${(files?.comment)}</span>
                            </g:else>
                        </g:else>
                    </td>
                    <td>${files?.user?.username}</td>
                    <td>${files?.dateCreated}</td>
                    <td>${files?.lastUpdated}</td>
                </tr>
                    </g:each>
                </tbody>
            </table>

            <g:if test="${fileAssetInstanceList.size()==0}" >
                <div align="center">  NO File Found</div>
            </g:if>
        </div>
  </body>
</html>