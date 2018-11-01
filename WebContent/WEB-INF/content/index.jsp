<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme() + "//" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,
	minimum-scale=1.0, maximum-scale=1.0, 
	user-scalable=no" />
<title>LibrarySub</title>
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
	function delfile(path, id) {
		inputpath = "//usr//tomcat//webapps//library" + path;
		$.ajax({
			url : "ajax/delfile",
			data : {
				inputPath : inputpath,
				id : id
			},
			type : "get",
			dataType : "json",
			success : function(data) {
				var jsonobj = JSON.parse(data);
				console.log(jsonobj.err);
				var $ddd = $("<span style='color: red'>" + jsonobj.err
						+ "<br>请刷新页面！" + "</span>");
				$("#delfile").prepend($ddd);
				$('#filedel').modal('show');
				console.log(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				console.log(XMLHttpRequest.status);
				console.log(XMLHttpRequest.readyState);
				console.log(textStatus);
				console.log(errorThrown);
			},
		});
	}

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
</head>
<body>
	<!--警告-->
	<div class="alert alert-warning" style="margin-bottom: 0px">
		<a href="#" class="close" data-dismiss="alert"> &times; </a> <strong>警告！</strong>有用户反映界面错乱，无法点击等问题！如遇到此情况，请更换：谷歌，火狐或者360
		等 完全支持html5的浏览器即可解决 <br>
	</div>
	<!--头部-->
	<div>
		<div><%@ include file="/Template/template.jsp"%></div>
	</div>
	<!--主体-->
	<div style="margin: 0px 5px">
		<!--内容区-->
		<div>
			<!--内容区标签-->
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
				<li><a href="#zdmsg" data-toggle="tab">支持信息</a></li>
				<li><a href="#lymsg" data-toggle="tab">雁过留声</a></li>
				<li><a href="#grzx" data-toggle="tab">个人中心</a></li>
				<li><a href="#quiti" data-toggle="tab">其他</a></li>
			</ul>
			<!--内容区-->
			<div id="myTabContent" class="tab-content">
				<!--Home-->
				<div class="tab-pane fade in active" id="home">
					<div class="panel panel-default" style="margin-top: 20px">
						<div class="panel-heading">
							<h3 class="panel-title" style="display: inline-block">Home</h3>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <a
								href="uploadfile.action">上传文件</a>
						</div>
						<div class="panel-body" style="text-align: center" id='fileshare'>

							<!--文件区-->

							<c:choose>
								<c:when test="${sessionScope.user.files !=null}">
									<c:forEach items="${sessionScope.user.files}" var="file">
										<div class="panel panel-primary"
											style="margin-top: 20px; width: 300px; height: 250px; display: inline-block">
											<div class="panel-heading">
												<h3 class="panel-title">${file.filename}</h3>
											</div>
											<div class="panel-body">文件大小：${file.filesize }MB</div>
											<div class="panel-body">上传时间：${file.uploadtime }</div>
											<div class="panel-body">是否共享：${file.fileshare }</div>
											<a
												href="download?inputPath=${file.filepath }&downFileName=${file.filename}">下载</a><span>|</span>
											<a href="javascript:void(0)"
												onclick="delfile('${file.filepath}','${file.id}')">删除</a>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<h2>此处显示用户共享的文件，登陆后将只显示自己的文件！</h2>
									<script type="text/javascript">
										fileshare();
									</script>
								</c:otherwise>
							</c:choose>


						</div>
					</div>
				</div>
				<!--支持信息-->
				<div class="tab-pane fade" id="zdmsg">
					<div class="panel panel-default" style="margin-top: 20px">
						<div class="panel-heading">
							<h3 class="panel-title">支持信息</h3>
						</div>
						<div class="panel-body">
							<!--文件区-->
							<div class="list-group">
								<a href="#" class="list-group-item active">
									<h4 class="list-group-item-heading">信息</h4>
								</a> <a href="#" class="list-group-item">
									<h4 class="list-group-item-heading">免费注册</h4>
									<p class="list-group-item-text">您将通过网页进行免费注册。</p>
								</a> <a href="#" class="list-group-item">
									<h4 class="list-group-item-heading"></h4>
									<p class="list-group-item-text">
										<img alt=""
											src="${pageContext.request.contextPath}/img/C36A09B11452ECDAA67A72135F118C51.jpg">
									</p>
								</a>
							</div>

						</div>
					</div>
				</div>
				<!--雁过留声-->
				<div class="tab-pane fade" id="lymsg">
					<div class="panel panel-default" style="margin-top: 20px">
						<div class="panel-heading">
							<h3 class="panel-title" style="display: inline-block">雁过留声</h3>
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <a
								href="message.action">读取留言</a> <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<a href="msgboard.action">我想留言</a>
						</div>
						<div class="panel-body" id="loadmsg">
							<!--留言-->

							<c:forEach items="${requestScope.message}" var="msge"
								varStatus="id">
								<div class="lynr">
									<h3 class="name">${msge.name}&nbsp;&nbsp;|</h3>
									&nbsp;&nbsp; <a href="javascript:void(0);" class="upda"
										onclick="update()">修改</a> <span class="span">|&nbsp;&nbsp;留言时间：
										<p class="sj">${msge.dates}</p>
									</span>
									<div class="ly-val">${msge.msg}</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
				<!--个人中心-->
				<div class="tab-pane fade" id="grzx">
					<div class="panel panel-default" style="margin-top: 20px">
						<div class="panel-heading">
							<h3 class="panel-title">个人中心</h3>
						</div>
						<div class="panel-body">
							<!--个人信息-->
							<c:choose>
								<c:when test="${sessionScope.user != null}">
									<div class="panel panel-primary"
										style="margin-top: 20px; width: 300px; display: inline-block">
										<div class="panel-heading">
											<h3 class="panel-title">${sessionScope.user.uname}</h3>
										</div>
										<div class="panel-body">邮件：${sessionScope.user.uemail}</div>
										<div class="panel-body">注册时间：${sessionScope.user.registration}</div>
										<div class="panel-body">管理员：${sessionScope.user.uadmin}</div>
										<div class="panel-body">
											<a href="logout.action">退出用户</a>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<h2>
										请<a href="javascript:void(0);" onclick="return login();">登录</a>
									</h2>
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
				<!--退出-->
				<div class="tab-pane fade" id="quiti">
					<div class="panel panel-default" style="margin-top: 20px">
						<div class="panel-heading">
							<h3 class="panel-title">其他</h3>
						</div>
						<div class="panel-body">
							<!--个人信息-->

							<div class="panel panel-danger"
								style="margin: 20px 20px 20px 20px; width: 211px; display: inline-block">
								<div class="panel-heading">
									<h3 class="panel-title">暂未更新</h3>
								</div>
								<div style="padding: 10px; display: inline-block">
									<button type="button" class="btn btn-warning"></button>
								</div>

							</div>


						</div>
					</div>
				</div>
			</div>
		</div>		

		<!--底部内容-->
		<div class="jumbotron text-center"
			style="margin-bottom: 0; padding-top: 10px; padding-bottom: 1px">
			<address style="margin-bottom: 10px;">
				<strong>Library Company, Inc.</strong><br> <abbr title="QQ">Q:</abbr>
				810227881
			</address>
			<address style="margin-bottom: 10px;">
				<strong>Library Sub</strong><br> <a
					href="mailto:lovewlever@outlook.com">lovewlever@outlook.com</a>
			</address>
		</div>


		<!--弹出层区-->
		<div>

			<!-- 网页加载完毕后提示消息 -->
			<div class="modal fade" id="message" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">提醒</h4>
						</div>
						<div class="modal-body">
							<h3>LIBRARY：</h3>
							<ol>								
								<li><a href="mailto:lovewlever@outlook.com">lovewlever@outlook.com</a></li>
								<li><img alt=""
									src="${pageContext.request.contextPath}/img/ACDB85FD6B6818E66E69977B62A3EDDD.jpg"
									style="width: 200px; height: 180px"></li>
							</ol>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<!--<button type="button" class="btn btn-primary">提交更改</button>-->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
			<!-- 文件删除提示信息 -->
			<div class="modal fade" id="filedel" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">提醒</h4>
						</div>
						<div class="modal-body" id="delfile"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<!--<button type="button" class="btn btn-primary">提交更改</button>-->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
			</div>
		</div>
	</div>
</body>
</html>