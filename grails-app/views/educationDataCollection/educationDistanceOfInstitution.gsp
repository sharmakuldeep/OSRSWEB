<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta content="main" name="layout">

      <style type="text/css">

        .field{
            float: right;
            width: 57%;
            height: 20px;
        }
    </style>
  </head>
  <body>

  <div id="content">
      <div align="center">
           <h1> Department of Economics & Statistics </h1>
       </div>  <br>
      <g:render template="/layouts/dataInfo" />
      <br>
      <h2>Education Form : Distance(in Km) from Institution</h2>
      <div style="padding: 20px;border: 2px solid black">
      <g:form controller="educationDataCollection" action="educationSave">
          <div>
             <div>
                <span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">College with degree course</span>
                <div class="field">
        <input  placeholder="Enter Number" type="text" name="edu10" value="${education?.edu10}" onkeypress="validateIsNumber(event)" />
                </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">College with Master Degree/University</span>
                  <div class="field">
                      <input placeholder="Enter Number" type="text" name="edu11" value="${education?.edu11}" onkeypress="validateIsNumber(event)" />
                  </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Industrial Training Institute (ITI)</span>
                  <div class="field">
                    <input placeholder="Enter Number" type="text" name="edu12" value="${education?.edu12}" onkeypress="validateIsNumber(event)" />
                </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Non-formal education center</span>
                  <div class="field">
                <input placeholder="Enter Number" type="text" name="edu13" value="${education?.edu13}" onkeypress="validateIsNumber(event)" />
                </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Special school for Blind</span>
                  <div class="field">
                <input placeholder="Enter Number" type="text" name="edu14" value="${education?.edu14}" onkeypress="validateIsNumber(event)" />
                </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Special school for Mentally retarded</span>
                  <div class="field">
                <input placeholder="Enter Number" type="text" name="edu15" value="${education?.edu15}" onkeypress="validateIsNumber(event)" />
                </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Vocational training center/school</span>
                  <div class="field">
                <input placeholder="Enter Number" type="text" name="edu16" value="${education?.edu16}" onkeypress="validateIsNumber(event)" />
                </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Institute for rehabilitation pf disable person</span>
                  <div class="field">
                <input placeholder="Enter Number" type="text" name="edu17" value="${education?.edu17}" onkeypress="validateIsNumber(event)" />
                </div>

              </div>

              <div>
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
                  <g:link controller="educationDataCollection" action="main">
                      <input class="buttonClass" type="button" value="Back">
                  </g:link>
              </div>

          </div>
      </g:form>
       </div>
  </div>
  </body>
</html>