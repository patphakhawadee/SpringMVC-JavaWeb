<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Hotel</title>
<link href="form-validation.css" rel="stylesheet">
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/>
<!-- /Header -->

<br>
	<div class="container" >
		<div class="text-center" >
		<h1>Create Hotel</h1>
	</div>
<br>
<div class="container">
		<div class="jumbotron" >
  			<div class="text-center">
				<form action="/hotel/create" >
				
					Hotel Name : <input type="text" name="hotelName" placeholder="Enter hotel name" required><br>
					Hotel Detail : <br>
					<textarea name="hotelDetail" rows="3" cols="40" placeholder="Enter hotel detail" required></textarea><br>
					Hotel rate score : 
					<select  name="hotelScore" required>
				  		<option value="1">1</option>
				  		<option value="2">2</option>
				  		<option value="3">3</option>
				  		<option value="4">4</option>
				  		<option value="5">5</option>
					</select><br>
					<input type="submit" value="Create">
					<button onclick="/hotel/hotels">Cancel</button>
					
				</form>
			</div>
		</div>
	</div>
</body>
</html>