<%@page import="Modelos.SAdministrador"%>
<%
    if (session.getAttribute("perfil") == null) {
        response.sendRedirect("loginUser?action=error403");
        session.setAttribute("setUsuario", null);
        session.setAttribute("perfil", null);
        session.invalidate();

    } else if (session.getAttribute("perfil").toString().equals("SuperAdministrador")) {
        SAdministrador user = (SAdministrador) session.getAttribute("setUsuario");

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
                                        <h4 class="m-t-0 m-b-30">Registrar Cliente</h4>
                                        <div class="m-t-20">
                                            <form class="" action="ClientesC?action=create" method="post">
                                                <div class="form-group">
                                                    <label>Nombre</label>
                                                    <div>
                                                        <input type="text" name="nombre" class="form-control" required placeholder="Nombres"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Apellido</label>
                                                    <div>
                                                        <input type="text" name="apellidos" class="form-control" required placeholder="Apellidos"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Documento</label>
                                                    <div>
                                                        <input data-parsley-minlength="4" data-parsley-maxlength="11" name="nit" type="number" class="form-control" required placeholder="Documento"/>
                                                        <div>
                                                        </div>

                                                        <div class="form-group"> 
                                                            <label>E-Mail</label>
                                                            <div>
                                                                <input type="email" name="email" class="form-control" required parsley-type="email" placeholder="E-mail"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Celular</label>
                                                            <div> 
                                                                <input type="number" name="telefono" class="form-control" required data-parsley-minlength="6" data-parsley-maxlength="10" placeholder="Telefono."/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Contraseña</label>
                                                            <div> 
                                                                <input type="password" name="password" id="pass2" class="form-control" required data-parsley-minlength="8" data-parsley-maxlength="15" placeholder="Contraseña"/>
                                                            </div>
                                                        </div>


                                                        <div class="form-group">
                                                            <div>
                                                                <button type="submit" class="btn btn-primary waves-effect waves-light"> Registrar </button> 
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