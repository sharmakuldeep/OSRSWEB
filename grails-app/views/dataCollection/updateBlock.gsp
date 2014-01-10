<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/22/12
  Time: 4:07 PM
  To change this template use File | Settings | File Templates.
--%>
<g:if test="${blocks?.size()==0||blocks==null}">
    <g:select from="${blocks}" name="block" id="blockCode" value="" optionKey="code" optionValue="name" style="height:25px"
              noSelection="${['null':'Select One...']}" disabled="true" class="selectBox"/>
</g:if>
<g:else>
    <g:select from="${blocks}" name="block" id="blockCode" value="" optionKey="code" optionValue="name" style="height:25px"
              noSelection="${['null':'Select One...']}" onchange="updatePanchayat(this)" class="selectBox"/>
</g:else>

