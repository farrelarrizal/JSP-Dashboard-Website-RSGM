<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%
    
    
    Paging pagePreAdms = AdmissionManagement.getPasien();
    
    String idTemp = null;
    String [] idPasien = new String[2];
%>


<div class="o-flex-grid w-100" style="margin:auto">
    <a style="font-size:170% ; color:white ; background-color:#28527a; margin-left:25%" class=" pure-button" href="?act=admission"><b>Pre Admission</b></a>
    <a style="font-size:170% ; color:white ; background-color:#28527a; margin-right:25%" class=" pure-button" href="?act=main-adms&id=1"><b>Admission</b></a>
</div>
<h2> Daftar Pre-Admission </h2>

<div style="margin-top:-2%" class="o-flex-grid w-100">
    <div class="o-flex-grid--item">
		<table class="pure-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Pasien</th>
                    <th>ID Pasien</th>
                    <th>Jenis Kelamin</th>
                    <th>Tanggal Kedatangan</th>
                    <th><center>Aksi</center></th>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < pagePreAdms.getResultList().size(); i++) { %>
                <%
                    idTemp = pagePreAdms.getResultList().get(i).getString("_id");
                    idPasien = idTemp.split("pasien:") ;
                    
                %>
                <tr class="pure-table<%if((i+1) %2 == 1){out.print("-odd");}%>" >
                    <td><%=i+1  %></td>
                    <td><%=pagePreAdms.getResultList().get(i).getString("nama")%></td>
                    <td><%=idPasien[1]%></td>
                    <td><center><%=pagePreAdms.getResultList().get(i).getString("jk")%></center></td>
                    <td><center><%=pagePreAdms.getResultList().get(i).getString("tglDatang")%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=detail-pre&id=<%=idPasien[1]%>"><b>Detail</b></a>
                            |
                            <a <%if(pagePreAdms.getResultList().get(i).has("adms")){out.print("disabled");}%> style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=form-adms&id=<%=idPasien[1]%>"  ><b><strong>Admisi</strong></b></a>
                            |
                            <a style="font-size:70% ; color:white ; background-color:#cf0000" class=" pure-button" href="?act=delete-pasien&id=<%=idPasien[1]%>"><b>Delete</b></a>
                    </td>
                </tr>
                <%}%>
            </tbody>
        
        </table>
	</div>
</div>