<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,
	minimum-scale=1.0, maximum-scale=1.0, 
	user-scalable=no" />
<title>正在跳转...</title>
<script type="text/javascript">

window.onload=function (){
	window.location='message.action';
    }
</script>
</head>
<body>

<h3 style="color: red">正在加载数据...</h3>
<%-- 	<a href="register.action">注册</a>
	<a href="login.action">登陆</a>
	<a href="message.action">Message</a><br>
	<a href="index.action">index</a><br>

	<c:choose>
		<c:when test="${sessionScope.user != null}">${sessionScope.user.uname}</c:when>
		<c:otherwise>未登录</c:otherwise>
	</c:choose>
	
	<hr>
	<form action="search">
	<input type="search" name="keyword" placeholder="search">
	<input type="submit" value="搜索">
	</form> --%>
</body>
</html>