package net.ustube.controllers;


import java.net.UnknownHostException;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import net.ustube.models.Media;
import net.ustube.models.Recommend;

/**
 * @author Baibhav
 */


public class MediaController extends BaseController{

	public Recommend m;
	
	public MediaController() throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, UnknownHostException {
		super();
		m = new Recommend();
	}
	
	public ResultSet relatedMedia(String id) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
	    
		return m.relatedMedia(id);
	}
	
	public ResultSet recommendedMedia(String id, String type) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
	    
		return m.recommendedMedia(id,type);
	}
	
}