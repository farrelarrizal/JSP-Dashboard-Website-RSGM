<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.operasi_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%

    String edit = request.getParameter("edit");
    Response resp = null;
    String id = request.getParameter("id");
    JSONObject cariPasien = KamarOperasi.searchPasien(id);
    String idTemp[] = cariPasien.getString("_id").split("pasien:");
%>

<h2> Detail Kamar Operasi</h2>
<div class="o-flex-grid w-100">
    <div class=" o-flex-grid--item">
<table class="pure-table pure-table-horizontal ">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
            <td class="" ><%=(idTemp[1])%></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" > Nama Pasien : </th>
            <td><%=(cariPasien.getString("nama"))%></td>
        </tr>
        <tr>
            <th style="text-align:right" > Jenis Kelamin : </th>
            <td><%=(cariPasien.getString("jk"))%></td>
        </tr>
        <tr>
            <th style="text-align:right" > No Kamar Operasi : </th>
            <td><%=(cariPasien.getString("noKamar"))%></td>
        </tr>
        <tr>
            <th style="text-align:right" > Dokter : </th>
            <td><%=(cariPasien.getString("dokterOperasi"))%></td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Operasi : </th>
            <td><%=(cariPasien.getString("tglOperasi"))%></td>
        </tr>
    </tbody>
</table>
<div style="margin-top:20px">
    <a href="?act=kamar-operasi" style="background:#fdca40" class="pure-button"><b>Kembali</b></a>
    <a href="?act=delete-operasi&id=<%=idTemp[1]%>" style="background:#df260d; color: rgb(255, 255, 255)" class="pure-button"><b>Delete</b></a>
</div>