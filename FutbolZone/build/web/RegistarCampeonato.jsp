<%@page import="Modelos.Establecimiento"%>
<%
    String perfil = session.getAttribute("perfil").toString();

    if (perfil == null) {
        response.sendRedirect("loginUser?action=error403");
        session.setAttribute("setUsuario", null);
        session.setAttribute("perfil", null);
        session.invalidate();

    } else if (perfil.equals("Establecimiento")) {
        Establecimiento user = (Establecimiento) session.getAttribute("setUsuario");

%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="MenuAdmin.jsp"/>

<div class="content-page">
   <div class="content">
       <div class="">
           <div class="page-header-title">
               <h4 class="page-title">Clientes</h4>
           </div>
       </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row"
                    <div class="col-sm-12">
                        <div class="panel panel-primary">
                           <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-12"></div>
                                        <div class="col-sm-8 col-xs-12">
                                                <h4 class="m-t-0 m-b-30">Registrar Campeonato</h4>
                                                        <div class="m-t-20">
                                                            <form class="" action="CampeonatosC?action=create" method="post">
                                                                <div class="form-group">
                                                                    <label>Nombre</label>
                                                                    <div>
                                                                        <input type="text" name="nombre" class="form-control" required placeholder="Nombres"/>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Cupos</label>
                                                                    <div>
                                                                        <input type="text" name="cupos" class="form-control" required placeholder="Cupos"/>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Pemiacion</label>
                                                                    <div>
                                                                        <input type="text" name="premiacion" class="form-control" required placeholder="Premiacion"/>
                                                                    </div>
                                                                </div>
                                                                
                                                                 <div class="form-group">
                                                    <label>Tipo de Campeonato</label>
                                                    <div>
                                                        <select name="Campeonato" required class="form-control">
                                                            <option value="">Seleccione</option>
                                                            <option value="Futbol 5">Futbol 5</option>
                                                            <option value="Futbol 7">Futbol 7</option>
                                                            <option value="Futbol 8">Futbol 8</option>
                                                            <option value="Futbol 11">Futbol 11</option> 
                                                        </select> 
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
        <%} else {
        response.sendRedirect("loginUser?action=error403");
        session.setAttribute("setUsuario", null);
        session.setAttribute("perfil", null);
        session.invalidate();
    }

%>
