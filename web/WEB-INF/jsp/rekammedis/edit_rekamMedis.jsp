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
    JSONObject lp = AdmissionManagement.cariPrePasien(id);



%>
<form class="pure-form pure-form-aligned" method="post" >
    <fieldset>
<div class="pure-g">
	<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
        <div class="o-flex-grid--item">
        <h2>Edit Rekam Medis</h2>
        <fieldset>
            <div class="pure-control-group">
                <label for="idPasien">ID Pasien : </label>
                <input type="text" disabled autocomplete="off" id="idPasien" name="idPasien"   value="AES75GSE"/>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Tanggal Datang</label>
                <input type="text" name="datang" id="aligned-datang" placeholder="Tanggal Datang" value=""/>
            </div>
		
            <div class="pure-control-group">
                <label for="aligned-name">Tanggal Lahir</label>
                <input type="text" name="lahir" id="aligned-lahir" placeholder="Tanggal Lahir" value=""/>
            </div>
			<div class="pure-control-group">
                <label for="aligned-name">Jenis Kelamin</label>
                <input type="text" name="jk" id="aligned-jk" placeholder="Jenis Kelamin" value=""/>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Diagnosa</label>
                <input type="text" name="diagnosa" id="aligned-diagnosa" placeholder="Diagnosa" value=""/>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Asuransi</label>
                <input type="text" name="asuransi" id="aligned-asuransi" placeholder="Asuransi" value=""/>
            </div>
            <div class="pure-controls">		
                <input type="submit" class="pure-button pure-button-primary" value="Simpan">
                <button href="?act=pasien" class="button-success pure-button">Kembali</button>
            </div>
        </fieldset>
    </div>
</div>
</div>
</fieldset>
</form>

