<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.inap_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>

<%

    
    Paging kamar = InapManagement.getKamar();
    String tipeKamar[] = new String[2];
    out.print(kamar);

%>


<br>
<br>

<div style="margin-top:-2%" class="o-flex-grid w-100">
    <div class="o-flex-grid--item">
        <h2> Daftar Ketersediaan Bed </h2>
		<table class="pure-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Tipe Kamar</th>
                    <th>Jumlah Bed</th>
                    <th>Bed Kosong</th>
                    <th><center>Aksi</center></th>
                </tr>
            </thead>
            <tbody>
            <% for(int i = 0; i < kamar.getResultList().size(); i++) { %>
                <%
                    tipeKamar = kamar.getResultList().get(i).getString("_id").split("kamar:");
                %>
                <tr class="pure-table<%if((i+1) %2 == 1){out.print("-odd");}%>" >
                    <td> <%=i+1  %></td>
                    <td> <%=tipeKamar[1].toUpperCase() %> </td>
                    <td><center><%=kamar.getResultList().get(i).getInt("totalBed")%></center></td>
                    <td><center><%=kamar.getResultList().get(i).getInt("bedKosong")%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=tipe-inap&id=<%=tipeKamar[1] %>"><b>Detail Tipe Kamar</b></a>
                    </td>
                </tr>
            <%}%>
            </tbody>

        </table>
	</div>
</div>