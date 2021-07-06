<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%

    
    Paging pageAdms = AdmissionManagement.getAdmsPasien();
    out.print(pageAdms);
    String idTemp = null;
    String [] idPasien = new String[2];

%>


<div class="o-flex-grid w-100" style="margin:auto">
    <a style="font-size:170% ; color:white ; background-color:#28527a; margin-left:25%" class=" pure-button" href="?act=admission"><b>Pre Admission</b></a>
    <a style="font-size:170% ; color:white ; background-color:#28527a; margin-right:25%" class=" pure-button" href="?act=main-adms&"><b>Admission</b></a>
</div>
<div style="margin-top:-2%" class="o-flex-grid w-100">
    <div class="o-flex-grid--item">
<h2> Daftar Admission </h2>
		<table class="pure-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Pasien</th>
                    <th>ID Pasien</th>
                    <th>Jenis Kelamin</th>
                    <th>Tanggal Kedatangan</th>
                    <th>Diagnosa</th>
                    <th><center>Aksi</center></th>
                </tr>
            </thead>
            <tbody>
                <% for(int i = 0; i < pageAdms.getResultList().size(); i++) { 

                    idTemp = pageAdms.getResultList().get(i).getString("_id");
                    idPasien = idTemp.split("pasien:") ;
                    
                %>
                <tr class="pure-table<%if((i+1) %2 == 1){out.print("-odd");}%>" >
                    <td><%=i+1  %></td>
                    <td><%=pageAdms.getResultList().get(i).getString("nama")%></td>
                    <td><%=idPasien[1]  %></td>
                    <td><center><%=pageAdms.getResultList().get(i).getString("jk")%></center></td>
                    <td><center><%=pageAdms.getResultList().get(i).getString("tglDatang")%></center></td>
                    <td><center><%=pageAdms.getResultList().get(i).getString("diagnosa")%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=detail-adms&id=<%=idPasien[1]%>"><b>Detail</b></a> | <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=edit-adms&id=<%=idPasien[1]%>"><b>edit</b></a>
                            
                    </td>
                </tr>
                <%}%>
            </tbody>
        
        </table>
	</div>
</div>