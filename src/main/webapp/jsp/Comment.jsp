<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Comment</title>
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/>

<!-- /Header -->

<br><br><br>
	<div class="text-center">
		<font size="50" >You can rate and comment the hotel,where did you go.</font>
	</div>
	<br>
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

</body>
</html>