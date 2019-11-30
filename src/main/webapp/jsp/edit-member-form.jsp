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

<br><br><br>
<div class="container">
	<h1>Edit Member</h1>
</div>
<br>
<div class="container">
		<div class="jumbotron" >
  			<div class="text-center">
				<form action="/member/edit">
					<p>
						username : <input type="hidden" name="username" value="${member.username }">${member.username }<br>
					</p><p>	
						Password : <input type="text" name="password" value="${member.password }"><br>
					</p><p>	
						Member name : <input type="text" name="memberName" value="${member.memberName }"><br>
					</p><p>
						Member email : <input type="text" name="memberEmail" value="${member.memberEmail}"><br>
					</p><p>
						<input type="submit" value="Edit">
						
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>