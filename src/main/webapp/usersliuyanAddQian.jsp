<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户留言反馈添加</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
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
        // 添加留言反馈
        function liuyanAdd() {
			var biaoti=$('#biaoti').val().trim();
			if(biaoti == "")
			{
				alert("please input:标题");
				return false;
			}
			var neirong=$('#neirong').val().trim();
			var liuyanshijian=$('#liuyanshijian').val().trim();
			if(liuyanshijian == "")
			{
				alert("please input:留言时间");
				return false;
			}
			var usersid=$('#usersid').val().trim();

            var param = {
				'biaoti':biaoti,
				'neirong':neirong,
				'liuyanshijian':liuyanshijian,
				'usersid':usersid,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/liuyanAddOrUpdate',
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    if (resp.success) {
                        alert("添加成功！");
                        //window.location.href = "${contextPath}/liuyanManaMyQian";
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
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">用户留言反馈添加</h2>
        <p class="t_en"></p>
        <div class="desc">


            <table width="98%" height="667" border="1" align="center"
                   cellpadding="3" cellspacing="1" bordercolor="#58AC22"
                   style="border-collapse:collapse">
                <form name="formAdd" id="formAdd">

                    <tr>
                        <td>
                            用户:
                        </td>
                        <td>
                            <select name="usersid"
                                    id="usersid" style="border:solid 1px #000000; color:#666666">
                                <option value="${users.id }">${users.loginname}</option>
                            </select>
                        </td>
                    </tr>
		<tr>
			<td>
				标题:
			</td>
            <td>
                <input type="text" name="biaoti" id="biaoti" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				内容:
			</td>
            <td>
                <textarea name="neirong" id="neirong" style="width:670px;height:200px;" size="70px"></textarea>
            </td>

		</tr>
		<tr>
			<td>
				留言时间:
			</td>
            <td>
                <input type="text" name="liuyanshijian" id="liuyanshijian" style="border:1px solid #cccccc;" readonly="readonly" size="25px" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" />
            </td>

		</tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type="button" name="Submit5" value="提交" onClick="liuyanAdd();" />
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

