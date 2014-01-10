<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 11/26/12
  Time: 5:58 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.osrs.Categories" contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"/>
      <title>Simple GSP page</title>
      <style type="text/css">
    .selectOne {
        height: 30px;
        font-size: 15px;
        width: 200px;
    }
    .button{
        color: #8a2be2;
        width: 200px;
        height: 40px;
        cursor: pointer;
    }
        table{

        }
        tr{
            padding: 10px;
        }
        td{
            width: 300px;
            height: 40px;
        }
    </style>
      <script type="text/javascript">
          function validateForm(thisForm){

          }
      </script>
  </head>
  <body>
   <div style="border:2px solid #000000;height: 400px ">
      <div style="width: 100%;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Analytics</h2>
      </div>
      <div style="margin-left: 20px;font-size: 20px;">
            <g:link controller="analytics" action="performanceGraph">Performance graph</g:link>
           <g:form action="performanceGraph" onsubmit="return validateForm(this);">
                <table>
                    <tbody>
                     <tr><td></td><td></td></tr>
                    <tr>
                        <td >
                            Select Year
                        </td>
                        <td class="right">
                            <g:select name="year" from="${startyear..year}" value="${params?.year?:year}"
                                      onchange="updateMonth(this.value)" class="selectOne"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Select State
                        </td>
                        <td>
                            <g:select from="${states}" name="stateCode"
                                      value="" optionKey="code"
                                      optionValue="name"
                                      style="height:25px"
                                      noSelection="${['':'Select One...']}"
                                      class="selectOne"/>
                        </td>
                    </tr>
                    <tr class="prop">
                        <td>
                            Select Category
                        </td>
                        <td>
                            <select name="category" id="category" class="selectOne">
                                <option value="">Select One...</option>
                                <g:each in="${Categories}" var="cat">
                                     <option value="${cat.value()}">${cat.value()}</option>
                                </g:each>
                                %{--<option value="${Categories.EDUCATION.value()}">${Categories.EDUCATION.value()}</option>
                                <option value="${Categories.HEALTH.value()}">${Categories.HEALTH.value()}</option>
                                <option value="${Categories.INFRASTRUCTURE.value()}" selected="">${Categories.INFRASTRUCTURE.value()} Facilities</option>--}%
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td >
                            Select Month
                        </td>
                        <td>
                            <select name="month" id="month" class="selectOne"></select>
                        </td>
                    </tr>

                    <tr><td></td><td></td></tr>
                    <tr>

                        <td colspan="2">
                            <input name="Submit" class="button" type="submit" value="Submit this Info"/>
                            <input type="reset" class="button" value="Cancel" onclick="reset1()"/>
                        </td>
                    </tr>

                    </tbody>
                </table>
           </g:form>
      </div>

  </div>


  </body>
</html>