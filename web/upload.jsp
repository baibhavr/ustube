<!-- Author - Baibhav -->

<%@ page import="java.sql.*" %>

<%@ include file="header.jsp" %>

<script type="text/javascript">
function Validate() { //v3.0
	var name=document.frm.name;
	
	if ((name.value==null)||(name.value=="")){
		alert("Please Enter title of the file");
		name.focus();
		return false;
		}
}
</script>

<!-- ####################################################################################################### -->
<div class="wrapper">
			  <div class="container">
			    <div class="content">
			      
			      <!--  Content STARTS here  -->
			      

							    
									    <%
									    Class.forName("com.mysql.jdbc.Driver").newInstance();
										Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ustube","root", "root");
									    Statement st=conn.createStatement();
										    
											String query = "SELECT * FROM category";
											Statement st1=conn.createStatement();
										    ResultSet cat = st1.executeQuery(query);
									    %>

	    <table>    

					<h2>Upload your file</h2>
					<div id="upload">
					
					<%
// 					out.println("session ="+session.getAttribute("user_name")+" and user_id = "+session.getAttribute("user_id"));
					if (session.getAttribute("user_name") != null){
					
						if(request.getAttribute("success")!=null){
							out.println("<span style='color:orange;'>You have successfully uploaded your file!</span><br><br><a TARGET='_blank' href='http://76.74.219.132/ustubefiles/"+request.getAttribute("success")+"'>Download link</a>");
							request.setAttribute("success", null);
						}
						
						if(request.getAttribute("invalid_file")!=null){
							out.println("<span style='color:orange;'>Please upload only video or audio file!</span>");
							request.setAttribute("invalid_file", null);
						}
					%>
						<form name="frm" enctype="multipart/form-data" action="upload.do" method = "POST" onsubmit="return Validate();">
							<p>
								<label for="name">Title</label>
							</p>
							<p>
								<input type="text" name="name" id="name" value="" size="22">
								
							</p>


					
						<p>
							<label for="cat">Category (required)</label>
							</p>
							<p>
							<%
							if(!cat.wasNull()){
								out.print("<select name='category'>");
								while(cat.next())
									out.print("<option value="+cat.getInt("id")+">"+cat.getString("title")+"</option>");

								out.print("</select>");
							}
							%>
						</p>

						<p>
							<label for="tags">Tags</label>
						</p>
						<p>
							<textarea name="tags" id="desc" cols="100%" rows="3"></textarea>
						</p>

						<p>
								Privacy (required)
								<input type="radio" name="privacy" class="radio"
									checked="checked" value="0">
								<label for="email">Public</label>
								
								<input type="radio" name="privacy" class="radio"
									value="1">
								<label for="email">Friends</label>
								
								<input type="radio" name="privacy" class="radio"
									value="2">
								<label for="email">Only me</label>
							</p>
							

							<p>
							 	<label for="desc">Description</label>
							</p>
							<p>
								<textarea name="desc" id="desc" cols="100%" rows="10"></textarea>
								
								
							</p>
							
							<p>
								<input type = "file" name="fileInput"/>
							</p>
							<p>
								<input name="submit" type="submit" id="submit"
									value="Submit Form"> &nbsp; <input name="reset"
									type="reset" id="reset" tabindex="5" value="Reset Form">
							</p>
							
							
						</form>
						
						<%}
					
					else{
						%>
						Please <a href="login.jsp">login</a> to upload 
						<%}
						%>
					</div>
				</table>
			      
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
