<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
 
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/>
<!-- Header -->
<br><br><br>
<div class="container">
	<div class="jumbotron p-3 p-md-5"  >
  		<div class="text-center">
		<form action="/member/login" method="Post" >
			
		 	<div class="container">
				<img src="/user-logo.png" width="100" height="100">
				<h1 style="text-align:center">Sign in</h1>
			</div>
		 	<div class="container">
		 		<p>
					<input type="text" placeholder="Enter Username" name="username" required   >
				</p>
				<p>
					<input type="password" placeholder="Enter Password" name="password" required>
				</p>
				<font color="red">${Wrong}</font><Br><br>
				<button  type="submit">Sign in</button>
			</div>
		</form>
		
		</div>
	</div>
</div>

<!-- script -->
	<script>
	var modal = document.getElementById('modal-wrapper');
	window.onclick = function(event){
		if(event.target == modal){
			modal.style.display = "none";
		}
	}
	</script>
</body>
</html>
