<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台用户详情</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <link href="${staticPath}/css/css.css" type=text/css rel=stylesheet>
    <script language="javascript">
        //附件下载
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //跳转到子表dingdan添加页面
        function usersdingdanAdd(id) {
            var url="${contextPath}/usersdingdanAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdan查看页面
        function usersdingdanGetByusersid(id) {
            var url="${contextPath}/usersdingdanGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang添加页面
        function usersdingdanxiangAdd(id) {
            var url="${contextPath}/usersdingdanxiangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function usersdingdanxiangGetByusersid(id) {
            var url="${contextPath}/usersdingdanxiangGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche添加页面
        function usersgouwucheAdd(id) {
            var url="${contextPath}/usersgouwucheAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche查看页面
        function usersgouwucheGetByusersid(id) {
            var url="${contextPath}/usersgouwucheGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表liuyan添加页面
        function usersliuyanAdd(id) {
            var url="${contextPath}/usersliuyanAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表liuyan查看页面
        function usersliuyanGetByusersid(id) {
            var url="${contextPath}/usersliuyanGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia添加页面
        function userspingjiaAdd(id) {
            var url="${contextPath}/userspingjiaAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia查看页面
        function userspingjiaGetByusersid(id) {
            var url="${contextPath}/userspingjiaGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表shangpin添加页面
        function usersshangpinAdd(id) {
            var url="${contextPath}/usersshangpinAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表shangpin查看页面
        function usersshangpinGetByusersid(id) {
            var url="${contextPath}/usersshangpinGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang添加页面
        function usersshoucangAdd(id) {
            var url="${contextPath}/usersshoucangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang查看页面
        function usersshoucangGetByusersid(id) {
            var url="${contextPath}/usersshoucangGetByusersid/"+id;
            window.location.href=url;
        }

    </script>
</head>
<body leftmargin="2" topmargin="9" background='${staticPath}/img/allbg.gif'>
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom:8px">
    <tr bgcolor="#EEF4EA">
        <td colspan="3" background="${staticPath}/img/wbg.gif" class='title'><span>&nbsp;用户详情</span>
        </td>
    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            用户名称:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.loginname }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            密码:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.loginpw }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            类型:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.type}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            类型名称:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.typename }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            姓名:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.xingming }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            性别:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.xingbie}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            年龄:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.nianling }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            地址:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.address }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            电话:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.dianhua }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            审核:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${users.shenhe}
        </td>

    </tr>

    <tr>
        <td width="10" bgcolor="#FFFFFF" align="right">
            &nbsp;
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
                <%--<input type="button" value="订单添加" onclick="usersdingdanAdd(${users.id})"/>--%>
                <%--<input type="button" value="订单查看" onclick="usersdingdanGetByusersid(${users.id})"/>--%>
                <%--<input type="button" value="订单项添加" onclick="usersdingdanxiangAdd(${users.id})"/>--%>
                <%--<input type="button" value="订单项查看" onclick="usersdingdanxiangGetByusersid(${users.id})"/>--%>
                <%--<input type="button" value="购物车添加" onclick="usersgouwucheAdd(${users.id})"/>--%>
                <%--<input type="button" value="购物车查看" onclick="usersgouwucheGetByusersid(${users.id})"/>--%>
                <%--<input type="button" value="留言反馈添加" onclick="usersliuyanAdd(${users.id})"/>--%>
                <%--<input type="button" value="留言反馈查看" onclick="usersliuyanGetByusersid(${users.id})"/>--%>
                <%--<input type="button" value="商品评价添加" onclick="userspingjiaAdd(${users.id})"/>--%>
                <%--<input type="button" value="商品评价查看" onclick="userspingjiaGetByusersid(${users.id})"/>--%>
                <%--<input type="button" value="商品添加" onclick="usersshangpinAdd(${users.id})"/>--%>
                <%--<input type="button" value="商品查看" onclick="usersshangpinGetByusersid(${users.id})"/>--%>
                <%--<input type="button" value="商品收藏添加" onclick="usersshoucangAdd(${users.id})"/>--%>
                <%--<input type="button" value="商品收藏查看" onclick="usersshoucangGetByusersid(${users.id})"/>--%>

            <input type="button" value="打印" onClick="javascript:window.print()"/>
            <input type="button" value="返回" onClick="javascript:history.back()"/>
        </td>
    </tr>
</table>
</body>
</html>


