<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">OIO HOTEL</a>
    </div>
    <ul class="nav navbar-nav">
		<li ><a href="/hotel/">Home</a></li> 
     	<!--  if user login lawe -->
        <c:if test="${session!=null}">
        <li><a href="/o-o/comment">Comment</a></li>
        <c:if test="${session.username == 'admin'}">
        	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/member/members" >Member</a></li>
					<li><a href="/hotel/hotels">Hotel</a></li>
					<li><a href="/o-o/comments">Comment</a></li>
				</ul>
			</li>
    	</c:if>
    	
        <li><a class="p-2 text-success" href="/member/memberDetail/${session.username}">Welcome  ${session.username}</a></li>
        <li><a class="p-2 text-Red" href="/member/logout">Sign out</a></li>
        </c:if>
      	<!-- if no session (no login) -->
      	<c:if test="${session==null}">
    		<li><a  href="/member/loginPage" >Sign in</a></li>
    		<li><a href="/member/register" >Sign up</a></li>
      	</c:if>
      </ul>
  </div>
</nav>


</body>
</html>

