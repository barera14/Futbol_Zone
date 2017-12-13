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
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Administrar Equipos</h4>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Equipo</th>
                                                    <th>Nombre</th>
                                                    <th>Documento</th>
                                                    <th>Dorsal</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cli" items="${requestScope.ArrayJug}">
                                                    <tr>  
                                                      <td> <c:out value="${cli.equipo.nombre}"/></td>
                                                      <td> <c:out value="${cli.nombre}"/></td>
                                                      <td> <c:out value="${cli.documento}"/></td>
                                                      <td> <c:out value="${cli.dorsal}"/></td>
                                                        
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                         <div class="form-group">
                                                    <div>
                                                        <button type="reset" class="btn btn-default waves-effect m-l-5"  onclick="javascript:history.go(-1)"> Volver </button></div>
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