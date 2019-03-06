package main;

/**
 * @author Baibhav
 */

import java.io.*;

import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.AudioSystem;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.jdbc.Connection;

import java.io.*;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

/**
 * 
 * The class handles the uploading functionality provided by the UStube.
 *
 */
public class videopage{
	/**
	 * Creates the serial version UUID for this class.
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	
	public ResultSet video_info(String id) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
				
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ustube","root", "root");
	    Statement st=conn.createStatement();
	    
	    String query = "SELECT media.*,title,user.user_name FROM media,category,user WHERE media.user_id=user.id and media.id='"+id+"' AND media.category_id=category.id LIMIT 1";
//	    System.out.println(query);
	    ResultSet rs = st.executeQuery(query);
	    
		return rs;
	}
	
	public void setHistory(String user_id, String media_id) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ustube","root", "root");
	    Statement st=conn.createStatement();
	    
	    String query = "INSERT INTO history(`user_id`, `media_id`) " +
	    			   "VALUES ('"+user_id+"', '"+media_id+"')";
//	    System.out.println(query);
	    st.execute(query);
	}
	
	public static int getResultSetCount(String query) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
	{
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/ustube","root", "root");
		java.sql.Statement st=conn.createStatement();

		ResultSet rs = st.executeQuery(query); 
		int count = 0;
		while(rs.next())
			count++;
		return count;
	}
	
	public String get_tags(String tags){
		
		if(!tags.isEmpty()){
			StringBuffer str = new StringBuffer ("");
			String tag_array[]=tags.split(" ");
			for(int i=0;i<tag_array.length;i++)
				str.append("<a href='search.jsp?tags="+tag_array[i]+"'>"+tag_array[i]+"</a>&nbsp;&nbsp;&nbsp;&nbsp;");
			return str.toString();
		}
		
		return "";
		
	}
	
	public static int updateDB(String query) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost/ustube","root", "root");
		java.sql.Statement st=conn.createStatement();

		 return st.executeUpdate(query); 
	}
}