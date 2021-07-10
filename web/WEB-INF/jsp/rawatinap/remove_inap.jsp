<%
    String resp = request.getParameter("resp");
    String name = request.getParameter("nama-pasien");
    String id = request.getParameter("id");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:");  
%>

<h2> Detail Pasien</h2>
<div class="o-flex-grid w-100">
    <div class=" o-flex-grid--item">
<table class="pure-table pure-table-horizontal ">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
            <td class="" >BBCSDA</td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" > Nama : </th>
            <td> Budi </td>
        </tr>
    </tbody>
</table>
<div style="margin-top:20px">
    <a href="" style="background:#fdca40" class="pure-button"><b>Hapus</b></a>
</div>