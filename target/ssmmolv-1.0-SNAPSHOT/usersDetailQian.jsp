<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户详情</title>
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

        //跳转到子表dingdan添加页面
        function usersdingdanAddQian(id) {
            var url="${contextPath}/usersdingdanAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdan查看页面
        function usersdingdanGetByusersidQian(id) {
            var url="${contextPath}/usersdingdanGetByusersidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang添加页面
        function usersdingdanxiangAddQian(id) {
            var url="${contextPath}/usersdingdanxiangAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function usersdingdanxiangGetByusersidQian(id) {
            var url="${contextPath}/usersdingdanxiangGetByusersidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche添加页面
        function usersgouwucheAddQian(id) {
            var url="${contextPath}/usersgouwucheAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche查看页面
        function usersgouwucheGetByusersidQian(id) {
            var url="${contextPath}/usersgouwucheGetByusersidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表liuyan添加页面
        function usersliuyanAddQian(id) {
            var url="${contextPath}/usersliuyanAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表liuyan查看页面
        function usersliuyanGetByusersidQian(id) {
            var url="${contextPath}/usersliuyanGetByusersidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia添加页面
        function userspingjiaAddQian(id) {
            var url="${contextPath}/userspingjiaAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia查看页面
        function userspingjiaGetByusersidQian(id) {
            var url="${contextPath}/userspingjiaGetByusersidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shangpin添加页面
        function usersshangpinAddQian(id) {
            var url="${contextPath}/usersshangpinAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shangpin查看页面
        function usersshangpinGetByusersidQian(id) {
            var url="${contextPath}/usersshangpinGetByusersidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang添加页面
        function usersshoucangAddQian(id) {
            var url="${contextPath}/usersshoucangAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang查看页面
        function usersshoucangGetByusersidQian(id) {
            var url="${contextPath}/usersshoucangGetByusersidQian/"+id;
            window.location.href=url;
        }

    </script>
</head>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">用户信息</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="#00FFFF"
                   style="border-collapse:collapse" class="newsline">
    <tr>
        <td width="39%" height="44px">
            用户名称:
        </td>
        <td width="39%">
            ${users.loginname }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            密码:
        </td>
        <td width="39%">
            ${users.loginpw }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            类型:
        </td>
        <td width="39%">
            ${users.type}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            类型名称:
        </td>
        <td width="39%">
            ${users.typename }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            姓名:
        </td>
        <td width="39%">
            ${users.xingming }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            性别:
        </td>
        <td width="39%">
            ${users.xingbie}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            年龄:
        </td>
        <td width="39%">
            ${users.nianling }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            地址:
        </td>
        <td width="39%">
            ${users.address }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            电话:
        </td>
        <td width="39%">
            ${users.dianhua }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            审核:
        </td>
        <td width="39%">
            ${users.shenhe}
        </td>

    </tr>

                <tr>
                    <td colspan=3 align=center>
                <input type="button" value="订单添加" onclick="usersdingdanAddQian(${users.id})"/>
                <input type="button" value="订单查看" onclick="usersdingdanGetByusersidQian(${users.id})"/>
                <%--<input type="button" value="订单项添加" onclick="usersdingdanxiangAddQian(${users.id})"/>--%>
                <%--<input type="button" value="订单项查看" onclick="usersdingdanxiangGetByusersidQian(${users.id})"/>--%>
                <input type="button" value="购物车添加" onclick="usersgouwucheAddQian(${users.id})"/>
                <%--<input type="button" value="购物车查看" onclick="usersgouwucheGetByusersidQian(${users.id})"/>--%>
                <input type="button" value="留言反馈添加" onclick="usersliuyanAddQian(${users.id})"/>
                <input type="button" value="留言反馈查看" onclick="usersliuyanGetByusersidQian(${users.id})"/>
                <input type="button" value="商品评价添加" onclick="userspingjiaAddQian(${users.id})"/>
                <input type="button" value="商品评价查看" onclick="userspingjiaGetByusersidQian(${users.id})"/>
                <input type="button" value="商品添加" onclick="usersshangpinAddQian(${users.id})"/>
                <input type="button" value="商品查看" onclick="usersshangpinGetByusersidQian(${users.id})"/>
                <input type="button" value="商品收藏添加" onclick="usersshoucangAddQian(${users.id})"/>
                <%--<input type="button" value="商品收藏查看" onclick="usersshoucangGetByusersidQian(${users.id})"/>--%>

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



