<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.rekam_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%
    String resp = request.getParameter("resp");
    String name = request.getParameter("nama-pasien");
    String id = request.getParameter("id");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(id); 
    // String idTemp[] = detailPasien.getString("_id").split("pasien:");
    out.println(detailPasien);
%>
<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
    <div class="o-flex-grid--item">
        <h1> Detail Rekam Medis </h1>

        <table class="pure-table pure-table-bordered">
            <thead>
                <tr>
                    <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
                    <td class="" ><%= idTemp[1] %></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th> Nama Pasien : </th>
                    <td> <%=(detailPasien.getString("nama"))%> </td>
                </tr>
                <tr>
                    <th> Tanggal Kedatangan : </th>
                    <td> <%=(detailPasien.getString("tglDatang"))%> </td>
                </tr>cd
                <tr>
                    <th> Tanggal Lahir : </th>
                    <td> <%=(detailPasien.getString("tglLahir"))%> </td>
                </tr>
                <tr>
                    <th> Jenis Kelamin : </th>
                    <td> <%=(detailPasien.getString("jk"))%> </td>
                </tr>
                <tr>
                    <th> Riwayat Diagnosa : </th>
                    <td> <%=(detailPasien.getString("diagnosa"))%> </td>
                </tr>
                <tr>
                    <th> Riwayat Penanganan : </th>
                    <td> <%=(detailPasien.getString("penanganan"))%> </td>
                </tr>
                <tr>
                    <th> Status Asuransi : </th>
                    <td> <%=(detailPasien.getString("asuransi"))%> </td>
                </tr>  
            </tbody>
        </table>

        <div style="margin-top:10px; font-size:1em">
                    <a class="pure-button pure-button-primary" href="?act=default" style="margin-right:4px;" >Kembali</a>
                    <a style="color:rgb(0, 0, 0) ; background-color:#fffb0a" class="pure-button pure-button-primary" href="?act=edit-rekammedis" style="margin-right:9px;" >Edit</a>
                    <a style="color:rgb(255, 255, 255) ; background-color:#ff0a0a" class="pure-button pure-button-primary" href="?delete-rekammedis" style="margin-right:5px;" >Delete</a>
                    </div>

	</div>
</div>