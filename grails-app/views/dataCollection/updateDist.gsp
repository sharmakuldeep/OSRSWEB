<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/22/12
  Time: 3:40 PM
  To change this template use File | Settings | File Templates.
--%>

<g:if test="${districts?.size()==0||districts==null}">
    <g:select from="${districts}" name="district" value="" optionKey="code" optionValue="name" style="height:25px"
              noSelection="${['null':'Select One...']}" disabled="true" class="selectBox"/>
</g:if>
<g:else>
    <g:select from="${districts}" name="district" value="" optionKey="code" optionValue="name" style="height:25px"
              noSelection="${['null':'Select One...']}" onchange="updateBlock(this)" class="selectBox"/>
</g:else>

