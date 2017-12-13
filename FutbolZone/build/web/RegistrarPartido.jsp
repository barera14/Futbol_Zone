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
                                    <div class="col-md-8 col-sm-8 col-xs-8">
                                            <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Equipo Local</th>
                                                    <th align="center"></th>
                                                    <th>Equipo Visitante</th>
                                                    <th>Fecha</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="part" items="${requestScope.ArrayPa}">
                                                <tr>
                                                    <td> <c:out value="${part.equipoByLocal.nombre}"/></td>
                                                    <td align="center"> VS</td>
                                                    <td><c:out value="${part.equipoByVisitante.nombre}"/></td>
                                                    <td> <c:out value="${part.fecha}"/></td>
                                                     
                                                     
                                                </tr>
                                               
                                            </c:forEach>
                                                
                                                
                                            </tbody>
                                        </table>
                                        
                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8 col-sm-8 col-xs-8">
                                          <form class="" action="PartidoC?action=registrar2&id=<%=Integer.parseInt(request.getParameter("id"))%>" method="post">
                                        <table id="" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Equipo Local</th>
                                                    <th></th>
                                                    <th>Equipo Visitante</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                    <tr>  
                                                      <td> <div class="form-group">
                                 
                                      <select name="IdEquipoL" required class="form-control">
                                        <option>Seleccione</option>
                                        <c:forEach  var="clien" items="${requestScope.ArrayCliente}">
                                      <option value="${clien.idEquipo}"><c:out value="${clien.nombre}"/></option>
                                   </c:forEach>
                                                         </select>
                                  </div>
                                 </td>
                                          <td> vs</td>            <td> <div class="form-group">
                                 
                                      <select name="IdEquipoV" required class="form-control">
                                        <option>Seleccione</option>
                                        <c:forEach  var="clien" items="${requestScope.ArrayCliente}">
                                      <option value="${clien.idEquipo}"><c:out value="${clien.nombre}"/></option>
                                   </c:forEach>
                                                         </select>
                                  </div>
                                 </td>
                                
                                                    </tr>
                                            </tbody>
                                        </table>
                                         <div class="form-group">    
                                        
                                              <button class="btn btn-success"  type="submit" title="Guardar ´Resultado" >Guardar Resultado</button>
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
<jsp:include page="PieDePagina.jsp"/>
<%} else {
        response.sendRedirect("loginUser?action=error403");
 session.setAttribute("setUsuario", null);
     session.setAttribute("perfil", null);
     session.invalidate(); 
}

%>