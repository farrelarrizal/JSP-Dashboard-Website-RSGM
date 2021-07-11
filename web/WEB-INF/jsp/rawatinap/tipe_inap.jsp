<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.inap_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%
    String id = request.getParameter("id");
    JSONObject detailKamar = InapManagement.cariKamar(id);
    String idTemp[] = detailKamar.getString("_id").split("kamar:");  
    out.print(detailKamar);
%>

<h2> Daftar Kamar </h2>
<div style="margin-top:-2%" class="o-flex-grid w-100">
    <div class="o-flex-grid--item">
		<table class="pure-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>No Kamar</th>
                    <th>Jumlah Bed</th>
                    <th>Bed Kosong</th>
                    <th><center>Aksi</center></th>
                </tr>
            </thead>
            <tbody>
                <tr class="pure-table-odd" >
                    <td >1</td>
                    <td><%=idTemp[1].toUpperCase()%> 01</td>
                    <td><center><%=(detailKamar.getInt( "kapasitas"))%></center></td>
                    <td><center><%=(detailKamar.getInt(id+"1"))%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=kamar-inap&id=<%=idTemp[1]%>&no=1"><b>Detail Kamar</b></a>
                            <a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=tambah-inap&tipe=<%=idTemp[1]%>&id=1"><b><strong>Tambah Pasien</strong></b></a>
                    </td>
                </tr>
                <tr class="pure-table-odd" >
                    <td>2</td>
                    <td><%=idTemp[1].toUpperCase()%> 02</td>
                    <td><center><%=(detailKamar.getInt("kapasitas"))%></center></td>
                    <td><center><%=(detailKamar.getInt(id+"2"))%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=kamar-inap&id=<%=idTemp[1]%>&no=2"><b>Detail Kamar</b></a>
                            <a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=tambah-inap&tipe=<%=idTemp[1]%>&id=2"><b><strong>Tambah Pasien</strong></b></a>
                    </td>
                </tr>
                <tr class="pure-table-odd" >
                    <td >3</td>
                    <td><%=idTemp[1].toUpperCase()%> 03</td>
                    <td><center><%=(detailKamar.getInt("kapasitas"))%></center></td>
                    <td><center><%=(detailKamar.getInt(id+"3"))%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=kamar-inap&id=<%=idTemp[1]%>&no=3"><b>Detail Kamar</b></a>
                            <a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=tambah-inap&tipe=<%=idTemp[1]%>&id=3"><b><strong>Tambah Pasien</strong></b></a>
                    </td>
                </tr>
                <tr class="pure-table-odd" >
                    <td >4</td>
                    <td><%=idTemp[1].toUpperCase()%> 04</td>
                    <td><center><%=(detailKamar.getInt("kapasitas"))%></center></td>
                    <td><center><%=(detailKamar.getInt(id+"4"))%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=kamar-inap&id=<%=idTemp[1]%>&no=4"><b>Detail Kamar</b></a>
                            <a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=tambah-inap&tipe=<%=idTemp[1]%>&id=4"><b><strong>Tambah Pasien</strong></b></a>
                    </td>
                </tr>
                <tr class="pure-table-odd" >
                    <td>5</td>
                    <td><%=idTemp[1].toUpperCase()%> 05</td>
                    <td><center><%=(detailKamar.getInt("kapasitas"))%></center></td>
                    <td><center><%=(detailKamar.getInt(id+"5"))%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#28527a" class=" pure-button" href="?act=kamar-inap&id=<%=idTemp[1]%>&no=5"><b>Detail Kamar</b></a>
                            <a style="font-size:70% ;  background-color:#fdca40" class="pure-button" href="?act=tambah-inap&tipe=<%=idTemp[1]%>&id=5"><b><strong>Tambah Pasien</strong></b></a>
                    </td>
                </tr>
            </tbody>
        </table>
        <div style="margin-top:20px">
            <a href="?act=rawat-inap&id=1" style="background:#fdca40" class="pure-button"><b>Kembali</b></a>
        </div>
	</div>
</div>