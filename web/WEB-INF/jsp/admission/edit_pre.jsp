<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%
    Response resp = null; 
    String edit = request.getParameter("edit");
    String id = request.getParameter("id");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:");  

    if(edit != null && edit.equals("true")){

        FormRegisPre fr = new FormRegisPre();
        fr.setRev(request.getParameter("rev"));
        fr.setIdPasien(request.getParameter("idPasien"));
        fr.setTglDatang(request.getParameter("tglDatang"));
        fr.setKeluhan(request.getParameter("keluhan"));
        fr.setAsalRujukan(request.getParameter("asalRujukan"));
        fr.setNama(request.getParameter("nama"));
        fr.setJk(request.getParameter("jk"));
        fr.setTglLahir(request.getParameter("tglLahir"));
        fr.setNik(request.getParameter("nik"));
        fr.setAlamat(request.getParameter("alamat"));
        fr.setNoHP(request.getParameter("noHP"));
        fr.setPembayaran(request.getParameter("pembayaran"));
        fr.setPreAdms("true");
        
        resp = AdmissionManagement.managePasien(fr);

    %>
            <script> 
                window.location.href="?act=detail-pre&id=<%=idTemp[1]%>&resp=<%=resp.getKode()%>"
            </script>
    <%
    }
%>
                <h2>Edit Formulir Pre Admission Pasien</h2>

                <form class="pure-form pure-form-aligned" method="post" action="?act=edit-pre&id=<%=(idTemp[1])%>">
                    <fieldset>
                        <input type="hidden" id="update" name="rev" value="<%=detailPasien.getString("_rev")%>" >
                        <input type="hidden" id="idPasien" name="idPasien" value="<%=(idTemp[1])%>" >
                        <input type="hidden" id="edit" name="edit" value="true" >
                        <div class="pure-control-group">
                            <label for="idPasien">ID Pasien : </label>
                            <input type="text" disabled autocomplete="off" id="idPasien" name="idPasien"   value="<%=(idTemp[1])%>" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tglDatang">Tanggal Kedatangan</label>
                            <input  type="date" autocomplete="off" id="tglDatang" name="tglDatang" placeholder="" value="<%=(detailPasien.getString("tglDatang"))%>" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Keluhan/kondisi terkait pasien (opsional)</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="keluhan" name="keluhan"  placeholder="Masukkan keluhan pasien ..." required><%=(detailPasien.getString("keluhan"))%></textarea>
                        </div>
                        <div class="pure-control-group">
                            <label for="asalRujukan">Asal RS Rujukan (Optional)</label>
                            <input type="text" autocomplete="off" id="asalRujukan" name="asalRujukan" placeholder="masukkan asal RS"  value="<%=(detailPasien.getString("asalRujukan"))%>" class="pure-input-1-4" required />
                        </div>

                        <p> Data Pasien </p>
                        <div class="pure-control-group">
                            <label for="nama">Nama Lengkap Pasien</label>
                            <input type="text" id="nama" name="nama" autocomplete="off" value="<%=(detailPasien.getString("nama"))%>" placeholder="masukkan nama pasien" class="pure-input-1-4" />
                        </div>
                        <div class="pure-control-group ">
                            <label for="jenis-kelamin">Jenis Kelamin</label>
                            <select id="jenis-kelamin" name="jk" class="pure-input-1-4" >
                                <option>Laki - Laki</option>
                                <option>Perempuan</option>
                            </select>
                        </div>
                        <div class="pure-control-group">
                            <label for="tglLahir">Tanggal Lahir Pasien</label>
                            <input type="date" id="tglLahir" name="tglLahir" value="<%=(detailPasien.getString("tglLahir"))%>"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="nik">NIK</label>
                            <input type="text" autocomplete="off" id="nik" name="nik" placeholder="masukkan nomer NIK" value="<%=(detailPasien.getString("nik"))%>" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Alamat Pasien</label>
                            <input type="text" id="alamat" name="alamat" value="<%=(detailPasien.getString("alamat"))%>" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="noHP">No HP Pasien</label>
                            <input type="text" id="noHP" name="noHP" value="<%=(detailPasien.getString("noHP"))%>" autocomplete="off" placeholder="masukkan no hp" class="pure-input-1-4"required />
                        </div>
                        <div class="pure-control-group">
                            <label for="pembayaran">Pembayaran :  </label>
                            <select id="pembayaran" name=pembayaran class="pure-input-1-4" >
                                <option>Sendiri</option>
                                <option>BPJS</option>
                                <option>Asuransi Non BPJS</option>
                            </select>
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
                        <a href="?act=detail-pre&id=<%=(idTemp[1])%>" style=" background-color:#fdca40" class="pure-button ">Batal</a>
                    </fieldset>
                </form>
