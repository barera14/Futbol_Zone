<%@page import="Modelos.Establecimiento"%>
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
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <table id="datatable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Equipo Local</th>
                                                    <th align="center"></th>
                                                    <th>Equipo Visitante</th>
                                                    <th>Fecha</th>
                                                    <th>Partido</th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="part" items="${requestScope.ArrayPartido}">
                                                <tr>
                                                    <td> <c:out value="${part.equipoByLocal.nombre}"/></td>
                                                    <td align="center"> VS</td>
                                                    <td><c:out value="${part.equipoByVisitante.nombre}"/></td>
                                                    <td> <c:out value="${part.fecha}"/></td>
                                                     
                                                      <td>
                                                     <c:set var="estado" value="Activo" ></c:set>
                                                     <c:if test="${part.estado eq estado}">
                                                    <button class="btn btn-sm btn-success" type="button" title="Iniciar Partido"  onclick="location.href='PartidoC?action=ver&id=${part.idPartido}'"><i class="mdi mdi-check"></i></button>
                                              </c:if>
                                                     </td>
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

