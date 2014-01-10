<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/23/12
  Time: 5:43 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main" />
      <style type="text/css">
          .listElement{
              padding: 10px;
              font-size: 15px;
              font-weight: bold;

          }
      </style>

  </head>
  <body>
       <div align="center">
         <h1> Department of Economics & Statistics </h1>
       </div>  <br>
      %{--<h3>Village:${village.name}</h3><br>--}%
        <g:render template="/layouts/dataInfo" />
        <h2>Health And Family Welfare</h2>
        <div style="padding: 20px;border: 2px solid black" >

          <div class="listElement">
              <g:link class="nodffect" action="birthData" controller="healthDataCollection">
              <span class="name name1" >Birth</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="deathData" controller="healthDataCollection">
              <span class="name name1" >Death</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="maternalMortality" controller="healthDataCollection">
              <span class="name name1" >Maternal Mortality</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Govt. Hospitals',id:'govHospitals',c1:c1]">
              <span class="name name1" >Govt. Hospitals </span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Govt. Dispensaries',id:'govDispensaries',c1:c1]">
              <span class="name name1" >Govt. Dispensaries </span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Primary Health Centers',id:'primHealthCenter',c1:'abc']">
              <span class="name name1" >Primary Health Centers </span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Sub-Centers',id:'subCenter']">
              <span class="name name1" >Sub-Centers </span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Community Health Centers',id:'commHealthCenter']">
              <span class="name name1" >Community Health Centers</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Family Welfare Centers',id:'familyWelCenter']">
              <span class="name name1" >Family Welfare Centers</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Ayurvedic Centers',id:'ayurCenter']">
              <span class="name name1" >Ayurvedic Centers</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="hospitalData" controller="healthDataCollection" params="[hospital:'Homeopathic Centers',id:'homeoCells']">
              <span class="name name1" >Homeopathic Centers</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="others" controller="healthDataCollection" params="[hospital:'Other Centers',id:'otherCenters']">
              <span class="name name1" >Other Centers</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="healthLastPage" controller="healthDataCollection" params="[id:'NursesNos',head:'Nurses Nos']">
              <span class="name name1" >Nurses No's</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="healthLastPage" controller="healthDataCollection" params="[id:'fwp',head:'Family Welfare Programme']">
              <span class="name name1" >Family Welfare Programme</span>
              <span class="arrow"></span>
              </g:link>
          </div>

          <div class="listElement">
              <g:link class="nodffect" action="healthLastPage" controller="healthDataCollection" params="[id:'pip',head:'Performance of immunization Programme']">
              <span class="name name1" >Performance of immunization Programme</span>
              <span class="arrow"></span>
              </g:link>
          </div>
        </div>


    </div>


  </body>
</html>