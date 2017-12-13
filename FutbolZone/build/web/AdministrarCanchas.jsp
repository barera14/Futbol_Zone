<%@page import="Modelos.Cliente"%>
<%@page import="Modelos.Establecimiento"%>
<%
   
    if (session.getAttribute("perfil") == null) {
        response.sendRedirect("loginUser?action=error403");
        session.setAttribute("setUsuario", null);
        session.setAttribute("perfil", null);
        session.invalidate();

    } else if (session.getAttribute("perfil").toString().equals("Establecimiento")) {
        Establecimiento user = (Establecimiento) session.getAttribute("setUsuario");

%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Canchas del Establecimiento</h4>
                                <div>
                                    <%if (request.getParameter("rta").equals("yes")) {%>
                                    <p class="alert alert-danger">Registro Exitoso!</p>
                                    <%} else if (request.getParameter("rta").equals("no")) {%>
                                    <p class="alert alert-warning">Registro Fallido!</p>
                                    <%} else if (request.getParameter("rta").equals("esty")) { %>
                                    <p class="alert alert-warning">Se cambio de estado Sastifactoriamente!</p>
                                    <%} else {
                                          }%>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Tipo de Cancha</th>
                                                    <th>Valor por hora</th>
                                                    <th>Estado</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cli" items="${requestScope.ArrayCliente}">
                                                    <tr>  
                                                        <td> <c:out value="${cli.tipoCancha}"/></td>
                                                        <td> <c:out value="${cli.valor}"/></td>
                                                        <td> <c:out value="${cli.estado}"/></td>
                                                        <td> 
                                                            <c:set var="estado" value="Inactivo" ></c:set>
                                                            <button class="btn btn-sm btn-danger" type="button" title="Editar"  onclick="location.href = 'CanchasC?action=update&id=${cli.idCancha}'"><i class="mdi mdi-pencil"></i> </button>
                                                            <c:choose>

                                                                <c:when  test="${cli.estado eq estado}" >
                                                                    <button class="btn btn-sm btn-success" type="button" title="Activar"  onclick="location.href = 'CanchasC?action=activar&id=${cli.idCancha}'"><i class="mdi mdi-check"></i></button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <button class="btn btn-sm btn-warning" type="button" title="Inactivar"  onclick="location.href = 'CanchasC?action=inactivar&id=${cli.idCancha}'"><i class="mdi mdi-close"></i></button>
                                                                    </c:otherwise>
                                                                </c:choose>
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
