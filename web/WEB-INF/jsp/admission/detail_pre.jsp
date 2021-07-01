<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%
    String resp = request.getParameter("resp");
    String name = request.getParameter("nama-pasien");
    String id = request.getParameter("id");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:");  
%>

<%if(resp != null && resp.equals("0")){%>
    <p style="background: #28a745 ; color:white"><b>Data Berhasil Disimpan!</b></p>
<%}else if (resp != null && resp.equals("-1")){%>
    <p style="background: #cf0000 ; color:white"><b>Data Gagal Disimpan!</b></p>
<%}%>
<div class="box blue">
<h2> Detail Pre - Admission Pasien</h2>
<div class="o-flex-grid w-100">
    <div class=" o-flex-grid--item">
<table class="pure-table pure-table-horizontal ">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
            <td class="" > <%=(idTemp[1])%> </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" > Tanggal Kedatangan : </th>
            <td> <%=(detailPasien.getString("tglDatang"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Keluhan Pasien : </th>
            <td> <%=(detailPasien.getString("keluhan"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Asal RS Rujukan : </th>
            <td> <%=(detailPasien.getString("asalRujukan"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Nama Lengkap Pasien : </th>
            <td><b> <%=(detailPasien.getString("nama"))%></b></td>
        </tr>
        <tr>
            <th style="text-align:right" > Jenis Kelamin Pasien : </th>
            <td> <%=(detailPasien.getString("jk"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Lahir Pasien: </th>
            <td> <%=(detailPasien.getString("tglLahir"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > NIK Pasien : </th>
            <td> <%=(detailPasien.getString("nik"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Alamat Pasien : </th>
            <td> <%=(detailPasien.getString("alamat"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > No HP Pasien : </th>
            <td> <%=(detailPasien.getString("noHP"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Pembayaran : </th>
            <td> <%=(detailPasien.getString("pembayaran"))%> </td>
        </tr>
    </tbody>
</table>

<div style="margin-top:20px">
    <a href="?act=admission" class="pure-button pure-button-primary"> <b>< Kembali</b></a> | <a href="?act=edit-pre&id=<%=(idTemp[1])%>" style="background:#fdca40" class="pure-button"><b>edit</b></a>  | <a href="?act=form-adms&id=<%=(idTemp[1])%>" class="pure-button pure-button-primary"> <b>> Admisi</b></a>
</div>

</div>
</div>
</div>