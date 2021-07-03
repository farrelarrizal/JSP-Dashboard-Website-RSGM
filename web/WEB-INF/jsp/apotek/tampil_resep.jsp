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
    out.print(detailPasien);


%>



<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
    <div class="o-flex-grid--item">
        <h1> Apotek RSGM UNAIR </h1>
        <h2> Resep Pasien </h2>

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
       
            <form class="pure-form pure-form-aligned" style="margin-top:25px">
                        <fieldset >
                                <div style="margin-top:25px; font-size:1.2em">
                                 <table class="pure-table pure-table-bordered" style="margin-top : 30px">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Obat</th>
                    <th>Kuantitas</th>
                    <th>Stok dibeli</th>
                    <th>Generate resep</th>
                </tr>
            </thead>
            <tbody>
             <% 
    for(int i=1; i<6;i++){
        if(!detailPasien.has("obat"+i)){
            break;
        }
    %>
                <tr>
                    <td><%=(i)%></td>
                    <td><%=(detailPasien.getString("obat"+i))%> </td>
                    <td><%=(detailPasien.getString("jumlahObat"+i))%></td>
                    <td>
                        <input type="number" id="aligned-name" name="id" size="10" />
                    </td>
                    <td style="text-align:center">
                    <label for="default-remember">
                        <input type="checkbox" id="generate" /> </label>
                    </td>
                </tr>
                    <%}%>
            </tbody>
        </table>
                                <a class="pure-button pure-button-primary" href="?act=cetak-resep" style="margin-top:25px;" >Berikan Resep</a>
                                </div>
                        </fieldset>
                    </form>
	</div>
</div>