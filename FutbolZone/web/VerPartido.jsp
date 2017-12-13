<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="Modelos.Partido"%>
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
                            <div class="panel-body"><h4 class="m-b-30 m-t-0">Partidos</h4>
                               
                                <div class="row">
                                   <div class="col-sm-1 col-xs-12"></div>
                                        <div class="col-sm-8 col-xs-12">
                                            
                                            <%   
                                                ArrayList listaObjetos = (ArrayList) request.getAttribute("ArrayPartido");
                                        %>
                                        <form class="" action="PartidoC?action=registrar&id=<%=Integer.parseInt(request.getParameter("id"))%>" method="post">
                                         <table id="" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Equipo Local</th>
                                                    <th>Marcador Local</th>
                                                    <th></th>
                                                   
                                                    <th>Marcador Visitante</th>
                                                     <th>Equipo Visitante</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="cli" items="${requestScope.ArrayPartido}">
                                                    <tr>  
                                                      <td> <c:out value="${cli.equipoByLocal.nombre}"/></td>
                                                      <td>     <input type="number" style="width: 70px;" name="MarLocal"  class="form-control small" required data-parsley-minlength="1" data-parsley-maxlength="2"/></td>
                                                      <td> VS</td>
                                                      <td><input type="number" style="width: 70px;" name="MarVis"  class="form-control small" required data-parsley-minlength="1" data-parsley-maxlength="2"/></td>
                                                      <td> <c:out value="${cli.equipoByVisitante.nombre}"/></td>
                                                       
                                                    </tr>
                                                </c:forEach>
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
