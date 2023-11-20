<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户注册</title>
    <%@include file="common/head.jsp" %>
    <script type="text/javascript" src="${staticPath}/js/popup.js"></script>
    <script language="JavaScript" src="${staticPath}/js/public.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${staticPath}/qtimages/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${staticPath}/qtimages/css/mislider.css" />
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
        .basic-grey {

            margin-left:auto;

            margin-right:auto;

            max-width: 500px;

            background: white;

            padding: 25px 15px 25px 10px;

            font: 12px Georgia, "Times New Roman", Times, serif;

            color: #888;

            text-shadow: 1px 1px 1px #FFF;

            border:1px solid #E4E4E4;

        }

        .basic-grey h1 {

            font-size: 25px;

            padding: 0px 0px 10px 40px;

            display: block;

            border-bottom:1px solid #E4E4E4;

            margin: -10px -15px 30px -10px;;

            color: #888;

        }

        .basic-grey label {

            display: block;

            margin: 0px;

        }

        .basic-grey label>span {

            float: left;

            width: 20%;

            text-align: right;

            padding-right: 10px;

            margin-top: 10px;

            color: #888;

        }

        .basic-grey input[type="text"], .basic-grey input[type="email"], .basic-grey textarea, .basic-grey select {

            border: 1px solid #DADADA;

            color: #888;

            height: 30px;

            margin-bottom: 16px;

            margin-right: 6px;

            margin-top: 2px;

            outline: 0 none;

            padding: 3px 3px 3px 5px;

            width: 70%;

            font-size: 12px;

            line-height:15px;

            box-shadow: inset 0px 1px 4px #ECECEC;

            -moz-box-shadow: inset 0px 1px 4px #ECECEC;

            -webkit-box-shadow: inset 0px 1px 4px #ECECEC;

        }

        .basic-grey textarea{

            padding: 5px 3px 3px 5px;

        }

        .basic-grey select {
            appearance:none;
            -webkit-appearance:none;
            -moz-appearance: none;
            text-indent: 0.01px;
            text-overflow: '';
            width: 70%;
            height: 35px;
            line-height: 25px;
        }
        .basic-grey textarea{
            height:100px;
        }
        .basic-grey .button {
            background: #E27575;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            box-shadow: 1px 1px 5px #B6B6B6;
            border-radius: 3px;
            text-shadow: 1px 1px 1px #9E3F3F;
            cursor: pointer;
        }
        .basic-grey .button:hover {
            background: #CF7A7A;
        }
        .m{
            margin-top: 50px;
        }
    </style>

    <script type="text/javascript">
        //文件上传
        function upx(id) {
            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
            pop.setContent("contentUrl","${contextPath}/common/upload/?id="+id);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
        }
        // 添加用户
        function usersAdd() {
			var loginname=$('#loginname').val().trim();
			if(loginname == "")
			{
				alert("please input:用户名称");
				return false;
			}
			var loginpw=$('#loginpw').val().trim();
			if(loginpw == "")
			{
				alert("please input:密码");
				return false;
			}
			var type=$('#type').val().trim();
			if(type == "")
			{
				alert("please input:类型");
				return false;
			}
			var typename=$('#typename').val().trim();
			if(typename == "")
			{
				alert("please input:类型名称");
				return false;
			}
			var xingming=$('#xingming').val().trim();
			if(xingming == "")
			{
				alert("please input:姓名");
				return false;
			}
			var xingbie=$('#xingbie').val().trim();
			var nianling=$('#nianling').val().trim();
			if(nianling == "")
			{
				alert("please input:年龄");
				return false;
			}
			var address=$('#address').val().trim();
			if(address == "")
			{
				alert("please input:地址");
				return false;
			}
			var dianhua=$('#dianhua').val().trim();
			if(dianhua == "") {
				alert("please input:电话");
				return false;
			}else{
				if (/^[1][3,4,5,6,7,8,9][0-9]{9}$/.test(dianhua)) {
				} else {
					alert("必需手机格式");
					return false;
				}
			}
			var shenhe=$('#shenhe').val().trim();

            var param = {
				'loginname':loginname,
				'loginpw':loginpw,
				'type':type,
				'typename':typename,
				'xingming':xingming,
				'xingbie':xingbie,
				'nianling':nianling,
				'address':address,
				'dianhua':dianhua,
				'shenhe':shenhe,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/usersAddOrUpdate',
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    if (resp.success) {
                        alert("注册成功！");
                        //window.location.href = "${contextPath}/usersManaMyQian";
                    } else {
                        alert(resp.message);
                    }
                }
            });
        }
    </script>
</head>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">用户注册</h2>
        <p class="t_en"></p>
        <form name="formAdd" id="formAdd"  class="basic-grey">
            <h1>
                注册
            </h1>
            <label>
                <span>用户名：</span>
                <input type="text" name="loginname" id="loginname"/>
            </label>
            <label>
                <span>密码：</span>
                <input type="text" name="loginpw" id="loginpw"/>
            </label>
            <label>
                <span>类型：</span>
                <select name="type" id="type" style="border:solid 1px #000000; color:#666666" onchange='$("#typename").val($(this).find("option:selected").text());'>
                    <option value="2">用户</option>
                </select>
            </label>
            <label>
                <span>类型名称：</span>
                <input type="text" name="typename" id="typename" value="" readonly="readonly"/>
                <script type="text/javascript">$("#typename").val($("#type").find("option:selected").text());
                </script>
            </label>
            <label>
                <span>姓名：</span>
                <input type="text" name="xingming" id="xingming"/>
            </label>
            <label>
                <span>性别：</span>
                <select name="xingbie" id="xingbie">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </label>
            <label>
                <span>年龄</span>
                <input type="text" name="nianling" id="nianling" />
            </label>
            <label>
                <span>电话号码：</span>
                <input type="text" name="dianhua" id="dianhua" />
            </label>
            <table style="display: none;">
                <tr>
                    <td>
                        地址:
                    </td>
                    <td>
                        <input type="text" name="address" id="address" size="70px"/>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td>
                        审核:
                    </td>
                    <td style="display: none">
                        <select name="shenhe" id="shenhe" style="border:solid 1px #000000; color:#666666">
                            <option value="yes">yes</option>
                            <option value="no">no</option>
                        </select>
                    </td>
                </tr>
            </table>
            <label>
                <span>&nbsp;</span>
                <input type="button" name="Submit5" value="注册" onClick="gouwucheAdd();" class="m"/>
                <input type="button" value="返回" onClick="javascript:history.back()" class="m"/>
            </label>
        </form>
    </div>
</div>
<%@ include file="yqlj.jsp"%>
<%@ include file="qtdown.jsp"%>
<%@ include file="kefutiao.jsp"%>
</body>
</html>
