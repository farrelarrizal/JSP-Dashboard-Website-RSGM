<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.inap_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%
        String id = request.getParameter("id");
        String no = request.getParameter("no");
        String delete = request.getParameter("del");
        JSONObject detailKamar = InapManagement.cariKamar(id);
        
%>
<div style="margin-top:-2%" class="o-flex-grid w-100">
    <div class="o-flex-grid--item">
<%if(delete != null){%>
    <p style="background: #28a745; color:white"> Pasien Berhasil dihapus dari kamar ini!</p>
<%}%>
<h2> Detail Kamar <%=request.getParameter("id").toUpperCase()+" "+request.getParameter("no")%></h2>
		<table class="pure-table">
            <thead>
                <tr>
                    <th>Bed No</th>
                    <th>Nama Pasien</th>
                    <th>Penyakit</th>
                    <th><center>Aksi</center></th>
                </tr>
            </thead>
            <tbody>
                <%  
                    int i=1;
                    while(detailKamar.has("kamar"+request.getParameter("no")+i)){
                        String idPasien = detailKamar.getString("kamar"+request.getParameter("no")+i);
                        if(!idPasien.equals("")){
                        JSONObject detailPasien = AdmissionManagement.cariPrePasien(idPasien);
                %>
                <tr class="pure-table-odd" >
                    <td ><center><%=i%></center></td>
                    <td><%if(detailPasien.has("nama")){out.print(detailPasien.getString("nama"));}%></td>
                    <td><%if(detailPasien.has("diagnosa")){out.print(detailPasien.getString("diagnosa"));}%></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=detail-inap&no=<%=no%>&id=<%=id%>&idPasien=<%=idPasien%>"><b>Detail</b></a>
                            <a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=remove-inap&idPasien=<%=idPasien%>&tipe=<%=id%>&no=<%=no%>&urutan=<%=i%>"><b><strong>Hapus</strong></b></a>
                    </td>
                </tr>
                <%
                        }

                        %>
                <%  
                        i++;
                    }
                %>
            </tbody>
        </table>
        <div style="margin-top:20px">
            <a href="?act=tipe-inap&id=<%=id%>" style="background:#fdca40" class="pure-button"><b>Kembali</b></a>
        </div>
	</div>
</div>