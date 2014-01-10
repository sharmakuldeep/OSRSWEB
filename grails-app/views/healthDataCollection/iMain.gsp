<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/21/12
  Time: 4:31 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
           <meta name="layout" content="iwebkit" />
            <title>Department of Economics & Statistics</title>
       <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'iStyle.css')}"/>


  </head>
  <body>
   <div id="topbar">
	<div id="leftnav">
		<g:link controller="home" action="iMain">
            <img alt="home" src="${resource(dir: 'images', file: 'home.png')}" />
        </g:link>
        <g:link controller="home" action="iMain">Home</g:link>
    </div>
	   %{--<div align="center"><span class="graytitle">Education Form 1</span></div>--}%
    <div id="rightnav">
        <g:link action="iLogOut" controller="login">Log out</g:link>
	</div>
    </div>

  <div id="content">
      <div align="center">
           <span class="graytitle"> Department of Economics & Statistics </span>
       </div>  <br>
      <span class="graytitle">Village:${village.name}</span>
      <span class="graytitle">Block:${village.block.name}</span>
      <span class="graytitle">District:${village.block.district.name}</span>
      <span class="graytitle">State:${village.block.district.state.name}</span> <br>
      <span class="graytitle">Year:${year}</span>
      <span class="graytitle">Month:${month}</span><br>
      <span class="graytitle">Health And Family Welfare</span>
      <ul class="pageitem ">

        <li class="store store1" >
            <g:link class="nodffect" action="iBirthData" controller="healthDataCollection">
            <span class="name name1" >Birth</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iDeathData" controller="healthDataCollection">
            <span class="name name1" >Death</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iMaternalMortality" controller="healthDataCollection">
            <span class="name name1" >Maternal Mortality</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Government Hospitals',id:'govHospitals']">
            <span class="name name1" >Government Hospitals </span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Government Dispensaries',id:'govDispensaries']">
            <span class="name name1" >Government Dispensaries </span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Primary Health Centers',id:'primHealthCenter']">
            <span class="name name1" >Primary Health Centers </span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Sub-Centers',id:'subCenter']">
            <span class="name name1" >Sub-Centers </span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Community Health Centers',id:'commHealthCenter']">
            <span class="name name1" >Community Health Centers</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Family Welfare Centers',id:'familyWelCenter']">
            <span class="name name1" >Family Welfare Centers</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Ayurvedic Centers',id:'ayurCenter']">
            <span class="name name1" >Ayurvedic Centers</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHospitalData" controller="healthDataCollection" params="[hospital:'Homeopathic Centers',id:'homeoCells']">
            <span class="name name1" >Homeopathic Centers</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iOthers" controller="healthDataCollection" params="[hospital:'Other Centers',id:'otherCenters']">
            <span class="name name1" >Other Centers</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHealthLastPage" controller="healthDataCollection" params="[id:'NursesNos',head:'Nurses Nos']">
            <span class="name name1" >Nurses Nos</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHealthLastPage" controller="healthDataCollection" params="[id:'fwp',head:'Family Welfare Programme']">
            <span class="name name1" >Family Welfare Programme</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iHealthLastPage" controller="healthDataCollection" params="[id:'pip',head:'Performance of Immunization Programme']">
            <span class="name name1" >Performance of Immunization Programme</span>
            <span class="arrow"></span>
            </g:link>
        </li>


      </ul>


  </div>

   <div id="footer">
<a href="http://www.damyant.com" target="_blank">
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>