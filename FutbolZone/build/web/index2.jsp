<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="Modelos.Cliente"%>
<%@page import="Modelos.Establecimiento"%>
<%
    if (session.getAttribute("perfil") == null) {
        response.sendRedirect("loginUser?action=error403");
        session.setAttribute("setUsuario", null);
        session.setAttribute("perfil", null);
        session.invalidate();

    } else if (session.getAttribute("perfil").equals("Establecimiento")) {
        Establecimiento user = (Establecimiento) session.getAttribute("setUsuario");

%>
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
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Lista de Canchas</h4>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Tipo de Cancha</th>
                                                    <th>Nombre Cliente</th>
                                                    <th>Fecha de inicio</th>
                                                    <th>Fecha Final</th>
                                                    <th>Valor</th>
                                                    <th>Acciones</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="campeonato" items="${requestScope.ArrayAlq}">
                                                    <tr>
                                                        <td> <c:out value="${campeonato.cancha.tipoCancha}"/></td>
                                                        <td> <c:out value="${campeonato.cliente.nombre}"/> <c:out value="${campeonato.cliente.apellido}"/></td>
                                                        <td> <c:out value="${campeonato.fecha}"/></td>
                                                        <td> <c:out value="${campeonato.fechaFin}"/></td>
                                                        <td> <c:out value="${campeonato.valor}"/></td>
                                                        <td> <button class="btn btn-sm btn-danger" type="button" title="Ver Equipos"  onclick="location.href = 'AlquilerC?action=admin'"><i class="mdi mdi-eye"></i> </button>
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
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Lista de Campeonatos</h4>
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
                                                <c:forEach var="campeonato" items="${requestScope.ArrayCliente}">
                                                    <tr>
                                                        <td> <c:out value="${campeonato.nombre}"/></td>
                                                        <td> <c:out value="${campeonato.cupos}"/></td>
                                                        <td> <c:out value="${campeonato.premiacion}"/></td>
                                                        <td> <c:out value="${campeonato.maxEquipos}"/></td>
                                                        <td> <c:out value="${campeonato.estado}"/></td>
                                                        <td> <button class="btn btn-sm btn-danger" type="button" title="Ver Equipos"  onclick="location.href = 'CampeonatosC?action=admin'"><i class="mdi mdi-eye"></i> </button>
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
<%  } else if (session.getAttribute("perfil").equals("Cliente")) {
    Cliente user = (Cliente) session.getAttribute("setUsuario");

%>
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
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Lista de Campeonatos</h4>
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
                                                <c:forEach var="campeonato" items="${requestScope.ArrayCliente}">
                                                    <tr>
                                                        <td> <c:out value="${campeonato.nombre}"/></td>
                                                        <td> <c:out value="${campeonato.cupos}"/></td>
                                                        <td> <c:out value="${campeonato.premiacion}"/></td>
                                                        <td> <c:out value="${campeonato.maxEquipos}"/></td>
                                                        <td> <c:out value="${campeonato.estado}"/></td>
                                                        <td> <button class="btn btn-sm btn-danger" type="button" title="Ver Equipos"  onclick="location.href = 'ListarCanchas?action=ver'"><i class="mdi mdi-eye"></i> </button></td>
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
<%}%>

