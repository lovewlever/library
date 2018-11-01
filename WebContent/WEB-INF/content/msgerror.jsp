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
	<script
	src="${pageContext.request.contextPath}/js/template.js?v=0.2"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/index.js?v=0.2"
	type="text/javascript"></script>
	<script type="text/javascript">
	function login() {
		$('#login').modal('show');
		return false;
	}
	</script>
<title>LibrarySub</title>
</head>
<body>
	<!--导航栏-->
	<div>
		<div><%@ include file="/Template/template.jsp" %></div>
	</div>
<h3 style="color: red"><s:actionerror/></h3>
<s:actionmessage/>


<!-- 登陆弹出层 -->
			<div class="modal fade" id="login" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width: 350px">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h4 class="modal-title">登陆</h4>
						</div>
						<div class="modal-body">
							<!--登陆模块-->
							<form role="form" action="ln" method="post">
								<div class="input-group">
									<span class="input-group-addon">用户名：</span> <input type="text"
										class="form-control" placeholder="用户名/邮箱" name="uname"
										id="username" required="required">
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">密 码：</span> <input
										type="password" class="form-control" placeholder="密码"
										name="upass" id="password" required="required">
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
						<div class="modal-footer">
							<button type="button" class="btn btn-success">
								<a href="fileAll">获取文件</a>
							</button>
							<button type="button" class="btn btn-success"
								onclick="return locals()">Local</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<!--<button type="button" class="btn btn-primary">提交更改</button>-->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
</body>
</html>