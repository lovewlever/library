<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<script type="text/javascript">
	function register() {
		$('#register').modal('show');
		return false;
	}

	function login() {
		$('#login').modal('show');
		return false;
	}

	function msg() {
		location.href = "https://librarysub.top/message/";
		return false;
	}

	$(function() {
		$('#message').modal('show');
		var cookie = document.cookie.split(";")[0].split("=")[1];
		if (cookie != undefined) {
			$("#dlzh").empty().prepend(
					$("<li><a>" + "欢迎" + cookie + "登陆" + "</a></li>"));
		} else {
			return false;
		}
	});

	function locals() {
		if (typeof (localStorage) !== "undefined") {
			var local = localStorage.getItem("user");
			if (local !== null) {
				console.log("有存储的内容");
			} else {
				console.log("本地没有存储此页内容");
			}
			alert("支持本地存储");
			var jsonq = {
				"name" : "username",
				"pass" : "password",
				"other" : "中文测试"
			};
			var jsonst = JSON.stringify(jsonq);
			localStorage.setItem("user", jsonst);
			var getitem = localStorage.getItem("user");
			var obj = JSON.parse(getitem);
			console.log("name:" + obj.name);
			console.log("pass:" + obj.pass);
			console.log("other:" + obj.other);
			return false;
		} else {
			alert("不支持本地存储");
			return false;
		}
	}
</script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
<title>登陆</title>
</head>
<body>
	<!--导航栏-->
	<div><%@ include file="/Template/template.jsp" %></div>

<div style="width: 300px;margin: 0px auto">
	<!--登陆模块-->
	<h3>请先登陆</h3>
	<form role="form" action="ln" method="post" style="width: 300px">
		<div class="input-group">
			<span class="input-group-addon">用户名：</span> <input type="text"
				class="form-control" placeholder="用户名/邮箱" name="uname" id="username" required="required">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">密 码：</span> <input type="password"
				class="form-control" placeholder="密码" name="upass" id="password" required="required">
		</div>
		<br>
		<div class="input-group">
			<span class="input-group-addon">验证码：</span> <input type="text"
				class="form-control" placeholder="可不填" name="upasss">
		</div>
		<br>
		<button type="submit" class="btn btn-default">登 陆</button>
		<div id="error" style="color: red">
			<s:actionerror />
		</div>
	</form>
</div>

</body>
</html>