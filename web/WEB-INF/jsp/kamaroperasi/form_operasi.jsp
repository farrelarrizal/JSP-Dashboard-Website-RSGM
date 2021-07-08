<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.operasi_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%

    String action = null;
    action = request.getParameter("action");
    Response resp = null;
    String id = request.getParameter("id");


    JSONObject cariPasien = KamarOperasi.searchPasien(id);
    String idTemp[] = cariPasien.getString("_id").split("pasien:");

                
    if(action != null && action.equals("assignOperasi")){

            AssignOperasi ao = new AssignOperasi();
            ao.setIdPasien(request.getParameter("idPasien"));
            ao.setNama(request.getParameter("nama"));
            ao.setRev(request.getParameter("rev"));
            ao.setNoKamar(request.getParameter("noKamar"));
            ao.setDokterOperasi(request.getParameter("dokterOperasi"));
            ao.setTglOperasi(request.getParameter("tglOperasi"));
            ao.setOperasi("true");
        
        resp = KamarOperasi.assignKamar(ao);
    %>
        <script>
            window.location.href="?act=form-kamar-operasi&id=<%=resp.getID()%>"
        </script>
    <%
    }
%>

<h2>Assign Kamar Operasi</h2>
<form class="pure-form pure-form-aligned" method="post" action="?act=form-kamar-operasi&id=<%=(idTemp[1])%>&assign=OK">
    <fieldset>
        <input type="hidden" id="action" name="action" value="assignOperasi">
        <div class="pure-control-group ">
            <label for="idPasien">ID Pasien</label>
            <input type="text" id="idPasien" name="idPasien" autocomplete="off" readonly class="pure-input-1-4" value="<%=(idTemp[1])%>" />
        </div>
        <div class="pure-control-group ">
            <label for="nama">Nama Pasien : </label>
            <input type="text" id="nama" name="nama" autocomplete="off" readonly class="pure-input-1-4" value="<%=(cariPasien.getString("nama"))%>" />
        </div>
        <input type="hidden" name="rev" value="<%=cariPasien.getString("_rev")%>" >
        <div class="pure-control-group ">
            <label for="nokamar">No Kamar Operasi</label>
            <input type="text" id="noKamar" name="noKamar" autocomplete="off" placeholder="" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group ">
            <label for="dokter">Dokter Operasi</label>
            <input type="text" id="dokterOperasi" name="dokterOperasi" autocomplete="off" placeholder="" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group">
            <label for="tgloperasi">Tanggal Operasi</label>
            <input type="date" id="tglOperasi" name="tglOperasi"  class="pure-input-1-4" required />
        </div>
        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
        <a href="?act=kamar-operasi" style="background:#ffee07; color: rgb(70, 64, 64)" class="pure-button"><b>Kembali</b></a>
    </fieldset>
</form>