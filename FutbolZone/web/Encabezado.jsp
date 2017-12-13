<%@page import="Modelos.SAdministrador"%>
<%@page import="Modelos.Cliente"%>
<%@page import="Modelos.Establecimiento"%>
<!DOCTYPE html>
<html>
    <!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/form-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:31:59 GMT -->
    <head>
        <meta charset="utf-8" />
        <title>FutbolZone</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <meta content="Admin Dashboard" name="description" />
        <meta content="ThemeDesign" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" href="image/icono.png">
<link href="assets/plugins/bootstrap-sweetalert/sweet-alert.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/plugins/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
        <link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
        <link href="assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
        <link href="assets/plugins/dropzone/dist/dropzone.css" rel="stylesheet" type="text/css">
        <link href="assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
        <link href="sweetalert.css" rel="stylesheet" type="text/css">
<link href='calendar/fullcalendar.min.css' rel='stylesheet' />
<link href='calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
        <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    </head>

    <body class="fixed-left">
        <div id="wrapper">
            <div class="topbar">
                <div class="topbar-left">
                    <div class="text-center"> 
                        <a href="index.html" class="logo"><img class="logo" src="image/logo.png"></a></a> <a href="index.html" class="logo-sm"><span >FZ</span></a></div>
                </div>

                <style>
                    .foto1 { padding: 0.05em; margin: 0.05em;  float: left;  }
                    .icono { width: 45  px;}
                    .icono { padding: 0.2px;   float: left;}
                </style>
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">
                        <div class="">
                            <div class="pull-left"> 
                                <button type="button" class="button-menu-mobile open-left waves-effect waves-light"> <i class="ion-navicon"></i> </button> <span class="clearfix"></span>
                            </div>
                        
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
                                <%
                                    String perfil = session.getAttribute("perfil").toString();
                                    String nombre = "";
                                    String Apellido = "";
                                    String Establecimiento = "";
                                    if (perfil.equals("Establecimiento")) {
                                        Establecimiento user = (Establecimiento) session.getAttribute("setUsuario");
                                        nombre = user.getNombre();

                                    } else if (perfil.equals("Cliente")) {
                                        Cliente user = (Cliente) session.getAttribute("setUsuario");
                                        nombre = user.getNombre();
                                        Apellido = user.getApellido();

                                    } else if (perfil.equals("SuperAdministrador")) {
                                        SAdministrador user = (SAdministrador) session.getAttribute("setUsuario");
                                        nombre = user.getNombre();
                                        Apellido = user.getApellido();

                                    }
                                %>

                                <%if (perfil.equals("Establecimiento")) {
                                %>  
                                <li class="dropdown"> <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
                                        <img src="image/icono.png" alt="user-img" class="img-circle"><span class="profile-username"><%= nombre%> <br/> <small><%= perfil%></small> </span> </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="javascript:void(0)"> Perfil</a>
                                        </li>

                                        <li><a href="loginUser?action=inicio"> Logout</a>
                                        </li>
                                    </ul>
                                </li>
                                <% } else if (perfil.equals("Cliente")) {%>
                                <li class="dropdown"> <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
                                        <img src="image/icono.png" alt="user-img" class="img-circle"><span class="profile-username"><%= nombre + " " + Apellido%> <br/> <small><%= perfil%></small> </span> </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="javascript:void(0)"> Perfil</a>
                                        </li>

                                        <li><a href="loginUser?action=inicio"> Logout</a>
                                        </li>
                                    </ul>
                                </li>
                                <%} else if (perfil.equals("SuperAdministrador")) {%>
                                <li class="dropdown"> <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true">
                                        <img src="image/icono.png" alt="user-img" class="img-circle"><span class="profile-username"><%= nombre + " " + Apellido%> <br/> <small><%= perfil%></small> </span> </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="javascript:void(0)"> Perfil</a>
                                        </li>

                                        <li><a href="loginUser?action=inicio"> Logout</a>
                                        </li>
                                    </ul>
                                </li>
                                <%} %>      
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="left side-menu">
                <div class="sidebar-inner slimscrollleft">
                    <div class="user-details">
                        <div class="text-center">
                            <img src="image/icono.png" alt="" class="img-circle">
                        </div>
                        <%if (perfil.equals("Establecimiento")) {%>
                        <div class="user-info">
                            <div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><%= nombre%></a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:void(0)"> Profile</a>
                                    </li>

                                    <li><a href="loginUser?action=inicio"> Logout</a>
                                    </li>
                                </ul>
                            </div>

                            <p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i> <%= perfil%></p>
                        </div>
                        <% } else if (perfil.equals("Cliente")) {%>
                        <div class="user-info">
                            <div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><%= nombre + " " + Apellido%> </a>
                                <ul class="dropdown-menu">
                                    <li><a href=""> Profile</a>
                                    </li>

                                    <li><a href="loginUser?action=inicio"> Logout</a>
                                    </li>
                                </ul>
                            </div>

                            <p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i><%= perfil%></p>
                        </div>
                        <% } else if (perfil.equals("SuperAdministrador")) {%>
                        <div class="user-info">
                            <div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><%= nombre + " " + Apellido%> </a>
                                <ul class="dropdown-menu">
                                    <li><a href=""> Profile</a>
                                    </li>

                                    <li><a href="loginUser?action=inicio"> Logout</a>
                                    </li>
                                </ul>
                            </div>

                            <p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i><%= perfil%></p>
                        </div>
                        <%}%>   
                    </div>