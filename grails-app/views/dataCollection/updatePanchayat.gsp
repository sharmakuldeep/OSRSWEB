<%--
  Created by IntelliJ IDEA.
  User: damyant
  Date: 12/4/13
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>

<g:if test="${panchayat?.size()==0||panchayat==null}">
    <g:select from="${panchayat}" name="block" value="" optionKey="code" optionValue="name" style="height:25px"
              noSelection="${['null':'Select Ones...']}" disabled="true" class="selectBox"/>
</g:if>
<g:else>
    <g:select from="${panchayat}" name="block" value="" optionKey="code" optionValue="name" style="height:25px"
              noSelection="${['null':'Select Oneq...']}" onchange="updateVillage(this)" class="selectBox"/>
</g:else>

