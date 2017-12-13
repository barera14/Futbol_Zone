/**
 *================================================================================
 * THIS SOFTWARE IS PROVIDED BY JAVAZOOM "AS IS".
 * JAVAZOOM DISCLAIMS ANY OTHER WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT
 * LIMITED TO, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE AND NONINFRINGEMENT.
 *================================================================================
 */
package sample;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;
import java.util.Properties;

import javazoom.upload.DBStore;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadFile;

/**
 * This class implements a DBStore for Oracle with Lob (Blob or Clob).
 * @author JavaZOOM
 * @version 1.1
 */
public class OracleLobDBStore extends DBStore
{
  public static boolean BLOBENABLED = true;
  
  public String EMPTYBLOB = "empty_blob()";
  public String EMPTYCLOB = "empty_clob()";

  public OracleLobDBStore()
  {
    super();
  }

  public Connection getConnection()
  {
    return super.getConnection();
  }

  /**
   * Connects to database store.
   * @param p1 Driver string or Jdbc connection
   * @param p2 URL String
   * @param p3 Credentials properties
   * @throws UploadException
   */
  public void connect (Object p1, Object p2, Object p3) throws UploadException
  {
    if (p1 instanceof Connection) super.setConnection((Connection) p1);
    else
    {
      // Loads JDBC driver and gets a JDBC connection.
      String driver = (String) p1;
      String URL = (String) p2;
      Properties credentials = (Properties) p3;
	  Connection c = null;
	  try 
	  {
		  Class.forName(driver);
		  c = DriverManager.getConnection(URL, credentials);
		  c.setAutoCommit( false );
	  } catch (ClassNotFoundException e) 
	  {
	  	throw new UploadException(e);
	  } catch (SQLException e) 
	  {
		throw new UploadException(e);
	  }
      super.setConnection(c);
    }
  }

  /**
   * Counts database entries.
   * @return number of entries in database store
   * @throws UploadException
   */
  public int countFiles() throws UploadException
  {
    if (getConnection() != null)
    {
      // Counts records in database to check max files in store.
      String count = "SELECT COUNT(*) FROM "+UploadBean.SQLUPLOADTABLE;
	  int size = 0;
	  Statement s = null;
	  ResultSet r = null;
	  try 
	  {
		  s = getConnection().createStatement();
		  r = s.executeQuery(count);
		  while (r.next()) size = r.getInt(1);
	  } catch (SQLException e) 
	  {
		throw new UploadException(e);
	  }
	  finally
	  {
	  	closeResultSet(r);
	  	closeStatement(s);
	  }
      return size;
    }
    else return -1;
  }

  /**
   * Depending on overwrite state, inserts or updates file in store.
   * @param file input file
   * @param overwrite enables/disables overwrite
   * @throws UploadException
   */
  public void store(UploadFile file, boolean overwrite, Map extra) throws UploadException
  {
    if (overwrite == false)
    {
      insert(file);
    }
    else
    {
      // Check for duplicate entry (filename)
	  int size = 0;
	  String count = "SELECT COUNT(*) FROM "+UploadBean.SQLUPLOADTABLE+" WHERE "+UploadBean.SQLUPLOADFILENAME+"='"+file.getFileName()+"'";
	  Statement s = null;
	  ResultSet r = null;
	  try 
	  {
		  s = getConnection().createStatement();
		  r = s.executeQuery(count);
		  while (r.next()) size = r.getInt(1);
	  } catch (SQLException e) 
	  {
		throw new UploadException(e);
	  }
	  finally
	  {
		closeResultSet(r);
		closeStatement(s);
	  }
      if (size > 0)
      {
        if (size > 1)
        {
          delete(file);
          insert(file);
        }
        else if (size == 1) update(file);
      }
      else
      {
        insert(file);
      }
    }
  }

