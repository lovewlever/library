var longin = true;

// 登陆验证
function loginaction() {
    /*
	 * $("#submmit").attr({ "disabled" : "disabled" });
	 */
    if (longin == true) {

        var uname = $("#username").val();
        var upass = $("#password").val();

        if (uname != "" && upass != "") {

            $("#error").html("正在登陆。。。");
            $.ajax({
                url: "login",
                type: "post",
                dataType: "json",
                scriptCharset: 'utf-8',
                data: {
                    "username": uname,
                    "password": upass
                },
                success: function (data) {
                    $("#error").html(data.mess);
                    if(data.mess==="登陆成功"){
                        setTimeout(" window.location.href = 'index.html'", 2000);
                    }
                    longin = false;

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    $("#regi_error").html("连接服务器失败");
                    console.log(XMLHttpRequest.status);
                    console.log(XMLHttpRequest.readyState);
                    readyState(textStatus);
                }
            });
        } else {
            alert("内容不能为空");
        }
    } else {
        return false
    }
}

// 注册验证
var y_e_mail = false;
var y_u_name = false;
var y_u_pass = false;
var y_s_ubmit = false;

// 邮箱验证
function e_mail(email) {
    y_e_mail = false;
    $("#emailerror").remove();
    if (email == "") {
        var $loading = $("<span style='color: red' id='emailerror'>&nbsp;邮件地址不能为空</span>");
        $("#register input:eq(0)").after($loading);
    } else {
        var str = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (str.test(email)) {
            $("#emailerror").remove();
            y_e_mail = true;
            return true;
        } else {
            $loading = $("<span style='color: red' id='emailerror'>&nbsp;邮箱格式不正确</span>");
            $("#register input:eq(0)").after($loading);
        }
    }
};

// 用户名验证
function u_name(uname) {
    y_u_name = false;
    $("#emailerror").remove();
    if (uname == "") {
        var $loading = $("<span style='color: red' id='emailerror'>&nbsp;用户名不能为空</span>");
        $("#register input:eq(1)").after($loading);
    } else {
        if (uname.length < 8) {
            $loading = $("<span style='color: red' id='emailerror'>&nbsp;用户名不能小于8位字符</span>");
            $("#register input:eq(1)").after($loading);
        } else {
            y_u_name = true;
        }
    }
}

// 密码验证
function u_pass(upass) {
    y_u_pass = false;
    $("#emailerror").remove();
    if (upass == "") {
        var $loading = $("<span style='color: red' id='emailerror'>&nbsp;密码不能为空</span>");
        $("#register input:eq(2)").after($loading);
    } else {
        if (upass.length < 6) {
            $loading = $("<span style='color: red' id='emailerror'>&nbsp;密码不能小于6位字符</span>");
            $("#register input:eq(2)").after($loading);
        } else {
            y_u_pass = true;
        }
    }
}

// 重复密码验证
function uu_pass(uupass) {
    y_s_ubmit = false;
    $("#emailerror").remove();
    var upass = $("#register input:eq(2)").val();
    if (uupass !== "" && uupass == upass) {
        y_s_ubmit = true;
        return true;
    } else {
        var $loading = $("<span style='color: red' id='emailerror'>&nbsp;两次密码不一致</span>");
        $("#register input:eq(3)").after($loading);
    }
}

// 提交注册
function s_ubmit() {
    if (y_e_mail == true && y_u_name == true && y_u_pass == true && y_s_ubmit == true) {
        $("#regi_error").html("正在注册，请稍后");
        var useremail = $("#register input:eq(0)").val();
        var username = $("#register input:eq(1)").val();
        var userpassword = $("#register input:eq(2)").val();

        return true
    } else {
       return false
    }

}

// 请求留言信息
var boolean = false;

function loadmsg() {
    // 防止多次请求先删除加载信息
    $("#loading").remove();
    if (boolean == false) {
        var $loading = $("<div style='font-size: 28px; color: red;width: 400px;margin: 50px auto' id='loading'>正在加载数据，请耐心等待...</div>");
        $("#loadmsg").prepend($loading);
        $.ajax({
            type: "get",
            url: "findall",
            // data: {sdate:date},
            dataType: "json",
            success: function (data) {
                console.log(data);
                createMess(data);
                $("#loading").remove();
                boolean = true;
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#loading").remove();
                $loading = $("<div style='font-size: 28px; color: red;width: 400px;margin: 50px auto' id='loading'>服务器连接失败，请稍后重试！</div>");
                $("#loadmsg").prepend($loading);
            }
        });
    } else {
        return false;
    }
};

