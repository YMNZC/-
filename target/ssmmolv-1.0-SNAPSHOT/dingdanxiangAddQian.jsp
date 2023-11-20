<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单项添加</title>
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
        // 添加订单项
        function dingdanxiangAdd() {
			var dingdanid=$('#dingdanid').val().trim();
			var shangpinid=$('#shangpinid').val().trim();
			var goumaishuliang=$('#goumaishuliang').val().trim();
			if(goumaishuliang == "")
			{
				alert("please input:商品数量");
				return false;
			}
			var usersid=$('#usersid').val().trim();

            var param = {
				'dingdanid':dingdanid,
				'shangpinid':shangpinid,
				'goumaishuliang':goumaishuliang,
				'usersid':usersid,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/dingdanxiangAddOrUpdate',
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    if (resp.success) {
                        alert("添加成功！");
                        //window.location.href = "${contextPath}/dingdanxiangManaMyQian";
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
        <h2 class="t">订单项添加</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="98%" height="667" border="1" align="center"
                   cellpadding="3" cellspacing="1" bordercolor="#58AC22"
                   style="border-collapse:collapse">
                <form name="formAdd" id="formAdd">
		<tr>
			<td>
				订单:
			</td>
            <td>
                <select name="dingdanid" id="dingdanid" style="border:solid 1px #000000; color:#666666"></select>
            </td>
            <script type="text/javascript">
                $.get(basePath + '/dingdanAll/', function(resp) {
                    if (resp.success) {
                        if(resp.data!=null){
                            var list = resp.data;
                            for(var i=0; i<list.length; i++){
                                var info = list[i];
                                $("#dingdanid").append("<option value='"+info.id+"' >" + info.bianhao + "</option>");
                            }
                        }
                    }else {
                        alert(resp.message);
                    }
                });
            </script>

		</tr>
		<tr>
			<td>
				商品:
			</td>
            <td>
                <select name="shangpinid" id="shangpinid" style="border:solid 1px #000000; color:#666666"></select>
            </td>
            <script type="text/javascript">
                $.get(basePath + '/shangpinAll/', function(resp) {
                    if (resp.success) {
                        if(resp.data!=null){
                            var list = resp.data;
                            for(var i=0; i<list.length; i++){
                                var info = list[i];
                                $("#shangpinid").append("<option value='"+info.id+"' >" + info.mingcheng + "</option>");
                            }
                        }
                    }else {
                        alert(resp.message);
                    }
                });
            </script>

		</tr>
		<tr>
			<td>
				商品数量:
			</td>
            <td>
                <input type="number" name="goumaishuliang" id="goumaishuliang" value="0" size="70px"/>
            </td>

		</tr>
		<tr style="display: none;">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				用户:
			</td>
            <td style="display: none">
                <select name="usersid" id="usersid" style="border:solid 1px #000000; color:#666666">
                    <option value="${sessionScope.user.id }">${sessionScope.user.loginname }</option>
                </select>
            </td>

		</tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type="button" name="Submit5" value="提交" onClick="dingdanxiangAdd();" />
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

