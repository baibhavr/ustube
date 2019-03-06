

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
import org.apache.struts2.util.IteratorGenerator.Converter;

import com.mysql.jdbc.Connection;

import java.io.*;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import net.ustube.utils.ffmpeg.FfmpegUtils;

/**
 * 
 * The class handles the uploading functionality provided by the UStube.
 *
 */

/**
 * @author Baibhav
 */

public class UploadServlet extends HttpServlet{
	/**
	 * Creates the serial version UUID for this class.
	 */
	private static final long serialVersionUID = 1L;
	private static int filecount;
	private String file_path,thumbnail_path;
	// For thumbnail
	private FfmpegUtils ffmpeg;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		// For thumbnail
		ffmpeg = new FfmpegUtils( "ffmpeg" );
		
		// Check that we have a file upload request
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		// Create a factory for disk-based file items
		FileItemFactory factory = new DiskFileItemFactory();

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		req.getParameterNames();
		try{
			List /* FileItem */ items = upload.parseRequest(req);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
			    FileItem item = (FileItem) iter.next();
			    if(!(item.isFormField())){
			    	if((item.getContentType().contains("video")||item.getContentType().contains("audio"))){
						 String name = item.getName();
						 StringTokenizer tok = new StringTokenizer(name,".");
						 String ext = "";
						 if(tok.countTokens()>0){
							while(tok.hasMoreTokens()){
								 ext = tok.nextToken();
							}
						}
					    
						File media = new File("/var/www/ustubefiles");
						if(!media.exists()){
							media.mkdir();
						}
						
						// For thumbnail
						File thumb = new File("/var/www/ustubefiles/thumb");
						if(!thumb.exists()){
							thumb.mkdir();
						}
						
						String randomFileName = UUID.randomUUID().toString();
						
					
						file_path = "/var/www/ustubefiles/".concat(randomFileName).concat(".").concat(ext);
                        
						thumbnail_path = "/var/www/ustubefiles/thumb/".concat(randomFileName).concat("_1.jpg");
						File uploadedFile = new File(file_path);
					    
						// Create video file
					    item.write(uploadedFile);
					    
					    
					    //Convert video into mp4
					    
					    if(!("mp3".equals(ext)) && !("mp4".equals(ext))){
					    	
					    	String convertedFilePath = "/var/www/ustubefiles/".concat(randomFileName).concat(".mp4");                            
					    	File convertedFile = new File("/var/www/ustubefiles/");
					    	FfmpegUtils convertUtil = new FfmpegUtils("ffmpeg");
					    	convertUtil.convertVideo(file_path,convertedFile);
					    	file_path = convertedFilePath;
                        }
					    
    
					    
		  
					    // Create thumbnail
//					    if(item.getContentType().contains("video"))
//						    ffmpeg.generateThumbnails(file_path,
//					                new File("/var/www/ustubefiles/thumb/" ), 480, 320, 1 );
//					    else
					    	thumbnail_path ="";
					    
					    // Save into database
					    boolean success = databaseconn(req, items);

					    String[] url = file_path.split("/");
						String file_name = url[url.length-1];
					    req.setAttribute("success", file_name);
					 }else{
                        req.setAttribute("invalid_file", "Please upload a video/audio media file");
//                        RequestDispatcher reqDidpatcher = req.getRequestDispatcher("upload.jsp");
//                        reqDidpatcher.forward(req, resp);
					 }
					}
			    }
			
			 
			
		}catch (Exception e) {
			e.printStackTrace();
		}	
		RequestDispatcher reqDidpatcher = req.getRequestDispatcher("upload.jsp");
		reqDidpatcher.forward(req, resp);
	}
	
//	Author Baibhav
	public boolean databaseconn (HttpServletRequest req, List items) throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException{
		HttpSession session = req.getSession(true);
		boolean val= false;
		
		
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ustube","root", "root");
	    Statement st=conn.createStatement();
	    
	    String title=null;
	    String desc=null;
	    String category=null;
	    String privacy=null;
	    String type=null;
	    String tags=null;
	    
	    
	    Iterator listItr = items.iterator();
	    while (listItr.hasNext()) {
	    	
	    	FileItem item = (FileItem) listItr.next();
	    	if(!(item.isFormField())){
		    	if(item.getContentType().contains("video"))
		    			type = "video";
		    	else if(item.getContentType().contains("audio"))
		    			type = "audio";
	    	}
	    	else if(item.isFormField()){
                if("cat".equals(item.getFieldName()))
                    category = item.getString();
                else if("desc".equals(item.getFieldName()))
                    desc = item.getString();
                else if("name".equals(item.getFieldName()))
                	title = item.getString();
                else if("category".equals(item.getFieldName()))
                    category = item.getString();
                else if("privacy".equals(item.getFieldName()))
                    privacy = item.getString();
                if("tags".equals(item.getFieldName())){
                    tags = item.getString();
                    
                }
                
            }
	    }
		
	    

	    String query = "INSERT INTO media(`name`, `privacy`,`desc`,`user_id`,`file_path`,`thumbnail_path`,`category_id`,`add_date`,`type`,`tags`) VALUES('"+title+"','"+privacy+"','"+desc+"','"+session.getAttribute("user_id")+"','"+file_path+"','"+thumbnail_path+"','"+category+"',NOW(),'"+type+"','"+tags+"')";
	    System.out.println("Media Insert "+query);
	    st.executeUpdate(query);
	    
		
		return true;
	}
}