function createMess(data) {
    for (var i in data) {
        // alert(data[i].name + " " + data[i].dates+""+data[i].msm);
        var name = data[i].name;
        var dates = data[i].dates;
        var msg = data[i].msm;
        // 生成代码插入到html
        var $div = $("<div class='lynr'></div>");
        var $h3 = $("<h3 class='name'>" + name + "&nbsp;&nbsp;|</h3>"
            + "&nbsp;&nbsp;<a href='javascript:void(0);' class='upda' onclick='update()'>修改</a>");

        var $span = $("<span class='span'>|&nbsp;&nbsp;留言时间：<p class='sj'>" + dates + "</p></span>");
        var $divm = $("<div class='ly-val'>" + msg + "</div>");
        // 构建div
        $div.prepend($divm);
        $div.prepend($span);
        $div.prepend($h3);
        // 元素内部前置内容
        $(".modal").prepend($div);
    }
}

function update() {
    alert("未更新，暂不可用");
}

//
function fileshare() {
	$
			.ajax({
				url : "ajax/fileAllAjax",
				type : "post",
				dataType : "json",
				data : {},
				success : function(json) {
					console.log(json);
					var obj = JSON.parse(json);
					for ( var as in obj) {
						console.log(obj[as].filename + obj[as].filepath);
						// 外框div
						var $div = $("<div class=\"panel panel-primary\" style=\"margin-top: 20px; width: 300px; height: 268px; display: inline-block\"></div>")
						// 标题div
						var $titdiv = $("<div class=\"panel-heading\"><h3 class=\"panel-title\">"
								+ obj[as].filename + "</h3></div>")
						// 大小div
						var $sizediv = $("<div class=\"panel-body\">"
								+ "文件大小：" + obj[as].filesize + "MB"
								+ "</div>")
						// 上传时间
						var $timediv = $("<div class=\"panel-body\">"
								+ "上传时间：" + obj[as].uploadtime + "</div>")
						// 是否共享
						var $sherdiv = $("<div class=\"panel-body\">"
								+ "是否共享：" + obj[as].fileshare + "</div>")
						// a标签
						var $a = $("<a href=\"\">下载</a>")
						$a.attr("href", 'download?inputPath='
								+ obj[as].filepath + '&downFileName='
								+ obj[as].filename + '');
						//共享用户
						var $userdiv = $("<div class=\"panel-body\">"
								+ "此文件由用户：" + obj[as].userna + "&nbsp;所共享</div>")

						// 拼接整个文件框
						var $div1 = $div.prepend($a);
						var $div1 = $div.prepend($sherdiv);
						var $div1 = $div.prepend($timediv);
						var $div1 = $div.prepend($sizediv);
						var $div1 = $div.prepend($userdiv);
						var $div1 = $div.prepend($titdiv);
						// 添加到主页
						$("#fileshare").prepend($div1);
					}

				},
				error : function() {
					$("#fileshare").html("发生错误");
				},
			});
};






// 进度条
function setsession() {
	$("sbmit").attr('disabled',true);
	
var i=0;
	setInterval(() => {
		/*$.ajax({
		    url: "ajax/rs",
		    type: "post",
		    dataType: "json",
		    data: {},
		    success: function (json) {
		    	var jsonobj=JSON.parse(json);
		    	console.log(jsonobj.progress);
		    	$("#jdt").css("width",jsonobj.progress+"%");
		        
		    },
		    error: function (XMLHttpRequest, textStatus, errorThrown) {
		        console.log(XMLHttpRequest.status);
		        console.log(XMLHttpRequest.readyState);
		        console.log(textStatus);
		        console.log(errorThrown);
		    }
		})*/
		i++;
		if(i<=100){
			$("#jdt").css("width",i+"%");
		}
		

	}, 500);

}
function stop() {
	setTimeout(t)
}




