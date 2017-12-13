<%-- 
    Document   : Canchas
    Created on : 15-dic-2009, 1:30:01
    Author     : USER
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelos.Campeonatos"%>
<%@page import="Modelos.Establecimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Encabezado.jsp"/>
<jsp:include page="../MenuAdmin.jsp"/>

<div class="content-page"><div class="content"><div class=""><div class="page-header-title"><h4 class="page-title">Futbol Zone</h4></div></div>
        <div class="page-content-wrapper "><div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-primary" style="background-color: #f5f5f5">
                            <div class="panel-body">
                                <h3 class="m-t-0">Campeonatos Disponibles:</h3>
                                <br/>
                                <br/>
                                <br/>

                                <% ArrayList Listado = (ArrayList) request.getAttribute("listarcarreras");%>

                                <%for (Object elem : Listado) {
                                        Campeonatos sal = (Campeonatos) elem;
                                %>
                                <div class="col-md-4">
                                    <div class="row">
                                        <div class="panel-body user-card" style="width: 300px; ">
                                            <div class="col-sm-4" style="width: 300px;">
                                                <div class="panel" style="width: 300px;">
                                                    <div class="media-main"> 

                                                        <div style="text-align: center" class="info">
                                                            <h4 ><a onclick="location.href = 'ListarCanchas?action=InfoEsta&id=<%= sal.getEstablecimiento().getIdEstablecimiento()%>'"><%= sal.getEstablecimiento().getNombre()%></a></h4>
                                                            <br>
                                                            <h1 class="ion-trophy"></h1>
                                                            <br>
                                                            <br>

                                                            <p style="text-align: left; margin-left: 25px;" class="text-muted">Nombre: <%= sal.getNombre()%> <br> Cupos: <%= sal.getCupos()%> <br> Premiacion: <%= sal.getPremiacion()%> <br> Maximo de equipos: <%= sal.getMaxEquipos()%> <br>Establecimiento: <%= sal.getEstablecimiento().getNombre()%> <br> Estado:<%= sal.getEstado()%> </p>
                                                        </div>
                                                    </div>

                                                    <div class="clearfix">

                                                    </div>

                                                    <hr>
                                                    <div >
                                                        <ul class="social-links list-inline m-b-0" >
                                                            <div>
                                                                <div class="text-center">   
                                                                    <button type="button" class="btn btn-primary waves-effect waves-light" data-toggle="modal" onclick="myFuncion('<%= sal.getEstablecimiento().getNombre()%>', '<%= sal.getNombre()%>', '<%= sal.getCupos()%>', '<%= sal.getPremiacion()%>', '<%= sal.getMaxEquipos()%>')" data-target="#custom-width-modal">Mas informacion</button>
                                                                    <button type="button" class="btn btn-primary waves-effect waves-light" data-toggle="modal" onclick="myFuncion3('<%= sal.getEstablecimiento().getNombre()%>', '<%= sal.getNombre()%>', '<%= sal.getCupos()%>', '<%= sal.getPremiacion()%>', '<%= sal.getMaxEquipos()%>', '<%= sal.getIdCampeonatos()%>')" data-target="#custom-width-modal2">Inscribir equipo </button>
                                                                </div>
                                                                <div id="custom-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: none;">
                                                                    <div class="modal-dialog" style="width:55%">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header"> 
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>

                                                                                <div class="modal-title" id="custom-width-modalLabel">
                                                                                    <h4  id="esta" >Campeonato </h4>
                                                                                    <h4></h4>
                                                                                </div>

                                                                            </div>

                                                                            <div class="modal-body" >
                                                                                <label>Nombre del campeonato:</label>
                                                                                <p id="nom"></p>

                                                                                <label>Cupos:</label>
                                                                                <p id="cup"></p>
                                                                                <label>Premiacion:</label>
                                                                                <p id="prem"></p>
                                                                                <label>Maximos equipos:</label>
                                                                                <p id="maxeq"></p>



                                                                                <div class="modal-footer">

                                                                                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Volver</button> 

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>




                                                        </ul>


                                                    </div>



                                                    <!--//zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz-->
                                                    <form action="ListarCampeonatos?action=inscribir" method="Post">
                                                        <div id="custom-width-modal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: none;">
                                                            <div class="modal-dialog" style="width:55%">
                                                                <div class="modal-content">
                                                                    <div class="modal-header"> 
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>

                                                                        <div class="modal-title" id="custom-width-modalLabel">
                                                                            <h4>Campeonato </h4>
                                                                            <h4 id="estas"></h4>
                                                                        </div>

                                                                    </div>

                                                                    <div class="modal-body">
                                                                        <h4 id="noms"></h4>

                                                                        <label>Cupos:</label>
                                                                        <p id="cups"></p>
                                                                        <label>Premiacion:</label>
                                                                        <p id="prems"></p>
                                                                        <label>Maximos equipos:</label>
                                                                        <p id="maxeqs"></p>

                                                                        <p hidden="" id="idd"></p>

                                                                        <div class="modal-footer">
                                                                            <div style="text-align:  left;">
                                                                                <label>Nombre del equipo:</label>
                                                                                <br/>

                                                                                <input class="form-control" required=""  type="text" name="nom" placeholder="Ingresar nombre del equipo"> 

                                                                                <input hidden="" type="text"  name="n" id="iiii" value="">
                                                                                <input hidden="" type="text"  name="nn" id="iii" value="">
                                                                            </div>
                                                                            <br/>
                                                                            <button type="submit" class="btn btn-primary waves-effect waves-light">Inscribir Equipo</button> 




                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>

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
<script src="assets/plugins/timepicker/bootstrap-timepicker.js"></script>
<script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script> 
<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script> 
<script src="assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script> 
<script src="assets/plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js" type="text/javascript"></script>
<script src="assets/pages/form-advanced.js"></script> 
<script src="assets/js/app.js"></script>
<script type = "text/javascript" src = "assets/plugins/parsleyjs/parsley.min.js" ></script> 
<script type="text/javascript">$(document).ready(function () {
                                                                                                $('form').parsley();
                                                                                            });</script>






<script type="text/javascript">
    function myFuncion(esta, nom, cup, prem, maxeq) {

        document.getElementById('esta').textContent = esta;
        document.getElementById('nom').textContent = nom;
        document.getElementById('cup').textContent = cup;
        document.getElementById('prem').textContent = prem;
        document.getElementById('maxeq').textContent = maxeq;

    }
    function myFuncion3(estas, noms, cups, prems, maxeqs, idd) {

        document.getElementById('estas').textContent = estas;
        document.getElementById('noms').textContent = noms;
        document.getElementById('cups').textContent = cups;
        document.getElementById('prems').textContent = prems;
        document.getElementById('maxeqs').textContent = maxeqs;
        document.getElementById('idd').textContent = idd;

        $("#iiii").val(idd);
        $("#iii").val(maxeqs);
    }
    function myFuncion4(estass) {

        document.getElementById('estas').textContent = estass;

    }

    function myFuncion2(a) {

        document.getElementById('a').textContent = a;
//                    document.getElementById('nom').textContent = nom;
//                    document.getElementById('cup').textContent = cup;
//                    document.getElementById('prem').textContent = prem;
//                    document.getElementById('maxeq').textContent = maxeq;
    }
</script> 
</body>
<!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/pages-blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:47 GMT -->
</html>