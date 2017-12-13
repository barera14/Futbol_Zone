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

        </script>
    </head>
    <body >

        <div style="margin-top:30px;" class="wrapper-page">
            <div class="panel panel-color panel-primary panel-pages">
                <div class="panel-body">
                    <h3 class="text-center m-t-0 m-b-15"> <img class="logo" src="image/logo.png"></h3>
                    <h4 class="text-muted text-center m-t-0">
                        <b>Registrar Establecimiento

                        </b>

                    </h4>
                    <form class="" action="EstablecimientoC?action=create" method="post">
                        <div class="form-group">
                            <label>Nombre Establecimiento</label>
                            <div>
                                <input type="text" name="nombre" class="form-control" required placeholder="Nombre del Establecimiento"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Nit</label>
                            <div>
                                <input data-parsley-minlength="4" data-parsley-maxlength="11" name="nit" type="number" class="form-control" required placeholder="Nit"/>
                                <div>
                                </div>
                                <div class="form-group"> 
                                    <label>Ciudad</label> 
                                    <div>
                                        <input type="text" name="ciudad" class="form-control" required placeholder="Ciudad"/>
                                        <div>
                                        </div>
                                        <div class="form-group"> 
                                            <label>Direccion</label>
                                            <div>
                                                <input type="text" name="direccion" class="form-control" required placeholder="Direccion"/>
                                                <div>
                                                </div>
                                                <div class="form-group"> 
                                                    <label>E-Mail</label>
                                                    <div>
                                                        <input type="email" name="email" class="form-control" required parsley-type="email" placeholder="E-mail"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Telefono</label>
                                                    <div> 
                                                        <input type="number" name="telefono" class="form-control" required data-parsley-minlength="6" data-parsley-maxlength="10" placeholder="Telefono."/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Contraseña</label>
                                                    <div> 
                                                        <input type="password" name="password" id="pass2" class="form-control" required data-parsley-minlength="8" data-parsley-maxlength="15" placeholder="Contraseña"/>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" class="btn btn-primary waves-effect waves-light"> Registrar </button> 
                                                        <button type="reset"  onclick="javascript:history.go(-1)" class="btn btn-default waves-effect m-l-5"> Cancelar </button></div>
                                                </div>
                                                </form>

                                            </div>

                                        </div>

                                    </div> 
                                    <script src="assets/js/jquery.min.js">

                                    </script> 
                                    <script src="assets/js/bootstrap.min.js">

                                    </script> 
                                    <script src="assets/js/modernizr.min.js">

                                    </script> 
                                    <script src="assets/js/detect.js">

                                    </script> 
                                    <script src="assets/js/fastclick.js">

                                    </script> 
                                    <script src="assets/js/jquery.slimscroll.js">

                                    </script> 
                                    <script src="assets/js/jquery.blockUI.js">

                                    </script> 
                                    <script src="assets/js/waves.js">

                                    </script> 
                                    <script src="assets/js/wow.min.js">

                                    </script> 
                                    <script src="assets/js/jquery.nicescroll.js">

                                    </script> 
                                    <script src="assets/js/jquery.scrollTo.min.js">

                                    </script> 
                                    <script src="assets/js/app.js">

                                    </script> 

                                    <script type = "text/javascript" src = "assets/plugins/parsleyjs/parsley.min.js" ></script> 
                                    <script type="text/javascript">$(document).ready(function () {
                $('form').parsley();
            });</script>    
                                    </body>

                                    <!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/pages-register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:47 GMT -->


                                    </html>