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
      <g:javascript library="prototype" />
        <script src="${resource(dir:'js',file:'dataCollection.js')}" />
      <script type="text/javascript">

      function disableBlock(){
          var url = '${request.contextPath}' + '/dataCollection/disableBlock';
              myAjax = new Ajax.Updater('blocks', url, {
                          method : "post",
                          onComplete:disableVillage,
                          evalScripts : true
                      });
      }
          function disableVillage(){
          var url = '${request.contextPath}' + '/dataCollection/disableVillage';
              myAjax = new Ajax.Updater('villages', url, {
                          method : "post",
                          evalScripts : true
                      });
      }
%{----}%
      function updateDist(data){
              var url = '${request.contextPath}' + '/dataCollection/updateDist?stateCode=' + data.value;
              myAjax = new Ajax.Updater('distCode', url, {
                          method : "post",
                          onComplete:disableBlock,
                          evalScripts : true
                      });
          }
      function updateBlock(data){
              var url = '${request.contextPath}' + '/dataCollection/updateBlock?distCode=' + data.value;
              myAjax = new Ajax.Updater('blocks', url, {
                          method : "post",
                          onComplete:disableVillage,
                          evalScripts : true
                      });
          }
function updateVillage(data){
              var url = '${request.contextPath}' + '/dataCollection/updateVillage?blockCode=' + data.value;
              myAjax = new Ajax.Updater('villages', url, {
                          method : "post",
                          evalScripts : true
                      });
          }
%{----}%
      </script>
       <script>
        function submitform(code){
//            alert("code"+code);
            document.getElementById('distCode').value=code;
            document.getElementById('stateCode').value=code;
            document.forms["myform"].submit();
        }

    </script>
  </head>
  <body>

    <g:form action="renderingReports" name="myform" onsubmit="return validateFormReport(this)">
        %{--<input type="hidden"  value="" id="stateCode">--}%
    <form name="myform">
         <h2 align="center">Report</h2>
        <table align="center" style="min-width: 1000px; border: 0px none;">
                    <tr>
           <td style="text-align:center;font-weight:bold;">
                <div style="float: left; padding: 20px" align="center">&nbsp;Select Category</div>
                <div style="float: left; padding: 20px" id="category1">
                    <select name="category" id="category" style="height: 25px;font-size: 15px;width: 200px">
                    <option value="edu" >Education</option>
                    <option value="health" >Health And Family Welfare</option>
                    <option value="isf" selected="">Infrastructural Facilities</option>
                </select>
                </div>
            </td>
        </tr>
            <tr>
                <td style="text-align: center;font-weight: bold;">
                <div style="float: left; padding: 20px">Select Year</div>

                <div style="float: left; padding: 20px" id="year">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <g:select name="year" id="year1" from="${startyear..year}"
                                                    value="${params?.year?:year}"    onchange="updateMonth(this.value)" />
                </div>
                <tr>
                <td style="text-align: center;font-weight: bold;">
                <div style="float: left; padding: 20px">Select Month &nbsp;&nbsp;&nbsp;</div>

                <div style="float: left; padding: 20px" id="month1">
                    &nbsp; <select name="month" id="month">
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
                </div>
            </td>
                </tr>
                </td>

            </tr>
            <tr>
               <td style="text-align: center;font-weight: bold;">
                   <div style="float: left; padding: 20px">Select State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </div>
          <div style="float: left; padding: 20px" id="state"><g:select from="${states}" name="stateCode" value="" optionKey="code" optionValue="name"
                                           style="height:25px" noSelection="${['':'Select One...']}"
                                            class="selectBox"/></div>
               </td></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
            <tr></tr>
              <tr>

                  <td  width="50%">
                    &nbsp;&nbsp;&nbsp;  &nbsp;
                      <input name="Submit" style="color: #8a2be2;" type="submit" value="Submit this Info"/>
                      <input type="reset" style="color: #8a2be2;" value="Cancel" onclick="reset1()" />
                  </td>
              </tr>

         </table>
        </form>
        </g:form>

  <script type="text/javascript">
      var cat= $('#category').val();
      var mn=$('#month').val();
      var yr=$('#year1').val();
     updateMonth(${year}) ;
        if('${flash.message}'){
          alert('${flash.message}');
      }
        </script>

     <script type="text/javascript">
         function reset1(){

          $('#category').val('edu');
           $('#year1').val('1990');
           $('#month1').val('January');
           $('#state1').val('Select One');
           $('#dist1').val('Select One');
           $('#block1').val('Select One');
           $('#villages1').val('Select One');
         }


     </script>

  </body>
</html>