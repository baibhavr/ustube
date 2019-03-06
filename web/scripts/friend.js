$(document).ready(function () {
	$('#comment_button').click(function () {
		var date = new Date();
		var media_id = $('#media_id').val();
		var comment_message = $('#comment_message').val();
		var user_name = $('#user_name').val();
		$.post('commentOnVedio.jsp',
			{media_id:media_id,comment_message:comment_message},
			function (data) {
//alert(data);
	//setInterval( "commentHistory();", 1000 );
$('#comments').append("<ul class='commentlist'><li class='comment_odd'>"+"<div class='author'><span class='name'>"+data+"</span><span class='wrote'>wrote:</span><p>"+comment_message+"</p></div><div class='submitdate'>"+date+"</div></li></ul>");
/*
				$(function(){commentHistory = function(){
				$.post("commentHistory.jsp",{fid:fid},function(data){
				$('#comment').html(data)});*/
				$('#comment_message').attr('value','');
		});    //end of post function
	});   //end of comment_button click


	$('.comfirm').click(function () {
		//alert('click comfirm');
	var fid = $(this).attr('value');
	//alert('comfirm fid = '+fid);
	$.post('comfirm.jsp',{fid:fid},function (data) {
		//alert(data);
		window.location.href = "friend-request.jsp";
		//window.location.reload("friend-request.jsp");
		});
	});
	$('.reject').click(function () {
		//alert('click reject');
	var fid = $(this).attr('value');
	//alert('reject fid = '+fid);
	$.post('reject.jsp',{fid:fid},function (data) {
		//alert(data);
		window.location.href = "friend-request.jsp";
		//window.location.reload("friend-request.jsp");
		});	
	});

});
