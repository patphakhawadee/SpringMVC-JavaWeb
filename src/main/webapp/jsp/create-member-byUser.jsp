<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Edit Member</title>
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/> 
<!-- /Header -->

<br>
<div class="container">
	<div class="text-center">
	<h1>Create Member</h1>
</div>
</div>
<br>
<div class="container">
		<div class="jumbotron" >
  			<div class="text-center">
				<form action="/member/addMemberByAdmin" method="Post">
					<p>
						username : <input type="text" name="username" ><br>
					</p><p>	
						Password : <input type="text" name="password" ><br>
					</p><p>	
						Member name : <input type="text" name="memberName" ><br>
					</p><p>
						Member email : <input type="text" name="memberEmail" ><br>
					</p><p>
						<input type="submit" value="Create">
						
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>