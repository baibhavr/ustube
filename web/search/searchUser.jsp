<!-- Author - Baibhav -->

<%
	    String query,term;
	    ResultSet rs = null;
	    
	    SearchController object=new SearchController();
	    if(request.getParameter("title")!=null){
	    	query = request.getParameter("title");
	    	rs = object.searchUser(query);
	    	term = "all";
	    }
	    else
        	{
	    	query = "";
	    	term = "";
        	}
	    
	    if((query.contains("Search Our Website...") || query=="") && request.getParameter("title")==null && request.getParameter("tags")==null){
	    	out.println("<h1>Search Results for User ");
	    	out.println("empty string");
	   		out.println("</h1>");	
	   		
	   		out.println("<br><h2>No results for this query</h2>");
	   		
	    }
	    else{
	    
	    if(term=="all"){		
	    	out.println("<h1>Search Results for User");
	    	out.println("'"+query+"'");
	    	
	    }
	    else{
	    	out.println("<h1><em><b>"+term.toUpperCase()+"</b></em> - "+query);
	    }
	    out.println("</h1>");
	    
	    
//    		ResultSet rs = object.search_tags(query);
    
	    if(!rs.isBeforeFirst())
	    	out.println("<br><h2>No results for this query</h2>");
	    	else{
	    		
			    %>
			    <div id="comments">
			    <ul class="commentlist">

			    <%
			    while(rs.next()){
			    %>
			    

	          	<li class="comment_<%=((rs.getRow()%2>0) ? "even":"odd")%>">
		            <div class="author">
										
							<span class="name">
								<a href='profile.jsp?id=<%=rs.getString("id")%>'>
									<%=rs.getString("user_name") %>
								</a>
							</span>
					</div>
								
				</li>

			    <%
			    
			    }
			    
			    %></ul>
			    </div>
			    <%
	    	}
	    }
	    %>