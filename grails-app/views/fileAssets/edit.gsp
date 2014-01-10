<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/27/12
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.osrs.FileAsset" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

    <style type="text/css">
         .ShowFileAssetDetail{
            margin-left: 10px;
             width: 100%;
             min-height: 30px;
             font-size: 15px;
         }
         .ShowFileAssetDetailLft{
            float: left;
             width: 15%;
             /*height: 30px;*/
             padding: 5px;
             font-weight: bold;
         }
         .ShowFileAssetDetailRgt{
            float: left;
             width: 80%;
             height: 30px;
             padding: 5px;
         }
     </style>
    <script type="text/javascript">
        function showDiv(d){document.getElementById(d).style.display="block";}
        function hideDiv(d){document.getElementById(d).style.display="none";}
        function validateForm(thisForm) {
            if ((thisForm.name.value).length > 254) {
                alert("Name should less than 255 character")
                return false;
            }
            else if ((thisForm.comment.value).length > 254) {
                alert("Comment should less than 255 character")
                return false;
            }
            return true;
        }
        function visibilityChanged(data) {
            if (data == 'Share') {
                showDiv('share');
            } else {
                hideDiv('share');
            }
        }
        $(document).ready(function() {
            hideDiv('share');
            if (${fileAssetInstance?.ownerGroup=='Share'}) {
                showDiv('share');
            }
        });
    </script>
</head>

<body>
<div>
    <div align="center">
        <h2>My Document</h2>
    </div>
    <div style="border:2px solid #000000; ">
          <div style="width: 100%;background-color: #9999ff;">
              <h2><span style="margin-left:10px;color: #ffffff;font-weight: bold;">Edit File( ${fileAssetInstance?.name} )</span></h2>
          </div>
        <g:form method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
            <g:hiddenField name="id" value="${fileAssetInstance?.id}"/>
            <g:hiddenField name="version" value="${fileAssetInstance?.version}"/>

		<div>
            <div class="ShowFileAssetDetail" style="min-height: 100px;overflow: hidden;">
				<span class="ShowFileAssetDetailLft">Browse file:</span>
				<span class="ShowFileAssetDetailRgt">
					<attachments:each bean="${fileAssetInstance}">
                        <attachments:icon attachment="${attachment}"/>

                        <attachments:downloadLink attachment="${attachment}"/>
                        ( ${attachment.niceLength} )
                        <attachments:deleteLink attachment="${attachment}" label="Delete [X]"
                                                returnPageURI="${createLink(action: actionName, id: fileAssetInstance.id)}"/>
                        <br>
                    </attachments:each>
                    <input type="file" name="${FileAsset.attachmentName}"/>
				</span>
			</div>
            <div class="ShowFileAssetDetail">
				<span class="ShowFileAssetDetailLft">Name :</span>
				<span class="ShowFileAssetDetailRgt">
                    <input type="text" name="name" class="NameTextField" value="${fileAssetInstance?.name}"/>
                </span>
			</div>
            <div class="ShowFileAssetDetail">
				<span class="ShowFileAssetDetailLft">Comment:</span>
                <span class="FileAssetDetailRgt">
                   <textarea name="comment" rows="10" cols="50">${fileAssetInstance?.comment}</textarea>
                </span>

			</div>

			<div class="ShowFileAssetDetail">
				<span class="ShowFileAssetDetailLft">Owner Group :</span>
				<span class="ShowFileAssetDetailRgt">
                     <g:select name="ownerGroup"
                              from="['Public','Private','Share']"
                              value="${fileAssetInstance?.ownerGroup}"
                              onchange="visibilityChanged(this.value)"/>
                </span>
			</div>

            <div class="ShowFileAssetDetail" id="share">
                <span class="ShowFileAssetDetailLft">Share to :</span>
                <span class="FileAssetDetailRgt">
                    <g:select name="share" optionKey="id" optionValue="username" from="${shareTo}" multiple="true"
                              value="${fileAssetInstance?.share}" noSelection="['':'Not Share']" style="height:50px"/>
                </span>
            </div>

            <div class="ShowFileAssetDetail" style="padding: 20px">
                <span class="ShowFileAssetDetailLft" >
                    <g:actionSubmit class="UpdateBtn" action="update" value="Update"/>
            </span>
                <span class="FileAssetDetailRgt">
                  <g:actionSubmit class="DeleteBtn" action="delete" value="Delete"/>
                </span>
            </div>

        </div>

         </g:form>
        </div>

</div>
</body>
</html>