<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.operasi_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>
<%

    String uniqueIdGenerator = UUID.randomUUID().toString();
    String [] uniqueTemp = uniqueIdGenerator.split("-");
    String uniqueID = uniqueTemp[1].toUpperCase()+uniqueTemp[2].toUpperCase();

    String action = null;
    action = request.getParameter("action");
    Response resp = null;
    
      if(action != null && action.equals("assignKamar")){

            AssignOperasi ao = new AssignOperasi();
            ao.setIdPasienOperasi(request.getParameter("idPasienOperasi"));
            ao.setRev(request.getParameter("rev"));
            ao.setNama(request.getParameter("nama"));
            ao.setNoKamar(request.getParameter("noKamar"));
            ao.setDokter(request.getParameter("dokter"));
            ao.setTglOperasi(request.getParameter("tglOperasi"));
        
        resp = KamarOperasi.assignKamar(ao);
      }
%>

<h2>Assign Kamar Operasi</h2>
<%if(action != null && action.equals("assignKamar")){%>
    <p style="background: <%if(resp.getKode()==0){out.print("#28a745");}else{out.print("#cf0000");}%>;color:white"><b><%=resp.getPesan()%></b></p>
<%}%>
<form class="pure-form pure-form-aligned" method="post" action="?act=form-kamar-operasi">
    <fieldset>
        <input type="hidden" id="idPasienOperasi" name="action" value="assignKamar">
        <input type="hidden" id="idPasienOperasi" name="idPasienOperasi" value="<% out.print(uniqueID) ; %>">
        <div class="pure-control-group">
            <label for="id">Nama Pasien</label>
            <input  type="text" autocomplete="off" id="nama" name="nama"  placeholder="" class="pure-input-1-4" required />
        </div>
        <div class="pure-control-group ">
            <label for="nokamar">No Kamar Operasi</label>
            <input type="text" id="nokamar" name="noKamar" autocomplete="off" placeholder="" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group ">
            <label for="dokter">Dokter</label>
            <input type="text" id="dokter" name="dokter" autocomplete="off" placeholder="" class="pure-input-1-4" />
        </div>
        <div class="pure-control-group">
            <label for="tgloperasi">Tanggal Operasi</label>
            <input type="date" id="tgloperasi" name="tglOperasi"  class="pure-input-1-4" required />
        </div>
        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
        <a href="?act=kamar-operasi" style="background:#ffee07; color: rgb(70, 64, 64)" class="pure-button"><b>Kembali</b></a>
    </fieldset>
</form>