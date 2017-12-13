<%@page import="Modelos.Alquiler"%>
<%@page import="Modelos.Establecimiento"%>
<%@page import="Modelos.Cancha"%>
<%@page import="Modelos.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%
    if (session.getAttribute("perfil")==null) {
        response.sendRedirect("loginUser?action=error403");
        session.setAttribute("setUsuario", null);
            session.setAttribute("perfil", null);
            session.invalidate();  
        
    } else if (session.getAttribute("perfil").toString().equals("Cliente")) {
        Cliente user = (Cliente) session.getAttribute("setUsuario");

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Encabezado.jsp"/>
<jsp:include page="../MenuAdmin.jsp"/>
            <div class="content-page"><div class="content"><div class=""><div class="page-header-title"><h4 class="page-title">Futbol Zone</h4></div></div>
                    <div class="page-content-wrapper "><div class="container">
                            <div class="row"><div class="col-sm-12"><div class="panel panel-primary" style="background-color: #f5f5f5"><div class="panel-body">
                                            <h4 class="m-t-0">Canchas Disponibles:</h4>
                                            <br/>
                                            <br/>
                                            <br/>
                                            <form>
               <% ArrayList Listado = (ArrayList) request.getAttribute("listarcarrerass");%>

                                        <%for (Object elem : Listado) {
                                                Cancha  sal = (Cancha) elem;
                                        %>
                                                <div class="col-md-12">
                                                    <div class="panel panel-default">
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="col-xs-12">
                                                                    <div class="invoice-title">
                                                                        <h4 class="pull-right"><%= sal.getEstablecimiento().getDireccion()%></h4>
                                                                        <h3 class="m-t-0"><%= sal.getEstablecimiento().getNombre()%></h3>
                                                                    </div>
                                                                    <hr>
                                                                    <div class="row">

                                                                        <div class="col-md-8">
                                                                            <div class="row">
                                                                                <div class="col-xs-6">
                                                                                    <address> <strong>Establecimiento:</strong><br> <%= sal.getEstablecimiento().getNombre()%></address>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-xs-6">
                                                                                    <address> <strong>Tipo de cancha</strong><br> <%= sal.getTipoCancha()%></address>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col-xs-6">
                                                                                    <address> <strong>Valor:</strong><br>$<%= sal.getValor()%></address>
                                                                                </div>
                                                                            </div>


                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <div class="col-xs-6 text-right"> <img style="width: 200px"src="assets\images\big\<%= sal.getFoto()%>">
                                                                                <br>

                                                                                <p  style="text-align: center; color: darkorange" class="mdi mdi-star"></p>
                                                                                <p  style="text-align: center; color: darkorange" class="mdi mdi-star"></p>
                                                                                <p  style="text-align: center; color: darkorange" class="mdi mdi-star"></p>
                                                                                <p  style="text-align: center; color: darkorange" class="mdi mdi-star"></p>
                                                                                <p  style="text-align: center; color: darkorange" class="mdi mdi-star"></p>

                                                                            </div>
                                                                        </div>
                                                                                 <%}%>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <div class="panel panel-default">

                                                                                    <div class="panel-body">

                                                                                        <div >
                                                                                            <div class="panel panel-default">
                                                                                                <div class="panel-heading">
                                                                                                    <h3 class="panel-title"><strong>Reservas</strong></h3>
                                                                                                </div>
                                                                                                <div class="panel-body">
                                                                                                    <div class="table-responsive">
                                                                                                        <table class="table">
                                                                                                            <thead>
                                                                                                                <tr>
                                                                                                                    <td style="text-align: left;"><strong>Fecha inicio</strong></td>
                                                                                                                    <td style="text-align: left;" class="text-center"><strong>Fecha final</strong></td>
                                                                                                                    <td style="text-align: left;" class="text-center"><strong>Cliente</strong></td>
                                                                                                                    <td style="text-align: left;" class="text-right"><strong>Valor</strong></td>
                                                                                                                </tr>
                                                                                                            </thead>
                                                                                                            <tbody>
                                                                                                                          <% ArrayList Listad = (ArrayList) request.getAttribute("li");%>

                                        <%                                                                               for (Object elem : Listad) {
                                                                                                                        Alquiler  sa = (Alquiler) elem;
                                        %>
                                        <tr > 
                                                                                                                    
                                                                                                                    <td style="text-align: left;" class="text-center"><%= sa.getFecha()%></td>
                                                                                                                    <td style="text-align: left;" class="text-center"><%= sa.getFechaFin()%></td>
                                                                                                                    <td style="text-align: left;" class="text-right"><%= sa.getCliente().getNombre()%> <%= sa.getCliente().getApellido()%></td>
                                                                                                                    <td style="text-align: left;" class="text-right"><%= sa.getValor()%></td>
                                                                                                                </tr>
                                                                                                             
                                                                                                                <%}%>
                                                                                                            </tbody>
                                                                                                        </table>
                                                                                                    </div>
                                                                                                    <div class="hidden-print">
                                                                                                        <div class="pull-right"> 
                                                                                                        </div>

                                                                                                    </div>
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
<%} else {
        response.sendRedirect("loginUser?action=error403");
 session.setAttribute("setUsuario", null);
     session.setAttribute("perfil", null);
     session.invalidate(); 
}

%>