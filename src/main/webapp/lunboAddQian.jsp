<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>轮播图添加</title>
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
        // 添加轮播图
        function lunboAdd() {
			var biaoti=$('#biaoti').val().trim();
			if(biaoti == "")
			{
				alert("please input:标题");
				return false;
			}
			var image=$('#image').val().trim();
			if(image == "")
			{
				alert("please input:图片");
				return false;
			}

            var param = {
				'biaoti':biaoti,
				'image':image,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/lunboAddOrUpdate',
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    if (resp.success) {
                        alert("添加成功！");
                        //window.location.href = "${contextPath}/lunboManaMyQian";
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
        <h2 class="t">轮播图添加</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="98%" height="667" border="1" align="center"
                   cellpadding="3" cellspacing="1" bordercolor="#58AC22"
                   style="border-collapse:collapse">
                <form name="formAdd" id="formAdd">
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
				图片:
			</td>
            <td>
                <input type="text" name="image" id="image" size="50px" readonly="readonly" />
                <input type="button" value="上传" onclick="upx('image')" />
            </td>

		</tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type="button" name="Submit5" value="提交" onClick="lunboAdd();" />
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

