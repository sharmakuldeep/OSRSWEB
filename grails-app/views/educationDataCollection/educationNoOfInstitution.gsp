
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta content="main" name="layout">

      <style type="text/css">
        /*.name{*/
            /*float: right;*/
            /*font-size: 15px;*/
            /*white-space:normal;*/
            /*line-height:20px;*/
            /*width: 70%;*/

        /*}*/
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
      <g:render template="/layouts/dataInfo" /><br>
      <h2>Education Form :No Of Institution</h2>

      <div style="padding: 20px;border: 2px solid black">
      <g:form controller="educationDataCollection" action="educationSave">
          <div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Pre-Primary School</span>
                  <div class="field">
                       <input  placeholder="Enter Number" type="text" name="edu5" value="${education?.edu5}"  style="width: 28%" onkeypress="validateIsNumber(event)" />
                  </div>
              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Primary School</span>
                  <div class="field">
                      <input placeholder="Enter Number" type="text" name="edu6" value="${education?.edu6}" style="width: 28%" onkeypress="validateIsNumber(event)" />
                  </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Middle School</span>
                  <div class="field">
                      <input placeholder="Enter Number" type="text" name="edu7" value="${education?.edu7}" style="width: 28%" onkeypress="validateIsNumber(event)" />
                  </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">High School</span>
                  <div class="field">
                     <input placeholder="Enter Number" type="text" name="edu8" value="${education?.edu8}" style="width: 28%" onkeypress="validateIsNumber(event)" />
                  </div>

              </div>
              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Senior Secondary School</span>
                  <div class="field">
                     <input placeholder="Enter Number" type="text" name="edu9" value="${education?.edu9}" style="width: 28%" onkeypress="validateIsNumber(event)" />
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