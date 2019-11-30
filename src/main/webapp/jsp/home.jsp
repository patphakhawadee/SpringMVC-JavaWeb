<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta content="text/html; charset=iso-8859-2" http-equiv="Content-Type">
<meta charset="utf-8">
<title>Home</title>
<style>
.mySlides {display:none;}
</style>
</head>

<body>
<!-- Header -->
<jsp:include page="header.jsp"/>
<!-- /Header -->

<br>
<div class="text-center">
	<h1>You can rate and comment the hotel,where did you go.</h1>
</div>
<br>
	<h2 class="w3-center">Poppula Hotel in Khon Kean</h2>

<div class="w3-content w3-display-container">
	<div class="w3-display-container mySlides">
  		<img  src="/hotelPicture/Avani Khon Kaen Hotel.png" style="width:100%">
  		<div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-black">
    		<p>Avani Khon Kaen Hotel</p>
  		</div>
	</div>
	<div class="w3-display-container mySlides">
  		<img  src="/hotelPicture/Castle Howchow Beach Resort.png" style="width:100%">
  		<div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-black">
    		Castle Howchow Beach Resort
  		</div>
	</div>
	<div class="w3-display-container mySlides">
  		<img  src="/hotelPicture/The Charm Boutique.png" style="width:100%">
  		<div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-black">
    		The Charm Boutique
  		</div>
	</div>
	<div class="w3-display-container mySlides">
  		<img  src="/hotelPicture/The Glacier Khon Kaen.png" style="width:100%">
  		<div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-black">
    		The Glacier Khon Kaen
  		</div>
	</div>
	<div class="w3-display-container mySlides">
  		<img src="/hotelPicture/The Lake Khon Kaen.png" style="width:100%">
  		<div class="w3-display-bottomleft w3-large w3-container w3-padding-16 w3-black">
    		The Lake Khon Kaen
  		</div>
	</div>
	
  <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
  <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
</div>
<br><br>
<div class="container">
		<div class="row1">
			<div class="col-lg-12" >
				
				<form class="navbar-form navbar-left" action="/hotel/searchHome" >
				<h2>Find Hotel in Khon Kean </h2>
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
	</div>
	<br>

	<c:forEach items="${hotelList}" var="hotel">
	<div class="container">	
		<div  class="jumbotron" >
		<table  >
			<tr>
		    	<td><img src="/hotelPicture/${hotel.hotelName}.png" width="300" height="300"> </td> 
		    	<td width="70"></td> 
		    	<td width="800">
		    			<h3>${hotel.hotelName}</h3>
		    		    <p><br> ${hotel.hotelDetail}</p>
		    		    Star :  
		    		    <c:forEach var = "i" begin = "1" end = "${hotel.hotelScore }">
		    				<img src="/star.png" width="30" height="30" >
		    			</c:forEach>
		    			<p>You can see comment or comment and give star --->
		    			<a href="/o-o/showComment/${hotel.hotelId}">Here</a></p>
		    	</td>    	
		    </tr>
		    	</table><br>
		    </div>
		</div>
		</c:forEach>
		<br><br>


<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>

	
</body>
</html>