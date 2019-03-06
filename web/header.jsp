<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>USTube</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />

<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="scripts/jquery.timers.1.2.js"></script>
<script type="text/javascript" src="scripts/jquery.galleryview.2.1.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.galleryview.setup.js"></script>
<script type="text/javascript" src="scripts/friend.js"></script>
</head>
<body id="top">

<%@ page import="net.ustube.controllers.BaseController" %>
<%@ page import="java.sql.ResultSet" %>


<div class="wrapper col0">
  <div id="topline">
    <p><a href="http://www.albany.edu/">Ualbany</a> | MediaStreamer</p>
    <ul>
    <% if (session.getAttribute("user_name") != null){ %>
    <li>Welcome, <%=session.getAttribute("user_name")+" !"%></li>
    <%} %>
      <li><a href="upload.jsp">Upload</a></li>
      <li><a href="dashboard.jsp">Dashboard</a></li>
      <li class="last">
      <% if (session.getAttribute("user_name") == null){ %>
      	<a href="login.jsp">Login</a>
      	<%}
      	else{%>
       	<a href="logout.jsp">Logout</a>
      	<%} %>
   	</li>
    </ul>
    <br class="clear" />
  </div>
</div>


<!-- ####################################################################################################### -->
<div class="wrapper">
  <div id="header">
    <div class="fl_left">
      <h1><a href=""><strong>US</strong>Tube</a></h1>
      <p>Upload, stream and download videos or audios</p>
    </div>
<!--     <div class="fl_right"><a href="#"><img src="images/demo/468x60.gif" alt="" /></a></div> -->
    <br class="clear" />
  </div>
</div>



<!-- ####################################################################################################### -->
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li class="active"><a href="/ustube/">Home</a></li>
        <li><a href="medialist.jsp?type=video">Videos</a></li>
        <li><a href="medialist.jsp?type=audio">Audios</a></li>
<!--         <li><a href="style-demo.jsp">Style Demo</a></li> -->
<!--         <li><a href="full-width.jsp">Full Width</a></li> -->
        <li class="last"><a href="#">Categories</a>
          <ul>
            <%
            BaseController cat1=new BaseController();
            ResultSet category_rs = cat1.get_category();
            while(category_rs.next()){
            %>
            <li><a href='search.jsp?cat=<%=category_rs.getString("title")%>'><%=category_rs.getString("title") %></a></li>
            <% } %>
          </ul>
        </li>

      </ul>
    </div>
    <div id="search">
        <form action="searchMedia" method="post">
        <fieldset>
          <legend>Site Search</legend>
          <input id="autoSearch" name="title" type="text" value="Search Our Website&hellip;"  onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;" />
          <select name="searchType" style="float:left" size="1" onChange="this.form.action=this.options[this.selectedIndex].value;">
          	<option value="searchMedia">Media</option>
          	<option value="search.jsp">User</option>
          </select>
          <input type="submit" name="go" id="go" value="Search" />
        </fieldset>
      </form>
    </div>
    <br class="clear" />
  </div>
</div>
          
<!-- Stan#######################################################################################################AutoCompleteSearch -->


<link href="styles/auto_complete/jquery-ui-1.8.20.custom.css" rel="stylesheet" type="text/css"/>
<script src="scripts/auto_complete/jquery-1.7.2.min.js"></script>
<script src="scripts/auto_complete/jquery-ui-1.8.20.custom.min.js"></script>
<script>
  var arr=new Array('${mediaTitles}');
  var temp=arr.toString();
  var title=temp.split(', ');
//  var projects=new Array();
//  var arrID=[1,2,3];

//  projects.push(arrID);
//  for(i=0;i<arr.length;i++){
//      projects=[{value}]
//  }
   
  $(document).ready(function() {
    $("input#autoSearch").autocomplete({
    source: title,
    select: function( event, ui ) {
//                          $( "#s" ).val( ui.item.value );
			  
                          this.value=ui.item.value;
//                          window.open('video.jsp?id=7','_blank');
                        $(this).closest('form').submit();	
			}
});
  });
  </script>
