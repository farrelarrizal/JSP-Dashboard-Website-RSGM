<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.operasi_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>
<%@ page import="java.util.*" %>

<%  

    Paging pasienOperasi = KamarOperasi.getPasienOperasi();
    Paging daftarKamarOp = KamarOperasi.getDaftarKamarOp();
    
    String idTemp = null;
    String [] idPasien = new String[2];

    String Kamar1 = "Tersedia";
    String namaDokter1 = "";
    String namaPasien1 = "";
    String tglOperasi1 = "";
    String idTemp1 = null;
    String [] idPasien1 = new String[2];

    String Kamar2 = "Tersedia";
    String namaDokter2 = "";
    String namaPasien2 = "";
    String tglOperasi2 = "";
    String idTemp2 = null;
    String [] idPasien2 = new String[2];

    String Kamar3 = "Tersedia";
    String namaDokter3 = "";
    String namaPasien3 = "";
    String tglOperasi3 = "";
    String idTemp3 = null;
    String [] idPasien3 = new String[2];

    String Kamar4 = "Tersedia";
    String namaDokter4 = "";
    String namaPasien4 = "";
    String tglOperasi4 = "";
    String idTemp4 = null;
    String [] idPasien4 = new String[2];

    String Kamar5 = "Tersedia";
    String namaDokter5 = "";
    String namaPasien5 = "";
    String tglOperasi5 = "";
    String idTemp5 = null;
    String [] idPasien5 = new String[2];

    for(int i = 0; i < pasienOperasi.getResultList().size(); i++) {
        if(pasienOperasi.getResultList().get(i).getString("noKamar").equals(daftarKamarOp.getResultList().get(0).getString("kamar1"))) {
            Kamar1 = "Ruangan Tidak Tersedia";
            namaDokter1 = pasienOperasi.getResultList().get(i).getString("dokterOperasi");
            namaPasien1 = pasienOperasi.getResultList().get(i).getString("nama");
            tglOperasi1 = pasienOperasi.getResultList().get(i).getString("tglOperasi");
            idTemp1 = pasienOperasi.getResultList().get(i).getString("_id");
            idPasien1 = idTemp1.split("pasien:");
        }
    }

    for(int i = 0; i < pasienOperasi.getResultList().size(); i++) {
        if(pasienOperasi.getResultList().get(i).getString("noKamar").equals(daftarKamarOp.getResultList().get(0).getString("kamar2"))) {
            Kamar2 = "Ruangan Tidak Tersedia";
            namaDokter2 = pasienOperasi.getResultList().get(i).getString("dokterOperasi");
            namaPasien2 = pasienOperasi.getResultList().get(i).getString("nama");
            tglOperasi2 = pasienOperasi.getResultList().get(i).getString("tglOperasi");
            idTemp2 = pasienOperasi.getResultList().get(i).getString("_id");
            idPasien2 = idTemp2.split("pasien:");
        }
    }

    for(int i = 0; i < pasienOperasi.getResultList().size(); i++) {
        if(pasienOperasi.getResultList().get(i).getString("noKamar").equals(daftarKamarOp.getResultList().get(0).getString("kamar3"))) {
            Kamar3 = "Ruangan Tidak Tersedia";
            namaDokter3 = pasienOperasi.getResultList().get(i).getString("dokterOperasi");
            namaPasien3 = pasienOperasi.getResultList().get(i).getString("nama");
            tglOperasi3 = pasienOperasi.getResultList().get(i).getString("tglOperasi");
            idTemp3 = pasienOperasi.getResultList().get(i).getString("_id");
            idPasien3 = idTemp3.split("pasien:");
        }
    }

    for(int i = 0; i < pasienOperasi.getResultList().size(); i++) {
        if(pasienOperasi.getResultList().get(i).getString("noKamar").equals(daftarKamarOp.getResultList().get(0).getString("kamar4"))) {
            Kamar4 = "Ruangan Tidak Tersedia";
            namaDokter4 = pasienOperasi.getResultList().get(i).getString("dokterOperasi");
            namaPasien4 = pasienOperasi.getResultList().get(i).getString("nama");
            tglOperasi4 = pasienOperasi.getResultList().get(i).getString("tglOperasi");
            idTemp4 = pasienOperasi.getResultList().get(i).getString("_id");
            idPasien4 = idTemp4.split("pasien:");
        }
    }

    for(int i = 0; i < pasienOperasi.getResultList().size(); i++) {
        if(pasienOperasi.getResultList().get(i).getString("noKamar").equals(daftarKamarOp.getResultList().get(0).getString("kamar5"))) {
            Kamar5 = "Ruangan Tidak Tersedia";
            namaDokter5 = pasienOperasi.getResultList().get(i).getString("dokterOperasi");
            namaPasien5 = pasienOperasi.getResultList().get(i).getString("nama");
            tglOperasi5 = pasienOperasi.getResultList().get(i).getString("tglOperasi");
            idTemp5 = pasienOperasi.getResultList().get(i).getString("_id");
            idPasien5 = idTemp5.split("pasien:");
        }
    }
