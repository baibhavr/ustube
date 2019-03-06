<!-- Author - Baibhav -->

<%

if (null != session.getAttribute("user_name")){ 

%>

    <%@page import="java.sql.ResultSet"%>
    <%@ page import="net.ustube.controllers.RecommendController"%>
<div id="adblock">
     <h2>Recommended</h2>
     
     <%
	 	RecommendController recommended = new RecommendController();
	 	ResultSet recoVideo = recommended.recommendedMedia(session.getAttribute("user_id").toString(),"video");
	 	ResultSet recoAudio = recommended.recommendedMedia(session.getAttribute("user_id").toString(),"audio");
     %>
<div id="TabbedPanels_reco">
  <h2>Videos</h2>
    <div id="hpage_cats">
    	<%
    	while(recoVideo.next()){
    	%>
         <div class="fl_left">
             <a href='video.jsp?id=<%=recoVideo.getString("id")%>'><%=recoVideo.getString("name")%></a>
             <a href='video.jsp?id=<%=recoVideo.getString("id")%>'">
                 <img src="<%=recommended.thumbnail_url(recoVideo.getString("thumbnail_path"))%>" alt="" height="50%" width="50%"/>
             </a>
        <p><strong><a href="profile.jsp?id=<%=recoVideo.getString("user_id")%>"><%=recoVideo.getString("user_name")%></a></strong></p>
        <p><%=recoVideo.getString("hit")%></p>        
        <p><%=recoVideo.getString("add_date")%></p>
        </div>   
        <%
    	}
        %>
    </div>   
    <h2 style="clear:both">Audios</h2>
	  <div id="hpage_cats">
	  <%
	  while(recoAudio.next()){
	  %>
         <div class="fl_left">
             <a href='video.jsp?id=<%=recoAudio.getString("id")%>'><%=recoAudio.getString("name")%></a>
             <a href='video.jsp?id=<%=recoAudio.getString("id")%>'">
                 <img src="<%=recommended.thumbnail_url(recoAudio.getString("thumbnail_path"))%>" alt="" height="50%" width="50%"/>
             </a>
        <p><strong><a href="#"><%=recoAudio.getString("user_name")%></a></strong></p>
        <p><%=recoAudio.getString("hit")%></p>        
        <p><%=recoAudio.getString("add_date")%></p>
        </div>
        <%
    	}
        %>
    </div>

  </div>
    <br class="clear" />
  </div>
  
  <%
}
  %>