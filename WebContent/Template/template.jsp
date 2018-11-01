<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="message">LIBRARY</a>
		</div>
		<div>
			<form class="navbar-form navbar-left" role="search" action="search">
				<div class="form-group">

					<input type="text" class="form-control"
						placeholder="Search Message" name="keyword">
				</div>
				<button type="submit" class="btn btn-default">搜索</button>
				</a>
			</form>
		</div>


		<ul class="nav navbar-nav navbar-right" id="dlzh">
			<c:choose>
				<c:when test="${sessionScope.user != null}">
					<li><a>欢迎：${sessionScope.user.uname}&nbsp;登陆</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:void(0);" onclick="return register();"><span
							class="glyphicon glyphicon-user"></span>注册</a></li>
					<li><a href="javascript:void(0);" onclick="return login();"><span
							class="glyphicon glyphicon-log-in"></span> 登录</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
	</div>
</nav>

<!-- 登陆注册 -->
<!-- 注册弹出层 -->
<div class="modal fade" id="register" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 350px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h4 class="modal-title">注册</h4>
			</div>
			<div class="modal-body">
				<!--注册模块-->
				<form role="form" action="reg" method="post">
					<div class="input-group">
						<span class="input-group-addon">邮 箱：</span> <input type="text"
							class="form-control" placeholder="email" name="uemail"
							onblur="return e_mail(this.value)">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">用户名：</span> <input type="text"
							class="form-control" placeholder="username" name="uname"
							onblur="return u_name(this.value)">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">密 码：</span> <input type="password"
							class="form-control" placeholder="password" name="upass"
							onblur="return u_pass(this.value)">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">重 复：</span> <input type="password"
							class="form-control" placeholder="password" name="upasss"
							onblur="return uu_pass(this.value)">
					</div>
					<br>
					<button type="submit" class="btn btn-default"
						onclick="return s_ubmit()">注 册</button>
					<div id="regi_error" style="color: red"></div>
				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<!--<button type="button" class="btn btn-primary">提交更改</button>-->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
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
						<span class="input-group-addon">密 码：</span> <input type="password"
							class="form-control" placeholder="密码" name="upass" id="password"
							required="required">
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
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<!--<button type="button" class="btn btn-primary">提交更改</button>-->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

