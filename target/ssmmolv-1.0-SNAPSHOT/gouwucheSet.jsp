<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台购物车修改</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <link href="${staticPath}/css/css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="${staticPath}/js/popup.js"></script>
    <script type="text/javascript">
        //文件上传
        function upx(id) {
            var pop = new Popup({contentType: 1, isReloadOnClose: false, width: 400, height: 200});
            pop.setContent("contentUrl", "${contextPath}/common/upload/?id=" + id);
            pop.setContent("title", "文件上传");
            pop.build();
            pop.show();
        }

        // 修改购物车
        function gouwucheSet() {
            var id = $('#id').val();
			var shangpinid=$('#shangpinid').val().trim();
			var goumaishuliang  = $("#goumaishuliang").length > 0 ? $('#goumaishuliang').val().trim():null;
			if($("#goumaishuliang").length > 0 && goumaishuliang == "")
			{
				alert("please input:商品数量");
			    $('#goumaishuliang').focus();
				return false;
			}
			var usersid=$('#usersid').val().trim();

            var param = {
                'id': id,
				'shangpinid':shangpinid,
				'goumaishuliang':goumaishuliang,
				'usersid':usersid,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/gouwucheAddOrUpdate',
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    if (resp.success) {
                        alert("修改成功！");
                        //window.location.href = "${contextPath}/gouwucheMana";
                    } else {
                        alert(resp.message);
                    }
                }
            });
        }
    </script>
</head>


<body>

<form name="formAdd" id="formAdd">
    <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC"
           style="margin-bottom:8px">
        <tr bgcolor="#EEF4EA">
            <td colspan="3" background="${staticPath}/img/wbg.gif" class='title'><span>&nbsp;购物车修改</span>
            </td>
        </tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				商品:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <select name="shangpinid" id="shangpinid" style="  border:solid 1px #000000; color:#666666">
                    <option value="${gouwuche.shangpin.id }">${gouwuche.shangpin.mingcheng }</option>
                </select>
            </td>
            <script type="text/javascript">
                // 如果要获取所有数据请替换一下
                //$.get(basePath + '/shangpinAll/', function(resp) {
                $.get(basePath + '/shangpinSearch/?usersid=${sessionScope.user.id}', function(resp) {
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
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				商品数量:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="goumaishuliang" id="goumaishuliang" value="${gouwuche.goumaishuliang }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				用户:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <select name="usersid" id="usersid" style="width: 280px;">
                    <option value="${gouwuche.users.id }">${gouwuche.users.loginname}</option>
                </select>
            </td>

		</tr>

        <tr align='center' bgcolor="#FFFFFF" height="22">
            <td width="10%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="hidden" id="id" name="id" value="${gouwuche.id}"/>
                <input type="button" value="提交" onclick="gouwucheSet();"/>&nbsp;
                <input type="button" value="返回" onClick="javascript:history.back()"/>
                <input type="reset" value="重置"/>&nbsp;
            </td>
        </tr>
    </table>
</form>

</body>
</html>


