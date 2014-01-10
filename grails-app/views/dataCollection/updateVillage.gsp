<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 5/22/12
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>

<g:if test="${villages?.size()==0||villages==null}">
    <g:select from="${villages}" name="villageCode" value="" optionKey="code" optionValue="name" style="height:25px"
          noSelection="${['null':'Select One...']}" class="selectBox" disabled="true" />
</g:if>
<g:else>
    <g:select from="${villages}" name="villageCode" value="" optionKey="code" optionValue="name" style="height:25px"
          noSelection="${['null':'Select One...']}" class="selectBox" onchange="updateVillageCode(this.value)"/>
</g:else>

