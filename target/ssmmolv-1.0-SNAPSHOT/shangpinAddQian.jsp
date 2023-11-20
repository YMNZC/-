<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品添加</title>
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
        // 添加商品
        function shangpinAdd() {
			var mingcheng=$('#mingcheng').val().trim();
			if(mingcheng == "")
			{
				alert("please input:名称");
				return false;
			}
			var bianhao=$('#bianhao').val().trim();
			if(bianhao == "")
			{
				alert("please input:编号");
				return false;
			}
			var zhongleiid=$('#zhongleiid').val().trim();
			var pinpaiid=$('#pinpaiid').val().trim();
			var neirong=$('#neirong').val().trim();
			var image=$('#image').val().trim();
			if(image == "")
			{
				alert("please input:图片");
				return false;
			}
			var yuanshijiage=$('#yuanshijiage').val().trim();
			if(yuanshijiage == "")
			{
				alert("please input:原价");
				return false;
			}
			var jiage=$('#jiage').val().trim();
			if(jiage == "")
			{
				alert("please input:现价");
				return false;
			}
			var danwei=$('#danwei').val().trim();
			if(danwei == "")
			{
				alert("please input:单位");
				return false;
			}
			var shenhe=$('#shenhe').val().trim();
			var kucunshuliang=$('#kucunshuliang').val().trim();
			if(kucunshuliang == "")
			{
				alert("please input:库存数量");
				return false;
			}
			var xiaoshoushuliang=$('#xiaoshoushuliang').val().trim();
			if(xiaoshoushuliang == "")
			{
				alert("please input:销售数量");
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
                        //window.location.href = "${contextPath}/shangpinManaMyQian";
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
        <h2 class="t">商品添加</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="98%" height="667" border="1" align="center"
                   cellpadding="3" cellspacing="1" bordercolor="#58AC22"
                   style="border-collapse:collapse">
                <form name="formAdd" id="formAdd">
		<tr>
			<td>
				名称:
			</td>
            <td>
                <input type="text" name="mingcheng" id="mingcheng" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				编号:
			</td>
            <td>
                <input type="text" name="bianhao" id="bianhao" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				分类:
			</td>
            <td>
                <select name="zhongleiid" id="zhongleiid" style="border:solid 1px #000000; color:#666666"></select>
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
		<tr>
			<td>
				品牌:
			</td>
            <td>
                <select name="pinpaiid" id="pinpaiid" style="border:solid 1px #000000; color:#666666"></select>
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
		<tr>
			<td>
				内容介绍:
			</td>
            <td width="80%" bgcolor="#FFFFFF" align="left">
                <textarea name="neirong" id="neirong" style="width:670px;height:200px;"></textarea>
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
			<td>
				原价:
			</td>
            <td>
                <input type="number" name="yuanshijiage" id="yuanshijiage" value="0" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				现价:
			</td>
            <td>
                <input type="number" name="jiage" id="jiage" value="0" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				单位:
			</td>
            <td>
                <input type="text" name="danwei" id="danwei" size="70px"/>
            </td>

		</tr>
		<tr style="display: none;">
			<td>
				是否上架:
			</td>
            <td style="display: none">
                <select name="shenhe" id="shenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>

		</tr>
		<tr>
			<td>
				库存数量:
			</td>
            <td>
                <input type="number" name="kucunshuliang" id="kucunshuliang" value="0" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				销售数量:
			</td>
            <td>
                <input type="number" name="xiaoshoushuliang" id="xiaoshoushuliang" value="0" size="70px"/>
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
                            <input type="button" name="Submit5" value="提交" onClick="shangpinAdd();" />
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

