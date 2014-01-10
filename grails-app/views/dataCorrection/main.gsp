<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/24/12
  Time: 1:03 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:javascript library="prototype"/>
    <script src="${resource(dir:'js',file:'dataCollection.js')}" />

    <script>


    </script>

    <style type="text/css">

    .left {
        width: 200px;
        height: 50px;
        font-size: 15px;
    }
    input.txt {
        vertical-align: middle;
        width: 20px;
    }

    .right {
        width: 65px;
        height: 50px;
    }

        .selectBox{
            height: 25px;
            font-size: 15px;
            width: 200px
        }
    </style>

</head>

<body>

<div align="center">
    <h1> Data Correction</h1>
</div>

<br>
<g:form action="dataRendering" onsubmit=" return validateForm(this);">

<input type="hidden" name="vCode" value="" id="villageCode">
<table  border='1px solid black' style="background-color: #f5f5dc;">
    <tr>
        <td colspan="2" align="left">
            <table>
                <tr>
                    <td class="left">  Select Category    </td>
                    <td class="right">
                        <select name="category" class="selectBox">
                        <option value="">Select Category...</option>
                        <option value="edu">Education</option>
                        <option value="health">Health And Family Welfare</option>
                        <option value="isf">Infrastructural Facilities</option>
                    </select>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                        <td class="left">Select Year</td>
                        <td class="right">
                            <g:select name="year" from="${startyear..year}" value="${params?.year?:year}" onchange="updateMonth(this.value)" class="selectBox" />
                        </td>

                        <td class="left" style="padding-left: 90px;">Select Month</td>
                        <td class="right">
                            <select name="month" id="month" class="selectBox">
                                <option value="1">January</option>
                                <option value="2">February</option>
                                <option value="3">March</option>
                                <option value="4">April</option>
                                <option value="5">May</option>
                                <option value="6">June</option>
                                <option value="7">July</option>
                                <option value="8">August</option>
                                <option value="9">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                        </td>
                    </tr>
            </table>

        </td>
    </tr>

    <tr>
        <td width="500px">
                <table>
                    <tr>
                        <td colspan="2" height="50px"><b>Find Village by Hierarchy</b></td>
                    </tr>
                    <tr>
                        <td class="left">Select State</td>
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
                           %{-- <g:select from="${states}" name="state" value="" optionKey="code" optionValue="name"
                                      style="height:25px;" noSelection="${['null':'Select One...']}"
                                      onchange="updateDist(this)" class="selectBox"/>--}%
                        </td>
                    </tr>
                    <tr>
                        <td class="left">Select District</td>
                        <td class="right" id="district">
                           %{-- <div id="district">--}%
                                     <g:if test="${district}">
                                      <select  name="district" style="height:25px" class="selectBox" disabled="disabled" >
                                          <option value="${district.code}">${district.name}</option>
                                      </select>
                                     <input type="hidden" name="district" value="${district.code}">

                                     </g:if>
                                 <g:elseif test="${!block}">
                                    <g:select from="${districts}" name="district" value="" optionKey="code" optionValue="name" style="height:25px"
                                        noSelection="${['null':'Select One...']}" onchange="updateBlock(this)" class="selectBox"/>
                                 </g:elseif>
                            %{--<g:select from="${states}" name="dist" value="" optionKey="code" optionValue="name"
                                      style="height:20px" noSelection="${['null':'Select One...']}"
                                      disabled="true" class="selectBox"/>--}%
                        </td>
                    </tr>
                    <tr>
                        <td class="left">Select Block</td>
                        <td class="right" id="blocks">
                            <g:if test="${blocks}">
                                         <g:select from="${blocks}" name="block" value="" optionKey="code"
                                                   optionValue="name" style="height:25px"
                                                   noSelection="${['null':'Select One...']}"
                                                   onchange="updatePanchayat(this)" class="selectBox"/>
                                     </g:if>
                                     <g:elseif test="${block}">
                                         <input type="hidden" name="blockCode" value="${block.code}">
                                         <select name="blockCode" style="height:25px" class="selectBox"
                                                 disabled="disabled">
                                             <option value="${block.code}">${block.name}</option>
                                         </select>
                                     </g:elseif>
                                     <g:else>
                                         <select name="blockCode" style="height:25px" class="selectBox"
                                                 disabled="disabled">
                                             <option>Select One...</option>
                                         </select>
                                     </g:else>
                            %{--<g:select from="${states}" name="block" value="" optionKey="code" optionValue="name"
                                      style="height:20px" noSelection="${['null':'Select One...']}"
                                      disabled="true" class="selectBox" />--}%
                        </td>
                    </tr>




                     <tr>
                        <td class="left">Select Gram Panchayat</td>
                        <td class="right" id="panchayat">
                            <g:if test="${panchayat}">
                                         <g:select from="${panchayat}" name="block" value="" optionKey="code"
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
                                             <option>Select One...</option>
                                         </select>
                                     </g:else>
                            %{--<g:select from="${states}" name="block" value="" optionKey="code" optionValue="name"
                                      style="height:20px" noSelection="${['null':'Select One...']}"
                                      disabled="true" class="selectBox" />--}%
                        </td>
                    </tr>

                    <tr>
                        <td class="left">Select Village</td>
                        <td class="right" id="villages">
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
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td>&nbsp;</td></tr>
                </table>
        </td>
        <td width="500px"  VALIGN="top">
            <table width="100%">
                <tr>
                    <td colspan="2" height="50px"><b>Find Village By Name</b></td>
                </tr>
                <tr>
                    <td colspan="2">
                            <table width="100%">
                                <tr>
                                    <td class="left">
                                        Enter Village Name:
                                    </td>
                                    <td class="right">
                                        <input type="text" name="village2" id="village2" onBlur="if (this.value == '') {
                                            this.value = 'Village Name';
                                        }" onfocus="if (this.value == 'Village Name') {
                                            this.value = '';
                                        }" value="Village Name" class="selectBox" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                       <input type="button" value="Find Village" onclick="findVillage()">
                                    </td>
                                </tr>
                            </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                            <table width="100%">
                                <tr>
                                    <td class="left">Select Village :</td>
                                    <td class="right" id="resultVillage">
                                        <select name="village2" class="selectBox" onchange="updateVillageCode(this.value)" >
                                            <option>Select Village</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td >
                                        <div id="villageDes"></div>
                                    </td>
                                </tr>
                            </table>
                    </td>
                </tr>

            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <input name="submit" type="submit" value="Submit This Info" style="height: 50px;width: 200px;font-size: 15px;font-weight: bold;"/>
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