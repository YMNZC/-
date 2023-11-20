<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台商品修改</title>
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

        // 修改商品
        function shangpinSet() {
            var id = $('#id').val();
			var mingcheng  = $("#mingcheng").length > 0 ? $('#mingcheng').val().trim():null;
			if($("#mingcheng").length > 0 && mingcheng == "")
			{
				alert("please input:名称");
			    $('#mingcheng').focus();
				return false;
			}
			var bianhao  = $("#bianhao").length > 0 ? $('#bianhao').val().trim():null;
			if($("#bianhao").length > 0 && bianhao == "")
			{
				alert("please input:编号");
			    $('#bianhao').focus();
				return false;
			}
			var zhongleiid=$('#zhongleiid').val().trim();
			var pinpaiid=$('#pinpaiid').val().trim();
			var neirong=$('#neirong').val().trim();
			var image  = $("#image").length > 0 ? $('#image').val().trim():null;
			if($("#image").length > 0 && image == "")
			{
				alert("please input:图片");
			    $('#image').focus();
				return false;
			}
			var yuanshijiage  = $("#yuanshijiage").length > 0 ? $('#yuanshijiage').val().trim():null;
			if($("#yuanshijiage").length > 0 && yuanshijiage == "")
			{
				alert("please input:原价");
			    $('#yuanshijiage').focus();
				return false;
			}
			var jiage  = $("#jiage").length > 0 ? $('#jiage').val().trim():null;
			if($("#jiage").length > 0 && jiage == "")
			{
				alert("please input:现价");
			    $('#jiage').focus();
				return false;
			}
			var danwei  = $("#danwei").length > 0 ? $('#danwei').val().trim():null;
			if($("#danwei").length > 0 && danwei == "")
			{
				alert("please input:单位");
			    $('#danwei').focus();
				return false;
			}
			var shenhe=$('#shenhe').val().trim();
			var kucunshuliang  = $("#kucunshuliang").length > 0 ? $('#kucunshuliang').val().trim():null;
			if($("#kucunshuliang").length > 0 && kucunshuliang == "")
			{
				alert("please input:库存数量");
			    $('#kucunshuliang').focus();
				return false;
			}
			var xiaoshoushuliang  = $("#xiaoshoushuliang").length > 0 ? $('#xiaoshoushuliang').val().trim():null;
			if($("#xiaoshoushuliang").length > 0 && xiaoshoushuliang == "")
			{
				alert("please input:销售数量");
			    $('#xiaoshoushuliang').focus();
				return false;
			}
			var usersid=$('#usersid').val().trim();

            var param = {
                'id': id,
				'mingcheng':mingcheng,
				'bianhao':bianhao,
				'zhongleiid':zhongleiid,
				'pinpaiid':pinpaiid,
				'neirong':neirong,
				'image':image,
				'yuanshijiage':yuanshijiage,
				'jiage':jiage,
				'danwei':danwei,
				'shenhe':shenhe,
				'kucunshuliang':kucunshuliang,
				'xiaoshoushuliang':xiaoshoushuliang,
				'usersid':usersid,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/shangpinAddOrUpdate',
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    if (resp.success) {
                        alert("修改成功！");
                        //window.location.href = "${contextPath}/shangpinMana";
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
            <td colspan="3" background="${staticPath}/img/wbg.gif" class='title'><span>&nbsp;商品修改</span>
            </td>
        </tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				名称:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="mingcheng" id="mingcheng" value="${shangpin.mingcheng }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				编号:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="bianhao" id="bianhao" value="${shangpin.bianhao }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				分类:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <select name="zhongleiid" id="zhongleiid" style="  border:solid 1px #000000; color:#666666">
                    <option value="${shangpin.zhonglei.id }">${shangpin.zhonglei.mingcheng }</option>
                </select>
            </td>
            <script type="text/javascript">
                $.get(basePath + '/zhongleiAll/', function(resp) {
                    if (resp.success) {
                        if(resp.data!=null){
                            var list = resp.data;
                            for(var i=0; i<list.length; i++){
                                var info = list[i];
                                $("#zhongleiid").append("<option value='"+info.id+"' >" + info.mingcheng + "</option>");
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
				品牌:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <select name="pinpaiid" id="pinpaiid" style="  border:solid 1px #000000; color:#666666">
                    <option value="${shangpin.pinpai.id }">${shangpin.pinpai.pinpaimingcheng }</option>
                </select>
            </td>
            <script type="text/javascript">
                $.get(basePath + '/pinpaiAll/', function(resp) {
                    if (resp.success) {
                        if(resp.data!=null){
                            var list = resp.data;
                            for(var i=0; i<list.length; i++){
                                var info = list[i];
                                $("#pinpaiid").append("<option value='"+info.id+"' >" + info.pinpaimingcheng + "</option>");
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
				内容介绍:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <textarea name="neirong" id="neirong" style="width:670px;height:200px;">${shangpin.neirong}</textarea>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				图片:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="image" id="image" value="${shangpin.image}" size="50px" readonly="readonly" />
                <input type="button" value="上传" onclick="upx('image')" />
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				原价:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="yuanshijiage" id="yuanshijiage" value="${shangpin.yuanshijiage }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				现价:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="jiage" id="jiage" value="${shangpin.jiage }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				单位:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="danwei" id="danwei" value="${shangpin.danwei }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				是否上架:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <select name="shenhe" id="shenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="${shangpin.shenhe }">${shangpin.shenhe }</option>
                    <option value="no">no</option>
                    <option value="yes">yes</option>
                </select>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				库存数量:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="kucunshuliang" id="kucunshuliang" value="${shangpin.kucunshuliang }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				销售数量:
			</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="xiaoshoushuliang" id="xiaoshoushuliang" value="${shangpin.xiaoshoushuliang }" size="90px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">
				用户:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <select name="usersid" id="usersid" style="width: 280px;">
                    <option value="${shangpin.users.id }">${shangpin.users.loginname}</option>
                </select>
            </td>

		</tr>

        <tr align='center' bgcolor="#FFFFFF" height="22">
            <td width="10%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
            <td width="90%" bgcolor="#FFFFFF" align="left">
                <input type="hidden" id="id" name="id" value="${shangpin.id}"/>
                <input type="button" value="提交" onclick="shangpinSet();"/>&nbsp;
                <input type="button" value="返回" onClick="javascript:history.back()"/>
                <input type="reset" value="重置"/>&nbsp;
            </td>
        </tr>
    </table>
</form>

</body>
</html>


