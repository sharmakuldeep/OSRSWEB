<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/18/12
  Time: 3:12 PM
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

      <span class="graytitle">Infrastructural Facilities Forms</span>
      <ul class="pageitem ">



        <li class="store store1" >
            <g:link class="nodffect" action="iDistanceOfNearest" controller="isfDataCollection">
            <span class="name name1" >Distance(in K.M.) to the Nearest</span>
            <span class="arrow"></span>
            </g:link>
        </li>

        <li class="store store1" >
            <g:link class="nodffect" action="iNoOfSW" controller="isfDataCollection" >
            <span class="name name1" >Nos. of Sericulture & Weaving</span>
            <span class="arrow"></span>
            </g:link>
        </li>
        <li class="store store1" >
            <g:link class="nodffect" action="iNoOfCSocieties" controller="isfDataCollection">
            <span class="name name1" >Nos. of Co-operation of Societies</span>
            <span class="arrow"></span>
            </g:link>
        </li>

      </ul>


  </div>

   <div id="footer">
		<a href="http://www.damyant.com" target=_blank>
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>