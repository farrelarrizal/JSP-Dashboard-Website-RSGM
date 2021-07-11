<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.apotek_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%  
    
%>

<div style="margin-top:2%" class="o-flex-grid w-100 pure-u-1-3">
    <div class="o-flex-grid--item">
        <h1> Apotek RSGM UNAIR </h1>
        <h2> Resep Obat Pasien </h2>
            <form class="pure-form" style="margin-top:15px ; margin-bottom:5px" action="?act=tambah-obat" method="post">
                <fieldset class="pure-u-1-3">
                <input type="hidden" name="act" value="tambah-obat" />
                    <div class="pure-control-group">
                        <label style="font-size:1.3em; margin-right:7px" for="aligned-name">ID Pasien :</label>
                        <input type="text" id="aligned-name" name="id" placeholder="masukkan Id pasien..." required />
                        <span class="pure-form-message-inline"></span>
                    </div>
                    <div style="margin-top:25px; font-size:1.2em">
                    <button class="pure-button" type="submit" style="margin-right:5px;">Tambahkan Obat</button>
                    
                    </div>
                </fieldset>
            </form>
	</div>
</div>