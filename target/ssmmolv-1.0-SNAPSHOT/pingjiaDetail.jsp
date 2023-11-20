<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台商品评价详情</title>
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


    </script>
</head>
<body leftmargin="2" topmargin="9" background='${staticPath}/img/allbg.gif'>
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom:8px">
    <tr bgcolor="#EEF4EA">
        <td colspan="3" background="${staticPath}/img/wbg.gif" class='title'><span>&nbsp;商品评价详情</span>
        </td>
    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            评语:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${pingjia.biaoti }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            分数（范围1-5）:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${pingjia.fenshu }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            评价时间:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${pingjia.shijian }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            商品:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${pingjia.shangpin.mingcheng}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            用户:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${pingjia.users.loginname}
        </td>

    </tr>

    <tr>
        <td width="10" bgcolor="#FFFFFF" align="right">
            &nbsp;
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">

            <input type="button" value="打印" onClick="javascript:window.print()"/>
            <input type="button" value="返回" onClick="javascript:history.back()"/>
        </td>
    </tr>
</table>
</body>
</html>


