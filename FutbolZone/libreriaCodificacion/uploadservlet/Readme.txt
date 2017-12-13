UploadServlet 1.0
Copyright JavaZOOM 1999-2003
http://www.javazoom.net

==========================================================
UploadBean support page :
http://www.javazoom.net/jzservlets/uploadbean/uploadbean.html

UploadBean add-ons homepage : 
http://www.javazoom.net/jzservlets/uploadbean/uploadbeantools.html

JSP Forums :
http://www.javazoom.net/services/forums/index.jsp
==========================================================

-----------------
05/02/2003 : v1.0
-----------------
UploadServlet is an open source add-on for UploadBean. This servlet uploads a file into
a folder (default one is $WEBAPP_HOME/WEB-INF).

Files included :
 - dist/upload.html : HTML upload form.
 - dist/WEB-INF/lib/uploadservlet.jar : compiled version of UploadServlet.
 - dist/WEB-INF/web.xml : Deployment descriptor with UploadServlet.
 - src/sample/UploadServlet.java : Upload Servlet source.
 upload.html will send the upload request to servlet/uploadservlet defined in web.xml.