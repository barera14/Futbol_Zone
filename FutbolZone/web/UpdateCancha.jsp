
<%@page import="Modelos.Establecimiento"%>
<%@page import="Modelos.Cancha"%>
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
                    <div class="col-sm-12">
                        <div class="panel panel-primary">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-2 col-xs-12"></div>
                                    <div class="col-sm-8 col-xs-12">
                                        <h4 class="m-t-0 m-b-30">Actualizar Establecimiento</h4>
                                        <div class="m-t-20">
                                            <% Cancha actualizar = (Cancha) request.getAttribute("Cancha");%>
                                            <form class="" enctype="multipart/form-data"  action="CanchasC?action=update&id=<%=actualizar.getIdCancha()%>" method="POST">
                                                <div class="form-group">
                                                    <label>Tipo de Cancha</label>
                                                    <div>
                                                        <select name="tCancha" required class="form-control" />
                                                        <option value="">Seleccione</option>
                                                        <option <%if (actualizar.getTipoCancha().equals("Futbol 5")) { %> selected value="Futbol 5">Futbol 5</option>
                                                        <option value="Futbol 7">Futbol 7</option>
                                                        <option value="Futbol 8">Futbol 8</option>
                                                        <option value="Futbol 11">Futbol 11</option> 
                                                        <%} else if (actualizar.getTipoCancha().equals("Futbol 7")) { %> 
                                                        <option value="Futbol 5">Futbol 5</option>
                                                        <option selected value="Futbol 7">Futbol 7</option>
                                                        <option value="Futbol 8">Futbol 8</option>
                                                        <option value="Futbol 11">Futbol 11</option> 
                                                        <%} else if (actualizar.getTipoCancha().equals("Futbol 8")) { %> 
                                                        <option value="Futbol 5">Futbol 5</option>
                                                        <option value="Futbol 7">Futbol 7</option>
                                                        <option selected value="Futbol 8">Futbol 8</option>
                                                        <option value="Futbol 11">Futbol 11</option> 
                                                        <%} else if (actualizar.getTipoCancha().equals("Futbol 11")) { %> 
                                                        <option value="Futbol 5">Futbol 5</option>
                                                        <option value="Futbol 7">Futbol 7</option>
                                                        <option value="Futbol 8">Futbol 8</option>
                                                        <option selected value="Futbol 11">Futbol 11</option> 
                                                        <%}%>
                                                        </select> 
                                                    </div>
                                                </div>
                                                <style>
                                                    .thumb{
                                                        width: 400px; height: 250px;
                                                        border: 1px solid #000;
                                                        margin: 10px 5px 0 0;
                                                    }
                                                </style>
                                                <div class="form-group">
                                                    <p>Foto de la cancha</p>
                                                    <input type="file"  accept="image/x-png,image/gif,image/jpeg" required class="filestyle" onchange="nombre(this.value)" data-buttonname="btn-default" id="filestyle-0" name="file" tabindex="-1" style="position: realtive; clip: rect(0px 0px 0px 0px);" />

                                                </div>
                                                <div class="form-group"> 
                                                    <output id="list"></output>
                                                </div>
                                                <script>
                                                    function nombre(fic) {
                                                        fic = fic.split('\\');
                                                        var nombre = fic[fic.length - 1];

                                                        var url = "Fotos/" + nombre;

                                                        document.getElementById("foto").value = url;
                                                    }
                                                </script>
                                                <div class="form-group">
                                                    <label>Valor por hora</label>
                                                    <div> 
                                                        <input type="number" value="<%=actualizar.getValor()%>" name="valor"   class="form-control" required data-parsley-minlength="4" data-parsley-maxlength="10" placeholder="Valor" va/>
                                                    </div>
                                                </div>
                                                <div hidden="hidden" class="form-group">
                                                    <div  >
                                                        <input type="text" name="foto" value="<%=actualizar.getFoto()%>" id="foto"  class="form-control" placeholder="Valor."/>
                                                    </div>                   
                                                </div>

                                                <div  class="form-group">
                                                    <div>
                                                        <button type="submit" class="btn btn-primary waves-effect waves-light"> Editar </button> 
                                                        <button type="reset" class="btn btn-default waves-effect m-l-5"  onclick="javascript:history.go(-1)"> Cancelar </button></div>
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
<output id="list"></output>

<script>
    function archivo(evt) {
        var files = evt.target.files; // FileList object

        // Obtenemos la imagen del campo "file".
        for (var i = 0, f; f = files[i]; i++) {
            //Solo admitimos imágenes.
            if (!f.type.match('image.*')) {
                continue;
            }

            var reader = new FileReader();

            reader.onload = (function (theFile) {
                return function (e) {
                    // Insertamos la imagen
                    document.getElementById("list").innerHTML = ['<img class="thumb" src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
                };
            })(f);

            reader.readAsDataURL(f);
        }
    }

    document.getElementById('filestyle-0').addEventListener('change', archivo, false);
    function foto(a) {
        var foto = document.getElementById("filestyle-0").value;
        document.getElementById("foto").value = foto;
    }
</script>
<jsp:include page="PieDePagina.jsp"/>
<%} else {
        response.sendRedirect("loginUser?action=error403");
 session.setAttribute("setUsuario", null);
     session.setAttribute("perfil", null);
     session.invalidate(); 
}

%>