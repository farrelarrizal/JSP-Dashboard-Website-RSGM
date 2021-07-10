<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.operasi_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%

    String edit = request.getParameter("edit");
    Response resp = null;
    String id = request.getParameter("id");


    JSONObject cariPasien = KamarOperasi.searchPasien(id);
    String idTemp[] = cariPasien.getString("_id").split("pasien:");

                
    if(edit != null && edit.equals("true")){

            AssignOperasi ao = new AssignOperasi();
            ao.setIdPasien(request.getParameter("idPasien"));
            ao.setNama(request.getParameter("nama"));
            ao.setJk(request.getParameter("jk"));
            ao.setUmur(request.getParameter("umur"));
            ao.setRev(request.getParameter("rev"));
            ao.setNoKamar(request.getParameter("noKamar"));
            ao.setDokterOperasi(request.getParameter("dokterOperasi"));
            ao.setTglOperasi(request.getParameter("tglOperasi"));
            ao.setOperasi("true");
        
        resp = KamarOperasi.assignKamar(ao);
    %>
        <script>
            window.location.href="?act=kamar-operasi"
        </script>
    <%
    }
%>

<h2>Edit Kamar Operasi</h2>

<form class="pure-form pure-form-aligned" method="post" action="?act=edit-kamar-operasi&id=<%=(idTemp[1])%>">
    <fieldset>
        <input type="hidden" id="edit" name="edit" value="true">
        <input type="hidden" name="rev" value="<%=cariPasien.getString("_rev")%>" >
        <div class="pure-control-group ">
            <label for="idPasien">ID Pasien</label>
            <input type="text" id="idPasien" name="idPasien" autocomplete="off" readonly class="pure-input-1-4" value="<%=(idTemp[1])%>" />
        </div>
        <div class="pure-control-group ">
            <label for="nama">Nama Pasien : </label>
            <input type="text" id="nama" name="nama" autocomplete="off" readonly class="pure-input-1-4" value="<%=(cariPasien.getString("nama"))%>" />
        </div>
        <div class="pure-control-group ">
            <label for="jk">Jenis Kelamin : </label>
            <input type="text" id="jk" name="jk" autocomplete="off" readonly class="pure-input-1-4" value="<%=(cariPasien.getString("jk"))%>" />
        </div>
        <div class="pure-control-group ">
            <label for="umur">Umur Pasien : </label>
            <input type="text" id="umur" name="umur" autocomplete="off" readonly class="pure-input-1-4" value="<%=(cariPasien.getString("umur"))%>" />
        </div>
        <div class="pure-control-group ">
            <label for="nokamar">No Kamar Operasi</label>
            <input type="text" id="noKamar" name="noKamar" autocomplete="off" placeholder="" class="pure-input-1-4" alue="<%=(cariPasien.getString("noKamar"))%>" />
        </div>
        <div class="pure-control-group ">
            <label for="dokter">Dokter Operasi</label>
            <input type="text" id="dokterOperasi" name="dokterOperasi" autocomplete="off" placeholder="" class="pure-input-1-4" alue="<%=(cariPasien.getString("dokterOperasi"))%>" />
        </div>
        <div class="pure-control-group">
            <label for="tgloperasi">Tanggal Operasi</label>
            <input type="date" id="tglOperasi" name="tglOperasi"  class="pure-input-1-4" alue="<%=(cariPasien.getString("umur"))%>" required />
        </div>
        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
        <a href="?act=kamar-operasi" style="background:#ffee07; color: rgb(70, 64, 64)" class="pure-button"><b>Kembali</b></a>
    </fieldset>
</form>