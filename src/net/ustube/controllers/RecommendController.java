package net.ustube.controllers;

import java.net.UnknownHostException;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import net.ustube.models.Recommend;


/**
 * @author Baibhav
 */

public class RecommendController extends BaseController{

	public Recommend r;
	
	public RecommendController() throws InstantiationException,
			IllegalAccessException, ClassNotFoundException, SQLException, UnknownHostException {
		super();
		r = new Recommend();
	}
	
	public ResultSet relatedMedia(String id) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
	    
		return r.relatedMedia(id);
	}
	
	public ResultSet recommendedMedia(String id, String type) throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException{
	    
		return r.recommendedMedia(id,type);
	}
	
}