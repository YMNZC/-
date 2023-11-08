<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台商品详情</title>
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
        function shangpindingdanxiangAdd(id) {
            var url="${contextPath}/shangpindingdanxiangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function shangpindingdanxiangGetByshangpinid(id) {
            var url="${contextPath}/shangpindingdanxiangGetByshangpinid/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche添加页面
        function shangpingouwucheAdd(id) {
            var url="${contextPath}/shangpingouwucheAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche查看页面
        function shangpingouwucheGetByshangpinid(id) {
            var url="${contextPath}/shangpingouwucheGetByshangpinid/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia添加页面
        function shangpinpingjiaAdd(id) {
            var url="${contextPath}/shangpinpingjiaAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia查看页面
        function shangpinpingjiaGetByshangpinid(id) {
            var url="${contextPath}/shangpinpingjiaGetByshangpinid/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang添加页面
        function shangpinshoucangAdd(id) {
            var url="${contextPath}/shangpinshoucangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang查看页面
        function shangpinshoucangGetByshangpinid(id) {
            var url="${contextPath}/shangpinshoucangGetByshangpinid/"+id;
            window.location.href=url;
        }

    </script>
</head>
<body>
商品详情
<br><br>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
       style="border-collapse:collapse">
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            名称:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.mingcheng }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            编号:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.bianhao }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            分类:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.zhonglei.mingcheng}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            品牌:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.pinpai.pinpaimingcheng}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            内容介绍:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.neirong }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            图片:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            <img src="${contextPath}/${shangpin.image}" alt="" width="550" height="350" onerror="this.src='${staticPath}/images/zanwu.jpg'" />
            <br />
        <c:choose>
            <c:when test='${ null != shangpin.image && !shangpin.image.equals("")}'>
                <a href="#" onclick="down('${shangpin.image}')" style="font-size: 11px;color: red">下载</a>
            </c:when>
            <c:otherwise>
                暂无
            </c:otherwise>
        </c:choose>
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            原价:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.yuanshijiage }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            现价:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.jiage }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            单位:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.danwei }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            是否上架:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.shenhe}
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            库存数量:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.kucunshuliang }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            销售数量:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.xiaoshoushuliang }
        </td>

    </tr>
    <tr>
        <td width="10%" bgcolor="#FFFFFF" align="right">
            用户:
        </td>
        <td width="90%" bgcolor="#FFFFFF" align="left">
            ${shangpin.users.loginname}
        </td>

    </tr>

    <tr>
        <td colspan=3 align=center>
                <%--<input type="button" value="订单项添加" onclick="shangpindingdanxiangAdd(${shangpin.id})"/>--%>
                <%--<input type="button" value="订单项查看" onclick="shangpindingdanxiangGetByshangpinid(${shangpin.id})"/>--%>
                <%--<input type="button" value="购物车添加" onclick="shangpingouwucheAdd(${shangpin.id})"/>--%>
                <%--<input type="button" value="购物车查看" onclick="shangpingouwucheGetByshangpinid(${shangpin.id})"/>--%>
                <%--<input type="button" value="商品评价添加" onclick="shangpinpingjiaAdd(${shangpin.id})"/>--%>
                <%--<input type="button" value="商品评价查看" onclick="shangpinpingjiaGetByshangpinid(${shangpin.id})"/>--%>
                <%--<input type="button" value="商品收藏添加" onclick="shangpinshoucangAdd(${shangpin.id})"/>--%>
                <%--<input type="button" value="商品收藏查看" onclick="shangpinshoucangGetByshangpinid(${shangpin.id})"/>--%>

            <input type="button" value="打印"  onClick="javascript:window.print()" />
            <input type="button" value="返回" onClick="javascript:history.back()"/>
        </td>
    </tr>
</table>
</body>
</html>


