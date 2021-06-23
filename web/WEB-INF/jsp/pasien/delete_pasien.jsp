<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<% 
    
    String id = request.getParameter("id");
    String isDelete = null;
    isDelete = request.getParameter("deletePasien");
    JSONObject pasien = PasienManagement.cariPasien(id);
    String idTemp[] = pasien.getString("_id").split("pasien:");   
    
   

    if(pasien != null && isDelete != null){
    PasienManagement.deletePasien(pasien.getString("_id"));

    
%>
	<script>
		window.location.href="?act=pasien&delete=ok";
	</script>
<% } %>

<h3 style=" background:#fdca40 ">Apakah anda yakin ingin menghapus data pasien ini?</h3>



<table class="pure-table pure-table-horizontal">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-5-6" >ID Pasien :</th>
            <td class=""> <%=idTemp[1]%> </td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" class="pure-u-5-6"  >Nama Pasien :</th>
            <td class="" ><%=pasien.getString("nama")%></td>
        </tr>
    </tbody>
</table>

<form style="margin-top:20px" method="post" action="?act=delete-pasien&id=<%=idTemp[1]%>">
     <input type="hidden" id="id-pasien" name="deletePasien" value="yes">
    <button type="submit" name=""  style="background:#cf0000 ; color: white " class="pure-button"><b>Hapus!  </b></button> |
    <a href="?act=pasien" style=" background:#fdca40 " class="pure-button "><b>Batal </b></a>
</form>

