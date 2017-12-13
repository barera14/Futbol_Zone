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


                                                    <% ArrayList Listado = (ArrayList) request.getAttribute("lista");%>

                                                    <%for (Object el : Listado) {
                                                            Equipo sall = (Equipo) el;
                                                    %>
                                                    <div class="panel-body" >
                                                        <h3 style="text-align: center">Nombre del equipo: <%= sall.getNombre()%></h3>



                                                        <form action="ListarCampeonatos?action=registrar" method="POST">


                                                            <hr>

                                                            <h3 style="text-align: center;">Registrar jugador (<%= request.getAttribute("a")%>) de <%= request.getAttribute("aaa")%></h3>

                                                            <% Object a = request.getAttribute("aa");

                                                                if (request.getAttribute("aaa") == request.getAttribute("a")) {
                                                                    JOptionPane.showMessageDialog(null, "Equipo registrado con exito");
                                                                    response.sendRedirect("ListarCampeonatos?action=ver");

                                                                }
                                                                





//
//
//   Object a = request.getAttribute("aaa");
//                                                            int i = (int) a;
//                                                            int t=i+1;
//                                                            Object aa = request.getAttribute("a");
//                                                            int ii = (int) aa;
//                                                      
//                                                                if (ii== t) {
//                                                                    JOptionPane.showMessageDialog(null, "Equipo registrado con exito");
//                                                                    response.sendRedirect("ListarCampeonatos?action=ver");
//
//                                                                }
//                                                            
                                                            %>
                                                            <br>
                                                            <div>
                                                                <label>Nombre del jugador:</label>
                                                                <br/>
                                                                <input class="form-control" type="text" name="nombre" required="required" placeholder="Ingresar Nombre del jugador"/>
                                                            </div>
                                                            <br/>
                                                            <div>
                                                                <label>Numero de documento:</label>
                                                                <br/>
                                                                <input class="form-control" type="number" required="required" name="documento" placeholder="Ingresar Numero de documento"/>
                                                            </div>
                                                            <br/>
                                                            <div>
                                                                <label>Numero de telefono:</label>
                                                                <br/>
                                                                <input class="form-control" type="number" required="required" name="telefono" placeholder="Ingresar Numero de telefono"/>
                                                            </div>
                                                            <br/>
                                                            <div>
                                                                <label>Dorsal:</label>
                                                                <br/>
                                                                <input class="form-control" type="number" required="required" name="dorsal" placeholder="Ingresar Dorsal"/>
                                                            </div>
                                                            <div>
                                                                <input hidden="" type="number" name="equipo" value="<%= sall.getIdEquipo()%>"/>
                                                                <input hidden="" type="text" name="n" value="<%= sall.getNombre()%>"/>
                                                                <input hidden="" type="text" name="na" value="<%= request.getAttribute("aaa")%>"/>
                                                            </div>
                                                            <br/>
                                                            <button type="submit"     class="btn btn-primary waves-effect waves-light">Guardar</button>
                                                            <a type="submit" href="ListarCampeonatos?action=eliminar&id=<%= sall.getIdEquipo()%>" class="btn btn-primary waves-effect waves-light">Cancelar</a>
                                                            <%}%>
                                                        </form>

                                                        <h3 style="text-align: center">Informacion del equipo:</h3>
                                                        <br/>
                                                        <br/>






                                                        <div class="col-md-12">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-body">

                                                                    <div id="datatable-keytable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                                                                        <div class="row"><div class="col-sm-12">
                                                                                <form>
                                                                                    <table id="datatable-keytable" class="table table-striped table-bordered dataTable no-footer" role="" aria-describedby="datatable-keytable_info" style="position: relative;"><thead>
                                                                                            <tr >
                                                                                                <th class="sorting_asc" tabindex="0" aria-controls="datatable-keytable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 161px;">Nombre del jugador</th>
                                                                                                <th class="sorting" tabindex="0" aria-controls="datatable-keytable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 249px;">Numero de documento</th>
                                                                                                <th class="sorting" tabindex="0" aria-controls="datatable-keytable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 120px;">Numero de telefono</th>
                                                                                                <th class="sorting" tabindex="0" aria-controls="datatable-keytable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 60px;">Dorsal</th>
                                                                                            </tr>

                                                                                        </thead>

                                                                                        <tbody>

                                                                                            <% ArrayList Lista = (ArrayList) request.getAttribute("juga");%>

                                                                                            <%for (Object ela : Lista) {
                                                                                                    Jugadores s = (Jugadores) ela;

                                                                                            %>
                                                                                            <tr role="row" class="odd">  

                                                                                                <td><%= s.getNombre()%></td>
                                                                                                <td><%= s.getDocumento()%></td>
                                                                                                <td><%= s.getCelular()%></td>
                                                                                                <td><%= s.getDorsal()%></td>
                                                                                                <%}%>
                                                                                        </tbody>
                                                                                    </table>


                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-sm-6">

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
                    </div>                                    
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
<script type="text/javascript">$(document).ready(function () {
        $('form').parsley();});</script>

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