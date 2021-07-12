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

<div class="pure-g">
	<div class="pure-u-24-24" align="center">
        <h2>Edit Rekam Medis</h2>

    <div class="pure-u-24-24"align="center"></div>

<div class="pure-g">
    <div class="pure-u-21-24" align="center">
        <fieldset>
            <div class="pure-control-group">
                <label for="aligned-name">Nama</label>
                <input type="text" name="name" id="aligned-name" placeholder="Nama Lengkap" value="<%=lp.getString("nama")%>"/>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Tanggal Lahir</label>
                <input type="text" name="umur" id="aligned-umur" placeholder="Umur" value="<%=lp.getString("tglLahir")%>"/>
            </div>
			<%-- <div class="pure-control-group">
                <label for="aligned-name">BeratBadan</label>
                <input type="text" name="beratbadan" id="aligned-beratbadan" placeholder="Berat Badan" value="<%=lp.getString("beratbadan")%>"/>
            </div> --%>
			<div class="pure-control-group">
                <label for="aligned-name">Keluhan</label>
                <input type="text" name="keluhan" id="aligned-keluhan" placeholder="Keluhan" value="<%=lp.getString("diagnosa")%>"/>
            </div>
            <div class="pure-control-group">
                <label for="aligned-name">Alamat</label>
                <input type="text" name="alamat" id="aligned-alamat" placeholder="Alamat" value="<%=lp.getString("alamat")%>"/>
            </div>
			<%-- <div class="pure-control-group">
                <label for="aligned-name">Ttl</label>
                <input type="text" name="ttl" id="aligned-ttl" placeholder="Tempat Tanggal Lahir" value="<%=lp.getString("ttl")%>"/>
            </div> --%>
            
            <div class="pure-controls">		
                <input type="submit" class="pure-button pure-button-primary" value="Simpan">
                <button href="?act=pasien" class="button-success pure-button">Kembali</button>
            </div>
        </fieldset>
    </div>
</div>
</div>
