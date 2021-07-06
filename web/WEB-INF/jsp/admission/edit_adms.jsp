<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>


<%  

    // Tambah Pasien
    String action = request.getParameter("action");
    String id = request.getParameter("id");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:"); 
    
    Response resp = null;
    
    if(action != null && action.equals("edit-adms")){


        FormRegisPre fr = new FormRegisPre();
        fr.setRev(request.getParameter("rev"));
        fr.setIdPasien(request.getParameter("id-pasien"));
        fr.setKlinis(request.getParameter("klinis"));
        fr.setTglKonsultasi(request.getParameter("tglKonsultasi"));
        fr.setTensi(request.getParameter("tensi"));
        fr.setPulse(request.getParameter("pulse"));
        fr.setTemperature(request.getParameter("temperature"));
        fr.setDiagnosa(request.getParameter("diagnosa"));
        fr.setAlasanDiagnosa(request.getParameter("alasanDiagnosa"));
        fr.setAdms("true");
        
        resp = AdmissionManagement.managePasien(fr);

        %>
            <script>
                window.location.href="?act=detail-adms&id=<%=resp.getID()%>&resp=<%=resp.getKode()%>"
            </script>
            
<%}%>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
				


                <h2>Update Formulir Admission Pasien </h2>
                <h4>Nama Pasien : <%=(detailPasien.getString("nama"))%> (<%= idTemp[1]%>) </h4>
               
                <form class="pure-form pure-form-aligned" method="post" action="?act=edit-adms&id=<%= idTemp[1]%>">
                    <fieldset>
                        <input type="hidden" id="id-pasien" name="id-pasien" value="<%= idTemp[1]%>">
                        <input type="hidden"  name="rev" value="<%=(detailPasien.getString("_rev"))%>">
                        <input type="hidden"  name="action" value="edit-adms">
                        <div class="pure-control-group">
                            <label for="nik">Kondisi Klinis</label>
                            <input type="text" autocomplete="off" id="nik" name="klinis" placeholder="masukkan nomer NIK" class="pure-input-1-4" value="<%=(detailPasien.getString("klinis"))%>" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tglLahir">Tanggal Konsultasi</label>
                            <input type="date" value="<%=(detailPasien.getString("tglKonsultasi"))%>" id="tglKonsultasi" name="tglKonsultasi"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Tensi Pasien : </label>
                            <input type="text" id="alamat" value="<%=(detailPasien.getString("tensi"))%>" name="tensi" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Denyut Jantung Pasien : </label>
                            <input type="text" value="<%=(detailPasien.getString("pulse"))%>" id="alamat" name="pulse" autocomplete="off" placeholder="Misalnya: 120/80" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Temperatur Pasien : </label>
                            <input type="text" id="alamat" value="<%=(detailPasien.getString("temperature"))%>" name="temperature" autocomplete="off" placeholder="Temperatur satuan derajat celcius" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Diagnosa Awal</label>
                            <textarea class="pure-input-1-4" value="<%=(detailPasien.getString("diagnosa"))%>" autocomplete="off" id="keluhan" name="diagnosa" placeholder="Masukkan keluhan pasien ..." required><%=(detailPasien.getString("diagnosa"))%></textarea>
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Alasan Diagnosa</label>
                            <textarea class="pure-input-1-4" autocomplete="off" value="<%=(detailPasien.getString("alasanDiagnosa"))%>" id="keluhan" name="alasanDiagnosa" placeholder="Masukkan keluhan pasien ..." required><%=(detailPasien.getString("alasanDiagnosa"))%></textarea>
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Update</button>
                        <a href="?act=main-adms" style=" background-color:#fdca40" class="pure-button ">Batal</a>
                    </fieldset>
                </form>
			</div>

		</div>
		
		</div>
	
		
	</body>
</html>