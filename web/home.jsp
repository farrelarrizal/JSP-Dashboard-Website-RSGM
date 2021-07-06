<%@ page import="rsgm_unair.user_management.UserManagement" %>
<%
String act = request.getParameter("act");
if(act == null || act.trim().equals("")){
	act = "default";
}


// String isLogin = (String) session.getAttribute("is_login");
String isLogin = "1";

if(isLogin == null || !isLogin.equals("1")){
	response.sendRedirect("index.jsp");
	return;
}



%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="css/pure-min.css"/>
		<link rel="stylesheet" href="css/style-card.css"/>
		<link rel="stylesheet" href="css/style-grid.css"/>


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
						<li class="pure-menu-item">
							<a href="?act=user" class="pure-menu-link">User</a>
						</li>
						<li class="pure-menu-item">
							<a href="?act=pasien" class="pure-menu-link">Pasien</a>
						</li>
						<li class="pure-menu-item">
							<a href="?act=admission" class="pure-menu-link">Admission</a>
						</li>
						<li class="pure-menu-item">
							<a href="?act=apotek" class="pure-menu-link">Apotek</a>
						</li>
						<li class="pure-menu-item">
							<a href="?act=rekam-medis" class="pure-menu-link">Rekam Medis</a>
						</li>
						<li class="pure-menu-item">
							<a href="?act=rawat-inap" class="pure-menu-link">Rawat Inap</a>
						</li>
						<li class="pure-menu-item">
							<a href="?act=kamar-operasi" class="pure-menu-link">Kamar Operasi</a>
						</li>
						<li class="pure-menu-item pure-menu-has-children pure-menu-allow-hover">
							<a href="#" class="pure-menu-link">akun</a>
							<ul class="pure-menu-children">
								<li class="pure-menu-item">
									<a href="?act=info_akun" class="pure-menu-link">info akun</a>
								</li>
								<li class="pure-menu-item">
									<a href="?act=ganti_password" class="pure-menu-link">ganti password</a>
								</li>
							</ul>
						</li>
						<li class="pure-menu-item">
							<a href="?act=logout" class="pure-menu-link">logout</a>
						</li>
					</ul>	
				</div>
			</div>
		</div>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
				<hr>
			</div>
		</div>
		<div class="pure-g">
			<div class="pure-u-1" align="center">
			<% if(act.equals("default")){ %>
			<h3> Silakan memilih menu </h3>
			<%-- <form action=""> --%>
				<div class="o-flex-grid w-100">
					
					<div class="box red o-flex-grid--item">
						<a href="?act=admission">
						<img src="https://assets.codepen.io/2301174/icon-team-builder.svg" alt="">
						<h2>Admission</h2>
						</a>
					</div>
					<div class="box red o-flex-grid--item">
						<a href="?act=apotek">
						<img src="img/medicine.png" width="75px" alt="">
						<h2>Apotek</h2>
						</a>
					</div>
					<div class="box red o-flex-grid--item">
						<a href="?act=rekam-medis">
						<img src="img/pulse.png" width="75px" alt="">
						<h2>Rekam Medis</h2>
						</a>
					</div>
				</div>
				<br>
				<div class="o-flex-grid w-100">
					<div class="box red o-flex-grid--item">
						<a href="?act=rawat-inap">
						<img src="img/health-insurance.png" width="75px"alt="">
						<h2>Rawat Inap</h2>
						</a>
					</div>
					<div class="box red o-flex-grid--item">
						<a href="?act=kamar-operasi">
						<img src="img/surgery-room.png" alt="" width="75px">
						<h2>Kamar Operasi</h2>
						</a>
					</div>
					<div class="box red o-flex-grid--item">
						<a href="./regispre.jsp">
						<img src="img/health-insurance.png" width="75px"alt="">
						<h2>Formulir Registrasi Pasien</h2>
						</a>
					</div>
				</div>
			<%-- </form> --%>
			<% }else if(act.equals("logout")){ %>
			<jsp:include page="WEB-INF/jsp/konfirmasi_logout.jsp"/>
			<% }else if(act.equals("info_akun")){ %>
			<jsp:include page="WEB-INF/jsp/info_akun.jsp"/>
			<% }else if(act.equals("ganti_password")){ %>
			<jsp:include page="WEB-INF/jsp/ganti_password.jsp"/>
			<% }else if(act.equals("user")){ %>
			<jsp:include page="WEB-INF/jsp/user.jsp"/>
			<% }else if(act.equals("pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/pasien.jsp"/>
			<% }else if(act.equals("tambahpasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/tambah_pasien.jsp"/>
			<% }else if(act.equals("detail-pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/detail_pasien.jsp"/>
			<% }else if(act.equals("edit-pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/edit_pasien.jsp"/>
			<% }else if(act.equals("delete_user")){ %>
			<jsp:include page="WEB-INF/jsp/delete_user.jsp"/>
			<% }else if(act.equals("delete-pasien")){ %>
			<jsp:include page="WEB-INF/jsp/pasien/delete_pasien.jsp"/>
			<% }else if( act.equals("admission")){ %>
			<jsp:include page="WEB-INF/jsp/admission/main_pre.jsp"/>
			<% }else if( act.equals("detail-pre")){ %>
			<jsp:include page="WEB-INF/jsp/admission/detail_pre.jsp"/>
			<% }else if( act.equals("edit-pre")){ %>
			<jsp:include page="WEB-INF/jsp/admission/edit_pre.jsp"/>
			<% }else if( act.equals("main-adms")){ %>
			<jsp:include page="WEB-INF/jsp/admission/main_adms.jsp"/>
			<% }else if( act.equals("detail-adms")){ %>
			<jsp:include page="WEB-INF/jsp/admission/detail_adms.jsp"/>
			<% }else if( act.equals("edit-adms")){ %>
			<jsp:include page="WEB-INF/jsp/admission/edit_adms.jsp"/>
			<% }else if( act.equals("form-adms")){ %>
			<jsp:include page="WEB-INF/jsp/admission/form_adms.jsp"/>
			<% }else if( act.equals("apotek")){ %>
			<jsp:include page="WEB-INF/jsp/apotek/apotek.jsp"/>
			<% }else if( act.equals("tambah-obat")){ %>
			<jsp:include page="WEB-INF/jsp/apotek/tambah_obat.jsp"/>
			<% }else if( act.equals("tampil-resep")){ %>
			<jsp:include page="WEB-INF/jsp/apotek/tampil_resep.jsp"/>
			<% }else if( act.equals("cetak-resep")){ %>
			<jsp:include page="WEB-INF/jsp/apotek/cetak_resep.jsp"/>
			<% }else if( act.equals("rawat-inap")){ %>
			<jsp:include page="WEB-INF/jsp/rawatinap/rawat_inap.jsp"/>
			<% }else if( act.equals("tipe-inap")){ %>
			<jsp:include page="WEB-INF/jsp/rawatinap/tipe_inap.jsp"/>
			<% }else if( act.equals("kamar-inap")){ %>
			<jsp:include page="WEB-INF/jsp/rawatinap/kamar_inap.jsp"/>
			<% }else if( act.equals("tambah-inap")){ %>
			<jsp:include page="WEB-INF/jsp/rawatinap/tambah_inap.jsp"/>
			<% }else if( act.equals("detail-inap")){ %>
			<jsp:include page="WEB-INF/jsp/rawatinap/detail_inap.jsp"/>
			<% }else if( act.equals("remove-inap")){ %>
			<jsp:include page="WEB-INF/jsp/rawatinap/remove_inap.jsp"/>
			<% }else if( act.equals("rekam-medis")){ %>
			<jsp:include page="WEB-INF/jsp/rekammedis/list_rekamMedis.jsp"/>
			<% }else if( act.equals("detail-rekammedis")){ %>
			<jsp:include page="WEB-INF/jsp/rekammedis/detail_rekamMedis.jsp"/>
			<% }else if( act.equals("edit-rekammedis")){ %>
			<jsp:include page="WEB-INF/jsp/rekammedis/edit_rekamMedis.jsp"/>
			<% }else if( act.equals("delete-rekammedis")){ %>
			<jsp:include page="WEB-INF/jsp/rekammedis/delete_rekamMedis.jsp"/>
			<% }else if( act.equals("kamar-operasi")){ %>
			<jsp:include page="WEB-INF/jsp/kamaroperasi/main_operasi.jsp"/>
			<% }else if( act.equals("detail-kamar-operasi")){ %>
			<jsp:include page="WEB-INF/jsp/kamaroperasi/detail_operasi.jsp"/>
			<% }else if( act.equals("form-kamar-operasi")){ %>
			<jsp:include page="WEB-INF/jsp/kamaroperasi/form_operasi.jsp"/>
			<% }else if( act.equals("edit-kamar-operasi")){ %>
			<jsp:include page="WEB-INF/jsp/kamaroperasi/edit_operasi.jsp"/>
			<% } %>
			</div>
		</div>
	
		
	</body>
</html>