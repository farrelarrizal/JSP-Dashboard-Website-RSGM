<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.rekam_management.*" %>
<%@ page import="rsgm_unair.inap_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%
    String id = request.getParameter("id");
    Response resp = null;
    String p = request.getParameter("idPasien");
    String action = request.getParameter("action");
    JSONObject lp = AdmissionManagement.cariPrePasien(id);
    String idPasien[] = lp.getString("_id").split("pasien:");
    
    if(action != null && action.equals("editRekamMedis")){
        FormRegisPre fr = new FormRegisPre();
        fr.setNama(request.getParameter("nama"));
        fr.setIdPasien(request.getParameter("idPasien"));
        fr.setRev(request.getParameter("rev"));
        fr.setTglKonsultasi(request.getParameter("tglKonsultasi"));
        fr.setTglDatang(request.getParameter("tglDatang"));
        fr.setTglLahir(request.getParameter("tglLahir"));
        fr.setJk(request.getParameter("jk"));
        fr.setDiagnosa(request.getParameter("diagnosa"));
        fr.setPembayaran(request.getParameter("pembayaran"));
        
        resp = RekamMedisManagement.editPasien(fr);
        %>
        <script>
            window.location.href="?act=detail-rekammedis&id=<%=p%>&edit=ok"
        </script>
    <%
    }
    %>



<div class="pure-g">
	<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
        <div class="o-flex-grid--item">
        <h2>Edit Rekam Medis</h2>
        <form class="pure-form pure-form-aligned" method="post" action="?act=edit-rekammedis&id=<%=idPasien[1]%>" >
        <fieldset>
            <input type="hidden" id="action" name="rev"  value="<%=lp.getString("_rev")%>">
            <input type="hidden" id="idPasien" name="idPasien"  value="<%=idPasien[1]%>">
            <input type="hidden" id="action" name="action"  value="editRekamMedis">
            <div class="pure-control-group">
                <label for="nama">Nama Pasien</label>
                <input class="pure-input-1-4" type="text"required  autocomplete="off" id="nama" name="nama"   value="<%=lp.getString("nama")%>"/>
            </div>
            <div class="pure-control-group">
                <label for="idPasien">ID Pasien </label>
                <input class="pure-input-1-4" type="text" required disabled autocomplete="off" id="idPasien" name="idPasien"   value="<%=idPasien[1]%>"/>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Tanggal Datang</label>
                <input class="pure-input-1-4" type="date" required name="tglDatang" id="aligned-datang" placeholder="Tanggal Datang" value="<%=lp.getString("tglDatang")%>"/>
            </div>
		
            <div class="pure-control-group">
                <label for="aligned-name">Tanggal Lahir</label>
                <input class="pure-input-1-4" type="date" required name="tglLahir" id="aligned-lahir" placeholder="Tanggal Lahir" value="<%=lp.getString("tglLahir")%>"/>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Tanggal Konsultasi</label>
                <input class="pure-input-1-4" type="date" required name="tglKonsultasi" id="aligned-lahir" placeholder="Tanggal Konsultasi" value="<%=lp.getString("tglKonsultasi")%>"/>
            </div>
            <div class="pure-control-group">
                <label for="jk">Jenis Kelamin</label>
                <select required id="jk" name=jk class="pure-input-1-4" >
                    <option <% if(lp.getString("jk").equals("Laki-Laki")){out.println("Selected");}  %>> Laki-Laki</option>
                    <option <% if(lp.getString("jk").equals("Perempuan")){out.println("Selected");}  %>>Perempuan</option>
                </select>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Diagnosa</label>
                <input required class="pure-input-1-4" type="text" name="diagnosa" id="aligned-diagnosa" placeholder="Diagnosa" value="<%=lp.getString("diagnosa")%>"/>
            </div>

            <div class="pure-control-group">
                <label for="pembayaran">Asuransi</label>
                <select required id="pembayaran" name=pembayaran class="pure-input-1-4" >
                    <option <% if(lp.getString("pembayaran").equals("Sendiri")){out.println("Selected");}  %> >Sendiri</option>
                    <option <% if(lp.getString("pembayaran").equals("BPJS")){out.println("Selected");}  %> >BPJS</option>
                    <option <% if(lp.getString("pembayaran").equals("Asuransi Non BPJS")){out.println("Selected");}  %> >Asuransi Non BPJS</option>
                </select>
            </div>
            <div class="pure-controls">		
                <input type="submit" class="pure-button pure-button-primary" value="Simpan">
                <a href="?act=detail-rekammedis&id=<%=idPasien[1]%>" class="button-success pure-button">Kembali</a>
            </div>
        </fieldset>
        </form>
    </div>
</div>

