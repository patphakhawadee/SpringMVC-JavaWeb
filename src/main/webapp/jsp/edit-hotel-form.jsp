<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Hotel</title>
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/>
<!-- /Header -->

<br><br><br>
<div class="container">
	<h1>Edit Hotel</h1>
</div>
<div class="container">
		<div class="jumbotron" >
  			<div class="text-center">
				<form action="/hotel/edit">
				
					<input type="hidden" name="hotelId" value="${hotel.hotelId }">
					Hotel name : <input type="text" name="hotelName" value="${hotel.hotelName }"><br>
					Hotel detail :  <br><textarea name="hotelDetail" rows="3" cols="40" >${hotel.hotelDetail}</textarea><br>
					Hotel rate score : 
					<select name="hotelScore">
				  		<option value="1">1</option>
				  		<option value="2">2</option>
				  		<option value="3">3</option>
				  		<option value="4">4</option>
				  		<option value="5">5</option>
					</select><br>
					<input type="submit" value="Edit">
					<button onclick="/hotel/hotels">Cancle</button>
				</form>
				</div>
		</div>
	</div>
</body>
</html>