<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 22/11/12
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>
        <meta name="layout" content="main"/>
    </title>
    <style type="text/css">
    .FileAssetDetailLft {
        float: left;
        width: 35%;
        min-height: 30px;
        padding: 5px;
        font-weight: bold;
    }

    .FileAssetDetailRgt {
        float: left;
        width: 45%;
        min-height: 30px;
        padding: 5px;
    }

    .FileAssetDetail {
        margin-left: 10px;
        width: 100%;
        min-height: 30px;
        font-size: 15px;
    }
    </style>
</head>

<body>
<div align="center">
    <h1>File Export</h1></div>

<div style="border:2px solid #000000;height: 200px ">

    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;">Export Document</h2>
    </div>

    <h2></h2>

    <div style="margin-left: 20px">

        <g:form action="save" enctype="multipart/form-data" onsubmit="return validateForm(this)">
            <br/>
            <br/>

            <div class="FileAssetDetail">
                <span class="FileAssetDetailLft">Select Option</span>
                <span class="FileAssetDetailRgt">
                    <g:select name="option" from="${['PDF','VCS','XLS']}"/>
                </span>
            </div>

            <div class="FileAssetDetail">
                <span class="FileAssetDetailLft">&nbsp;</span>
                <span class="FileAssetDetailRgt">
                    <input type="submit" value="Save"/>
                </span>

            </div>

        </g:form>

    </div>
</div>
</body>
</html>