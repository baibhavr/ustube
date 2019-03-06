package net.ustube.models;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

/**
 * @author Baibhav
 */

public class Recommend extends BaseModel{
	public Recommend() throws InstantiationException, IllegalAccessException,
			ClassNotFoundException, SQLException {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int id, user_id,hit,tag_id,category_id;
	public String name,desc,type,privacy,file_path,thumbnail_path,tags;
	public Date add_date;
	
	public ResultSet relatedMedia(String id) throws SQLException{
		Statement st = conn.createStatement();
		
			sql = this.relatedMediaSql(id) + " LIMIT 7";
//		    System.out.println(sql);
		    return st.executeQuery(sql);
	}
	
	/**
	 * Generates sql for related Media
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public String relatedMediaSql(String id) throws SQLException{
		String sql1="",sql2="",sql3="",sql4="";
		String tagTerms="",nameTerms="";
		
		// Get title, tags and other information of this media
		this.setId(Integer.parseInt(id));
		
		ResultSet thisMedia = getMedia();
		thisMedia.next();
		
		this.name = thisMedia.getString("name");
		this.tags = thisMedia.getString("tags");
		String userId = thisMedia.getString("user_id");
		
		String name_array[] = name.split("\\s");
		for(int i=0;i<name_array.length;i++){
			if(name_array[i].length()<4)
				continue;
			if(nameTerms.length()==0)
				nameTerms += " m.`name` LIKE '%" + name_array[i].trim()+"%' ";
			else
				nameTerms += " OR m.`name` LIKE '%" + name_array[i].trim()+"%' ";
		}		
		
		String tag_array[] = tags.split("\\s");
		
		for(int i=0;i<tag_array.length;i++){			
			if(tag_array[i].length()<4)
				continue;
			if(tagTerms.length()==0)
				tagTerms += " `tags` LIKE '%" + tag_array[i].trim()+"%' ";
			else
				tagTerms += " OR `tags` LIKE '%" + tag_array[i].trim()+"%' ";
		}
		
		if(nameTerms.length()!=0 && tagTerms.length()!=0)
			nameTerms = nameTerms + " OR ";
		
		
		// Title texts
		sql1 = "select m.*,user.user_name,category.title as cat_title " +
		    	  "from media m " +
		    	  "inner join user on user.id=m.user_id " +
		    	  "left join category on category_id=category.id " +
		    	  "WHERE m.id !=" + id+" " +
		    	  		"AND (" +
		    	  			  "("+
		    	  			  nameTerms +
		    	  			  tagTerms+
		    	  			  ")"+
		    	  			  " AND m.category_id = (SELECT category_id FROM media WHERE id ="+id+") " +
    	  			  		  " AND m.type = (SELECT type FROM media WHERE id ="+id+")" +
	  				  		 ")" +
		    	  		"AND privacy = 1 " +
		  		  "ORDER BY add_date DESC";
		
		// Tag texts
		if(tagTerms.length()!=0)
		sql2 = "select m.*,user.user_name,category.title as cat_title " +
		    	  "from media m " +
		    	  "inner join user on user.id=m.user_id " +
		    	  "left join category on category_id=category.id " +
		    	  "WHERE m.id !=" + id+" " +
	    	  			"AND ("+ tagTerms +")" +
	    	  			" AND m.category_id = (SELECT category_id FROM media WHERE id ="+id+") " +
	  			  		" AND m.type = (SELECT type FROM media WHERE id ="+id+")" +
		    	  		"AND privacy = 1 " +
		  		  "ORDER BY add_date DESC";
		
		// Users upload with same category and type
		sql3 = "select m.*,user.user_name,category.title as cat_title " +
		    	  "from media m " +
		    	  "inner join user on user.id=m.user_id " +
		    	  "left join category on category_id=category.id " +
		    	  "WHERE m.id !=" + id+" " +
		    	  		"" +
		    	  		"AND (" +
		    	  			  "m.user_id = " + userId + " " +
		    	  			  "AND m.category_id = (SELECT category_id FROM media WHERE id ="+id+") " +
    	  			  		  "AND m.type = (SELECT type FROM media WHERE id ="+id+")" +
	  				  		 ")" +
		    	  		"AND privacy = 1 " +
		  		  "ORDER BY add_date DESC";
		
		// Upload with same category and type
		sql4 = "select m.*,user.user_name,category.title as cat_title " +
		    	  "from media m " +
		    	  "inner join user on user.id=m.user_id " +
		    	  "left join category on category_id=category.id " +
		    	  "WHERE m.id !=" + id+" " +
		    	  		"AND (" +
		    	  			  "m.category_id = (SELECT category_id FROM media WHERE id ="+id+") " +
    	  			  		  "AND m.type = (SELECT type FROM media WHERE id ="+id+")" +
	  				  		 ")" +
		    	  		"AND privacy = 1 " +
		  		  "ORDER BY add_date DESC";
		
		
		if(tagTerms.length()==0)
			sql = "("+sql1+") UNION ("+sql3+") UNION ("+sql4+") ";
		else
			sql = "("+sql1+") UNION ("+sql2+") UNION ("+sql3+") UNION ("+sql4+") ";
		
		return sql;
	}
	
	/**
	 * Get Recommended media for the logged in user
	 * @param userId
	 * @param type
	 * @return
	 * @throws SQLException
	 */
	public ResultSet recommendedMedia(String userId, String type) throws SQLException{
		Statement st = conn.createStatement();
		String sql1="",sql2="";
		
		sql1 = "select l.media_id as id " +
		    	  "from `like` l,media m " +
		    	  "WHERE l.user_id = "+ userId + " AND l.`media_id` = m.id AND type ='" +type+ "' "+
		    	  "ORDER BY liked_date DESC LIMIT 4";
		sql2 = "select h.media_id as id " +
		    	  "from history h, media m " +
		    	  "WHERE h.user_id = "+ userId + " AND h.`media_id` = m.id AND type ='" +type+ "' "+
		    	  "ORDER BY watched_date DESC LIMIT 4";
		
		sql = "(" + sql1 + ") UNION (" + sql2 + ") LIMIT 6";
	    
//		System.out.println(sql);
		
		ResultSet preferredMedia = st.executeQuery(sql);
		System.out.println(sql);
		sql = "";
		
		while(preferredMedia.next()){
			if(sql.length()==0)
				sql+= relatedMediaSql(preferredMedia.getString("id"));
			else
				sql+= "UNION " + relatedMediaSql(preferredMedia.getString("id")) + " ";
		}
		
		if(sql.length()==0)
			sql = "select *" +
			    	  "from media m " +
			    	  "WHERE m.id = -1 ";
		else
			sql += "LIMIT 6"; 
		
			System.out.println(sql);
			
	    return st.executeQuery(sql);
//	    return preferredMedia;
	}
	
	public ResultSet getMedia() throws SQLException{
		Statement st = conn.createStatement();
		sql = "SELECT media.*,title,user.user_name FROM media,category,user WHERE media.user_id=user.id and media.id='"+id+"' AND media.category_id=category.id LIMIT 1";
//	    System.out.println(query);
	    return st.executeQuery(sql);	    
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getAdd_date() {
		return add_date;
	}
	public void setAdd_date(Date add_date) {
		this.add_date = add_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTag_id() {
		return tag_id;
	}
	public void setTag_id(int tag_id) {
		this.tag_id = tag_id;
	}
	public String getPrivacy() {
		return privacy;
	}
	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getThumbnail_path() {
		return thumbnail_path;
	}
	public void setThumbnail_path(String thumbnail_path) {
		this.thumbnail_path = thumbnail_path;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getTags() throws SQLException {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	
}
