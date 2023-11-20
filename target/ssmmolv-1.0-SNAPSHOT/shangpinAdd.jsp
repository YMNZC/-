<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>后台添加商品</title>
	<%@include file="common/head.jsp" %>
	<%@include file="common/loginstate.jsp" %>
	<link href="${staticPath}/css/css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="${staticPath}/js/popup.js"></script>
	<script type="text/javascript">
		//文件上传
		function upx(id) {
			var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
			pop.setContent("contentUrl","${contextPath}/common/upload/?id="+id);
			pop.setContent("title","文件上传");
			pop.build();
			pop.show();
		}
		// 添加商品
		function shangpinAdd() {
			var mingcheng = $("#mingcheng").length > 0 ? $('#mingcheng').val().trim():null;
			if($("#mingcheng").length > 0 && mingcheng == "")
			{
			    alert("please input:名称");
			    $('#mingcheng').focus();
			    return false;
			}
			var bianhao = $("#bianhao").length > 0 ? $('#bianhao').val().trim():null;
			if($("#bianhao").length > 0 && bianhao == "")
			{
			    alert("please input:编号");
			    $('#bianhao').focus();
			    return false;
			}
			var zhongleiid=$('#zhongleiid').val().trim();
			var pinpaiid=$('#pinpaiid').val().trim();
			var neirong=$('#neirong').val().trim();
			var image = $("#image").length > 0 ? $('#image').val().trim():null;
			if($("#image").length > 0 && image == "")
			{
			    alert("please input:图片");
			    $('#image').focus();
			    return false;
			}
			var yuanshijiage = $("#yuanshijiage").length > 0 ? $('#yuanshijiage').val().trim():null;
			if($("#yuanshijiage").length > 0 && yuanshijiage == "")
			{
			    alert("please input:原价");
			    $('#yuanshijiage').focus();
			    return false;
			}
			var jiage = $("#jiage").length > 0 ? $('#jiage').val().trim():null;
			if($("#jiage").length > 0 && jiage == "")
			{
			    alert("please input:现价");
			    $('#jiage').focus();
			    return false;
			}
			var danwei = $("#danwei").length > 0 ? $('#danwei').val().trim():null;
			if($("#danwei").length > 0 && danwei == "")
			{
			    alert("please input:单位");
			    $('#danwei').focus();
			    return false;
			}
			var shenhe=$('#shenhe').val().trim();
			var kucunshuliang = $("#kucunshuliang").length > 0 ? $('#kucunshuliang').val().trim():null;
			if($("#kucunshuliang").length > 0 && kucunshuliang == "")
			{
			    alert("please input:库存数量");
			    $('#kucunshuliang').focus();
			    return false;
			}
			var xiaoshoushuliang = $("#xiaoshoushuliang").length > 0 ? $('#xiaoshoushuliang').val().trim():null;
			if($("#xiaoshoushuliang").length > 0 && xiaoshoushuliang == "")
			{
			    alert("please input:销售数量");
			    $('#xiaoshoushuliang').focus();
			    return false;
			}
			var usersid=$('#usersid').val().trim();

			var param = {
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
						alert("添加成功！");
						//window.location.href = "${contextPath}/shangpinMana";
					} else {
						alert(resp.message);
					}
				}
			});
		}
	</script>
</head>

<body leftmargin="2" topmargin="9" background='${staticPath}/img/allbg.gif'>
<form id="formAdd" name="formAdd" >
	<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
		<tr bgcolor="#EEF4EA">
			<td colspan="3" background="${staticPath}/img/wbg.gif" class='title'><span>&nbsp;商品添加</span></td>
		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				名称:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="mingcheng" id="mingcheng" size="70px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				编号:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="bianhao" id="bianhao" size="70px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				分类:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <select name="zhongleiid" id="zhongleiid" style="  border:solid 1px #000000; color:#666666"></select>
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
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				品牌:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <select name="pinpaiid" id="pinpaiid" style="  border:solid 1px #000000; color:#666666"></select>
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
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				内容介绍:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <textarea name="neirong" id="neirong" style="width:522px;height:200px;" size="70px"></textarea>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				图片:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="image" id="image" size="50px" readonly="readonly" />
                <input type="button" value="上传" onclick="upx('image')" />
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				原价:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="number" name="yuanshijiage" id="yuanshijiage" value="0" size="70px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				现价:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="number" name="jiage" id="jiage" value="0" size="70px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				单位:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="text" name="danwei" id="danwei" size="70px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" style="display: none;">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				是否上架:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <select name="shenhe" id="shenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				库存数量:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="number" name="kucunshuliang" id="kucunshuliang" value="0" size="70px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				销售数量:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <input type="number" name="xiaoshoushuliang" id="xiaoshoushuliang" value="0" size="70px"/>
            </td>

		</tr>
		<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22" style="display: none">
			<td width="20%" bgcolor="#FFFFFF" align="right">
				用户:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <select name="usersid" id="usersid" style="width: 280px;">
                    <option value="${sessionScope.user.id }">${sessionScope.user.loginname }</option>
                </select>
            </td>

		</tr>

		<tr align='center' bgcolor="#FFFFFF" height="22">
			<td width="10%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
			<td width="90%" bgcolor="#FFFFFF" align="left">
				<input type="button" name="Submit" value="提交" style='border:solid 1px #000000; color:#666666' onclick="shangpinAdd();"/>
				<input type="button" value="返回" style='border:solid 1px #000000; color:#666666' onClick="javascript:history.back()" />
				<input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666'/></td>
		</tr>
	</table>
</form>
</body>
</html>
