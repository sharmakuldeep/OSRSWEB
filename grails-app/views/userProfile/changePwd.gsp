<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 9/25/12
  Time: 12:11 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}"/>
    <style type="text/css">
    .mainContent{
       border:2px solid #000000;height: 450px;
    }

    .message{
        font-size: 15px;
        color: blue;
    }

      .button{
          width: 150px;
          height: 40px;font-size: 20px;font-weight: bold;
          margin: 10px;
      }
    </style>
      <script type="text/javascript">
          function validateForm(thisForm){
              var oldPwd=thisForm.oldPwd;
              var newPwd=thisForm.newPwd;
              var reNewPwd=thisForm.reNewPwd;
              if(!oldPwd.value || oldPwd.value==''){
                  alert("Old Password Should not be Null !");
                  oldPwd.focus();
                  return false;
              }
              if(!newPwd.value || newPwd.value==''){
                  alert("New Password Should not be Null !");
                  newPwd.focus();
                  return false;
              }
              if(!reNewPwd.value || reNewPwd.value==''){
                  alert("Re Enter New Password Should not be Null !");
                  reNewPwd.focus();
                  return false;
              }
              if(newPwd.value!=reNewPwd.value){
                  alert("Re Enter New Password Should not Matched !");
                  reNewPwd.focus();
                  return false;
              }

           return true;
          }
      </script>
</head>

<body>

 <div class="mainContent" style="height: 300px">
      <div style="width: 100%;height:50px;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">
              <span style="float: left">
                  Change Password
              </span>

          </h2>
      </div>

      <div style="font-size: 20px;background:url('${resource(dir:'images',file:'changePwd.jpg')}') no-repeat right top;">
          <div class="body" style="padding: 50px;">
              <g:if test="${flash.message}">
                  <div class="message">${flash.message}</div>
              </g:if>
              <g:form method="post"  action="changPwdAction" onsubmit="return validateForm(this)">
                  <g:hiddenField name="id" value="${params.id}"/>
                <table>
                  <tr>
                      <td>Old Password</td>
                      <td>
                          <input type="password" value="" name="oldPwd">
                      </td>
                  </tr>
                  <tr>
                      <td>
                          New Password
                      </td>
                      <td>
                          <input type="password" value="" name="newPwd">
                      </td>
                  </tr>
                  <tr>
                      <td>Confirm New Password</td>
                      <td><input type="password" value="" name="reNewPwd"></td>
                  </tr>
                  <tr></tr>

              </table>
                  <g:submitButton name="changePwd" value="Submit" class="button"/>
                  <g:link action="show" params="[id:params.id]">
                     <input type="button" value="Cancel" class="button">
                  </g:link>

              </g:form>

          </div>
      </div>

  </div>


</body>
</html>
