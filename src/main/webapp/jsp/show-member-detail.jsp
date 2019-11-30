<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User</title>
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/> 
<!-- /Header -->

<form  >
 <br> <br> <br><br><br>
 
	<div class="container">
		<div class="jumbotron" >
  			<div class="text-center">
  				<p>
  					<img src="/img/${session.username }.png" width="100" height="100">
  				</p>
  				<p>Username : ${member.username}</p>
  				<p>Your name : ${member.memberName}</p>
  				<p>Your email : ${member.memberEmail}</p>
				<button><a href="/member/editform/${member.username}">Edit </a></button>
				<button><a href="/member/uploadprofile/${member.username}">Upload Profile </a></button>
			</div>
		</div>
	</div>
</form>
<br><br><br><br>

</body>
</html>