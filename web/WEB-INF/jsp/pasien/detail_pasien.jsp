<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%
    String edit = null;
    edit = request.getParameter("edit");
    String name = request.getParameter("nama-pasien");
    String id = null;
    id = request.getParameter("id");
    JSONObject pasien = PasienManagement.cariPasien(id);
    String idTemp[] = pasien.getString("_id").split("pasien:");  
%>

<h2>Detail Pasien</h2>

<%if(edit!= null){%>
<p style="background: <%out.print("#28a745");%>;color:white"><b><%="Data Berhasil di update!"%></b></p>
<%}%>
<table class="pure-table pure-table-horizontal ">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
            <td class="" ><%=(idTemp[1])%></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" class="pure-u-*"  >Nama Pasien :</th>
            <td class="" ><b><%=(pasien.getString("nama"))%><b></td>
        </tr>
        <tr>
            <th style="text-align:right" class="pure-u-*"  >Jenis Kelamin :</th>
            <td class="" ><%=(pasien.getString("jk"))%></td>
        </tr>

        <tr>
            <th style="text-align:right" class="pure-u-*"  >Keluhan Pasien:</th>
            <td class="" ><%=(pasien.getString("keluhan"))%></td>
        </tr>
        <%-- <tr>
            <th style="text-align:right" class="pure-u-*"  >Diagnosa Medis :</th>
            <td class="" ><%=(pasien.getString("diagnosa"))%></td>
        </tr> --%>

        <tr>
            <th style="text-align:right" class="pure-u-*"  >Alamat Pasien :</th>
            <td class="" ><%=(pasien.getString("alamat"))%></td>
        </tr>

    </tbody>

</table>
<div style="margin-top:20px">
    <a href="?act=edit-pasien&id=<%=idTemp[1]%>" style="background:#fdca40" class="pure-button"><b>edit</b></a> | <a href="?act=pasien" class="pure-button pure-button-primary"> <b>< Kembali</b></a>
</div>