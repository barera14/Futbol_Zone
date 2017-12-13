<%@page import="Modelos.Alquiler"%>
<%@page import="Modelos.Establecimiento"%>
<%@page import="Modelos.Cancha"%>
<%@page import="java.util.ArrayList"%>
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
                                            Cancha sal = (Cancha) elem;
                                    %>
                                    <div class="col-md-12">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <div class="invoice-title">

                                                            <h3 class="m-t-0">Informacion del usuario:</h3>
                                                        </div>
                                                        <hr>
                                                        <div class="row">


                                                            <%}%>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="panel panel-default">

                                                                        <div class="panel-body">

                                                                            <div >
                                                                                <div class="panel panel-default">
                                                                                    <div class="panel-heading">
                                                                                        <h3 class="panel-title"><strong>Mis Reservas</strong></h3>
                                                                                    </div>
                                                                                    <div class="panel-body">
                                                                                        <div class="table-responsive">
                                                                                            <table class="table">
                                                                                                <thead>
                                                                                                    <tr>
                                                                                                        <td style="text-align: left;"><strong>Fecha inicio</strong></td>
                                                                                                        <td style="text-align: left;" class="text-center"><strong>Fecha final</strong></td>
                                                                                                        <td style="text-align: left;" class="text-center"><strong>Cliente</strong></td>
                                                                                                        <td style="text-align: left;" class="text-center"><strong>Estado</strong></td>
                                                                                                        <td style="text-align: left;" class="text-right"><strong>Valor</strong></td>
                                                                                                        <td style="text-align: left;" class="text-right"><strong>Accion</strong></td>
                                                                                                    </tr>
                                                                                                </thead>
                                                                                                <tbody>
                                                                                                    <% ArrayList Listad = (ArrayList) request.getAttribute("li");%>

                                                                                                    <%      for (Object elem : Listad) {
                                                                                                            Alquiler sa = (Alquiler) elem;
                                                                                                    %>
                                                                                                    <tr > 

                                                                                                        <td style="text-align: left;" class="text-center"><%= sa.getFecha()%></td>
                                                                                                        <td style="text-align: left;" class="text-center"><%= sa.getFechaFin()%></td>
                                                                                                        <td style="text-align: left;" class="text-right"><%= sa.getCliente().getNombre()%> <%= sa.getCliente().getApellido()%></td>
                                                                                                        <td style="text-align: left;" class="text-right"><%= sa.getEstado()%></td>
                                                                                                        <td style="text-align: left;" class="text-right"><%= sa.getValor()%></td>

                                                                                                        <th >

                                                                                                            <a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="#" data-original-title="Editar"><i style="color: darkorange" class="mdi mdi-pencil"></i></a>


                                                                                                            <% if (sa.getEstado() == "Reservar") {%>

                                                                                                            <a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="#" data-original-title="Cancelado - Confirmar"><i style="color: #e66060" class="mdi mdi-close-circle"></i></a>


                                                                                                            <%} else {%>
                                                                                                            <a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="#" data-original-title="Confirmado - Cancelar "><i style="color: green" class="mdi mdi-check-circle"></i></a>

                                                                                                            <%  }%>

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