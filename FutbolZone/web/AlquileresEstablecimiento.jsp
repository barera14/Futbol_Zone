
<%@page import="Modelos.Establecimiento"%>
<%@page import="Modelos.SAdministrador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="Modelos.Alquiler"%>
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

<meta charset="utf-8" />
<div class="content-page">

    <div class="content">
        <div class="">

            <div class="page-header-title">
                <h4 class="page-title">Calendario de Alquiler

                </h4>

            </div>

        </div>
        <div class="page-content-wrapper ">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Lista de Campeonatos</h4>
                                                <div>
                                                    <% try {
                                            if (request.getParameter("rta").equals("yes")) {%>
                                                    <p class="alert alert-danger">Registro Exitoso!</p>
                                                    <%} else if (request.getParameter("rta").equals("no")) {%>
                                                    <p class="alert alert-warning">Registro Fallido!</p>
                                                    <%} else if (request.getParameter("rta").equals("esty")) { %>
                                                    <p class="alert alert-warning">Se cambio de estado Sastifactoriamente!</p>
                                                    <%} else {
                                                        }
                                                     
                                                        } catch (Exception e) {
                                                        }
                                                    %>
                                                </div>
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
                                                                    <th>Estado</th>
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
                                                                        <td> <c:out value="${campeonato.estado}"/></td>
                                                                        <td>
                                                                            <c:set var="estado" value="Reservar" ></c:set>
                                                                            <c:set var="estad" value="Confirmar" ></c:set>
                                                                            <c:choose>

                                                                                <c:when  test="${campeonato.estado eq estado}" >
                                                                                    <button class="btn btn-sm btn-danger" type="button" title="Confirmar Reserva"  onclick="location.href = 'AlquilerC?action=Reservar&id=${campeonato.idAlquiler}'"><i class="mdi mdi-check"></i> </button>
                                                                                </c:when>
                                                                               
                                                                                <c:when test="${campeonato.estado eq estad}" >
                                                                                    <button class="btn btn-sm btn-danger" type="button" title="Cancelar"  onclick="location.href = 'AlquilerC?action=cancelar&id=${campeonato.idAlquiler}'"><i class="mdi mdi-close"></i> </button>
                                                                                </c:when>
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

            </div>

        </div>

    </div>
    <script>

    </script>

    <jsp:include page="PieDePagina.jsp"/>

    <%} else {
        response.sendRedirect("loginUser?action=error403");
 session.setAttribute("setUsuario", null);
     session.setAttribute("perfil", null);
     session.invalidate(); 
} %>