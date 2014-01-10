<%--
  Created by IntelliJ IDEA.
  User: Aman
  Date: 6/16/12
  Time: 12:27 PM
  To change this template use File | Settings | File Templates.
--%>

<h3>
    <div style="float: left;font-weight: bold;width:200px">Village:${village.name}</div>

       <div style="float: left;font-weight: bold;width:200px">Gram Panchayat:${village?.gramPanchayat?.name}</div>

    <div style="float: left;font-weight: bold;width:200px">Block:${village?.gramPanchayat?.block?.name}</div>

    <div style="float: left;font-weight: bold;width:200px">District:${village?.gramPanchayat?.block?.district?.name}</div>

    <div style="float: left;font-weight: bold;width:200px">State:${village?.gramPanchayat?.block?.district?.state?.name}</div>

</h3><br>

<h3>
    <div style="float: left;font-weight: bold;width:200px">Year:${year}</div>

    <div style="float: left;width:200px;font-weight: bold;">Month:${month}</div>
</h3><br>