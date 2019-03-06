
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@ page import="main.videopage"%>

<%@ include file="header.jsp" %>


<!-- ####################################################################################################### -->
<div class="wrapper">
			  <div class="container">
			    <div class="content">
			      
			      <!--  Content STARTS here  -->
			      

<%
			      	if (request.getParameter("id") != null) {
			      		String id = request.getParameter("id");
			      		videopage object = new videopage();
			      		ResultSet rs = object.video_info(id);
			      		
			      		if(null != session.getAttribute("user_id"))
			      			object.setHistory(session.getAttribute("user_id").toString(),id);
			      		// 		String filename="";	//media src file name

			      		while (rs.next()) {
			      %>


<div id="watch-headline-container">

		<div id="watch-headline" class="watch-headline">

					<h1 id="watch-headline-title">
						<span id="eow-title" class="long-title" dir="ltr" title="">
							<%=rs.getString("name")%>
						</span>

					</h1>

		</div>
</div>		



<!-- STAN STARTS -->
<div>
    		<div>
                        <%
                        	String filepath[] = rs.getString("file_path").split("/");
                        			String fileName = filepath[filepath.length - 1];
                                                if(rs.getString("type").matches("video")){ 
                        %>
    			<div style="color:white;background-color:gray;width:640px;height:264px" id="watch-player" class="flash-player" style="background-image: initial; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: transparent; background-position: initial initial; background-repeat: initial initial; ">
                            <c:choose>
                                <c:when test="${success==null}">
                                    <%@include file="video/frame_video.jsp" %>
                                    
                                </c:when>
                                <c:otherwise>
                                    <p>Media is no longer available</p>
                                </c:otherwise>
                            </c:choose>    			
                        
    			</div>
                        <%@include file="video/download.jsp" %>
                        <%
                                               } 
                        else{  %>
                            <c:choose>
                                <c:when test="${success}">
                                    <p>Media is mp3,enjoy.</p>
                                </c:when>
                                <c:otherwise>                                   
                                    <%@include file="video/audio.jsp" %>
                                </c:otherwise>
                            </c:choose>
                                               <%
                         }                      %>             
    		</div>       
                <%@include file="video/download.jsp" %>
   		</div>
   		
<!--    STAN ENDS -->


<!--  Dan -->
<div id="video_info">
<button id = 'like_button' onclick = 'like("true")'>Like</button>&nbsp;&nbsp;&nbsp;

<div id = 'likes'><b>Likes:</b> <%= videopage.getResultSetCount("SELECT * FROM `like` WHERE media_id='"+ request.getParameter("id") +"'") %></div>
<div id = 'hits'><b>Hits:</b> 0</div>


</div>
 <script type="text/javascript">
 var vid = <%=request.getParameter("id")%>;
 
 like("false");
 getHits();
 

 

//organize the data properly
 
function like(modDb){
	
	
	$.ajax({url : 'like.do',
			type: "GET",
			data: 'id=' + vid + "&mod=" + modDb ,
			success : function(data)
			{
				
				var strings = data.split("_");
				
				if(strings[0] == "Like" || strings[0] == "Unlike")
					{
					
					
					document.getElementById('like_button').innerHTML = strings[0];
					document.getElementById('likes').innerHTML = strings[1];
					
					
					
					}
				else 
					{
					
					alert(data);
					}
				
			}}
	
	);
	
	

}

function getHits(){
	
	
	$.ajax({url : 'hit.do',
			type: "GET",
			data: 'id=' + vid,
			success : function(data)
			{
				
				document.getElementById('hits').innerHTML = "<b>Hits:</b> " + data;
				
			}}
	
	);
	
	

}

</script>



<!-- Dan code ends -->




<!-- Baibhav code -->

<%@ include file="video/video_info.jsp" %>

<!-- Baibhav code ends-->

<%
	}
%>


<!-- Huang Code Starts -->
<%@ include file="video/comment.jsp" %>


<!-- Huang Code Ends -->

     	<%
     		} else {
     	%>

			<div id="watch-headline-container">

				<div id="watch-headline" class="watch-headline">

					<h1 id="watch-headline-title">
						<span id="eow-title" class="long-title" dir="ltr" title="">
						Invalid Media Url!
						</span>
					</h1>
				</div>
			</div>

			<%
				}
			%>
					<!--  Content ENDS here  -->
			    </div>
			    <%@ include file="sidebar.jsp" %>
			    <br class="clear" />
			  </div>
</div>

<!-- ####################################################################################################### -->

<!-- Footer STARTS here -->

<%@ include file="footer.jsp" %>

<!-- Footer ENDS here -->


