<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.inap_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%
    String id = request.getParameter("id");
    String no = request.getParameter("no");
    String idPasien = request.getParameter("idPasien");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(idPasien);



%>
<h2> Detail Pasien</h2>
<div class="o-flex-grid w-100">
    <div class=" o-flex-grid--item">
<table class="pure-table pure-table-horizontal ">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
            <td class="" ><%=idPasien%></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" > Nama : </th>
            <td> <%=detailPasien.getString("nama")%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Lahir : </th>
            <td> <%=detailPasien.getString("tglLahir")%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Masuk : </th>
            <td> <%=detailPasien.getString("tglDatang")%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Mulai Inap : </th>
            <td> <%=detailPasien.getString("tglInap")%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Dokter Penanggung Jawab : </th>
            <td> <%=detailPasien.getString("dokterPJ")%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Jenis Kamar : </th>
            <td> <%=id.toUpperCase()%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > No Kamar : </th>
            <td> 02 </td>
        </tr>
    </tbody>
</table>
<div style="margin-top:20px">
    <a href="?act=kamar-inap&id=<%=id%>&no=<%=no%>" style="background:#fdca40" class="pure-button"><b>Kembali</b></a>
</div>