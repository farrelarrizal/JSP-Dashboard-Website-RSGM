<%  

%>


<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="css/pure-min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script src="sweetalert2.min.js"></script>
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
                <h2>Pendaftaran Online</h2>

                <form class="pure-form pure-form-aligned" method="post" action="regispre.jsp">
                    <fieldset>
                        <input type="hidden"  name="action" value="tambahPreAdmission">
                        <p> Data Pasien </p>
                        <div class="pure-control-group">
                            <label for="no-IC">Nama Lengkap Pasien</label>
                            <input type="text" id="no-IC" name="ic-pasien" autocomplete="off" placeholder="masukkan nama pasien" class="pure-input-1-4" />
                            <span style="margin-left: 7%" class="pure-form-message">Nama Lengkap (Sesuai KTP/passport)</span>
                        </div>
                        <div class="pure-control-group">
                            <label for="dokter">NIK Pasien</label>
                            <input type="text" autocomplete="off" id="nik" name="nik" placeholder="masukkan nomer NIK" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="tgl-masuk-pasien">Tanggal Lahir Pasien</label>
                            <input type="date" id="tgl-masuk-pasien" name="tgl-masuk-pasien"  class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group ">
                            <label for="jenis-kelamin">Jenis Kelamin</label>
                            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                                <option>Laki - Laki</option>
                                <option>Perempuan</option>
                            </select>
                        </div>
                        <div class="pure-control-group">
                            <label for="alamat-pasien">Alamat Pasien</label>
                            <input type="text" id="alamat-pasien" name="alamat-pasien" autocomplete="off" placeholder="masukkan alamat pasien" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="hp-pasien">No HP Pasien</label>
                            <input type="text" id="hp-pasien" name="hp-pasien" autocomplete="off" placeholder="masukkan no hp" class="pure-input-1-4"required />
                        </div>
                        <div class="pure-control-group">
                            <label for="jenis-kelamin">Pembayaran</label>
                            <select id="jenis-kelamin" name=jk class="pure-input-1-4" >
                                <option>Sendiri</option>
                                <option>BPJS</option>
                                <option>Asuransi Non BPJS</option>
                            </select>
                        </div>
                        <p> Keluhan Awal </p>
                        <div class="pure-control-group">
                            <label for="dokter">Tanggal Kedatangan</label>
                            <input  type="date" autocomplete="off" id="dokter" name="dokter" placeholder="" class="pure-input-1-4" required />
                        </div>
                        <div class="pure-control-group">
                            <label for="keluhan">Keluhan/kondisi terkait pasien (opsional)</label>
                            <textarea class="pure-input-1-4" autocomplete="off" id="keluhan" name="keluhan" placeholder="Masukkan keluhan pasien ..." required></textarea>
                        </div>
                        <div class="pure-control-group">
                            <label for="dokter">Asal RS Rujukan (Optional)</label>
                            <input type="text" autocomplete="off" id="nik" name="nik" placeholder="masukkan asal RS" class="pure-input-1-4" required />
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