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
<body style="padding-top:220px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">用户注册</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="98%" height="667" border="1" align="center"
                   cellpadding="3" cellspacing="1" bordercolor="#58AC22"
                   style="border-collapse:collapse">
                <form name="formAdd" id="formAdd">
                    		<tr>
			<td>
				用户名称:
			</td>
            <td>
                <input type="text" name="loginname" id="loginname" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				密码:
			</td>
            <td>
                <input type="text" name="loginpw" id="loginpw" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				类型:
			</td>
            <td>
                <select name="type" id="type" style="border:solid 1px #000000; color:#666666" onchange='$("#typename").val($(this).find("option:selected").text());'>
                    <option value="2">用户</option>
                </select>
            </td>

		</tr>
		<tr>
			<td>
				类型名称:
			</td>
            <td>
                <input type="text" name="typename" id="typename" value="" readonly="readonly" size="70px"/>
                <script type="text/javascript">
                    $("#typename").val($("#type").find("option:selected").text());
                </script>
            </td>

		</tr>
		<tr>
			<td>
				姓名:
			</td>
            <td>
                <input type="text" name="xingming" id="xingming" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				性别:
			</td>
            <td>
                <select name="xingbie" id="xingbie" style="border:solid 1px #000000; color:#666666">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </td>

		</tr>
		<tr>
			<td>
				年龄:
			</td>
            <td>
                <input type="text" name="nianling" id="nianling" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				地址:
			</td>
            <td>
                <input type="text" name="address" id="address" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				电话:
			</td>
            <td>
                <input type="text" name="dianhua" id="dianhua" size="70px"/>
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

                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type="button" name="Submit5" value="提交" onClick="usersAdd();" />
                            <input type="button" value="返回" onClick="javascript:history.back()"/>
                            <%--<input type="reset" name="Submit22" value="重置" />--%>
                        </td>
                    </tr>
                </form>
            </table>
        </div>
    </div>
</div>
<%@ include file="yqlj.jsp"%>
<%@ include file="qtdown.jsp"%>
<%@ include file="kefutiao.jsp"%>
</body>
</html>
