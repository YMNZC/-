<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>密码重置</title>
	<%@include file="common/head.jsp" %>
	<link rel="stylesheet" type="text/css" href="${staticPath}/qtimages/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${staticPath}/qtimages/css/mislider.css" />
	<link rel="stylesheet" href="${staticPath}/images/hsgcommon/divqt.css" type="text/css">
	<style>
		.dd a:hover {
			color: red;
		}

		.dd a {
			font-size: 18px;
		}

		.header .top .logo {
			margin-right: 260px;
		}

		.header {
			position: fixed;
			top: 0;
			left: 0;
			z-index: 9999;
			background: #fff;
			width: 100%;
		}
	</style>
	<script type="text/javascript" src="${staticPath}/js/popup.js"></script>
	<script language="javascript">
		function resetPw() {
			var loginname = $('#loginname').val().trim();;
			var xingming = $('#xingming').val().trim();
			var dianhua = $('#dianhua').val().trim();
			if (loginname == "") {
				alert("用户名称不能空");
				return;
			}
			if (xingming == "") {
				alert("姓名不能空");
				return;
			}
			if (dianhua == "") {
				alert("电话不能空");
				return;
			}
			var param = {
				'loginname':loginname,
				'xingming':xingming,
				'dianhua':dianhua,
			};
			$.post(basePath + '/usersResetPw', param, function(resp) {
				var pop=new Popup({ contentType:4,isReloadOnClose:false,width:250,height:100});
				if (resp.success) {
					pop.setContent("title","温馨提示");
					pop.setContent("alertCon",resp.data);

				}else {
					pop.setContent("title","温馨提示");
					pop.setContent("alertCon",resp.message);
				}
				pop.build();
				pop.show();
			})
		}
	</script>
</head>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
	<div class="w1200">
		<h2 class="t">重置密码</h2>
		<p class="t_en"></p>
		<div class="desc">
			<form>
				用户名称:<input type="text" style='border:solid 1px #000000; color:#666666' name="loginname" id="loginname" size="12px" />&nbsp;&nbsp;
				姓名:<input type="text" style='border:solid 1px #000000; color:#666666' name="xingming" id="xingming" size="12px" />&nbsp;&nbsp;
				电话:<input type="text" style='border:solid 1px #000000; color:#666666' name="dianhua" id="dianhua" size="12px" />&nbsp;&nbsp;
				<input type="button" onclick="resetPw();" value="重置密码"/>
			</form>


		</div>

	</div>
</div>
<%@ include file="yqlj.jsp"%>
<%@ include file="qtdown.jsp"%>
<%@ include file="kefutiao.jsp"%>
</body>
</html>
