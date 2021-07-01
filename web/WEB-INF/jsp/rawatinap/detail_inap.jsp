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
        <tr>
            <th style="text-align:right" > Tanggal Lahir : </th>
            <td> 21/Jan/2021 </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Masuk : </th>
            <td> 12/31/2021 </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Mulai Inap : </th>
            <td> 12/31/2029 </td>
        </tr>
        <tr>
            <th style="text-align:right" > Dokter Penanggung Jawab : </th>
            <td> Dr. Syaph </td>
        </tr>
        <tr>
            <th style="text-align:right" > Jenis Kamar : </th>
            <td> VIP </td>
        </tr>
        <tr>
            <th style="text-align:right" > No Kamar : </th>
            <td> 02 </td>
        </tr>
    </tbody>
</table>
<div style="margin-top:20px">
    <a href="?act=kamar-inap&id=1" style="background:#fdca40" class="pure-button"><b>Kembali</b></a>
</div>