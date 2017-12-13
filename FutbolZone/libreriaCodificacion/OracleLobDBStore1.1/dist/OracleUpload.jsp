<html>
<%@ page language="java" import="javazoom.upload.*,java.util.*" %>
<%@ page errorPage="ExceptionHandler.jsp" %>

<jsp:useBean id="upBean" scope="application" class="javazoom.upload.UploadBean" >
<% upBean.setDatabasestoreimplementation("sample.OracleLobDBStore"); %>
<% sample.OracleLobDBStore.BLOBENABLED=true; %>
<jsp:setProperty name="upBean" property="overwrite" value="true" />
<%
  Properties props = new Properties();
  // Modify info below to fit to your database settings.
  props.put("user","scott");
  props.put("password","tiger");
  upBean.setDatabasestore("oracle.jdbc.driver.OracleDriver",
  "jdbc:oracle:thin:@MYSERVER:1521:ORCL", props);
  // Also, uncomment and modify variables below if you need to map to your own database schema.
  //UploadBean.SQLUPLOADTABLE = "UPLOADS";
  //UploadBean.SQLUPLOADID = "UPLOADID";
  //UploadBean.SQLUPLOADFILENAME = "FILENAME";
  //UploadBean.SQLUPLOADFILE = "BINARYFILE";
%>
</jsp:useBean>

<head>
<title>Oracle (Lob) Upload</title>
<style TYPE="text/css">
<!--
.style1 {
	font-size: 12px;
	font-family: Verdana;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFEE" text="#000000">
<ul class="style1">
<%
      if (MultipartFormDataRequest.isMultipartFormData(request))
      {
         // Uses MultipartFormDataRequest to parse the HTTP request.
         MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
         String todo = mrequest.getParameter("todo");
	     if ( (todo != null) && (todo.equalsIgnoreCase("upload")) )
	     {
                Hashtable files = mrequest.getFiles();
                if ( (files != null) || (!files.isEmpty()) )
                {
                    UploadFile file = (UploadFile) files.get("uploadfile");
                    out.println("<li>Form field : uploadfile"+"<BR> Uploaded file : "+file.getFileName()+" ("+file.getFileSize()+" bytes)"+"<BR> Content Type : "+file.getContentType());
                    // Uses the bean now to store specified by jsp:setProperty at the top.
                    upBean.store(mrequest, "uploadfile", null);
                }
                else
                {
                  out.println("<li>No uploaded files");
                }
	     }
         else out.println("<BR> todo="+todo);
      }
      Vector history = upBean.getHistory();
      int amount = 0;
      if (history != null) amount = history.size();
     %>
  <br><i>(Uploaded files : <%= amount %>)</i>
</ul>
<form method="post" action="OracleUpload.jsp" name="upform" enctype="multipart/form-data">
  <table width="60%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
    <tr>
      <td align="left"><b>Select
        a file to upload :</b></td>
    </tr>
    <tr>
      <td align="left">
        <input type="file" name="uploadfile" size="50">
        </td>
    </tr>
    <tr>
      <td align="left">
		<input type="hidden" name="todo" value="upload">
        <input type="submit" name="Submit" value="Upload">
        <input type="reset" name="Reset" value="Cancel">
        </td>
    </tr>
  </table>
  <br>
  <br>
  <table width="95%" border="0" cellspacing="1" cellpadding="0" align="center">
    <tr>
      <td bgcolor="#666666">
        <table width="100%" border="0" cellspacing="1" cellpadding="0" align="center" class="style1">
          <tr>
            <td bgcolor="#FFFFFF"><b><font color="#0000FF">&nbsp;HTML tags used
              in this form : </font></b></td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF">&nbsp;&lt;<b>form</b>
              <b>method</b>=&quot;<b><font color="#FF0000">post</font></b>&quot;
              <b>action</b>=&quot;<b><font color="#FF0000">OracleUpload.jsp</font></b>&quot;
              name=&quot;upload&quot; <b>enctype</b>=&quot;<b><font color="#FF0000">multipart/form-data</font></b>&quot;&gt;</td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF">&nbsp;&lt;<b>input</b>
              <b>type</b>=&quot;<b><font color="#FF0000">file</font></b>&quot;
              <b>name</b>=&quot;<font color="#FF0000"><b>uploadfile</b></font>&quot;
              size=&quot;50&quot;&gt;</td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF">&nbsp;</td>
          </tr>
          <tr>
            <td bgcolor="#FFFFFF">OracleLobDBStore is a sample implementation
              of DBStore API provided by UploadBean. It's an open source add-on
              that stores uploaded files in Oracle table using BLOB or CLOB. This
              is a specific solution for Oracle + BLOB/CLOB. Generic solution
              included in UploadBean (DefaultDBStore) works with Oracle + LONG
              RAW.<br>
              To install this add-on to UploadBean :<br>
              1- Check that your database schema map to sql/upload_oracle_xlob.sql
              script. <br>
              2- Copy oraclelobdbstore.jar in the same folder as uploadbean.jar
              (It should be WEB-INF/lib)<br>
              3- Add :<font size="-2"> &lt;% upBean.setDatabasestoreimplementation(&quot;sample.OracleLobDBStore&quot;);
              %&gt; </font> <br>
              &nbsp;&nbsp;&nbsp;&nbsp; and : <font size="-2">&lt;% sample.OracleLobDBStore.BLOBENABLED=true;
              %&gt;</font> (or false for CLOB) to your JSP file using UploadBean.
              <br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(You could also use and setup OracleUpload.jsp
              included).<br>
              <br>
              If you have Java and JDBC skills and you want to implement your
              own DBStore then extend javazoom.upload.DBStore abstract class and
              implement connect, store, countFiles and reset methods. See OracleLobDBStore.java
              to learn more.</td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p align="center"><font size="-1" face="Courier New, Courier, mono">Copyright
    &copy; <a href="http://www.javazoom.net" target="_blank">JavaZOOM</a> 1999-2005</font></p>
</form>
</body>
</html>
