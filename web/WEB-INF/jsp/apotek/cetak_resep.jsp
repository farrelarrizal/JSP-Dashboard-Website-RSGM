<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.apotek_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
    String action = null;
    action = request.getParameter("action");
    Response resp = null;
    String id = request.getParameter("id");

    JSONObject detailPasien = TambahObat.searchPasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:");  


%>

<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
    <div class="o-flex-grid--item">
        <h1> Apotek RSGM UNAIR </h1>
        <h2> Cetak Resep</h2>
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
                        <td> <%=(detailPasien.getString("nama"))%> </td>
                    </tr>
        </table>


        <table class="pure-table pure-table-bordered" style="margin-top : 30px">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Obat</th>
                    <th>Kuantitas</th>
                </tr>
            </thead>
            <tbody>
             <% 
    for(int i=1; i<7;i++){
        if(!detailPasien.has("obat"+i)){
            break;
        }
        if(detailPasien.has("generate"+i)){
           
    %>
                <tr>
                    <td><%=(i)%></td>
                    <td><%=(detailPasien.getString("obat"+i))%> </td>
                    <td><%=(detailPasien.getString("jumlahObat"+i))%></td>
                </tr>
                    <%}}%>
            </tbody>
        </table>

 </div> 
 </div> 