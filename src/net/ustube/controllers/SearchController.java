package net.ustube.controllers;

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

public class SearchController extends BaseController{

	public SearchController() throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, UnknownHostException {
		super();
	}
	
	public ResultSet search(String value) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		Statement st = conn.createStatement();
	    sql = "select m.*,user.user_name,category.title as cat_title " +
	    	  "from media m inner join user on user.id=m.user_id " +
	    	  "left join category on category_id=category.id " +
	    	  "where m.`name` like '%"+value+"%' " +
	  		  "or `desc` like '%"+value+"%' " +
	  		  "or `user_name` like '%"+value+"%' " +
	  		  "or `tags` like '%"+value+"%' " +
	  		  "or category.`title` like '%"+value+"%' " +
	  		  "ORDER BY add_date DESC";
//	    System.out.println(sql);
	    ResultSet rs = st.executeQuery(sql);
	    
		return rs;
	}
	
	public ResultSet searchUser(String value) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		Statement st = conn.createStatement();
	    sql = "select *" +
	    	  "from user " +
	    	  "where user.`user_name` like '%"+value+"%' " +
	  		  "OR user.`name` like '%"+value+"%' " +
	  		  "ORDER BY user_name DESC";
//	    System.out.println(sql);
	    ResultSet rs = st.executeQuery(sql);
	    
		return rs;
	}
	
	public ResultSet search_tags(String value) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		Statement st = conn.createStatement();
	    sql = "select media.*,user.user_name,category.title as cat_title " +
    		  "from media inner join user on user.id=media.user_id " +
    		  "left join category on category_id=category.id " +
    		  "where `tags` ='"+value+"' "+
    		  "ORDER BY add_date DESC";
//	    System.out.println(sql);
	    ResultSet rs = st.executeQuery(sql);
	    
		return rs;
	}
	
	public ResultSet search_category(String value) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		Statement st = conn.createStatement();
	    sql = "select media.*,user.user_name,category.title as cat_title " +
    		  "from media inner join user on user.id=media.user_id " +
    		  "left join category on category_id=category.id " +
    		  "where category.title = '"+value+"' "+
    		  "ORDER BY add_date DESC";
//	    System.out.println(sql);
	    ResultSet rs = st.executeQuery(sql);
	    
		return rs;
	}
	
	public ResultSet search_type(String value) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
		Statement st = conn.createStatement();
	    sql = "select media.*,user.user_name,category.title as cat_title " +
    		  "from media inner join user on user.id=media.user_id " +
    		  "left join category on category_id=category.id " +
    		  "where type = '"+value+"' "+
    		  "ORDER BY add_date DESC";
//	    System.out.println(sql);
	    ResultSet rs = st.executeQuery(sql);
	    
		return rs;
	}
	
	
}