  /**
   * Insert a new file as BLOB.
   * We have to use 2 steps :<br>
   * Step 1 : Insert an empty blob.<br>
   * Step 2 : Select for update the blob.<br>
   * @param file UploadFile to insert.
   * @throws UploadException
   */
  private void insert(UploadFile file) throws UploadException
  {
    // Insert an empty blob.
    Connection c = getConnection();
    String sql = null;
    if (BLOBENABLED == false) sql = "INSERT INTO "+UploadBean.SQLUPLOADTABLE+" ("+UploadBean.SQLUPLOADID+","+UploadBean.SQLUPLOADFILENAME+","+UploadBean.SQLUPLOADFILE+") VALUES (?,?,"+EMPTYCLOB+")";
    else sql = "INSERT INTO "+UploadBean.SQLUPLOADTABLE+" ("+UploadBean.SQLUPLOADID+","+UploadBean.SQLUPLOADFILENAME+","+UploadBean.SQLUPLOADFILE+") VALUES (?,?,"+EMPTYBLOB+")";
	PreparedStatement ps = null;
	ResultSet r = null;
	try 
	{
		ps = c.prepareStatement(sql);
		int id = (int) System.currentTimeMillis();
		ps.setInt(1,id);
		ps.setString(2,file.getFileName());
		int modified = ps.executeUpdate();
		// Selects the lob for update.
		sql = "SELECT "+UploadBean.SQLUPLOADFILE+" FROM "+UploadBean.SQLUPLOADTABLE+" WHERE "+UploadBean.SQLUPLOADID+" = ? FOR UPDATE";
		ps = c.prepareStatement(sql);
		ps.setInt(1,id);
		r = ps.executeQuery();
		OutputStream os = null;
		int lobsize = 0;
		if (BLOBENABLED == false)
		{
			// Clob support.
			oracle.sql.CLOB b = null;
			while (r.next())
			{
			  b = (oracle.sql.CLOB) r.getClob(1);
			}
			os = b.getAsciiOutputStream();
			lobsize = b.getBufferSize();
		}
		else
		{
			// Blob support.
			oracle.sql.BLOB b = null;
			while (r.next())
			{
			  b = (oracle.sql.BLOB) r.getBlob(1);
			}
			os = b.getBinaryOutputStream();
			lobsize = b.getBufferSize();	
		}
		// Updates lob.
		ByteArrayInputStream is = new ByteArrayInputStream( file.getData() );
		byte[] buffer = new byte[lobsize];
		int bytesRead = 0;
		while( ( bytesRead = is.read( buffer ) ) != -1 ) os.write( buffer, 0, bytesRead );
		os.close();
		is.close();			
		c.commit();
	} catch (SQLException e) 
	{
		throw new UploadException(e);
	} catch (IOException e) 
	{
		throw new UploadException(e);
	}
	finally
	{
	  closeResultSet(r);
	  closeStatement(ps);
	}	
    //System.out.println("Inserted:"+file.getFileName());
  }

  /**
   * Updates file content.
   * @param file UploadFile to update.
   * @throws UploadException
   */
  private void update(UploadFile file) throws UploadException
  {
    Connection c = getConnection();
    // Selects the lob for update.
    String sql = "SELECT "+UploadBean.SQLUPLOADFILE+" FROM "+UploadBean.SQLUPLOADTABLE+" WHERE "+UploadBean.SQLUPLOADFILENAME+" = ? FOR UPDATE";
	PreparedStatement ps = null;
	ResultSet r = null;
	try 
	{
		ps = c.prepareStatement(sql);
		ps.setString(1,file.getFileName());
		r = ps.executeQuery();
		int lobsize = 0;
		OutputStream os = null;
		if (BLOBENABLED == false)
		{
			// Clob support.
			oracle.sql.CLOB b = null;
			while (r.next())
			{
			  b = (oracle.sql.CLOB) r.getClob(1);
			}
			os = b.getAsciiOutputStream();
			lobsize =  b.getBufferSize();			
		}
		else
		{
			// Blob support.
			oracle.sql.BLOB b = null;
			while (r.next())
			{
			  b = (oracle.sql.BLOB) r.getBlob(1);
			}
			os = b.getBinaryOutputStream();
			lobsize =  b.getBufferSize();			
		}
		// Updates lob.
		ByteArrayInputStream is = new ByteArrayInputStream( file.getData() );
		byte[] buffer = new byte[lobsize];
		int bytesRead = 0;
		while( ( bytesRead = is.read( buffer ) ) != -1 ) os.write( buffer, 0, bytesRead );
		os.close();
		is.close();
		c.commit();
	} catch (SQLException e) {
		throw new UploadException(e);
	} catch (IOException e) {
		throw new UploadException(e);
	}
	finally
	{
	  closeResultSet(r);
	  closeStatement(ps);
	}	
    //System.out.println("Updated:"+file.getFileName());
  }

  /**
   * Deletes one or many files matching to a filename.
   * @param file UploadFile to delete.
   * @throws UploadException
   */
  private void delete(UploadFile file) throws UploadException
  {
    String sql = "DELETE FROM "+UploadBean.SQLUPLOADTABLE+" WHERE "+UploadBean.SQLUPLOADFILENAME+" = ?";
	PreparedStatement ps = null;
	try 
	{
		ps = getConnection().prepareStatement(sql);
		ps.setString(1,file.getFileName());
		int modified = ps.executeUpdate();
		getConnection().commit();
	} catch (SQLException e) {
		throw new UploadException(e);
	}
	finally
	{
		closeStatement(ps);
	}
    //System.out.println("Deleted("+modified+"):"+file.getFileName());
  }

  /**
   * Deletes entries in database store.
   * @throws UploadException
   */
  public void reset() throws UploadException
  {
    if (getConnection() != null)
    {
      String delete = "DELETE FROM "+UploadBean.SQLUPLOADTABLE;
	  Statement s = null;
	  try 
	  {
		  s = getConnection().createStatement();
		  int deleted = s.executeUpdate(delete);
		  getConnection().commit();
	  } catch (SQLException e) {
		throw new UploadException(e);
	  }
	  finally
	  {
	  	closeStatement(s);
	  }
      //System.out.println("Reseted");
    }
  }
}