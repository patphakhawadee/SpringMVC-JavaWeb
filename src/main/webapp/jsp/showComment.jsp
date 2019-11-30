<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title>
</head>

<body>
 <br> 
<!-- Header -->


<jsp:include page="header.jsp"/>
<!-- /Header -->
<%int star=0;int user=0; %>
<c:if test="${commentList != null }">
<c:forEach items="${commentList}" var="c">
	<c:forEach var = "i" begin = "1" end = "${c.star }"> 
	<% star++; %>
	</c:forEach>
	<% user++; %>
</c:forEach>
</c:if>
<%int total;
total=star/user; 
request.setAttribute("total",total);
%>

<div class="container">
		<div class="jumbotron" >
			<table>
				<tr>
					<td><img src="/hotelPicture/${hotel.hotelName}.png" width="300" height="300"  > </td> 
		    	<td width="70"></td> 
		    	<td width="500">
		    			<h1>${hotel.hotelName}</h1>
		    		    <p> Description <br> ${hotel.hotelDetail}</p>
		    			<p>Star :  
			    		    <c:forEach var = "i" begin = "1" end = "${total}">
			    				<img src="/star.png" width="30" height="30" >
			    			</c:forEach>
		    			</p>
		    	</td>
				</tr>
			</table>
		</div>
</div>
<!-- Member other comment -->

<c:forEach items="${commentList}" var="comment">
<div class="container">
		<div class="jumbotron" >
			<table>
				<tr>
					<td >
					<img src="/img/${comment.username }.png" width="100" height="100" align="center"> <br><br>
						<p align="center">${comment.username }</p>
					</td> 
		    	<td width="70"></td> 
		    	<td width="500">
		    		<p>Comment</p>
		    		   <p>${comment.commentDetail}</p>
		    		<p>Star :  
		    		    <c:forEach var = "i" begin = "1" end = "${comment.star }"> <!--  Please Edit to comment.hotelScore-->
		    				<img src="/star.png" width="30" height="30" >
		    			</c:forEach>
		    		</p>
		    	</td>
			</tr>
		</table>
	</div>
</div>
</c:forEach>
<br><br>

${starTest}
<!-- Member comment box -->
<form action="/o-o/createComment">
<div class="container">
		<div class="jumbotron " >
		<table>
			<tr>
				<td>
					<img src="/user-logo.png" width="100" height="100"> <br><br>
					${session.username}
					<input type="hidden" name="username" value="${session.username}">
					<input type="hidden" name="hotelId" value="${hotel.hotelId}">
					
				</td> 
		    	<td width="70"></td> 
		    	<td width="500">
		    		<textarea name="commentDetail" rows="4" cols="120" required></textarea><br>
		    		Hotel Star : 
		    		<select name="star" required>
				  		<option value="1">1</option>
				  		<option value="2">2</option>
				  		<option value="3">3</option>
				  		<option value="4">4</option>
				  		<option value="5">5</option>
					</select><br>
					<input type="hidden" name="hotelScore" value="${total}">
		    		<input type="submit" value="comment" >
		    		
		    	</td>
			</tr>
		</table>
	</div>
</div>
</form>
</body>
</html>