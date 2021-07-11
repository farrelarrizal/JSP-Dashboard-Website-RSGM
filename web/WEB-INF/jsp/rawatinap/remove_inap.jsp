<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.inap_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%
    String idPasien = request.getParameter("idPasien");
    String tipe = request.getParameter("tipe");
    String no = request.getParameter("no");
    JSONObject detailPasien = AdmissionManagement.cariPrePasien(idPasien);
    JSONObject detailKamar = InapManagement.cariKamar(tipe);

    String action = request.getParameter("delete");
    Response resp = null;


    if(action != null && action.equals("ok")){
        Inap fr = new Inap();
        fr.setIdPasien(request.getParameter("idPasien"));
        fr.setTipe(request.getParameter("tipe"));
        fr.setRoomNo(request.getParameter("no"));
        fr.setUrutan(request.getParameter("urutan"));
        fr.setKamar(request.getParameter("tipe")+request.getParameter("no")+request.getParameter("urutan"));
        
        fr.setRev(detailKamar.getString("_rev"));
        int keep = detailKamar.getInt(request.getParameter("tipe")+ request.getParameter("urutan")) + 1;
        int keep2 = detailKamar.getInt("bedKosong") +1 ;
        fr.setCurrentRoom(keep);
        fr.setCurrentTotal(keep2);

        resp = InapManagement.removePasien(fr);
    
    %>
            <script>
                window.location.href="?act=kamar-inap&del=ok&id=<%=tipe%>&no=<%=no%> "
            </script>
    <%

    }
%>
<h2> Konfirmasi Hapus Pasien</h2>
<div class="o-flex-grid w-100">
    <div class=" o-flex-grid--item">
<table class="pure-table pure-table-horizontal ">
    <thead>
        <tr>
            <th style="text-align:right" class="pure-u-*" >ID Pasien :</th>
            <td class="" ><%=idPasien%></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th style="text-align:right" > Nama : </th>
            <td> <%=detailPasien.getString("nama")%> </td>
        </tr>
    </tbody>
</table>

<a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=remove-inap&idPasien=<%=idPasien%>&tipe=<%=tipe%>&no=<%=request.getParameter("no")%>&urutan=<%=request.getParameter("urutan")%>&delete=ok&rev=<%=detailPasien.getString("_rev")%>"><b><strong>Hapus</strong></b></a>

</div>

