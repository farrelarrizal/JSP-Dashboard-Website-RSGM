<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%  
    // Get all doc
    String action = null ;
    action = request.getParameter("action");
%>
<h2> Kamar Operasi </h2>
<div style="margin-top:-2%" class="o-flex-grid w-100">
    <div class="o-flex-grid--item">
		<table class="pure-table">
            <a href="?act=form-kamar-operasi" style="background-color:#0062ff" class="pure-button-primary pure-button"> + Tambah data </a>
            <br>
            <br>
            <thead>
                <tr>
                    <th><center>No. Kamar Operasi</center></th>
                    <th><center>Ketersediaan</center></th>
                    <th><center>Dokter</center></th>
                    <th><center>Pasien</center></th>
                    <th><center>Tanggal Operasi</center></th>
                    <th><center>Aksi</center></th>
                </tr>
            </thead>
            <tbody>
                <tr class="pure-table-odd" >
                    <td><center>010</center></td>
                    <td><center>Tersedia</center></td>
                    <td><center>Dr. Budi</center></td>
                    <td><center>Tono</center></td>
                    <td><center>05/16/2020</center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=form-kamar-operasi"><b>Assign</b></a>
                            |
                            <a style="font-size:70% ; color:white ; background-color:#56b9a1" class=" pure-button" href="?act=edit-kamar-operasi"><b>Edit Ruang</b></a>
                            |
                            <a style="font-size:70% ; color:white ; background-color:#b3ae72" class=" pure-button" href="?act=detail-kamar-operasi"><b>Detail Operasi</b></a>
                    </td>
                </tr>
            </tbody>

        </table>
	</div>
</div>