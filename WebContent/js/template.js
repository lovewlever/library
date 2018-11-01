	function delfile(path, id) {
		inputpath = "//usr//tomcat//webapps//library"
				+ path;
		$.ajax({
			url : "ajax/delfile",
			data : {
				inputPath : inputpath,
				id : id
			},
			type : "get",
			dataType : "json",
			success : function(data) {
				var jsonobj=JSON.parse(data);
		    	console.log(jsonobj.err);
				var $ddd=$("<span style='color: red'>"+jsonobj.err+"<br>请刷新页面！"+"</span>");
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