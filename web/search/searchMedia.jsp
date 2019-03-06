<!-- Author - Baibhav -->

<%@page import="java.util.HashMap"%>
<%@page import="net.ustube.utility.ResultToList"%>
<%@page import="net.ustube.utility.Privacy"%>
<%@page import="net.ustube.models.Media"%>

<!--  For Pagination -->
<%!int recordsPerPage=1;%>
<script type="text/javascript" src="scripts/pagination.js"></script>
<!--  For Pagination ENDS -->

<%
		// For Pagination
		int recordNo=0;
		// For Pagination ENDS
		
	    String query,term;
	    ResultSet rs = null;
	    
	    SearchController object=new SearchController();
	    if(request.getParameter("title")!=null){
	    	query = request.getParameter("title");
	    	rs = object.search(query);
	    	term = "all";
	    }
	    else if(request.getParameter("tags")!=null){
	    	query = request.getParameter("tags");
	    	rs = object.search_tags(query);
	    	term = "tags";
	    }
	    else if(request.getParameter("cat")!=null){
	    	query = request.getParameter("cat");
	    	rs = object.search_category(query);
	    	term = "category";
	    }
	    else if(request.getParameter("type")!=null){
	    	query = request.getParameter("type");
	    	rs = object.search_type(query);
	    	term = "type";
	    }
	    else
        	{
	    	query = "";
	    	term = "";
        	}
	    
	    if((query.contains("Search Our Website...") || query=="") && request.getParameter("title")==null && request.getParameter("tags")==null){
	    	out.println("<h1>Search Results for ");
	    	out.println("empty string");
	   		out.println("</h1>");	
	   		
	   		out.println("<br><h2>No results for this query</h2>");
	   		
	    }
	    else{
	    
	    if(term=="all"){		
	    	out.println("<h1>Search Results for ");
	    	out.println("'"+query+"'");
	    	
	    }
	    else{
	    	out.println("<h1><em><b>"+term.toUpperCase()+"</b></em> - "+query);
	    }
	    out.println("</h1>");
	    
	    

	 	// For Privacy
	    HashMap<Integer,Media> mediaMap= new HashMap<Integer,Media>();
	    Privacy privacy = new Privacy();
	    mediaMap = privacy.filterResultSet(rs, session);
	    rs.beforeFirst();
    
	    if(!rs.isBeforeFirst())
	    	out.println("<br><h2>No results for this query</h2>");
	    	else{
	    		
			    %>
			    <div id="comments">
			    <ul class="commentlist">

			    <%
			 	// For Pagination
			      int i=0;	  
	              for (i=0;rs.next();i++){
	            	// For Pagination ENDS
	            	
	            	 // For Privacy
			    	if(mediaMap.containsKey(new Integer(rs.getInt("id")))){// For Privacy
			    %>
			    

		          <li class="comment_<%=((rs.getRow()%2>0) ? "even":"odd")%>">
		            <div class="author">
									<img class="avatar" src='<%=object.thumbnail_url(rs.getString("thumbnail_path")) %>' width="150"
										height="90" alt="">
										
										<span class="name">
											<a href='video.jsp?id=<%=rs.getString("id")%>'>
												<%
													String name = rs.getString("name");
													out.print(name.toUpperCase().charAt(0)+name.substring(1));
												%>
											</a>
										</span>
								</div>
<!-- 								<div class="submitdate"> -->
<!-- 									<a href="#">August 4,2009</a> -->
<!-- 								</div> -->
								<p>
								<%
								String desc = rs.getString("desc");
								if(desc.length()>100)
									out.print(desc.substring(0,100)+"...");
								else
									out.print(desc);
								
								%>
								</p>

								<p>
								<span>
									<b>Category</b> - <%
									String cat = rs.getString("cat_title");
									if(cat==null)
										out.print("None");
									else
										out.print("<a href='search.jsp?cat="+cat+"'>"+cat+"</a>");
									%>
									</span>
									|
									<span>
									<b>Type</b> - <%
									out.print("<a href='search.jsp?type="+rs.getString("type")+"'>"+rs.getString("type")+"</a>");
									%>
									</span>
								</p>
								<p class="facets">
									<span class="username-prepend">by</span> 
										<a href="#" class="yt-user-name " dir="ltr">
											<%=rs.getString("user_name") %>
										</a>
									<span class="metadata-separator">|</span> 
									<span class="date-added">Date added - <%=((rs.getString("add_date")==null) ? "Empty":rs.getString("add_date")) %></span>
									<span class="metadata-separator">|</span>
									<span class="viewcount">
									<%
										String hits = rs.getString("hit");
										if(hits==null)
											out.print("0");
										else
											out.print(hits);
									%> views
									</span>
																		

								</p>
							</li>

			    <%
			    	}
			    }
			    
			    %></ul>
			    </div>
			    <%
			  //pagination
              recordNo = i;
             //pagination ends
	    	}
	    }
	    %>
	    
	    <!-- For Pagination -->
	     <div id="pages">
				<font size="2" color="green"></b>Page</font>&nbsp;&nbsp;
			       <%
			       double totalButtons=1;
			       if(recordNo<recordsPerPage) 
			        totalButtons=Math.ceil(recordNo/recordsPerPage)+1;
			       
				   for(int j=0;j<totalButtons;j++){%>
				   <input id="button_<%=j%>" type="button" onClick="getHits(<%=j+1%>,<%=totalButtons%>)" value="<%=j+1%>"></input>
				   <%}%>
	   	</div>
<!-- For Pagination ENDS-->