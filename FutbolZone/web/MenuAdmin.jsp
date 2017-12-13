<%
    String perfil = session.getAttribute("perfil").toString();
    if (perfil.equals("Establecimiento")) {
%>


<div id="sidebar-menu">
    <ul>
        <!-- Administrar canchas-->
        <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-home"></i> <span>Canchas </span> <span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
            <ul class="list-unstyled">
                <li ><a  href="RegistrarCancha.jsp"><i class="mdi mdi-plus"></i>Registrar</a></li>
                <li><a href="CanchasC?action=admin&rta"><i class="mdi mdi-check"  ></i>Administrar</a></li>
            </ul>
        </li>

        <!-- /Administrar canchas-->
        <!-- Administrar alquileres-->
        <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-checkbox-multiple-marked"></i> <span>Alquiler</span>

                <span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
            <ul class="list-unstyled">
                <li ><a  href="AlquilerC?action=admin"><i class="mdi mdi-plus"></i>Administrar</a></li>
            </ul>
        </li>
        <!-- /Administrar alquileres-->
        <!-- Administrar campeonatos-->
        <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-star"></i> <span>Campeonatos </span> <span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
            <ul class="list-unstyled">
                <li ><a  href="RegistarCampeonato.jsp"><i class="mdi mdi-plus"></i>Registrar</a></li>
                <li><a href="CampeonatosC?action=admin"><i class="mdi mdi-check"  ></i>Administrar</a></li>

            </ul>
        </li>

    

        <!-- /Administrar campeonatos-->

    </ul>
</div>
<div class="clearfix">

</div>
</div>
</div>



<%} else if (perfil.equals("Cliente")) {%>



<div id="sidebar-menu">
   <ul>
                            <!-- Administrar canchas-->
                            <li class="has_sub" > <a href="javascript:void(0);" class="waves-effect" ><i class="mdi mdi-home" style="color:#4a5869" ></i> <span style="color:black" >Canchas </span> <span class="pull-right"><i class="mdi mdi-plus" style="color:#4a5869" ></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a class="mdi mdi-plus" href="ListarCanchas?action=ver">   Canchas disponibles   </a></li>
                                    <li><a class="mdi mdi-check" href="ListarCanchas?action=mis">   Administrar alquileres</a></li>
                                </ul>
                            </li>
                            <li class="has_sub" > <a href="javascript:void(0);" class="waves-effect" ><i class="mdi mdi-flash" style="color:#4a5869" ></i> <span style="color:black" >Campeonatos</span> <span class="pull-right"><i class="mdi mdi-plus" style="color:#4a5869" ></i></span></a>
                                <ul class="list-unstyled">
                                    <li><a class="mdi mdi-plus" href="ListarCampeonatos?action=ver">  Ver Campeonatos </a></li>
                                    <li><a class="mdi mdi-check" href="ListarCampeonatos?action=campeonatos"> Mis  Cempeonatos </a></li>
                                </ul>
                            </li>

                            <!-- /Administrar canchas-->
                            <!-- Administrar alquileres-->
                    

                            <!-- /Administrar campeonatos-->

                        </ul>



</div>
<div class="clearfix">

</div>
</div>
</div>

<%}
    if (perfil.equals("SuperAdministrador")) {%>



<div id="sidebar-menu">
    <ul>
        <!-- Administrar canchas-->
        <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-home"></i> <span>Clientes</span> <span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
            <ul class="list-unstyled">
                <li ><a  href="RegistarCliente.jsp"><i class="mdi mdi-plus"></i>Registrar</a></li>
                <li><a  href="ClientesC?action=admin"><i class="mdi mdi-check"></i>Administrar</a></li>
            </ul>
        </li>

        <!-- /Administrar canchas-->
        <!-- Administrar alquileres-->
        <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="mdi mdi-checkbox-multiple-marked"></i> <span>Establecimientos</span>

                <span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
            <ul class="list-unstyled">
                <li ><a  href="ui-buttons.html"><i class="mdi mdi-plus"></i>Registrar</a></li>
                <li><a  href="ui-buttons.html"><i class="mdi mdi-check"></i>Administrar</a></li>
            </ul>
        </li>
        <!-- /Administrar alquileres-->
        <!-- Administrar campeonatos-->

        <!-- /Administrar campeonatos--><!-- Administrar campeonatos-->


        <!-- /Administrar campeonatos-->

    </ul>


</div>
<div class="clearfix">

</div>
</div>
</div>

<%}%>