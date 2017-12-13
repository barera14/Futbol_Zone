<%@page import="Modelos.Establecimiento"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Encabezado.jsp"/>
<jsp:include page="../MenuAdmin.jsp"/>

            <div class="content-page">
                <div class="content">
                    <div class=""><div class="page-header-title"><h4 class="page-title">Futbol Zone</h4></div></div>
                    <div class="page-content-wrapper ">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel panel-primary" style="background-color: #f5f5f5"><div class="panel-body">
                                            <h4 class="m-t-0">Informacion del establecimiento</h4>
                                            <br/>
                                            <br/>
                                            <br/>
                                            <form>
            <% ArrayList Listado = (ArrayList) request.getAttribute("listarcarrerass");%>

                                        <%for (Object elem : Listado) {
                                                Establecimiento  sal = (Establecimiento) elem;
                                        %>
                                                <div class="col-md-12">
                                                    <div class="panel panel-default">
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <div class="invoice-title">
                                                                        <h4 class="pull-right"><%= sal.getDireccion()%></h4>
                                                                        <h3 class="m-t-0"><%= sal.getNombre()%></h3>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">
                                                           
                                                                        <div class="col-md-8">
                                                                    <div class="row">
                                                                          <div class="col-xs-6">
                                                                            <address> <strong>Nombre:</strong><br><%= sal.getNombre()%></address>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-xs-6">
                                                                            <address> <strong>Nit:</strong><br><%= sal.getNit()%></address>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-xs-6">
                                                                            <address> <strong>Direccion</strong><br> <%= sal.getDireccion()%></address>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-xs-6">
                                                                            <address> <strong>Correo:</strong><br> <%= sal.getUsuarios().getCorreo()%></address>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-xs-6">
                                                                            <address> <strong>Celular:</strong><br> <%= sal.getCelular()%></address>
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col-xs-6">
                                                                            <address> <strong>Ciudad:</strong><br> <%= sal.getMunicipio()%></address>
                                                                        </div>
                                                                    </div>
                                                                 
                                                                </div>
                                                                        <div class="col-md-4">
                                                                  
                                                            </div>
                                                                       <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="panel panel-default">
                                                                       
                                                                        <div class="panel-body">
                                                                          
                                                                            <div >
                                                                                <div class="pull-right">                                                                
                                                                                    <a type="button" href="ListarCanchas?action=ver" class="btn btn-primary waves-effect waves-light">Volver</a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>    
                                                                     </div>
                                                                           
                                                                    </div>
                                                            </div>
                                                         
                                                                   
                                                         
                                                        </div>
                                                    </div>
                                                                   
                                                    </div>
                                                </div>
                                                                    <%}%>
                                            </form>

                                            <div style="height: 700px">

                                            </div>                                                
                                        </div>                                            
                                    </div>
                                </div>                                    
                            </div>                                
                        </div>                            
                    </div>                        
                </div>
                <footer class="footer"> © 2016 WebAdmin - All Rights Reserved. </footer>
            </div>
        </div> 
        <script src="assets/js/jquery.min.js"></script> 
        <script src="assets/js/bootstrap.min.js">

        </script>
        <script src="assets/js/modernizr.min.js">

        </script> <script src="assets/js/detect.js">

        </script> <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script>
        <script src="assets/js/waves.js"></script> 
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script> 
        <script src="assets/js/app.js"></script> 
    </body>
    <!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/pages-blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:47 GMT -->
</html>