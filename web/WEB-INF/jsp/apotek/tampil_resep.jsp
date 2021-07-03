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

 if(action != null && action.equals("addRsp")){
     int j =1;
     while(detailPasien.has("obat"+j)){

            Apotek fr = new Apotek();
            fr.setRev(request.getParameter("rev"));
            fr.setIdPasien(request.getParameter("idPasien"));
            fr.setJumlahBeli(request.getParameter("jumlahBeli"+j));
            fr.setRsp("true");
        
        resp = TambahObat.editResep(fr);
    j++;
    }
    %>
            <script>
                window.location.href="?act=tampil-resep&id=<%=resp.getID()%>&resp=<%=resp.getKode()%>"
            </script>
    <%
 }
   
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
       
            <form class="pure-form pure-form-aligned" style="margin-top:25px" method="post" action="?act=tampil-resep&id=<%=(idTemp[1])%>">
                        <fieldset >
                        <input type="hidden" id="action" name="action" value="addRsp">
                        <input type="hidden" id="idPasien" name="idPasien" value="<%=(idTemp[1])%>">
                        <%-- <input type="hidden" id="id" name="idPasien" value="<%=(idTemp[1])%>"> --%>
                        <input type="hidden"  name="rev" value="<%=detailPasien.getString("_rev")%>">
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
                        <input type="number" id="jumlahBeli<%=(i)%>" name="jumlahBeli<%=(i)%>"  />
                    </td>
                    <td style="text-align:center">
                    <label for="default-remember">
                       <%-- <button class="pure-button" type="submit" style="margin-right:5px;">Berikan Resep</button> --%>
                        <input type="checkbox" id="generate" /> </label>
                    </td>
                </tr>
                    <%}%>
            </tbody>
        </table>
                    <div style="margin-top:25px; font-size:1.2em">
                    <button class="pure-button" type="submit" style="margin-right:5px;">Berikan Resep</button>
                    </div>
                                </div>
                        </fieldset>
                    </form>
	</div>
</div>