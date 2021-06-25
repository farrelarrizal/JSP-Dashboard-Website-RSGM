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
			<div class="o-flex-grid w-100">
				<div class="box red o-flex-grid--item">
					<img src="https://assets.codepen.io/2301174/icon-team-builder.svg" alt="">
					<h2>Admission</h2>
				</div>
				<div class="box red o-flex-grid--item">
					<img src="https://assets.codepen.io/2301174/icon-team-builder.svg" alt="">
					<h2>Apotek</h2>
				</div>
				<div class="box red o-flex-grid--item">
					<img src="https://assets.codepen.io/2301174/icon-team-builder.svg" alt="">
					<h2>Rekam Medis</h2>
				</div>
			</div>
			<br>
			<div class="o-flex-grid w-100">
				<div class="box red o-flex-grid--item">
					<img src="https://assets.codepen.io/2301174/icon-team-builder.svg" alt="">
					<h2>Rawat Inap</h2>
				</div>
				<div class="box red o-flex-grid--item">
					<img src="https://assets.codepen.io/2301174/icon-team-builder.svg" alt="">
					<h2>Kamar Operasi</h2>
				</div>
				<div class="box red o-flex-grid--item">
					<h1>coming soon...</h1>
				</div>
			</div>
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
			<% }else if( act.equals("apotek")){ %>
			<jsp:include page="WEB-INF/jsp/apotek/apotek.jsp"/>
			<% }else if( act.equals("tambah-obat")){ %>
			<jsp:include page="WEB-INF/jsp/apotek/tambah_obat.jsp"/>
			<% } %>
			</div>
		</div>
	
		
	</body>
</html>