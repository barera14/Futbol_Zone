<%-- 
    Document   : Canchas
    Created on : 15-dic-2009, 1:30:01
    Author     : USER
--%>

<%@page import="Modelos.Alquiler"%>
<%@page import="Modelos.Cancha"%>
<%@page import="Modelos.Establecimiento"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                              
                                    <% ArrayList Listado = (ArrayList) request.getAttribute("listarcarreras");%>

                                    <%for (Object elem : Listado) {
                                            Cancha sal = (Cancha) elem;
                                    %>
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="panel-body user-card" style="width: 300px; ">
                                                <div class="col-sm-4" style="width: 300px;">
                                                    <div class="panel" style="width: 300px;">
                                                        <div class="media-main"> 

                                                            <div style="text-align: center" class="info">
                                                                <h4 ><a onclick="location.href = 'ListarCanchas?action=InfoEsta&id=<%= sal.getEstablecimiento().getIdEstablecimiento()%>'"><%= sal.getEstablecimiento().getNombre()%></a></h4>

                                                                <p class="text-muted"><%= sal.getTipoCancha()%></p>
                                                            </div>
                                                        </div>

                                                        <div class="clearfix">

                                                        </div>
                                                        <div style="  position: relative; left:10px; ">
                                                            <a class="pull-left" href="#" > 
                                                                <img style="width:280px;height: 180px" src="Fotos/<%= sal.getFoto()%>"> 

                                                            </a>
                                                            <br/>
                                                            <br/>
                                                            <div>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <br/>
                                                                <br/>

                                                                <p class="text-muted info-text" style="text-align: center">$ <%= sal.getValor()%></p>
                                                            </div>
                                                        </div>

                                                        <hr>
                                                        <div >
                                                            <ul class="social-links list-inline m-b-0" >
                                                                <div>
                                                                    <div class="text-center">   
                                                                        <% Alquiler ianlol = new Alquiler();
                                                                            ianlol.setIan(sal.getIdCancha());
                                                                        %>
                                                                        <a type="button" href="ListarCanchas?action=ver3&id=<%= sal.getIdCancha()%>" class="btn btn-primary waves-effect waves-light">Mas informacion!</a>
                                                                        <button type="button" class="btn btn-primary waves-effect waves-light" data-toggle="modal" onclick=" myFuncion('<%= sal.getEstablecimiento().getNombre()%>', '<%= sal.getValor()%>', '<%= sal.getTipoCancha()%>', '<%= sal.getIdCancha()%>')<%  %>" data-target="#custom-width-modal">Alquilar</button>

                                                                    </div>
                                                                    <div id="custom-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: none;">
                                                                        <div class="modal-dialog" style="width:55%">
                                                                            <div class="modal-content">
                                                                                <div class="modal-header"> 
                                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>

                                                                                    <div class="modal-title" id="custom-width-modalLabel"><h4  id="soloo"></h4></div>

                                                                                </div>
                                                                                 <form action="ListarCanchas?action=RCacha" method="Post">
                                                                                <div class="modal-body">

                                                                                    <h4>Alquilar cancha!</h4>

                                                                                    <label>Tipo de cancha:</label>
                                                                                    <p id="val"></p>

                                                                                    <label>Valor:</label>
                                                                                    <p id="solo"></p>
                                                                                    <hr>
                                                                                    <div>
                                                                                         
                                                                                        <div class="form-group"> 
                                                                                            <label>Fecha y hora</label>
                                                                                            <div>
                                                                                                <div class="input-group">
                                                                                                    <input type="datetime" name="horainicio" required="" class="form-control" placeholder="Dia /Mes /Año - Hora /Minuto" >
                                                                                                    <span class="input-group-addon bg-custom b-0">
                                                                                                        <i class="mdi mdi-calendar"></i>
                                                                                                    </span>
                                                                                                </div>

                                                                                                <div>
                                                                                                    <label>Numero de horas</label>
                                                                                                    <input type="number" name="horafin" required="" class="form-control" placeholder="Ingresar numero de horas">

                                                                                                </div>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div hidden="">
                                                                                            <h3 name="cancha" id="i"></h3>
                                                                                            <input type="text" name="cancha" id="xyz" value="">
                                                                                            <input type="text" id="al" value="" name="val">


                                                                                        </div>
                                                                                        <div>
                                                                                            <label></label>
                                                                                        </div>

                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button type="reset" class="btn btn-default waves-effect" data-dismiss="modal">Cancelar</button> 
                                                                                        <button type="submit" class="btn btn-primary waves-effect waves-light">Alquilar!</button>
                                                                                    </div>
                                                                                </div>
                                                                                      </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                            </ul>


                                                        </div>

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
    function myFuncion(vall, val, tipo, i) {

        document.getElementById('soloo').textContent = vall;
        document.getElementById('solo').textContent = val;
        document.getElementById('val').textContent = tipo;
        document.getElementById('i').textContent = i;

        $("#xyz").val(i);
        $("#al").val(val);
    }
</script> 
</body>
<!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/pages-blank.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:47 GMT -->
</html>