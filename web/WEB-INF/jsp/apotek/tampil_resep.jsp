
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
    
            Apotek fr = new Apotek();
            fr.setRev(request.getParameter("rev"));
            fr.setIdPasien(request.getParameter("idPasien"));
            fr.setJumlahBeli1(request.getParameter("jumlahBeli1"));
            fr.setJumlahBeli2(request.getParameter("jumlahBeli2"));
            fr.setJumlahBeli3(request.getParameter("jumlahBeli3"));
            fr.setJumlahBeli4(request.getParameter("jumlahBeli4"));
            fr.setJumlahBeli5(request.getParameter("jumlahBeli5"));
            fr.setJumlahBeli6(request.getParameter("jumlahBeli6"));
            fr.setGenerate1(request.getParameter("generate1"));
            fr.setGenerate2(request.getParameter("generate2"));
            fr.setGenerate3(request.getParameter("generate3"));
            fr.setGenerate4(request.getParameter("generate4"));
            fr.setGenerate5(request.getParameter("generate5"));
            fr.setGenerate6(request.getParameter("generate16"));
            fr.setRsp("true");
        
        resp = TambahObat.editResep(fr);
  
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
                        <input type="number"  id="jumlahBeli<%=(i)%>" name="jumlahBeli<%=(i)%>" value = "<%=detailPasien.getString("jumlahBeli"+i)%>" />
                    </td>
                    <td style="text-align:center">
                    <label for="default-remember">
                       <%-- <button class="pure-button" type="submit" style="margin-right:5px;">Berikan Resep</button> --%>
                        <input type="checkbox" id="generate<%=(i)%>" name="generate<%=(i)%>" /> </label>
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
                     <div style="margin-top:25px; font-size:1.2em">
                    <a class="pure-button pure-button-primary" href="?act=cetak-faktur&id=<%=(idTemp[1])%>" style="margin-right:5px;" >Cetak Faktur</a>
                    </div>
                      <div style="margin-top:25px; font-size:1.2em">
                    <a class="pure-button pure-button-primary" href="?act=cetak-resep&id=<%=(idTemp[1])%>" style="margin-right:5px;" >Cetak Resep</a>
                    </div>
	</div>
</div>
