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

    String notif = request.getParameter("notif");
    String fail = request.getParameter("fail");
      if(action != null && action.equals("addAptk")){
         

            Apotek fr = new Apotek();
            fr.setRev(request.getParameter("rev"));
            fr.setIdPasien(request.getParameter("idPasien"));
            fr.setObat(request.getParameter("obat"));
            fr.setJumlahObat(request.getParameter("jumlahObat"));
            fr.setAptk("true");
        
        resp = TambahObat.editObat(fr);
         if(detailPasien.has("jumlahObat5")){
              String maxObat = "yes";
               %>
            <script>
               window.location.href="?act=tambah-obat&id=<%=resp.getID()%>&resp=<%=resp.getKode()%>&fail=ok"
            </script>
    <%
          }

    %>
            <script>
                window.location.href="?act=tambah-obat&id=<%=resp.getID()%>&resp=<%=resp.getKode()%>&notif=ok"
            </script>
    <%
    }
   out.println(action);
%>


<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
    <div class="o-flex-grid--item">
        <h1> Apotek RSGM UNAIR </h1>
        <h2> Tambahkan Obat Pasien </h2>


               <%if(notif != null){%>
                        <p style="background: #28a745; color:white"> Obat berhasil ditambahkan </p>
                    <%}
                    if(fail != null){%>
                        <p style="background: #FF0000; color:white"> Hanya dapat memberikan maksimal 5 obat per pasien!</p>
                    <%}
                    
                    %>

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
        <form class="pure-form pure-form-aligned pure-u-1-3" style="margin-top:25px" method="post" action="?act=tambah-obat&id=<%=(idTemp[1])%>">
            <fieldset >
               <%-- <input type="hidden" name="obat" value="obat" />  --%>
                        <input type="hidden" id="action" name="action" value="addAptk">
                        <input type="hidden" id="idPasien" name="idPasien" value="<%=(idTemp[1])%>">
                        <%-- <input type="hidden" id="id" name="idPasien" value="<%=(idTemp[1])%>"> --%>
                        <input type="hidden"  name="rev" value="<%=detailPasien.getString("_rev")%>">
                        <%-- <input type="hidden"  name="act" value="tambah-obat"> --%>
                <div class="pure-control-group">
                    <label for="aligned-name">Nama Obat:</label>
                     <input type="text" id="obat" name="obat" required=""  />
                 
                </div>
                <div class="pure-control-group">
                    <label for="aligned-password">Jumlah Obat:</label>
                    <input type="text" id="jumlahObat" name="jumlahObat" required=""  />
                </div>
                    <div style="margin-top:25px; font-size:1.2em">
                    <button class="pure-button" type="submit" style="margin-right:5px;">Tambahkan Obat</button>
                    </div>
            </fieldset>
        </form>
        <table class="pure-table pure-table-bordered">
        
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Obat</th>
                    <th>Kuantitas</th>
                </tr>
            </thead>
            <tbody>
            <%-- <% for(int i=1;i<6;i++){
            %> --%>
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
                </tr>
            <%}%>
            </tbody>
        </table>
        <%-- <form class="pure-form pure-form-aligned pure-u-1-3" style="margin-top:25px" method="post" action="?act=tambah-obat&id=<%=(idTemp[1])%>">
            <fieldset > --%>
        <div style="margin-top:25px; font-size:1.2em">
                    <a class="pure-button pure-button-primary" href="?act=tampil-resep&id=<%=(idTemp[1])%>" style="margin-right:5px;" >Tampilkan Resep</a>
                    </div>
            <%-- </fieldset>
        </form> --%>
	</div>
</div>