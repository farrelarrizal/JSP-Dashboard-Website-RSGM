<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%
    String resp = request.getParameter("resp");
    String action = request.getParameter("resp");
    String name = request.getParameter("nama-pasien");
    String id = request.getParameter("id");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:");  
%>
<div class="box blue">
<h2> Detail Admission Pasien</h2>

                <%if(action != null){%>
                    <p style="background: <%if(action.equals("0")){out.print("#28a745");}else{out.print("#cf0000");}%>;color:white"><b><%if(action.equals("0")){out.print("Berhasil Disimpan");}else{out.print("Gagal Disimpan");}%></b></p>
                <%}%>
<div class="o-flex-grid w-100">
    <div class=" o-flex-grid--item">
<table class="pure-table pure-table-horizontal ">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
            <td class="" ><%= idTemp[1] %></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" > Nama Lengkap Pasien : </th>
            <td> <%=(detailPasien.getString("nama"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Jenis Kelamin Pasien : </th>
            <td> <%=(detailPasien.getString("jk"))%> </td>
        <tr>
            <th style="text-align:right" > Tanggal Kedatangan : </th>
            <td> <%=(detailPasien.getString("tglDatang"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tanggal Konsultasi Terakhir: </th>
            <td> <%=(detailPasien.getString("tglKonsultasi"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Keluhan Pasien : </th>
            <td> <%=(detailPasien.getString("keluhan"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Kondisi Klinis : </th>
            <td> <%=(detailPasien.getString("klinis"))%> </td>
        </tr>
        <tr>
            <th style="text-align:right" > Tensi Pasien : </th>
            <td> <%=(detailPasien.getString("tensi"))%> mmHg 	</td>
        </tr>
        <tr>
            <th style="text-align:right" > Temperatur Pasien : </th>
            <td> <%=(detailPasien.getString("temperature"))%> &deg;C 	</td>
        </tr>
        <tr>
            <th style="text-align:right" > Diagnosa Awal : </th>
            <td> <%=(detailPasien.getString("diagnosa"))%> 	</td>
        </tr>
        <tr>
            <th style="text-align:right" > Alasan Diagnosa : </th>
            <td> <%=(detailPasien.getString("alasanDiagnosa"))%>	</td>
        </tr>
        
        <tr>
        </tr>
    
    </tbody>
</table>

<div style="margin-top:20px">
    <a href="?act=main-adms" class="pure-button pure-button-primary"> <b>< Kembali</b></a> | <a href="?act=edit-adms&id=<%=idTemp[1]%>" style="background:#fdca40" class="pure-button"><b>edit</b></a>  | <a href="?act=admission" class="pure-button pure-button-primary"> <b>> Admisi</b></a>
</div>

</div>
</div>
</div>