<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Comment</title>
<style>
table#t01 td {
    text-align: left;
    padding: 20px;
}

table#t01 tr:nth-child(even) {
    background-color: #eee;
}
table#t01 tr:nth-child(odd) {
   background-color: #fff;
}
table#t01 th {
    background-color: #00ffff;
    color: black;
    padding: 20px;
}
</style>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script language='javascript' type='text/javascript'>
  		function confirmDelete(id) {
	       var ans = confirm("Do you want to delete comment Id :" +id);
	       if (ans==true)
	       document.location = "/o-o/delete/"+id;
	      } 
</script>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/> 
<!-- /Header -->

<div class="container">
  	<div class="text-center">
		<h2>Comment List</h2>
	</div>
</div>
<br>
	<div class="container">
		
  			<div class="text-center">
				<table  id="t01" style="width:100%">
					<tr height="50" align="center" ><th width="200" >Hotel</th><th width="200">Username</th><th width="400">Comment</th><th width="100">Star</th><th width="100"></th></tr>
					<c:forEach items="${commentList}" var="comment">
					<tr height="30" >
						<td width="200"><a href="/o-o/showComment/${comment.hotelId}">${comment.hotelId}</a></td>
						<td width="200">${comment.username}</td>
						<td width="200">${comment.commentDetail}</td>
						<td width="200">${comment.star}</td>
						<td width="200"><a  onclick='confirmDelete(${comment.commentId})'>Delete</a></td>
					</tr>
					</c:forEach>
					</table><br>
						
			</div>
		
	</div>

</body>
</html>