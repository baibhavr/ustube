<!-- Author - Baibhav -->

<div id="video_info">

	<div id = 'description' class="chunk">
	<p>
	<b>Uploaded by - </b> <em><%=rs.getString("user_name")%></em>
	| <b>Date added - </b> <em><%=rs.getString("add_date")%></em>
	</p>
	<b>Description</b>
	<p>
	<%= rs.getString("desc") %>
	</p>
	</div>
	
	<div id = 'category' class="chunk">
	<b>Category</b> - 
	<a href='search.jsp?cat=<%=rs.getString("title")%>'><%= rs.getString("title")%></a>
	| <b>Type</b> - 
	<a href='search.jsp?type=<%=rs.getString("type")%>'><%= rs.getString("type")%></a>
	</div>
	<div id = 'tags' class="chunk">
	<b>Tags</b>
	<p>
	<%= object.get_tags(rs.getString("tags")) %>
	</p>
	</div>
</div>