<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 6:10 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main" />
      <style type="text/css">

        .field{
            float: right;
            width: 57%;
            height: 20px;
        }
    </style>
  </head>
  <body>

  <div align="center">
         <h1> Department of Economics & Statistics </h1>
       </div>  <br>
              <g:render template="/layouts/dataInfo" />
        <h2>Health And Family Welfare Form:${hospitalType} Data</h2>
        <div style="padding: 20px;border: 2px solid black" >
      <g:form controller="healthDataCollection" action="saveHospitalData">
          <g:hiddenField name="hospitalId" value="${id}" />
          <g:hiddenField name="hospitalType" value="${hospitalType}" />

          <div><span class="name"
                     style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No's of Doctors</span>
           <div class="field">   <input placeholder="Enter Number" type="text" name="noOfDoctors" style="width: 28%;font-size: 15px;"
                     value="${hospital?.noOfDoctors}" onkeypress="validateIsNumber(event)"/>
          </div>
          </div>
          <g:if test="${!(id=='ayurCenter'|| id=='homeoCells') }">
              <div><span class="name"
                         style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No's of Nurses</span>
             <div class="field">      <input placeholder="Enter Number" type="text" name="noOfNurses" style="width: 28%;font-size: 15px;"
                         value="${hospital?.noOfNurses}" onkeypress="validateIsNumber(event)"/>
              </div>
                </div>


              <div><span class="name"
                         style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No's of Beds</span>
             <div class="field">      <input placeholder="Enter Number" type="text" name="noOfBeds" style="width: 28%;font-size: 15px;"
                         value="${hospital?.noOfBeds}" onkeypress="validateIsNumber(event)"/>
              </div>
                </div>
          </g:if>
          <div><span class="name"
                     style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No's of Cases Treated(Male)</span>
           <div class="field">    <input placeholder="Enter Number" type="text" name="noOfMaleCasesTreated"
                     style="width: 28%;font-size: 15px;" value="${hospital?.noOfMaleCasesTreated}"
                     onkeypress="validateIsNumber(event)"/>
          </div>
            </div>

          <div><span class="name"
                     style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">No's of Cases Treated(Female)</span>
         <div class="field">      <input placeholder="Enter Number" type="text" name="noOfFemaleCasesTreated"
                     style="width: 28%;font-size: 15px;" value="${hospital?.noOfFemaleCasesTreated}"
                     onkeypress="validateIsNumber(event)"/>
          </div>
            </div>


          <div>
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
                  <g:link controller="healthDataCollection" action="main">
                      <input class="buttonClass" type="button" value="Back">
                  </g:link>
              </div>
      </g:form>
            </div>
  </div>
  </body>
</html>