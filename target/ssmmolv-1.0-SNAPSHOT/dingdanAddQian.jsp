<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单提交</title>
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
        // 添加订单
        function dingdanAdd() {
            var shangpinid=$('#shangpinid').val();
			var bianhao=$('#bianhao').val().trim();
			if(bianhao == "")
			{
				alert("please input:编号");
				return false;
			}
			var jine=$('#jine').val().trim();
			if(jine == "")
			{
				alert("please input:订单金额");
				return false;
			}
			var zhifushenhe=$('#zhifushenhe').val().trim();
			var fahuoshenhe=$('#fahuoshenhe').val().trim();
			var shouhuoshenhe=$('#shouhuoshenhe').val().trim();
			var fukuanfangshiid=$('#fukuanfangshiid').val().trim();
			var xingming=$('#xingming').val().trim();
			if(xingming == "")
			{
				alert("please input:姓名");
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
			var dizhi=$('#dizhi').val().trim();
			if(dizhi == "")
			{
				alert("please input:送货地址");
				return false;
			}
			var shangjia=$('#shangjia').val().trim();
			// if(shangjia == "")
			// {
			// 	alert("please input:商家ID");
			// 	return false;
			// }
			var usersid=$('#usersid').val().trim();
			var shijian=$('#shijian').val().trim();
			if(shijian == "")
			{
				alert("please input:时间");
				return false;
			}
			var wuliu=$('#wuliu').val().trim();
			var beizhu=$('#beizhu').val().trim();
			if(beizhu == "")
			{
				alert("please input:备注");
				return false;
			}

            var param = {
				'bianhao':bianhao,
				'jine':jine,
				'zhifushenhe':zhifushenhe,
				'fahuoshenhe':fahuoshenhe,
				'shouhuoshenhe':shouhuoshenhe,
				'fukuanfangshiid':fukuanfangshiid,
				'xingming':xingming,
				'dianhua':dianhua,
				'dizhi':dizhi,
				'shangjia':shangjia,
				'usersid':usersid,
				'shijian':shijian,
				'wuliu':wuliu,
				'beizhu':beizhu,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/dingdanAddOrUpdate?shangPinId='+shangpinid,
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    alert(resp.message);
                    if (resp.success) {
                        window.location.href = "${contextPath}/default.jsp";
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
        <h2 class="t">订单提交</h2>
        <p class="t_en"></p>
        <div class="desc">
            <%
                String bianhao = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
                String jine = "0";
                if(null != request.getParameter("jine")){
                    jine = request.getParameter("jine");
                }
                String shangpinid = "0";
                if(null != request.getParameter("shangpinid")){
                    shangpinid = request.getParameter("shangpinid");
                }
            %>
            <table width="98%" height="667" border="1" align="center"
                   cellpadding="3" cellspacing="1" bordercolor="#58AC22"
                   style="border-collapse:collapse">
                <form name="formAdd" id="formAdd">
		<tr>
			<td>
				编号:
			</td>
            <td>
                <input type="text" name="bianhao" id="bianhao" value="<%=bianhao %>" readonly="readonly" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				订单金额:
			</td>
            <td>
                <input type="text" name="jine" id="jine" value="<%=jine %>" readonly="readonly" size="70px"/>
            </td>

		</tr>
		<tr style="display: none;">
			<td>
				是否支付:
			</td>
            <td style="display: none">
                <select name="zhifushenhe" id="zhifushenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>

		</tr>
		<tr style="display: none;">
			<td>
				是否发货:
			</td>
            <td style="display: none">
                <select name="fahuoshenhe" id="fahuoshenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>

		</tr>
		<tr style="display: none;">
			<td>
				是否收货:
			</td>
            <td style="display: none">
                <select name="shouhuoshenhe" id="shouhuoshenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>

		</tr>
		<tr>
			<td>
				付款方式:
			</td>
            <td>
                <select name="fukuanfangshiid" id="fukuanfangshiid" style="border:solid 1px #000000; color:#666666"></select>
            </td>
            <script type="text/javascript">
                $.get(basePath + '/fukuanfangshiAll/', function(resp) {
                    if (resp.success) {
                        if(resp.data!=null){
                            var list = resp.data;
                            for(var i=0; i<list.length; i++){
                                var info = list[i];
                                $("#fukuanfangshiid").append("<option value='"+info.id+"' >" + info.mingcheng + "</option>");
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
				姓名:
			</td>
            <td>
                <input type="text" name="xingming" id="xingming" size="70px"/>
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
		<tr>
			<td>
				送货地址:
			</td>
            <td>
                <input type="text" name="dizhi" id="dizhi" size="70px"/>
            </td>

		</tr>
		<tr style="display: none;">
			<td>
				商家ID:
			</td>
            <td>
                <input type="text" name="shangjia" id="shangjia" size="70px"/>
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
			<td>
				时间:
			</td>
            <td>
                <input type="text" name="shijian" id="shijian" style="border:1px solid #cccccc;" readonly="readonly" size="25px" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" />
            </td>

		</tr>
		<tr style="display: none;">
			<td>
				物流信息:
			</td>
            <td>
                <input type="text" name="wuliu" id="wuliu" size="70px"/>
            </td>

		</tr>
		<tr>
			<td>
				备注:
			</td>
            <td>
                <input type="text" name="beizhu" id="beizhu" size="70px"/>
            </td>

		</tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <input type="hidden" id="shangpinid" name="shangpinid" value="<%= shangpinid %>">
                            <input type="button" name="Submit5" value="提交" onClick="dingdanAdd();" />
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

