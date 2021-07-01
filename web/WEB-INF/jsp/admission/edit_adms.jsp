<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>


<%  String uniqueIdGenerator = UUID.randomUUID().toString();
    String [] uniqueTemp = uniqueIdGenerator.split("-");
    String uniqueID = uniqueTemp[1].toUpperCase()+uniqueTemp[2].toUpperCase();

    // Tambah Pasien
    String action = null;
    action = request.getParameter("action");
    
    Response resp = null;
    
    if(action != null && action.equals("tambahPreAdmission")){

        FormRegisPre fr = new FormRegisPre();
        fr.setIdPasien(request.getParameter("id-pasien"));
        fr.setNama(request.getParameter("nama"));
        fr.setNik(request.getParameter("nik"));
        fr.setTglLahir(request.getParameter("tglLahir"));
        fr.setJk(request.getParameter("jk"));
        fr.setAlamat(request.getParameter("alamat"));
        fr.setNoHP(request.getParameter("noHP"));
        fr.setPembayaran(request.getParameter("pembayaran"));
        fr.setTglDatang(request.getParameter("tglDatang"));
        fr.setKeluhan(request.getParameter("keluhan"));
        fr.setAsalRujukan(request.getParameter("asalRujukan"));
        fr.setAdms("true");
        
        resp = AdmissionManagement.managePasien(fr);

        %>
            <script>
                window.location.href="?act=main-adms&id=<%=idTemp[1]%>&resp=<%=resp.getKode()%>"
            </script>
<%}%>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
				

                <%-- <%if(action != null && action.equals("tambahPreAdmission")){%>
                    <p style="background: <%if(resp.getKode()==0){out.print("#28a745");}else{out.print("#cf0000");}%>;color:white"><b><%=resp.getPesan()%></b></p>
                    <%if(resp.getKode()==0){%>
                        <p style="background: #28a745; color:white"> Harap Simpan ID Anda : <%=resp.getID()%> </p>
                    <%}%>

                <%}%> --%>
                <h2>Update Formulir Admission Pasien </h2>
                <h4>Nama Pasien : Udin Juleha (BRWQWS) </h4>
               
                <form class="pure-form pure-form-aligned" method="post" action="?act=form-adms">
                    <fieldset>
                        <input type="hidden" id="id-pasien" name="id-pasien" value="">
                        <input type="hidden"  name="action" value="edit-adms">
                        <div class="pure-control-group">
                            <label for="nik">Kondisi Klinis</label>
                            <input type="text" autocomplete="off" id="nik" name="nik" placeholder="masukkan nomer NIK" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tglLahir">Tanggal Konsultasi</label>
                            <input type="date" id="tglLahir" name="tglLahir"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Tensi Pasien : </label>
                            <input type="text" id="alamat" name="alamat" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Denyut Jantung Pasien : </label>
                            <input type="text" id="alamat" name="alamat" autocomplete="off" placeholder="Misalnya: 120/80" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Temperatur Pasien : </label>
                            <input type="text" id="alamat" name="alamat" autocomplete="off" placeholder="Temperatur satuan derajat celcius" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Diagnosa Awal</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="keluhan" name="keluhan" placeholder="Masukkan keluhan pasien ..." required></textarea>
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Alasan Diagnosa</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="keluhan" name="keluhan" placeholder="Masukkan keluhan pasien ..." required></textarea>
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Update</button>
                        <a href="?act=admission" style=" background-color:#fdca40" class="pure-button ">Batal</a>
                    </fieldset>
                </form>
			</div>

		</div>
		
		</div>
	
		
	</body>
</html>