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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="MenuAdmin.jsp"/>

<div class="content-page">
    <div class="content">
        <div class="">
            <div class="page-header-title">
                <h4 class="page-title">Campeonatos</h4>
            </div>
        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Administrar Campeonatos</h4>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Nombre</th>
                                                    <th>Cupos</th>
                                                    <th>Premiacion</th>
                                                    <th>Tipo Campeonato</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cli" items="${requestScope.ArrayCliente}">
                                                    <tr>  
                                                      <td> <c:out value="${cli.nombre}"/></td>
                                                      <td> <c:out value="${cli.cupos}"/></td>
                                                      <td> <c:out value="${cli.premiacion}"/></td>
                                                      <td> <c:out value="${cli.maxEquipos}"/></td>
                                                      <td> <c:out value="${cli.estado}"/></td>
                                                        <td> 
                                                            <button class="btn btn-sm btn-danger" type="button" title="Ver Equipos"  onclick="location.href = 'CampeonatosC?action=verequipos&id=${cli.idCampeonatos}'"><i class="mdi mdi-eye"></i> </button>
                                                          
                                                            <button class="btn btn-sm btn-success" type="button" title="Registrar Enfrentamientos"  onclick="location.href = 'PartidoC?action=select&id=${cli.idCampeonatos}'"><i class="mdi mdi-check"></i></button>
                                                            
                                                            </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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