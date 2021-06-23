<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%  
    String action = request.getParameter("update");
    String id = request.getParameter("id");
    JSONObject pasien = PasienManagement.cariPasien(id);
    String idTemp[] = pasien.getString("_id").split("pasien:");
    Response resp = null;

    
    if(action != null && action.equals("yes")){

        FormTambah fu = new FormTambah();
        fu.setIdPasien(request.getParameter("id-pasien"));
        fu.setNama(request.getParameter("nama-pasien"));
        fu.setJk(request.getParameter("jk"));
        fu.setUmur(request.getParameter("umur-pasien"));
        fu.setTglMasuk(request.getParameter("tgl-masuk-pasien"));
        fu.setDiagnosaMedis(request.getParameter("diagnosa-pasien"));
        fu.setNoIC(request.getParameter("ic-pasien"));
        fu.setAlamat(request.getParameter("alamat-pasien"));
        fu.setNoHp(request.getParameter("hp-pasien"));
        fu.setTitle(request.getParameter("title"));
        fu.setRev(request.getParameter("rev"));
        fu.setDokter(request.getParameter("dokter"));
        fu.setKeluhan(request.getParameter("keluhan"));

        resp = PasienManagement.tambahPasien(fu);

%>
	<script>
		window.location.href="?act=detail-pasien&id=<%=idTemp[1]%>&edit=ok"
	</script>
<%
    }
%>


<div class="pure-u" style="">
    <h2>Formulir Edit Data Pasien RSGM UNAIR</h2>
</div>

<div class="pure-u-">
<form class="pure-form pure-form-aligned" action="?act=edit-pasien&id=<%=idTemp[1]%>" method="post" >
    <fieldset>
        <input type="hidden" id="update" name="rev" value="<%=pasien.getString("_rev")%>" >
        <input type="hidden" id="update" name="id-pasien" value="<%=idTemp[1]%>" >
        <input type="hidden" id="update" name="update" value="yes">
        <div class="pure-control-group">
        <div class="pure-control-group">
            <label for="nama-pasien">Nama Pasien</label>
                <select id="multi-state" name="title" class="pure-input-1-8" >
                    <option value="Tn." <% if(pasien.getString("title").equals("Tn.")){ %> selected="selected" <% } %> >Tn.</option>
                    <option value="Ny." <% if(pasien.getString("title").equals("Ny.")){ %> selected="selected" <% } %> >Ny.</option>
                    <option value="An." <% if(pasien.getString("title").equals("An.")){ %> selected="selected" <% } %> >An.</option>
                    
                </select>
            <input type="text" id="nama-pasien" name="nama-pasien" value="<%=pasien.getString("nama")%>" placeholder="masukkan nama" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group ">
            <label for="stacked-state">Jenis Kelamin</label>
            <select id="stacked-state" name="jk" class="pure-input-1-4" >
                <option value="Laki - Laki"  <% if(pasien.getString("jk").equals("Laki-Laki")){ out.println("selected=\"selected\"") ;} %>  >Laki - Laki</option>
                <option value="Perempuan" <% if(pasien.getString("jk").equals("Perempuan")){ out.println("selected=\"selected\"") ;} %> >Perempuan</option>
            </select>

        </div>
        <div class="pure-control-group">
            <label for="umur-pasien">Umur</label>
            <input type="text" id="umur-pasien" name="umur-pasien" value="<%=pasien.getString("umur")%>" placeholder="masukkan umur" class="pure-input-1-4" />
        </div>
            <label for="dokter">Nama Dokter</label>
            <input type="text" id="dokter" name="dokter" value="<%=pasien.getString("dokter")%>" placeholder="masukkan umur" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group">
            <label for="tgl-masuk-pasien">Tanggal Masuk</label>
            <input type="text" value="<%=pasien.getString("tgl-masuk")%>" name="tgl-masuk-pasien" class="pure-input-1-4" readonly="" />
            
        </div>
        <div class="pure-control-group">
            <label for="keluhan">keluhan Pasien</label>
            <textarea class="pure-input-1-4"   id="keluhan" name="keluhan" ><%=pasien.getString("keluhan")%></textarea>
        </div>
        <div class="pure-control-group">
            <label for="diagnosa-pasien">Diagnosa Medis</label>
            <textarea class="pure-input-1-4"   id="diagnosa-pasien" name="diagnosa-pasien" ><%=pasien.getString("diagnosa")%></textarea>
        </div>
        <div class="pure-control-group">
            <label for="ic-pasien">No. Informed Consent</label>
            <input type="text" id="ic-pasien" name="ic-pasien" value="<%=pasien.getString("no-IC")%>" placeholder="Masukkan No Informed Consent" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group">
            <label for="alamat-pasien">Alamat Pasien</label>
            <input type="text" id="alamat-pasien" value="<%=pasien.getString("alamat")%>" name="alamat-pasien" placeholder="masukkan alamat pasien" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group">
            <label for="hp-pasien">No HP Pasien</label>
            <input type="text" id="hp-pasien" name="hp-pasien" value="<%=pasien.getString("hp-pasien")%>" placeholder="masukkan no hp" class="pure-input-1-4" />
        </div>
        
        <button style="background: #28a745; color: #fff" class="pure-button">update!</button>
        <a href="?act=pasien" style=" background-color:#fdca40" class="pure-button ">Batal</a>
    </fieldset>
</form>
</div>
