<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Hotel</title>
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
   padding: 20px;
}
table#t01 th {
    background-color: #00ffff;
    color: black;
    padding: 20px;
}
</style>
<meta charset="utf-8">
<title>Search Hotel</title>
</head>
<script language='javascript' type='text/javascript'>
  		function confirmDelete(id) {
	       var ans = confirm("Do you want to delete hotel Id :" +id);
	       if (ans==true)
	       document.location = "/product/DeleteProduct/"+Product;
	      } 
</script>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/> 
<!-- /Header -->
<div class="container">
  			<div class="text-center">
  			<h2>Hotel List</h2>
				<form  class="navbar-form " action="/hotel/search" >
					
					<div class="input-group">
					<input type="text" name="keyword" class="form-control" placeholder="Search" required>
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
						<tr height="50" ><th >Picture</th><th >Hotel name</th><th>detail</th><th>score</th><th>Manage</th></tr>
							<c:forEach items="${hotelList}" var="hotel">
						<tr>
							<td width="100"><img src="/hotelPicture/${hotel.hotelName}.png" width="100" height="100"></td>
							<td width="200">${hotel.hotelName}</td>
							<td width="400">${hotel.hotelDetail}</td>
							<td width="100">${hotel.hotelScore}</td>
							<td width="200">
								<a href="/hotel/uploadHotelPicture/${hotel.hotelId}">Upload Picture </a>
								<a>|</a>
								<a href="/hotel/editform/${hotel.hotelId}">Edit </a>
								<a>|</a>
								<a href="/hotel/delete/${hotel.hotelId}" onclick='confirmDelete(${hotel.hotelId})'>Delete</a>
							</td>
						</tr>
						</c:forEach>
						</table><br>
						<a href="/hotel/hotelForm"><button  ><font color="black">Add Hotel</font></button></a><br>
				</div>
		</div>
		<br><br><br><br>
</body>
</html>