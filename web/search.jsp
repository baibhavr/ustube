<!-- Author - Baibhav -->

<%@ page import="net.ustube.controllers.SearchController" %>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp" %>

<!-- ####################################################################################################### -->
<div class="wrapper">
  <div class="container">
    <div class="content">
      
<!--  Content STARTS here  -->
	    <form>
	    <table>
	    
	    <%
	    String searchType = (null == request.getParameter("searchType")) ? "":request.getParameter("searchType");
		
		if(searchType.contentEquals("user")){
		%>
		<%@ include file="search/searchUser.jsp" %>
	    <% }
		
		else {	    
		    %>
		    <%@ include file="search/searchMedia.jsp" %>
		    <% }
		%>
	    </table>
	    </form>  
	    
	    	    
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