<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Encabezado.jsp"/>
<jsp:include page="../MenuAdmin.jsp"/>
	<div id="wrapper">
		<div class="topbar">
			<div class="topbar-left">
				<div class="text-center"> 
					<a href="index.html" class="logo"><img class="logo" src="image/logo.png"></a></a> <a href="index.html" class="logo-sm"><span><img  src="image/icono.png"></span></a></div>
				</div>
                    
    <style>
        .foto1 { padding: 0.05em; margin: 0.05em;  float: left;  }
    </style>
				<div class="navbar navbar-default" role="navigation">
					<div class="container">
						<div class="">
							<div class="pull-left"> 
								<button type="button" class="button-menu-mobile open-left waves-effect waves-light"> <i class="ion-navicon"></i> </button> <span class="clearfix"></span>
							</div>
							<form class="navbar-form pull-left" role="search">
								<div class="form-group">
								 <input type="text" class="form-control search-bar" placeholder="Search...">
								</div> <button type="submit" class="btn btn-search"><i class="fa fa-search"></i></button>
							</form>
							<ul class="nav navbar-nav navbar-right pull-right">
								<li class="dropdown hidden-xs"> <a href="#" data-target="#" class="dropdown-toggle waves-effect waves-light notification-icon-box" data-toggle="dropdown" aria-expanded="true"> <i class="fa fa-bell"></i> <span class="badge badge-xs badge-danger"></span> </a>
									<ul class="dropdown-menu dropdown-menu-lg">
										<li class="text-center notifi-title">Notification <span class="badge badge-xs badge-success">3</span></li>
										<li class="list-group"> <a href="javascript:void(0);" class="list-group-item">
											<div class="media">
												<div class="media-heading">Your order is placed</div>
												<p class="m-0"> <small>Dummy text of the printing and typesetting industry.</small></p>
											</div> </a> <a href="javascript:void(0);" class="list-group-item">
												<div class="media">
													<div class="media-body clearfix">
														<div class="media-heading">New Message received</div>
														<p class="m-0"> <small>You have 87 unread messages</small></p>
													</div>
												</div> </a> <a href="javascript:void(0);" class="list-group-item">
													<div class="media">
														<div class="media-body clearfix">
															<div class="media-heading">Your item is shipped.</div>
															<p class="m-0"> <small>It is a long established fact that a reader will</small></p>
														</div>
													</div> </a> <a href="javascript:void(0);" class="list-group-item"> <small class="text-primary">See all notifications</small> </a>
												</li>
											</ul>
										</li>
										<li class="hidden-xs"> <a href="#" id="btn-fullscreen" class="waves-effect waves-light notification-icon-box"><i class="mdi mdi-fullscreen"></i></a>
										</li>
										<li class="dropdown"> <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
										 <img src="assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> <span class="profile-username"> Kenny Rigdon <br/> <small>Developer</small> </span> </a>
										 <ul class="dropdown-menu"><li><a href="javascript:void(0)"> Profile</a>
										 </li>
										 <li><a href="javascript:void(0)"><span class="badge badge-success pull-right">5</span> Settings </a></li>
										 <li><a href="javascript:void(0)"> Lock screen</a>
										 </li>
										 <li class="divider">
										 	
										 </li>
										 <li><a href="javascript:void(0)"> Logout</a>
										 </li>
										</ul>
									</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
            <div class="left side-menu">
						<div class="sidebar-inner slimscrollleft">
							<div class="user-details">
								<div class="text-center">
								 <img src="assets/images/users/avatar-1.jpg" alt="" class="img-circle">
								</div>
								<div class="user-info">
									<div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Kenny Rigdon</a>
										<ul class="dropdown-menu">
											<li><a href="javascript:void(0)"> Profile</a>
											</li>
											<li><a href="javascript:void(0)"> Settings</a>
											</li>
											<li><a href="javascript:void(0)"> Lock screen</a>
											</li>
											<li class="divider">
												
											</li>
											<li><a href="javascript:void(0)"> Logout</a>
											</li>
										</ul>
									</div>
									<p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i> Online</p>
								</div>
							</div>