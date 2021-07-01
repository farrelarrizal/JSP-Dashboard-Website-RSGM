<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.apotek_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%
    String resp = request.getParameter("resp");
    String name = request.getParameter("nama-pasien");
    String id = request.getParameter("id");
    JSONObject detailPasien = TambahObat.searchPasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:");  

    String action = null;
    action = request.getParameter("update");
    
    Response resp = null;
    JSONObject pasien = null

 if(action != null && action.equals("yes")){

        VarTambahObat ep = new VarTambahObat();
        //ep.setRev(request.getParameter("_rev"));
        ep.setIdPasien(request.getParameter("idPasien"));
        ep.setNama(request.getParameter("nama"));
        ep.setUmur(request.getParameter("umur"));
        ep.setAlamat(request.getParameter("alamat"));
        ep.setDokter(request.getParameter("dokter"));
        ep.setTanggalLahir(request.getParameter("tanggalLahir"));
        ep.setTanggalMasuk(request.getParameter("tanggalMasuk"));
        ep.setPerawatan(request.getParameter("perawatan"));
        ep.setKeluhan(request.getParameter("keluhan"));
        ep.setStatusRawat(request.getParameter("statusRawat"));
        ep.setAsuransi(request.getParameter("asuransi"));


      resp = ApotekManagement.editObat(ep);
        


%>



<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
    <div class="o-flex-grid--item">
        <h1> Apotek RSGM UNAIR </h1>
        <h2> Tambahkan Obat Pasien </h2>

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
        <form class="pure-form pure-form-aligned pure-u-1-3" style="margin-top:25px">
            <fieldset >
                <div class="pure-control-group">
                    <label for="aligned-name">Daftar Obat:</label>
                    <input type="text" id="obat" name="obat"  />
                </div>
                <div class="pure-control-group">
                    <label for="aligned-password">Kuantitas:</label>
                    <input type="text" id="jumlahObat" name="jumlahObat"  />
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
                <tr>
                    <td>1</td>
                    <td>Honda</td>
                    <td>Accord</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Toyota</td>
                    <td>Camry</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Hyundai</td>
                    <td>Elantra</td>
                </tr>
            </tbody>
        </table>
        <div style="margin-top:25px; font-size:1.2em">
                    <a class="pure-button pure-button-primary" href="?act=tampil-resep" style="margin-right:5px;" >Tampilkan Resep</a>
                    </div>

	</div>
</div>