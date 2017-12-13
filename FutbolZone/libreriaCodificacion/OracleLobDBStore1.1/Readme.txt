OracleLobDBStore 1.1 : UploadBean 1.6+ add-on
Copyright JavaZOOM 1999-2005
http://www.javazoom.net

=============================================================
UploadBean support page :
http://www.javazoom.net/jzservlets/uploadbean/uploadbean.html

JSP Forums :
http://www.javazoom.net/services/forums/index.jsp
=============================================================

OracleLobDBStore is a sample implementation of DBStore API provided by UploadBean.
It's an open source add-on that stores uploaded files in Oracle table using BLOB or CLOB.
This is a specific solution for Oracle + BLOB/CLOB. Generic solution included in UploadBean 
(DefaultDBStore) works with Oracle + LONG RAW.

To install this add-on to UploadBean :
1- Check that your database schema map to sql/upload_oracle_xlob.sql script. 
2- Copy oraclelobdbstore.jar in the same folder as uploadbean.jar (It should be WEB-INF/lib)
3- Add : <% upBean.setDatabasestoreimplementation("sample.OracleLobDBStore"); %> 
   and : <% sample.OracleLobDBStore.BLOBENABLED=true; %> (or false for CLOB) to your JSP 
   file using UploadBean. (You could also use and setup OracleUpload.jsp included dist/ folder).
4- Optionally, switch to CFU underlying parser for large upload.


02/27/2005 : v1.1
-----------------
- CLOB support added.
- upload_oracle_clob.sql added. 
+ UploadBean 1.6 support.


08/05/2002 : V1.0
-----------------
- BLOB support.
- upload_oracle_blob.sql included.
+ Oracle 8i/9i support.


Note : If you have Java and JDBC skills and you want to implement your own DBStore then 
       extend javazoom.upload.DBStore abstract class and implement connect, store, countFiles 
       and reset methods. See OracleLobDBStore.java source code to learn more.
       This package also includes ANT scripts to rebuild the add-on :
          - uploadbean.jar is not included in this package, you have to copy
            it under lib/ folder before running ANT script.
          - Oracle JDBC Driver is not included in this package, you have to copy the 
            driver (classes12.jar) under lib/ folder before running ANT script.
