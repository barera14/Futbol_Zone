<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelos.Jugadores"%>
<%@page import="Modelos.Equipo"%>
<%@page import="Modelos.Campeonatos"%>
<%@page import="Modelos.Establecimiento"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Encabezado.jsp"/>
<jsp:include page="../MenuAdmin.jsp"/>

<div class="content-page">
    <div class="content">
        <div class="">
            <div class="page-header-title">
                <h4 class="page-title">Futbol Zone</h4>
            </div>
        </div>
        <div class="page-content-wrapper "><div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-primary" style="background-color: #f5f5f5">
                            <div class="panel-body">
                                <h4 class="m-t-0">Registrar Equipo</h4>
                                <br/>
                                <br/>
                                <br/>

                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">

                                            <div class="invoice-title">


                                            </div>
                                            <hr>
                                            <div >

                                                <div class="panel panel-default" >



                                                    <div class="panel-body" >

                                                        <% Jugadores actualizar = (Jugadores) request.getAttribute("s");%>



                                                        <form action="ListarCampeonatos?action=edit&id=<%= actualizar.getIdJugadores()%>" method="POST">


                                                            <hr>

                                                            <div>
                                                                <label>Nombre del jugador:</label>
                                                                <br/>
                                                                <input class="form-control" type="text" name="nombre" required="required" value="<%= actualizar.getNombre()%>"/>
                                                            </div>
                                                            <br/>
                                                            <div>
                                                                <label>Numero de documento:</label>
                                                                <br/>
                                                                <input class="form-control" type="text" required="required" name="documento" value="<%= actualizar.getDocumento()%>"/>
                                                            </div>
                                                            <br/>
                                                            <div>
                                                                <label>Numero de telefono:</label>
                                                                <br/>
                                                                <input class="form-control" type="text" required="required" name="celular" value="<%= actualizar.getCelular()%>"/>
                                                            </div>
                                                            <br/>
                                                            <div>
                                                                <label>Dorsal:</label>
                                                                <br/>
                                                                <input class="form-control" type="text" required="required" name="dorsal" value="<%= actualizar.getDorsal()%>"/>
                                                            </div>

                                                 <br/>
                                                    <button type="submit"     class="btn btn-primary waves-effect waves-light">Guardar</button>

                                                
                                                    </form>
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






        <div style="height: 700px">

        </div>                                                
    </div>                                            
</div>
                                   

<footer class="footer"> © 2016 WebAdmin - All Rights Reserved. </footer>

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

<script type = "text/javascript" src = "assets/plugins/parsleyjs/parsley.min.js" ></script> 
<script type="text/javascript">
    $(document).ready(function () {
        $('form').parsley();
    });</script>

<script src="assets/plugins/datatables/jquery.dataTables.min.js">
</script> <script src="assets/plugins/datatables/dataTables.bootstrap.js">
</script> <script src="assets/plugins/datatables/dataTables.buttons.min.js">
</script> <script src="assets/plugins/datatables/buttons.bootstrap.min.js">
</script> <script src="assets/plugins/datatables/jszip.min.js">
</script> <script src="assets/plugins/datatables/pdfmake.min.js">
</script> <script src="assets/plugins/datatables/vfs_fonts.js">
</script> <script src="assets/plugins/datatables/buttons.html5.min.js">
</script> <script src="assets/plugins/datatables/buttons.print.min.js">
</script> <script src="assets/plugins/datatables/dataTables.fixedHeader.min.js">
</script> <script src="assets/plugins/datatables/dataTables.keyTable.min.js">
</script> <script src="assets/plugins/datatables/dataTables.responsive.min.js">
</script> <script src="assets/plugins/datatables/responsive.bootstrap.min.js">
</script> <script src="assets/plugins/datatables/dataTables.scroller.min.js">
</script> <script src="assets/pages/datatables.init.js">

</script>
</body>
<!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/pages-blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:47 GMT -->
</html>