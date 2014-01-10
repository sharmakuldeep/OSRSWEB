<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/1/12
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>

<select name="village2" class="selectBox" onchange="updateVillageCode(this.value)">

    <g:if test="${villageList}">
        <option value="">Select One ...</option>
        <g:each in="${villageList}" var="village">
            <option value="${village.code}">${village.name}(Gram Panchayat:${village.gramPanchayat.name})</option>
        </g:each>
    </g:if>
    <g:else>
        <option value="">No village Found</option>
    </g:else>
</select>