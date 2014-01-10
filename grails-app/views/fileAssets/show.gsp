<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/27/12
  Time: 8:02 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
      <meta name="layout" content="main"/>
     <style type="text/css">
         .ShowFileAssetDetail{
             margin-left: 10px;
             width: 100%;
             min-height: 40px;
             font-size: 15px;
         }
         .ShowFileAssetDetail div.ShowFileAssetDetailLft{
            float: left;
             width: 15%;
             min-height:30px;
             padding: 5px;
             font-weight: bold;
         }
         .ShowFileAssetDetail div.ShowFileAssetDetailRgt{
             float: left;
             width: 80%;
             min-height:30px;
             padding: 5px;
         }
     </style>
  </head>
  <body>
  <div>
      <div align="center">
          <h2>My Document</h2>
      </div>
      <div style="border:2px solid #000000; ">
          <div style="width: 100%;background-color: #9999ff;">
              <h2><div style="margin-left:10px;color: #ffffff;font-weight: bold;">Show File( ${fileAssetInstance?.name} )</div></h2>
          </div>
		<div style="min-height:200px;">
			<div class="ShowFileAssetDetail">
				<div class="ShowFileAssetDetailLft">Download :</div>
				<div class="ShowFileAssetDetailRgt">
					<attachments:each bean="${fileAssetInstance}">
						<attachments:icon attachment="${attachment}"/>
						<attachments:downloadLink attachment="${attachment}"/> (${attachment.niceLength})
					</attachments:each>
				</div>
			</div>
			<div class="ShowFileAssetDetail">
				<div class="ShowFileAssetDetailLft">Name :</div>
				<div class="ShowFileAssetDetailRgt">${fileAssetInstance?.name}</div>
			</div>

			<div class="ShowFileAssetDetail" >
				<div class="ShowFileAssetDetailLft">Comment :</div>
				<div class="ShowFileAssetDetailRgt">${fileAssetInstance?.comment}</div>
			</div>
            <g:if test="${fileAssetInstance?.share.size()!=0}">
                <div class="ShowFileAssetDetail">
                    <div class="ShowFileAssetDetailLft">Shared users :</div>
                    <div class="ShowFileAssetDetailRgt">
                        <g:each in="${fileAssetInstance?.share}" var="share">
                            ${share.username}<br>
                        </g:each>
                    </div>
                </div>
            </g:if>

			<div class="ShowFileAssetDetail">
				<div class="ShowFileAssetDetailLft">Date Created :</div>
				<div class="ShowFileAssetDetailRgt">${fileAssetInstance?.dateCreated}</div>
			</div>

            <div class="ShowFileAssetDetail">
                <div class="ShowFileAssetDetailLft">Date Updated :</div>
                <div class="ShowFileAssetDetailRgt">${fileAssetInstance?.lastUpdated}</div>
            </div>
            <br><br><br>
            <g:if test="${fileAssetInstance.user==cUser}">
            <div class="ShowFileAssetDetail">
                    <g:form action="edit" style="float: left;padding: 10px;">
                        <g:hiddenField name="id" value="${fileAssetInstance?.id}"/>
                        <input class="buttonClass" type="submit" value="Edit"/>
                    </g:form>

                    <g:form action="delete" name="delete" style="float: left;padding: 10px;">
                        <g:hiddenField name="id" value="${fileAssetInstance?.id}"/>
                        <input class="buttonClass" type="button" id="delBtn"value="Delete"/>
                    </g:form>
            </div>
                </g:if>
            <div class="ShowFileAssetDetail"></div>

        </div><!--Getting ShowFile_Asset div end here-->
	</div> <!--Getting DocumentRight Div end here-->
</div>


  </body>
</html>