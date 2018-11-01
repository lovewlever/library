<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,
	minimum-scale=1.0, maximum-scale=1.0,
	user-scalable=no" />
<meta charset="UTF-8">
<link rel="shortcut icon" href="favicon.ico" />
<style type="text/css">
body {
	background: url("${pageContext.request.contextPath}/bodyimg.gif")
		no-repeat center/cover;
	height: 100vh;
	overflow: hidden;
	color: #FFF;
}

.form {
	background: rgba(51, 0, 51, 0.8);
	width: 90%;
	height: 90%;
	padding: 15px;
	top: 5px;
	left: 0;
}

.form {
	border-radius: 10px 10px 10px 10px;
	margin: 5px auto;
}

.model {
	overflow: auto;
	height: 100%;
	width: 100%;
}

input {
	background: rgba(255, 255, 255, 0.15);
	width: 95%;
	padding: 8px;
	margin: 15px 0;
	border: none;
	border-radius: 3px;
	outline: none;
	color: #FFF;
	font-size: 20px;
}

input:-webkit-autofill {
	-webkit-box-shadow: 0 0 0px 500px #7a7a7a inset;
	-webkit-text-fill-color: #FFF;
}

textarea {
	background: rgba(255, 255, 255, 0.15);
	width: 95%;
	padding: 8px;
	margin: 15px 0;
	border: none;
	border-radius: 3px;
	outline: none;
	color: #FFF;
	font-size: 20px;
	height: 100px;
}

label {
	color: #f857a6;
	display: block;
}

#error {
	color: red;
}

button {
	background: linear-gradient(-45deg, #f857a6, #ff5858);
	padding: 10px 20px;
	border: none;
	border-radius: 21px;
	font-size: 18px;
	cursor: pointer;
	transform: translateX(-50%);
	left: 30%;
	position: relative;
}

a {
	position: relative;
	left: 200px;
	top: 20px;
	font-size: 17px;
	text-decoration: none;
	background: linear-gradient(to right, red, blue);
	-webkit-background-clip: text;
	color: transparent;
}
</style>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	function tijiao() {
		//禁用提交按钮防止重复提交
		$("#submmit").attr({
			"disabled" : "disabled"
		});
		var uname = $("#name").val();
		var umsm = $("#msm").val();
		var pass = $("#pass").val();

		if (uname != "" && umsm != "") {

			$("#error").html("正在保存数据，请稍后。。。");
			$.ajax({
				url : "save",
				type : "POST",
				dataType : "json",
				scriptCharset : 'utf-8',
				data : {
					"username" : uname,
					"usermsm" : umsm,
					"pass" : pass
				},
				success : function(data) {
					$("#error").html(data.mess);
					setTimeout(" window.location.href = 'index.html'", 3000);
				},
				error : function() {
					$("#error").html("连接服务器失败，请重试或者联系管理员");
				}
			});
		} else {
			alert("内容不能为空");
		}
	}

	function back() {
		window.location.href = 'index.html';
	}
</script>
<title>Leaving a message</title>
</head>
<body>
	<div class="model">
		<div class="form">
			<form action="msgtoboard" method="post">
				<label for="name" required="required">雁过留声：</label> 
					<input id="name" required="required" type="text" maxlength="6" placeholder="人过留名(最多6个汉字)" name="name"/> 
				<!-- <label for="pass" required="required" value="wl">口 令：</label> 
					<input id="pass" type="password" name="key"/> -->
				<label for="msm">说点什么吧：</label>
					<textarea id="msm" type="text" required="required" maxlength="800" placeholder="请输入留言内容(800字以内)" name="msg"></textarea>
				<div id="error"></div>
					<button type="submit" id="submmit">提交留言</button>
					<button type="reset">重 填</button>
				<br> <br>
			</form>
		</div>

		<div class="form">
			<H3>格言:</H3>
			<ol>
				<li>人生的磨难是很多的，所以我们不可对于每一件轻微的伤害都过于敏感。<br>
					在生活磨难面前，精神上的坚强和无动于衷是我们抵抗罪恶和人生意外的最好武器。
				</li>
				<br>
				<li>良心是一种根据道德准则来判断自己的本能，它不只是一种能力；它是一种本能。</li>
				<br>
				<li>过放荡不羁的生活，容易得像顺水推舟，但是要结识良朋益友，却难如登天。</li>
				<br>
				<li>世界上一成不变的东西，只有“任何事物都是在不断变化的”这条真理。</li>
				<br>
				<li>最甜美的是爱情，最苦涩的也是爱情。</li>
				<br>
				<li>在人生的道路上，当你的希望一个个落空的时候，你也要坚定，要沉着。</li>
				<br>
				<li>人的一生就是这样，先把人生变成一个科学的梦，然后再把梦变成现实。</li>
				<br>
				<li>有理想的人，生活总是火热的。</li>
			</ol>
		</div>
	</div>
</body>
</html>