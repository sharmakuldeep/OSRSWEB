<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/22/12
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"/>
      <g:javascript library="prototype" />
      %{--<script src="${resource(dir:'js',file:'dataCollection.js')}" />--}%

      <script type="text/javascript"
              src="${resource(dir: 'js', file: 'dataCollection.js')}"></script>
      <script type="text/javascript">

      </script>
      <style type="text/css">

    .left {
        width: 200px;
        height: 70px;
        font-size: 15px;
        font-weight: bold;
    }

    .right {
        width: 400px;
        height: 80px;
    }

        .selectBox{
            height: 25px;
            font-size: 15px;
            width: 200px
        }
    </style>
  </head>
  <body>
        <h1>Data Collection</h1>
     <g:form action="savePrimaryInfo"  onsubmit="return validateFormDc(this);">
         <input type="hidden" name="vCode" value="" id="villageCode">
         <table  border='1px solid black' style="background-color: #f5f5dc;">
             <tr>
                 <td>
                     <table>
                         <tr>
                             <td class="left">
                                 Select State
                             </td>
                             <td class="right">
                                 <g:if test="${state}">
                                      <select  name="state" style="height:25px" class="selectBox" disabled="disabled" >
                                          <option value="${state.code}">${state.name}</option>
                                      </select>
                                     <input type="hidden" name="state" value="${state.code}">
                                 </g:if>
                                 <g:elseif test="${!district && !block}">
                                    <g:select from="${states}" name="state" value="" optionKey="code" optionValue="name"
                                           style="height:25px" noSelection="${['null':'Select One...']}"
                                           onchange="updateDist(this)" class="selectBox"/>
                                 </g:elseif>
                                 <g:else>
                                      <select  name="state" style="height:25px" class="selectBox" disabled="disabled" >
                                          <option value="${state.code}">${state.name}</option>
                                      </select>
                                     <input type="hidden" name="state" value="${state.code}">
                                 </g:else>
                             </td>
                         </tr>
                         <tr>
                             <td class="left">
                                 Select District
                             </td>
                             <td class="right">
                                 <div id="district">
                                     <g:if test="${district}">
                                      <select  name="district" style="height:25px" class="selectBox" disabled="disabled" >
                                          <option value="${district.code}">${district.name}</option>
                                      </select>
                                     <input type="hidden" name="district" value="${district.code}">

                                     </g:if>
                                 <g:elseif test="${!block}">
                                    <g:select from="${districts}" name="district" value="" optionKey="code" optionValue="name" style="height:25px"
                                        noSelection="${['null':'Select One...']}" onchange="abc()" class="selectBox"/>
                                 </g:elseif>
                                     %{--<g:select from="${districts}" name="district" value="" optionKey="code" optionValue="name" style="height:25px"
                                        noSelection="${['null':'Select One...']}" onchange="updateBlock(this)" class="selectBox"/>--}%
                                     %{--<g:select from="${states}" name="dist" value="" optionKey="code" optionValue="name"
                                               style="height:25px" noSelection="${['null':'Select One...']}"
                                               disabled="true" class="selectBox"/>--}%
                                 </div>
                             </td>
                         </tr>
                         <tr>
                             <td class="left">
                                 Select Block
                             </td>
                             <td class="right">
                                 <div id="blocks">
                                     <g:if test="${blocks}">
                                         <g:select from="${blocks}" name="block" value="" optionKey="code"
                                                   optionValue="name" style="height:25px"
                                                   noSelection="${['null':'Select One...']}"
                                                   onchange="updatePanchayat(this)" class="selectBox"/>
                                     </g:if>
                                     <g:elseif test="${block}">
                                         <input type="hidden" name="blockCode" value="${block.code}">
                                         <select name="blockCode" id="blockCode" style="height:25px" class="selectBox"
                                                 disabled="disabled" >
                                             <option value="${block.code}">${block.name}</option>

       %{--                                          disabled="disabled">
                                             <option value="${block.code}">${block.name}</option>--}%

                                         </select>
                                     </g:elseif>
                                     <g:else>
                                         <select name="blockCode" style="height:25px" class="selectBox"
                                                 disabled="disabled">
                                             <option>Select One...</option>
                                         </select>
                                     </g:else>
                                    %{-- <g:select from="${states}" name="block" value="" optionKey="code"
                                               optionValue="name" style="height:25px"
                                               noSelection="${['null':'Select One...']}" disabled="true"
                                               class="selectBox"/>--}%
                                 </div>
                             </td>
                         </tr>

                          <tr>
                             <td class="left">
                                 Select Gram Panchayat
                             </td>
                             <td class="right">
                                 <div id="panchayat">
                                     <g:if test="${panchayat}">
                                         <g:select from="${panchayat}" name="panchayat" value="" optionKey="code"
                                                   optionValue="name" style="height:25px"
                                                   noSelection="${['null':'Select One...']}"
                                                   onchange="updateVillage(this)" class="selectBox"/>
                                     </g:if>
                                     <g:elseif test="${block}">
                                         <input type="hidden" name="panchayatCode" value="${panchayat.code}">
                                         <select name="panchayatCode" style="height:25px" class="selectBox"
                                                 disabled="disabled">
                                             <option value="${panchayat.code}">${panchayat.name}</option>
                                         </select>
                                     </g:elseif>
                                     <g:else>
                                         <select name="panchayatCode" style="height:25px" class="selectBox"
                                                 disabled="disabled">
                                             <option>Select Oneq...</option>
                                         </select>
                                     </g:else>
                                    %{-- <g:select from="${states}" name="block" value="" optionKey="code"
                                               optionValue="name" style="height:25px"
                                               noSelection="${['null':'Select One...']}" disabled="true"
                                               class="selectBox"/>--}%
                                 </div>
                             </td>
                         </tr>

                         <tr>
                             <td class="left">
                                 Select Village
                             </td>
                             <td class="right">
                                 <div id="villages">
                                     %{--<input type="hidden" name="villageCode" value="">--}%
                                     <g:if test="${villages}">
                                             <g:select from="${villages}" name="villageCode" value="" optionKey="code"
                                               optionValue="name" style="height:25px"
                                               noSelection="${['null':'Select One...']}" class="selectBox"
                                               onchange="updateVillageCode(this.value)"/>
                                     </g:if>
                                     <g:else>
                                         <select name="villageCode" style="height:25px" class="selectBox"
                                                 disabled="disabled">
                                             <option>Select One...</option>
                                         </select>
                                     </g:else>

                                     %{--<g:select from="${states}" name="village1" value="" optionKey="code"
                                 optionValue="name" style="height:20px;"
                                 noSelection="${['null':'Select One...']}" onchange="updateVillageCode(this.value)" disabled="true" class="selectBox"/>--}%
                                 </div>
                             </td>
                         </tr>
                         <tr>
                             <td class="left">
                                 Select Year
                             </td>
                             <td class="right">
                                  <g:select name="year" from="${startyear..year}" value="${params?.year?:year}" onchange="updateMonth(this.value)" class="selectBox" />
                             </td>
                         </tr>
                         <tr>
                             <td class="left">
                                 Select Month
                             </td>
                             <td class="right">
                                  <select name="month" id="month" class="selectBox"></select>
                             </td>
                         </tr>
                     </table>
                 </td>
             </tr>
             <tr>
                 <td align="center">
                     <div style=" padding:10px;">
                         <input name="Submit input" type="submit" value="Submit Primary Info" style="height: 40px;width: 200px;font-size: 15px;font-weight: bold;"/>
                     </div>

                 </td>
             </tr>
         </table>

  </g:form>
  <script type="text/javascript">
      updateMonth(${year}) ;
      if('${flash.message}'){
        alert('${flash.message}');
    }
  </script>
  </body>
</html>