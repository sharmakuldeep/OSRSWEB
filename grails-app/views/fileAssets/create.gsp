<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/25/12
  Time: 4:05 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.osrs.FileAsset" contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <title>Simple GSP page</title>
      <meta name="layout" content="main"/>
      <style type="text/css">
         .FileAssetDetail{
            margin-left: 10px;
             width: 100%;
             min-height: 30px;
             font-size: 15px;
         }
         .FileAssetDetailLft{
            float: left;
             width: 15%;
             min-height: 30px;
             padding: 5px;
             font-weight: bold;
         }
         .FileAssetDetailRgt{
            float: left;
             width: 80%;
             min-height: 30px;
             padding: 5px;
         }
     </style>
  </head>
  <body>

  <div align="center">
      <h2>MY DOCUMENT</h2>
  </div>
  <div>
      <g:if test="${flash.message}">
				  <div class="success" style="color: #ff0000;">${flash.message}</div>
			  </g:if>
  </div>
  <div style="border:2px solid #000000;height: 400px ">
      <div style="width: 100%;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;">Upload Document</h2>
      </div>
        <h2></h2>
      <div style="margin-left: 20px">

          <g:form action="save" enctype="multipart/form-data" onsubmit="return validateForm(this)">
			<div class="FileAssetDetail">
				<span class="FileAssetDetailLft">Browse file</span>
                <span class="FileAssetDetailRgt">
                   <input type="file" name="${FileAsset.attachmentName}" style="width: 200px;"/>
                </span>

			</div>

			<div class="FileAssetDetail" >
				<span class="FileAssetDetailLft">Name</span>
				<span class="FileAssetDetailRgt">
                    <input type="text" name="name" value="${fileAssetInstance?.name}" style="width: 200px;"/>
				</span>
			</div>

			<div class="FileAssetDetail">
				<span class="FileAssetDetailLft">Comment</span>
                <span class="FileAssetDetailRgt">
                   <textarea name="comment" value="${fileAssetInstance?.comment}" rows="10" cols="50"></textarea>
                </span>

			</div>

            <div class="FileAssetDetail">
				<span class="FileAssetDetailLft">Owner Group</span>
                <span class="FileAssetDetailRgt">
                    <g:select name="ownerGroup"  value="${fileAssetInstance?.ownerGroup}" from="${['Private','Public']}" />
                </span>

			</div>


			<div class="FileAssetDetail">
				<span class="FileAssetDetailLft">&nbsp;</span>
                <span class="FileAssetDetailRgt">
                  <input type="submit" value="Upload"/>
                </span>

			</div>

		</g:form>
      </div>

  </div>




  </body>
</html>