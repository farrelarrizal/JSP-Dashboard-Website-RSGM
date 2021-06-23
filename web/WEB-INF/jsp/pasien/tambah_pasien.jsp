<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%
    String uniqueIdGenerator = UUID.randomUUID().toString();
    String [] uniqueTemp = uniqueIdGenerator.split("-");
    String uniqueID = uniqueTemp[1].toUpperCase()+uniqueTemp[2].toUpperCase();

    // Tambah Pasien
    String action = null;
    action = request.getParameter("action");
    
    Response resp = null;


    if(action != null && action.equals("tambahPasien")){

        FormTambah ft = new FormTambah();
        ft.setIdPasien(request.getParameter("id-pasien"));
        ft.setNama(request.getParameter("nama-pasien"));
        ft.setJk(request.getParameter("jk"));
        ft.setUmur(request.getParameter("umur-pasien"));
        ft.setTglMasuk(request.getParameter("tgl-masuk-pasien"));
        ft.setDiagnosaMedis(request.getParameter("diagnosa-pasien"));
        ft.setNoIC(request.getParameter("ic-pasien"));
        ft.setAlamat(request.getParameter("alamat-pasien"));
        ft.setNoHp(request.getParameter("hp-pasien"));
        ft.setTitle(request.getParameter("title"));
        ft.setKeluhan(request.getParameter("keluhan"));
        ft.setDokter(request.getParameter("dokter"));
        
        resp = PasienManagement.tambahPasien(ft);
    }
    
%>

<div class="pure-u" style="">
    <h2>Formulir Tambah Data Pasien RSGM UNAIR</h2>
</div>
<%if(action != null && action.equals("tambahPasien")){%>
<p style="background: <%if(resp.getKode()==0){out.print("#28a745");}else{out.print("#cf0000");}%>;color:white"><b><%=resp.getPesan()%></b></p>
<%}%>
<div class="pure-u-">
<form class="pure-form pure-form-aligned" method="post" action="?act=tambahpasien">
    <fieldset>
        <input type="hidden" id="id-pasien" name="action" value="tambahPasien">
        <input type="hidden" id="id-pasien" name="id-pasien" value="<% out.print(uniqueID) ; %>">
        <div class="pure-control-group">
            <label for="nama-pasien">Nama Pasien</label>
                <select required id="multi-state" name="title" class="pure-input-1-8">
                    <option>Tn.</option>
                    <option>Ny.</option>
                    <option>An.</option>
                </select>
            <input type="text" autocomplete="off" id="nama-pasien" name="nama-pasien" placeholder="masukkan nama" class="pure-input-1-4" required />
        </div>
        <div class="pure-control-group ">
            <label for="jenis-kelamin">Jenis Kelamin</label>
            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                <option>Laki - Laki</option>
                <option>Perempuan</option>
            </select>
        </div>
        <div class="pure-control-group">
            <label for="umur-pasien">Umur</label>
            <input type="number" autocomplete="off" id="umur-pasien" name="umur-pasien" placeholder="masukkan umur" class="pure-input-1-4  "required />
        </div>
        <div class="pure-control-group">
            <label for="tgl-masuk-pasien">Tanggal Masuk</label>
            <input type="date" id="tgl-masuk-pasien" name="tgl-masuk-pasien"  class="pure-input-1-4" required />
        </div>
        <div class="pure-control-group">
            <label for="dokter">Nama Dokter</label>
            <input type="text" autocomplete="off" id="dokter" name="dokter" placeholder="masukkan nama dokter" class="pure-input-1-4" required />
        </div>
        <div class="pure-control-group">
            <label for="keluhan">Keluhan Pasien</label>
            <textarea class="pure-input-1-4" autocomplete="off" id="keluhan" name="keluhan" placeholder="Masukkan keluhan pasien ..." required></textarea>
        </div>
        <div class="pure-control-group">
            <label for="diagnosa-pasien">Diagnosa Medis</label>
            <textarea class="pure-input-1-4" autocomplete="off" id="diagnosa-pasien" name="diagnosa-pasien" placeholder="Masukkan diagnosa..." ></textarea>
        </div>
        <div class="pure-control-group">
            <label for="no-IC">No Informed Consent</label>
            <input type="text" id="no-IC" name="ic-pasien" autocomplete="off" placeholder="masukkan No Informed Consent" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group">
            <label for="alamat-pasien">Alamat Pasien</label>
            <input type="text" id="alamat-pasien" name="alamat-pasien" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
        </div>
        <div class="pure-control-group">
            <label for="hp-pasien">No HP Pasien</label>
            <input type="text" id="hp-pasien" name="hp-pasien" autocomplete="off" placeholder="masukkan no hp" class="pure-input-1-4"required />
        </div>
        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
        <a href="?act=pasien" style=" background-color:#fdca40" class="pure-button ">Batal</a>
    </fieldset>
</form>
</div>
