<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=0.2">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css?v=0.2">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/favicon.ico">
<script
	src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js?v=0.2"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=0.2"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/index.js?v=0.2"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/template.js?v=0.2"
	type="text/javascript"></script>
<title>LibrarySub</title>
</head>
<body>
	<!--导航栏-->
	<div>
		<div><%@ include file="/Template/template.jsp" %></div>
	</div>
<center>	
	<p style="color: red">注意：仅可上传rar文件且文件大小<30M的文件</p>
<form style="border: 1px solid;width: 306px" action="upload" method="post" enctype="multipart/form-data">
	<input type="file" name="file" placeholder="file" class="btn btn-success"><br>
	是否共享给游客：
	<select name="share">
		<option value="y">共享</option>
		<option value="n">不共享</option>
	</select><br><br>
	<button type="submit" class="btn btn-success" onclick="return setsession()" id="sbmit"> 上传</button><br><br>
	<!-- <button type="button" onclick="stop()">停止</button> -->
	<div class="progress">
	<div class="progress-bar" role="progressbar" aria-valuenow="60"
		 aria-valuemin="0" aria-valuemax="100" style="width: 0%;" id="jdt">
		<span class="sr-only">60% 完成</span>
	</div>
</div>
</form>
</center>
</body>
</html>