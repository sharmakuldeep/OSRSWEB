<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 12:39 PM
  To change this template use File | Settings | File Templates.
--%>

<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 12:26 PM
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

        <h2>Infrastructural Facilities Forms: Distance(in Km) to the nearest</h2>
        <div style="padding: 20px;border: 2px solid black" >
      <g:form controller="isfDataCollection" action="saveData">

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Human Hospital/Dispensary/PHC etc.</span>
         <div class="field">       <input  placeholder="Enter Number" type="text" name="isf3" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf3}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Veterinary Hospital/Dispensary</span>
         <div class="field">       <input  placeholder="Enter Number" type="text" name="isf4" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf4}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Motorable Road(Pucca Road)</span>
           <div class="field">     <input  placeholder="Enter Number" type="text" name="isf5" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf5}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Motorable Road(Semipucca Road)</span>
            <div class="field">    <input  placeholder="Enter Number" type="text" name="isf6" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf6}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Motorable Road(Katcha Road)</span>
           <div class="field">     <input  placeholder="Enter Number" type="text" name="isf7" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf7}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bus Stop</span>
           <div class="field">     <input  placeholder="Enter Number" type="text" name="isf8" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf8}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Post Office</span>
         <div class="field">       <input  placeholder="Enter Number" type="text" name="isf9" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf9}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Railway Station</span>
        <div class="field">        <input  placeholder="Enter Number" type="text" name="isf10" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf10}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Police Station</span>
         <div class="field">       <input  placeholder="Enter Number" type="text" name="isf11" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf11}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Hat/Bazar</span>
            <div class="field">    <input  placeholder="Enter Number" type="text" name="isf12" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf12}" onkeypress="validateIsNumber(event)" />
              </div>
                 </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Name of the day/Days of Hat/Bazar</span>
          <div class="field">      <input  placeholder="Enter Number" type="text" name="isf13" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf13}" onkeypress="validateIsNumber(event)" />
              </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bank(Schedule Bank)</span>
             <div class="field">   <input  placeholder="Enter Number" type="text" name="isf14" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf14}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bank(Regional Rural Bank)</span>
             <div class="field">   <input  placeholder="Enter Number" type="text" name="isf15" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf15}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div><span class="name" style="font-size: 15px;white-space:normal;line-height:20px;width: 70%">Bank(Co-operative Bank)</span>
              <div class="field">  <input  placeholder="Enter Number" type="text" name="isf16" style="width: 28%;font-size: 15px;" value="${infFaciliti?.isf16}" onkeypress="validateIsNumber(event)" />
              </div>
             </div>

              <div>
                  <input class="buttonClass" name="Submit input" type="submit" value="Save"/>
                  <g:link controller="isfDataCollection" action="main">
                      <input class="buttonClass" type="button" value="Back">
                  </g:link>
              </div>
      </g:form>
            </div>
  </div>
  </body>
</html>