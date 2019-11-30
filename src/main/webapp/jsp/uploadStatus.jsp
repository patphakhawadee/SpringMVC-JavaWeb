<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>
<jsp:include page="header.jsp"/>
<center>
<h1>${uploadStatus}</h1>
<h1>Upload profile success!! Please sign in again for update</h1><br>
<a href="/member/logout">Sign in</a>
</center>
</body>
</html>