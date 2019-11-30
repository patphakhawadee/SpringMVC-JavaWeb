<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Member</title>
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
<meta charset="ISO-8859-1">
<title>Member List</title>
</head>
<script language='javascript' type='text/javascript'>
  		function confirmDelete(id) {
	       var ans = confirm("Do you want to delete member Id :" +id);
	       if (ans==true)
	       document.location = "/member/delete/"+id;
	      } 
</script>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/> 
<!-- /Header -->
<div class="container">
  	<div class="text-center">
		
			<h2>Member List</h2>
			<form class="navbar-form " action="/member/searchMember">
			<div class="input-group">
					<input type="text" name="keyword" class="form-control" placeholder="Search">
					<div class="input-group-btn">
          				<button class="btn btn-default" type="submit">
            				<i class="glyphicon glyphicon-search"></i>
          				</button>
        			</div>
        	</div>
		</form>
		
	</div>
</div>
<br>
	<div class="container">
	
  			<div class="text-center">
				<table id="t01" style="width:100%">
					 
					<tr height="50"><th width="200" align="center">Name</th><th width="200">Email</th><th width="200">Username</th><th width="200">Password</th><th></th></tr>
					<c:forEach items="${memberList}" var="member">
					<tr height="30" >
						<td width="200">${member.memberName}</td>
						<td width="200">${member.memberEmail}</td>
						<td width="200">${member.username}</td>
						<td width="200">${member.password}</td>
						<td width="200">
							<a href="/member/editform/${member.username}">Edit </a>
							<a>|</a>
							<a href="/member/delete/${member.username}" onclick="return confirm('Press Yes to delete member')">Delete</a>
						</td>
					</tr>
					</c:forEach>
					</table><br>
					<a href="/member/addByAdmin"><button  ><font color="black">Add Member</font></button></a><br>	
			</div>
		</div>

<br><br><br><br>
</body>
</html>