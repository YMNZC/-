<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单详情</title>
    <%@include file="common/head.jsp" %>
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
    <script language="javascript">
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //跳转到子表dingdanxiang添加页面
        function dingdandingdanxiangAddQian(id) {
            var url="${contextPath}/dingdandingdanxiangAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function dingdandingdanxiangGetBydingdanidQian(id) {
            var url="${contextPath}/dingdandingdanxiangGetBydingdanidQian/"+id;
            window.location.href=url;
        }

    </script>
</head>
<body style="padding-top:220px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">订单信息</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="#00FFFF"
                   style="border-collapse:collapse" class="newsline">
    <tr>
        <td width="39%" height="44px">
            编号:
        </td>
        <td width="39%">
            ${dingdan.bianhao }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            订单金额:
        </td>
        <td width="39%">
            ${dingdan.jine }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            是否支付:
        </td>
        <td width="39%">
            ${dingdan.zhifushenhe}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            是否发货:
        </td>
        <td width="39%">
            ${dingdan.fahuoshenhe}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            是否收货:
        </td>
        <td width="39%">
            ${dingdan.shouhuoshenhe}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            付款方式:
        </td>
        <td width="39%">
            ${dingdan.fukuanfangshi.mingcheng}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            姓名:
        </td>
        <td width="39%">
            ${dingdan.xingming }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            电话:
        </td>
        <td width="39%">
            ${dingdan.dianhua }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            送货地址:
        </td>
        <td width="39%">
            ${dingdan.dizhi }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            商家ID:
        </td>
        <td width="39%">
            ${dingdan.shangjia }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            用户:
        </td>
        <td width="39%">
            ${dingdan.users.loginname}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            时间:
        </td>
        <td width="39%">
            ${dingdan.shijian }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            物流信息:
        </td>
        <td width="39%">
            ${dingdan.wuliu }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            备注:
        </td>
        <td width="39%">
            ${dingdan.beizhu }
        </td>

    </tr>

                <tr>
                    <td colspan=3 align=center>
                <%--<input type="button" value="订单项添加" onclick="dingdandingdanxiangAddQian(${dingdan.id})"/>--%>
                <%--<input type="button" value="订单项查看" onclick="dingdandingdanxiangGetBydingdanidQian(${dingdan.id})"/>--%>

                        <input type=button name=Submit5 value=返回
                               onClick="javascript:history.back()"/>
                        <%--<input type="button" value="打印" style="width: 60px;" onClick="javascript:window.print()" />--%>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<%@ include file="yqlj.jsp"%>
<%@ include file="qtdown.jsp"%>
<%@ include file="kefutiao.jsp"%>

<%--<a class='bshareDiv' href='http://www.bshare.cn/share'>分享按钮</a>
<script type='text/javascript' charset='utf-8'
		src='http://static.bshare.cn/b/buttonLite.js#uuid=&amp;style=3&amp;fs=4&amp;textcolor=#fff&amp;bgcolor=#9C3&amp;text=分享到'></script>
--%>
</body>
</html>



