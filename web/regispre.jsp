<%@ page import="java.util.*" %>
<%@ page import="rsgm_unair.admission_management.*" %>
<%@ page import="rsgm_unair.pasien_management.*" %>
<%@ page import="rsgm_unair.user_management.*" %>
<%@ page import="rsgm_unair.shared.*" %>
<%@ page import="org.json.*" %>


<%  String uniqueIdGenerator = UUID.randomUUID().toString();
    String [] uniqueTemp = uniqueIdGenerator.split("-");
    String uniqueID = uniqueTemp[1].toUpperCase()+uniqueTemp[2].toUpperCase();

    // Tambah Pasien
    String action = null;
    action = request.getParameter("action");
    
    Response resp = null;
    
    if(action != null && action.equals("tambahPreAdmission")){

        FormRegisPre fr = new FormRegisPre();
        fr.setIdPasien(request.getParameter("id-pasien"));
        fr.setNama(request.getParameter("nama"));
        fr.setNik(request.getParameter("nik"));
        fr.setTglLahir(request.getParameter("tglLahir"));
        fr.setJk(request.getParameter("jk"));
        fr.setAlamat(request.getParameter("alamat"));
        fr.setNoHP(request.getParameter("noHP"));
        fr.setPembayaran(request.getParameter("pembayaran"));
        fr.setTglDatang(request.getParameter("tglDatang"));
        fr.setKeluhan(request.getParameter("keluhan"));
        fr.setAsalRujukan(request.getParameter("asalRujukan"));
        fr.setPreAdms("true");
        
        resp = AdmissionManagement.managePasien(fr);

    }


    
%>


<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="css/pure-min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<!-- Date Picker-->
		<style type="text/css">
		[type="date"] {
			background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
			}
			[type="date"]::-webkit-inner-spin-button {
			display: none;
			}
			[type="date"]::-webkit-calendar-picker-indicator {
			opacity: 0;
			}

		</style>

    </head>
	<body>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
				<div class="pure-menu pure-menu-horizontal" >
					<a href="home.jsp" class="pure-menu-heading pure-menu-link"><img class="pure-img" width="100" src="img/logo.png"></a>
					<ul class="pure-menu-list">
						<h3>Rumah Sakit Gigi dan Mulut Universitas Airlangga - RSGM UNAIR 2021</h3>
						<small>Jl. Mayjen Prof. Dr. Moestopo No.47 Kota Surabaya, Jawa Timur</small>
						<small>081231123123</small>
					</ul>	
				</div>
			</div>
		</div>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
				<hr>

                <%if(action != null && action.equals("tambahPreAdmission")){%>
                    <p style="background: <%if(resp.getKode()==0){out.print("#28a745");}else{out.print("#cf0000");}%>;color:white"><b><%=resp.getPesan()%></b></p>
                    <%if(resp.getKode()==0){%>
                        <p style="background: #28a745; color:white"> Harap Simpan ID Anda : <%=resp.getID()%> </p>
                    <%}%>

                <%}%>
                <h2>Pendaftaran Online</h2>
                
                <form class="pure-form pure-form-aligned" method="post" action="regispre.jsp">
                    <fieldset>
                        <input type="hidden" id="id-pasien" name="id-pasien" value="<% out.print(uniqueID) ; %>">
                        <input type="hidden"  name="action" value="tambahPreAdmission">
                        <p> Data Pasien </p>
                        <div class="pure-control-group">
                            <label for="nama">Nama Lengkap Pasien</label>
                            <input type="text" id="nama" name="nama" autocomplete="off" placeholder="masukkan nama pasien" class="pure-input-1-4" />
                            <span style="margin-left: 7%" class="pure-form-message">Nama Lengkap (Sesuai KTP/passport)</span>
                        </div>
                        <div class="pure-control-group">
                            <label for="nik">NIK Pasien</label>
                            <input type="text" autocomplete="off" id="nik" name="nik" placeholder="masukkan nomer NIK" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tglLahir">Tanggal Lahir Pasien</label>
                            <input type="date" id="tglLahir" name="tglLahir"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group ">
                            <label for="jenis-kelamin">Jenis Kelamin</label>
                            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                                <option>Laki - Laki</option>
                                <option>Perempuan</option>
                            </select>
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat">Alamat Pasien</label>
                            <input type="text" id="alamat" name="alamat" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="noHP">No HP Pasien</label>
                            <input type="text" id="noHP" name="noHP" autocomplete="off" placeholder="masukkan no hp" class="pure-input-1-4"required />
                        </div>
                        <div class="pure-control-group">
                            <label for="pembayaran">Pembayaran</label>
                            <select id="pembayaran" name=pembayaran class="pure-input-1-4" >
                                <option>Sendiri</option>
                                <option>BPJS</option>
                                <option>Asuransi Non BPJS</option>
                            </select>
                        </div>
                        <p> Keluhan Awal </p>
                        <div class="pure-control-group">
                            <label for="tglDatang">Tanggal Kedatangan</label>
                            <input  type="date" autocomplete="off" id="tglDatang" name="tglDatang" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Keluhan/kondisi terkait pasien (opsional)</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="keluhan" name="keluhan" placeholder="Masukkan keluhan pasien ..." required></textarea>
                        </div>
                        <div class="pure-control-group">
                            <label for="asalRujukan">Asal RS Rujukan (Optional)</label>
                            <input type="text" autocomplete="off" id="asalRujukan" name="asalRujukan" placeholder="masukkan asal RS" class="pure-input-1-4" required />
                        </div>
                        <button type="submit" style="background: #28a745; color: #fff" class="pure-button">Submit</button>
                        <a href="?act=pasien" style=" background-color:#fdca40" class="pure-button ">Batal</a>
                    </fieldset>
                </form>
			</div>

		</div>
		
		</div>
	
		
	</body>
</html>