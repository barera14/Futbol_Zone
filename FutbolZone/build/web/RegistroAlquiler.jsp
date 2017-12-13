
<%
    if (session.getAttribute("perfil") == null) {
        response.sendRedirect("loginUser?action=errorS");
       
        
    } else if (session.getAttribute("perfil").toString().equals("Establecimiento")) {
     //   Establecimiento user = (Establecimiento) session.getAttribute("setUsuario");

%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="MenuAdmin.jsp"/>

<div class="content-page">
    <div class="content">
        <div class="">
            <div class="page-header-title">
                <h4 class="page-title">Establecimiento</h4>
            </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-12"></div>
                                    <div class="col-sm-8 col-xs-12">
                                        <h4 class="m-t-0 m-b-30">Registrar Establecimiento</h4>
                                        <div class="m-t-20">
                                            <form class="" enctype="multipart/form-data"  action="AlquilerC?action=RCacha" method="post">
                                                <div class="form-group"> 
                                                    <label>Fecha De Alquiler</label>
                                                    <div>
                                                        <div class="input-group"> 
                                                            <input type="text" name="fecha" class="form-control" placeholder="mm/dd/yyyy" id="datepicker-autoclose">
                                                            <span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
                                                    <label>Hora Inicio</label>
                                                    <div class="input-group m-b-15">
                                                        <div class="bootstrap-timepicker">
                                                            <input id="timepicker" name="horainicio" type="text" class="form-control">
                                                        </div> <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                                    </div>
                                                </div>
                                                <div class="form-group"> 
                                                    <label>Hora Fin</label>
                                                    <div class="input-group m-b-15">
                                                        <div class="bootstrap-timepicker">
                                                            <input id="timepicker3" name="horafin" type="text" class="form-control">
                                                        </div> <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div>
                                                        <button type="submit" class="btn btn-primary waves-effect waves-light"> Submit </button> 
                                                        <button type="reset" class="btn btn-default waves-effect m-l-5"> Cancel </button></div>
                                                </div>
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

<jsp:include page="PieDePagina.jsp"/>
<%
}

%>