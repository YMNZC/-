<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台订单详情</title>
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

        //跳转到子表dingdanxiang添加页面
        function dingdandingdanxiangAdd(id) {
            var url="${contextPath}/dingdandingdanxiangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function dingdandingdanxiangGetBydingdanid(id) {
            var url="${contextPath}/dingdandingdanxiangGetBydingdanid/"+id;
            window.location.href=url;
        }

    </script>
</head>
<body leftmargin="2" topmargin="9" background='${staticPath}/img/allbg.gif'>
<table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC"
       style="margin-bottom:8px">
    <tr bgcolor="#EEF4EA">
        <td colspan="3" background="${staticPath}/img/wbg.gif" class='title'><span>&nbsp;订单详情</span>
        </td>
    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            编号:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.bianhao }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            订单金额:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.jine }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            是否支付:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.zhifushenhe}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            是否发货:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.fahuoshenhe}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            是否收货:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.shouhuoshenhe}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            付款方式:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.fukuanfangshi.mingcheng}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            姓名:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.xingming }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            电话:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.dianhua }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            送货地址:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.dizhi }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            商家ID:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.shangjia }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            用户:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.users.loginname}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            时间:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.shijian }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            物流信息:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.wuliu }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            备注:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${dingdan.beizhu }
        </td>

    </tr>

    <tr>
        <td width="10" bgcolor="#FFFFFF" align="right">
            &nbsp;
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
                <%--<input type="button" value="订单项添加" onclick="dingdandingdanxiangAdd(${dingdan.id})"/>--%>
                <%--<input type="button" value="订单项查看" onclick="dingdandingdanxiangGetBydingdanid(${dingdan.id})"/>--%>

            <input type="button" value="打印" onClick="javascript:window.print()"/>
            <input type="button" value="返回" onClick="javascript:history.back()"/>
        </td>
    </tr>
</table>
</body>
</html>


