<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/14/12
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>




<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>

      <meta name="layout" content="iwebkit" />
      <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'iStyle.css')}"/>
       <title>Select Category</title>
       <script type="text/javascript">
           function validateInfo(){
               var check=confirm( 'After Submit You Are Not Able to Edit.\nDo You Want to Continue ?\n\n' )
              if(check) {
                  document.forms["aaa"].submit();
              }

           }
       </script>

  </head>

<body class="applist">
<div id="topbar">

    %{--<div id="leftnav">
        <g:link controller="home" action="iMain"><img alt="home"
                                                        src="${resource(dir: 'iwebkit/demo/images', file: 'home.png')}"/></g:link>
        <g:link controller="home" action="iMain">Home</g:link>

    </div>--}%

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

    <span class="graytitle">Select Category for Data Collection</span>
    <div align="center">
    <ul class="pageitem">

        <li class="store">
            <g:link class="nodffect" action="iEducation" controller="educationDataCollection">
                <span class="image" style="background-image: url('../images/education.png')">
            </span>
                %{--<span class="comment">Red Hot Chili Peppers</span>--}%
                <span class="name">Education</span>
                %{-- <span class="stars5"></span>
                    <span class="starcomment">151		Ratings</span>--}%
                <span class="arrow"></span>
                </g:link>
        </li>
        <li class="store">
            <g:link class="nodffect" action="iMain" controller="healthDataCollection">
            %{--<a class="noeffect" href="http://itunes.apple.com/us/album/blood-sugar-sex-magik-bonus-track/id309577455">--}%
                <span class="image" style="background-image: url('../images/health.jpg')">
            </span>
                %{--<span class="comment">Red Hot Chili Peppers</span>--}%
                <span class="name">Health and Family Welfare</span>
                %{-- <span class="stars5"></span>
                    <span class="starcomment">151		Ratings</span>--}%
                <span class="arrow"></span>
            %{--</a>--}%
                </g:link>
        </li>
        <li class="store">
            <g:link class="nodffect" action="iMain" controller="isfDataCollection">
                <span class="image" style="background-image: url('../images/infra.jpg')">
            </span>
                %{--<span class="comment">Red Hot Chili Peppers</span>--}%
                <span class="name">Infrastructural Facilities</span>
                %{-- <span class="stars5"></span>
                    <span class="starcomment">151		Ratings</span>--}%
                <span class="arrow"></span>
                </g:link>
        </li>

    </ul>

        <ul class="pageitem" style="align:center">
        <li class="store " style="height: 30px">
                  <span class="submitBtn" style="margin-left: 0px;" >
                      <div align="center" style="padding: 5px;font-size: 20px" >Data Collection is In-Progress</div></span>


            </li>
            <li class="store " style="height: 30px">
                  <span class="image" style="background-image: url('../images/loading.gif');width: 100%;"></span>

            </li>


    </ul>
    <ul class="pageitem" style="width: 90%;align:center">

          <li class="store " style="height: 80px">
              <g:form action="iSubmitDataCollectionInformation" controller="dataCollection" name="aaa">
                  <span class="submitBtn" style="margin-left: 0px;" >
                      <div align="center" style="padding: 20px" onclick="validateInfo();">Submit This Data Collection Report</div>
                  </span>
              </g:form>
            </li>

    </ul>

     </div>
</div>


  <div id="footer">
		<a href="http://www.damyant.com" target=_blank>
      Copyright © 2012 Damyant - All Rights Reserved
      %{--Confidential and Proprietary <br>Damyant Software Private Limited <br>All Right Reserved--}%
    </a>
  </div>
  </body>
</html>