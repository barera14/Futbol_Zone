<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Encabezado.jsp"/>
<jsp:include page="../MenuAdmin.jsp"/>
        <div id="wrapper">
        </div>
        <div class="content-page">
            <div class="content">
                <div class="">
                    <div class="page-header-title">
                        <h4 class="page-title">Calendar</h4>
                    </div>
                </div>
                <div class="page-content-wrapper ">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-2 col-md-3">
                                                <h4 class="m-t-5 m-b-15">Created Events</h4>
                                                <form method="post" id="add_event_form" class="m-t-5">
                                                    <input type="text" class="form-control new-event-form" placeholder="Nuevo alquiler"/>
                                                </form>
                                                <div id='external-events'>
                                                    <h4 class="m-b-15">Draggable Events</h4>
                                                    <div class='fc-event'>My Event 1</div>
                                                    <div class='fc-event'>My Event 2</div>
                                                                                              
                                                </div>
                                             </div><div id='calendar' class="col-md-9 col-lg-10">                                        
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer"> © 2016 WebAdmin - All Rights Reserved. </footer>
        </div>
    
        <script src="assets/js/jquery.min.js"></script> 
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/modernizr.min.js"></script>
        <script src="assets/js/detect.js"></script> 
        <script src="assets/js/fastclick.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/jquery.blockUI.js"></script> 
        <script src="assets/js/waves.js"></script>
        <script src="assets/js/wow.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script> 
        <script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script> 
        <script src="assets/plugins/moment/moment.js"></script> 
        <script src='assets/plugins/fullcalendar/js/fullcalendar.min.js'></script>
        <script src="assets/pages/calendar-init.js"></script>
        <script src="assets/js/app.js"></script> 
    </body>
<!-- Mirrored from themesdesign.in/webadmin_1.1/layouts/red/calendar.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 20 Oct 2017 21:32:44 GMT -->
</html>