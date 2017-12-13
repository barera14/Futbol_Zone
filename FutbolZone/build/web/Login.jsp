
<!DOCTYPE html><html>
<!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:47 GMT -->
<head>
	<meta charset="utf-8" />
	<title>FutbolZone</title>	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta content="Admin Dashboard" name="description" />
	<meta content="ThemeDesign" name="author" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link rel="shortcut icon" href="image/icono.png">
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/icons.css" rel="stylesheet" type="text/css">
	<link href="assets/css/style.css" rel="stylesheet" type="text/css">
        <script type="text/javascript">
function nobackbutton(){	
   window.location.hash="no-back-button";	
   window.location.hash="Again-No-back-button" //chrome	
   window.onhashchange=function(){window.location.hash="no-back-button";}
	
}
</script>
</head>
<body  onload="nobackbutton();">
	<div class=""></div>
	<div class="wrapper-page">
		<div class="panel panel-color panel-primary panel-pages">
			<div class="panel-body">
				<h3 class="text-center m-t-0 m-b-15"> <img class="logo" src="image/logo.png"></h3>
				<h4 class="text-muted text-center m-t-0"><b>Iniciar Sesion</b></h4>
                                <form class="form-horizontal m-t-20" action="loginUser" method="post">
					<div class="form-group">
						<div class="col-xs-12">
						 <input class="form-control" type="text" name="user" required="" placeholder="Correo">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12"> 
							<input class="form-control" type="password" name="pass" required="" placeholder="Contraseņa">
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<div class="checkbox checkbox-primary">
							 <input id="checkbox-signup" type="checkbox"> 
							 <label for="checkbox-signup"> Recuerdame </label>
							</div>
						</div>
					</div>
                                   <%if(request.getParameter("rta").toString().equals("error")){%>
                   <div class="form-group">
						<div class="col-xs-12">
							<div class="alert alert-danger">
                                                            <p>Error! Usuario o Contraseņa incorrecta</p>
							</div>
						</div>
					</div>
                                <%}else if(request.getParameter("rta").toString().equals("inio")){%>
                   <div class="form-group">
						<div class="col-xs-12">
							<div class="alert alert-danger">
                                                            <p>Listo! Por favor inicie sesion</p>
							</div>
						</div>
					</div>
                    <%}else if(request.getParameter("rta").toString().equals("errorS")){%>
                   <div class="form-group">
						<div class="col-xs-12">
							<div class="alert alert-danger">
                                                            <p>Error! Por favor inicie sesion</p>
							</div>
						</div>
					</div>
                    <%} %>
                                        
					<div class="form-group text-center m-t-40">
						<div class="col-xs-12"> 
							<button class="btn btn-primary btn-block btn-lg waves-effect waves-light" type="submit">Entrar</button>
						</div>
					</div>
					<div class="form-group m-t-30 m-b-0">
						<div class="col-sm-7"> 
							<a href="pages-recoverpw.html" class="text-muted"><i class="fa fa-lock m-r-5"></i> Olvido la Contraseņa?</a>
						</div>
						<div class="col-sm-5 text-right"> <a href="pages-register.html" class="text-muted">Crear Cuenta</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	 <script src="assets/js/jquery.min.js"></script> 
	 <script src="assets/js/bootstrap.min.js"></script>
	  <script src="assets/js/modernizr.min.js"></script> 
	  <script src="assets/js/detect.js"></script> 
	  <script src="assets/js/fastclick.js"></script> 
	  <script src="assets/js/jquery.slimscroll.js"></script> 
	  <script src="assets/js/jquery.blockUI.js"></script> 
	  <script src="assets/js/waves.js"></script> 
	  <script src="assets/js/wow.min.js"></script> 
	  <script src="assets/js/jquery.nicescroll.js"></script>
	   <script src="assets/js/jquery.scrollTo.min.js"></script> 
	   <script src="assets/js/app.js"></script> 
	</body>
<!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:47 GMT -->
</html>