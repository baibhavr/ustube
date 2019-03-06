

<div class="column">
      <div class="subnav">
        <h2>Secondary Navigation</h2>
        <ul>
          <li class="active"><a href="index.jsp">Home</a></li>
          <li><a href="upload.jsp">Upload</a></li>
          <li><a href="dashboard.jsp">Dashboard</a></li>
		  <li class="last">
				<%
					if (session.getAttribute("user_name") == null) {
				%> <a href="login.jsp">Login</a> <%
				 	} else {%>
				 <a href="profile.jsp?id=<%=session.getAttribute("user_id").toString()%>">Profile</a>
				 <a href="friend-request.jsp">Friend Request</a>
				 <a href="friendlist.jsp">Friend List</a>
				 <%
				 	}
				 %>
			</li>
		</ul>
      </div>
      
      
<!-- Author - Baibhav -->
      
<%
if(request.getRequestURI().contains("/video.jsp")){
%>


<%@ page import="net.ustube.controllers.RecommendController"%>

<%
	String videoId = request.getParameter("id");
	RecommendController related = new RecommendController();
	ResultSet rsRelated = related.relatedMedia(videoId);
%>
      <div class="subnav">
        <h2>Related Media</h2>
        <ul class="latestnews">
        <%
        while(rsRelated.next()){
        	%>
        <li><img width="50%" src="<%=related.thumbnail_url(rsRelated.getString("thumbnail_path"))%>" alt="">
          <p><strong><a style="border:none" href="video.jsp?id=<%=rsRelated.getString("id")%>"><%=rsRelated.getString("name")%></a></strong>
		  <%
		  String desc = rsRelated.getString("desc");
								if(desc.length()>70)
									out.println(desc.substring(0,70)+"...");
								else
									out.println(desc);
			%>
		  </p>
        </li>
        
        <%
        }
        %>
      </ul>
      </div>
      <div class="holder">

      </div>
      
     <%
	}
    %>
</div>
    
    