%>

<h2> Kamar Operasi </h2>
<div style="margin-top:-2%" class="o-flex-grid w-100">
    <div class="o-flex-grid--item">
		<table class="pure-table">
            <a href="?act=checkid-kamar-operasi" style="background-color:#0062ff" class="pure-button-primary pure-button"> + Assign Kamar Operasi </a>
            <br>
            <br>
            <thead>
                <tr>
                    <th><center>No. Kamar Operasi</center></th>
                    <th><center>Ketersediaan</center></th>
                    <th><center>Dokter</center></th>
                    <th><center>Pasien</center></th>
                    <th><center>Tanggal Operasi</center></th>
                    <th><center>Aksi</center></th>
                </tr>
            </thead>
            <tbody>
                <tr class="pure-table-odd" >
                    <td><center><%=daftarKamarOp.getResultList().get(0).getString("kamar1")%></center></td>
                    <td><center><%=Kamar1%></center></td>
                    <td><center><%=namaDokter1%></center></td>
                    <td><center><%=namaPasien1%></center></td>
                    <td><center><%=tglOperasi1%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#56b9a1" class=" pure-button" href="?act=edit-kamar-operasi&id=<%=idPasien1[1]%>"><b>Edit Ruang</b></a>
                            |
                            <a style="font-size:70% ; color:white ; background-color:#b3ae72" class=" pure-button" href="?act=detail-kamar-operasi&id=<%=idPasien1[1]%>"><b>Detail Operasi</b></a>
                    </td>
                <tr class="pure-table-odd" >
                    <td><center><%=daftarKamarOp.getResultList().get(0).getString("kamar2")%></center></td>
                    <td><center><%=Kamar2%></center></td>
                    <td><center><%=namaDokter2%></center></td>
                    <td><center><%=namaPasien2%></center></td>
                    <td><center><%=tglOperasi2%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#56b9a1" class=" pure-button" href="?act=edit-kamar-operasi&id=<%=idPasien2[1]%>"><b>Edit Ruang</b></a>
                                |
                            <a style="font-size:70% ; color:white ; background-color:#b3ae72" class=" pure-button" href="?act=detail-kamar-operasi&id=<%=idPasien2[1]%>"><b>Detail Operasi</b></a>
                    </td>
                <tr class="pure-table-odd" >
                    <td><center><%=daftarKamarOp.getResultList().get(0).getString("kamar3")%></center></td>
                    <td><center><%=Kamar3%></center></td>
                    <td><center><%=namaDokter3%></center></td>
                    <td><center><%=namaPasien3%></center></td>
                    <td><center><%=tglOperasi3%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#56b9a1" class=" pure-button" href="?act=edit-kamar-operasi&id=<%=idPasien3[1]%>"><b>Edit Ruang</b></a>
                            |
                            <a style="font-size:70% ; color:white ; background-color:#b3ae72" class=" pure-button" href="?act=detail-kamar-operasi&id=<%=idPasien3[1]%>"><b>Detail Operasi</b></a>
                    </td>
                <tr class="pure-table-odd" >
                    <td><center><%=daftarKamarOp.getResultList().get(0).getString("kamar4")%></center></td>
                    <td><center><%=Kamar4%></center></td>
                    <td><center><%=namaDokter4%></center></td>
                    <td><center><%=namaPasien4%></center></td>
                    <td><center><%=tglOperasi4%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#56b9a1" class=" pure-button" href="?act=edit-kamar-operasi&id=<%=idPasien4[1]%>"><b>Edit Ruang</b></a>
                            |
                             <a style="font-size:70% ; color:white ; background-color:#b3ae72" class=" pure-button" href="?act=detail-kamar-operasi&id=<%=idPasien4[1]%>"><b>Detail Operasi</b></a>
                    </td>
                <tr class="pure-table-odd" >
                    <td><center><%=daftarKamarOp.getResultList().get(0).getString("kamar5")%></center></td>
                    <td><center><%=Kamar5%></center></td>
                    <td><center><%=namaDokter5%></center></td>
                    <td><center><%=namaPasien5%></center></td>
                    <td><center><%=tglOperasi5%></center></td>
                    <td>
                            <a style="font-size:70% ; color:white ; background-color:#56b9a1" class=" pure-button" href="?act=edit-kamar-operasi&id=<%=idPasien5[1]%>"><b>Edit Ruang</b></a>
                            |
                            <a style="font-size:70% ; color:white ; background-color:#b3ae72" class=" pure-button" href="?act=detail-kamar-operasi&id=<%=idPasien5[1]%>"><b>Detail Operasi</b></a>
                    </td>
                </tr>
            </tbody>

        </table>
	</div>
</div>