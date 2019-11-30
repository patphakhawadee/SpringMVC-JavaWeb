<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/> 
<!-- /Header -->

<form action="/member/Registers" method="Post" >
 <br> <br> <br><br>
 
	<div class="container">
		<div class="jumbotron" >
  			<div class="text-center">
  				<p>
  					<img src="/user-logo.png" width="100" height="100">
  					<h1 style="text-align:center">Sign up</h1>
  				</p>
  				<p>
					Personal Information<br>
					 <input type="text" placeholder="Enter your name" name="memberName" required title="a - z , 0 - 9" ><br>
					 <input type="text" placeholder="Enter your email" name="memberEmail" required pattern="[a-zA-Z0-9.+,$-]+@+[a-zA]+.com" title="exsample@mail.com"><br>
				</p>
				<p>
					Set Access Information<br>
					<input type="text" placeholder="Set your username" name="username" required title="a - z , 0 - 9"><br>
					<input type="password" placeholder="Set your password" name="password" required  title="a - z , 0 - 9"><br>
				</p>
				<button type="submit">Register</button>
			</div>
		</div>
	</div>
</form>
</body>
</html>