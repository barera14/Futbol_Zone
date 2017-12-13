/**
 *================================================================================
 * THIS SOFTWARE IS PROVIDED BY JAVAZOOM "AS IS".
 * JAVAZOOM DISCLAIMS ANY OTHER WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT
 * LIMITED TO, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE AND NONINFRINGEMENT.
 *================================================================================
 */

package sample;

import java.io.*;
import javazoom.upload.*;
import javazoom.upload.parsing.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Vector;

/**
 * This servlet uses UploadBean to upload a file to a folder.
 * Default folder is $WEBAPP_HOME/WEB-INF/
 */
public class UploadServlet extends HttpServlet
{
  private String FOLDER = null;

  public void init() throws ServletException
  {
    FOLDER = this.getInitParameter("storefolder");
    if (FOLDER == null)
    {
      FOLDER = getServletContext().getRealPath("/WEB-INF");
    }
    if (FOLDER != null)
    {
      FOLDER = FOLDER.replace('\\', '/').replace('/', File.separatorChar);
    }
  }

  /**
   * Processes upload to a folder.
   */
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    String error = null;
    if (MultipartFormDataRequest.isMultipartFormData(request))
    {
      try
      {
        int uploadlimit = 1024*1024*1024; // 1GB
        Vector listeners = null; // No upload listeners
        String parser = MultipartFormDataRequest.COSPARSER; // Cos parser
        String encoding = "iso-8859-1";
        MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request, listeners, uploadlimit, parser, encoding);
        // UploadBean initialization (scope = request).
        UploadBean upBean = new UploadBean();
        // Select the folder to upload files (for database or Zip, see documentation)
        upBean.setFolderstore(FOLDER);
        // ... See UploadBean documentation for all options
        // ... such as whitelist, blacklist ...
        // Handle upload now.
        upBean.store(mrequest);
        error = "Upload completed successully";
      }
      catch (IOException ex)
      {
        error = "IO Error : " + ex.getMessage();
      }
      catch (UploadException ex)
      {
        error = "Upload Error : " + ex.getMessage();
      }
    }
    else
    {
      error = "Not multipart/form-data request";
    }
    PrintWriter out = response.getWriter();
    out.println("<html><head></head><body>");
    out.println("<p>" + error + "</p>");
    out.println("</html>");
    out.close();
  }

  public void destroy()
  {
  }
}