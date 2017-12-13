<%@page import="Modelos.SAdministrador"%>
<%
     if (session.getAttribute("perfil")==null) {
        response.sendRedirect("loginUser?action=error403");
        session.setAttribute("setUsuario", null);
            session.setAttribute("perfil", null);
            session.invalidate();  
        
    } else if (session.getAttribute("perfil").toString().equals("SuperAdministrador")) {
        SAdministrador user = (SAdministrador) session.getAttribute("setUsuario");

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
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Default Example</h4>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="datatable-buttons" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Nombres</th>
                                                    <th>Apellidos</th>
                                                    <th>Documento</th>
                                                    <th>Celular</th>
                                                    <th>Correo</th>
                                                    <th>Acciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cli" items="${requestScope.ArrayCliente}">
                                                    <tr>  
                                                      <td> <c:out value="${cli.nombre}"/></td>
                                                      <td> <c:out value="${cli.apellido}"/></td>
                                                      <td> <c:out value="${cli.documento}"/></td>
                                                      <td> <c:out value="${cli.celular}"/></td>
                                                      <td> <c:out value="${cli.usuarios.correo}"/></td>
                                                       <td> 
                                                            <c:set var="estado" value="Inactivo" ></c:set>
                                                            <button class="btn btn-sm btn-danger" type="button" title="Editar"  onclick="location.href = 'ClienteC?action=update&id=${cli.idCliente}'"><i class="mdi mdi-pencil"></i> </button>
                                                            <c:choose>
                                                                
                                                                <c:when  test="${cli.estado eq estado}" >
                                                            <button class="btn btn-sm btn-success" type="button" title="Activar"  onclick="location.href = 'ClienteC?action=activar&id=${cli.idCliente}'"><i class="mdi mdi-check"></i></button>
                                                               </c:when>
                                                               <c:otherwise>
                                                            <button class="btn btn-sm btn-warning" type="button" title="Inactivar"  onclick="location.href = 'ClienteC?action=inactivar&id=${cli.idCliente}'"><i class="mdi mdi-close"></i></button>
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