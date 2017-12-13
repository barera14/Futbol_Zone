<%@page import="Modelos.Campeonatos"%>
<%@page import="Modelos.Jugadores"%>
<%@page import="Modelos.Equipo"%>
<%@page import="Modelos.Alquiler"%>
<%@page import="Modelos.Establecimiento"%>
<%@page import="Modelos.Cancha"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Encabezado.jsp"/>
<jsp:include page="../MenuAdmin.jsp"/>

<div class="content-page">
    <div class="content">
        <div class="">
            <div class="page-header-title">
                <h4 class="page-title">Futbol Zone</h4>
            </div></div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-primary" style="background-color: #f5f5f5">
                            <div class="panel-body">
                                <h4 class="m-t-0">Mis Campeonatos</h4>
                                <br/>
                                <br/>
                                <br/>
                                <% ArrayList Lista = (ArrayList) request.getAttribute("liq");%>

                                <%for (Object elem : Lista) {
                                        Equipo sal = (Equipo) elem;

                                %>




                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <div class="invoice-title">

                                                        <h3 class="m-t-0">Informacion del campeonato: <%= sal.getCampeonatos().getNombre()%></h3>
                                                    </div>
                                                    <hr>
                                                    <br/>
                                                    <div class="row">
                                                        <div>
                                                            <label>Nombre del campeonato:</label>
                                                            <%= sal.getCampeonatos().getNombre()%>
                                                        </div>
                                                        <div>
                                                            <label>Cupos:</label>
                                                            <%= sal.getCampeonatos().getCupos()%>
                                                        </div>
                                                        <div>
                                                            <label>Premiacion:</label>
                                                            <%= sal.getCampeonatos().getPremiacion()%>
                                                        </div>
                                                        <div>
                                                            <label>Tipo de campeonato:</label>
                                                            <%= sal.getCampeonatos().getMaxEquipos()%>
                                                        </div>
                                                        <div>
                                                            <label>Establecimiento:</label>
                                                            <%= sal.getCampeonatos().getEstablecimiento().getNombre()%>
                                                        </div>
                                                        <div>
                                                            <label>Estado:</label>
                                                            <%= sal.getCampeonatos().getEstado()%>
                                                        </div>

                                                        <%}%>
<br/>
<br/>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="panel panel-default">

                                                                    <div class="panel-body">

                                                                        <div >
                                                                            <div class="panel panel-default">
                                                                                <div class="panel-heading">
                                                                                    <h3 class="panel-title"><strong>Mi Equipo</strong></h3>
                                                                                </div>
                                                                                <div class="panel-body">
                                                                                    <div class="table-responsive">
                                                                                        <table class="table">
                                                                                            <thead>
                                                                                                <tr>

                                                                                                    <td style="text-align: left;" class="text-center"><strong>Nombre</strong></td>
                                                                                                    <td style="text-align: left;" class="text-center"><strong>Documento</strong></td>
                                                                                                    <td style="text-align: left;" class="text-center"><strong>Celular</strong></td>
                                                                                                    <td style="text-align: left;" class="text-right"><strong>Dorsal</strong></td>
                                                                                                    <td style="text-align: left;" class="text-right"><strong>Accion</strong></td>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <% ArrayList List = (ArrayList) request.getAttribute("li");%>

                                                                                                <%for (Object elem : List) {
                                                                                                        Jugadores sal = (Jugadores) elem;

                                                                                                %>
                                                                                                <tr > 

                                                                                                    <td style="text-align: left;" class="text-center"><%= sal.getNombre()%></td>
                                                                                                    <td style="text-align: left;" class="text-center"><%= sal.getDocumento()%></td>
                                                                                                    <td style="text-align: left;" class="text-right"><%= sal.getCelular()%></td>
                                                                                                    <td style="text-align: left;" class="text-right"><%= sal.getDorsal()%></td>


                                                                                                    <th >

                                                                                                        <a title="" data-placement="top" data-toggle="tooltip" class="tooltips" href="ListarCampeonatos?action=edit&id=<%= sal.getIdJugadores()%>" data-original-title="Editar"><i style="color: #e66060 ; "  class="mdi mdi-pencil"></i></a>




                                                                                                </tr>
                                                                                                <%}%>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                    <div class="hidden-print">
                                                                                        <div class="pull-right"> 
                                                                                        </div>

                                                                                    </div>
                                                                                    
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>    
                                                            </div>

                                                        </div>
                                                                                            <br/>
                                               
        </div>  
                                                    </div>



                                                </div>
                                            </div>

                                        </div>
                                    </div>



                                    <div style="height: 700px">

                                    </div>                                                
                                </div>                                            
                            </div>
                        </div>                                    
                    </div>                                
                </div>                            
            </div>                        
        </div>
        <footer class="footer"> © 2017 Futbol Zone. </footer>
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