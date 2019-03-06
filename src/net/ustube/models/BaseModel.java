package net.ustube.models;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.io.*;

import com.mysql.jdbc.Connection;

/**
 * @author Baibhav
 */

public class BaseModel{
	
	public String sql;
	public java.sql.Connection conn;
		
	public BaseModel() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(
		"jdbc:mysql://localhost/ustube", "root", "root");
	}
	
	public String thumbnail_url(String thumbnail_path) {
		File file = new File(thumbnail_path);
		String[] url = thumbnail_path.split("/");
		String file_name = url[url.length-1];
		if(!file.exists() || file_name.isEmpty()) 
			file_name="default.jpg";
		return "http://ustube.no-ip.org/ustubefiles/thumb/"+file_name;
//		return "http://localhost/ustubefiles/thumb/"+file_name;
	}
	
//	public String hostname() throws UnknownHostException{
//		InetAddress addr = InetAddress.getLocalHost();
//
//	    // Get IP Address
//	    byte[] ipAddr = addr.getAddress();
//
//	    // Get hostname
//	    String hostname = addr.getHostName();
//	    
//	    System.out.println("HOSTNAME = " + request.getRequestURL());
//	    return ipAddr.toString();
//	}
	
}