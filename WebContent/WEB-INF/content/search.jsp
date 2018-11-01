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
	src="${pageContext.request.contextPath}/js/template.js?v=0.2"
	type="text/javascript"></script>
<title>LibrarySub</title>
</head>
<body>
	<!--导航栏-->
	<div>
		<div><%@ include file="/Template/template.jsp" %></div>
	</div>
	
	
	<c:choose>
		<c:when test="${requestScope.search != null}">
			<c:forEach items="${requestScope.search}" var="sear">
				<div class="lynr">
					<h3 class="name">${sear.name}&nbsp;&nbsp;|</h3>
					&nbsp;&nbsp; <a href="javascript:void(0);" class="upda"
						onclick="update()">修改</a> <span class="span">|&nbsp;&nbsp;留言时间：
						<p class="sj">${sear.dates}</p>
					</span>
					<div class="ly-val">${sear.msg}</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<%="dkeoeooekff"%>
		</c:otherwise>
	</c:choose>
</body>
</html>