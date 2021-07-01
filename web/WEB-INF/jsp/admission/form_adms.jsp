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
    String id = request.getParameter("id");
    
    Response resp = null;
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(id);
    String idTemp[] = detailPasien.getString("_id").split("pasien:");  
    out.print(detailPasien);
    if(action != null && action.equals("addAdms")){

        FormRegisPre fr = new FormRegisPre();
        fr.setRev(request.getParameter("rev"));
        fr.setIdPasien(request.getParameter("idPasien"));
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
                window.location.href="?act=main-adms&resp=<%=resp.getKode()%>"
            </script>
    <%
    }
%>

		<div class="pure-g">
			<div class="pure-u-1" align="center">
				

                <%-- <%if(action != null && action.equals("tambahPreAdmission")){%>
                    <p style="background: <%if(resp.getKode()==0){out.print("#28a745");}else{out.print("#cf0000");}%>;color:white"><b><%=resp.getPesan()%></b></p>
                    <%if(resp.getKode()==0){%>
                        <p style="background: #28a745; color:white"> Harap Simpan ID Anda : <%=resp.getID()%> </p>
                    <%}%>

                <%}%> --%>
                <h2>Formulir Admission Pasien </h2>
                <h4>Nama Pasien : <%=detailPasien.getString("nama")%> (<%=(idTemp[1])%>) </h4>
               
                <form class="pure-form pure-form-aligned" method="post" action="?act=form-adms&id=<%=(idTemp[1])%>">
                    <fieldset>
                        <input type="hidden" id="action" name="action" value="addAdms">
                        <input type="hidden" id="idPasien" name="idPasien" value="<%=(idTemp[1])%>">
                        <input type="hidden"  name="rev" value="<%=detailPasien.getString("_rev")%>">
                        <div class="pure-control-group">
                            <label for="klinis">Kondisi Klinis</label>
                            <input type="text" autocomplete="off" id="klinis" name="klinis" placeholder="masukkan nomer NIK" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tglKonsultasi">Tanggal Konsultasi</label>
                            <input type="date" id="tglKonsultasi" name="tglKonsultasi"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tensi">Tensi Pasien : </label>
                            <input type="text" id="tensi" name="tensi" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="pulse">Denyut Jantung Pasien : </label>
                            <input type="text" id="pulse" name="pulse" autocomplete="off" placeholder="Misalnya: 120/80" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="temperature">Temperature Pasien : </label>
                            <input type="text" id="temperature" name="temperature" autocomplete="off" placeholder="Temperatur satuan derajat celcius" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="diagnosa">Diagnosa Awal</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="diagnosa" name="diagnosa" placeholder="Masukkan keluhan pasien ..." required></textarea>
                        </div>
                        <div class="pure-control-group">
                            <label for="alasanDiagnosa">Alasan Diagnosa</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="alasanDiagnosa" name="alasanDiagnosa" placeholder="Masukkan keluhan pasien ..." required></textarea>
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
                        <a href="?act=admission" style=" background-color:#fdca40" class="pure-button ">Batal</a>
                    </fieldset>
                </form>
			</div>

		</div>
		
		</div>
	
		
	</body>
</html>