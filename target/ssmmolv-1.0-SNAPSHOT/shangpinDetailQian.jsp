<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品详情</title>
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

        //立即购买
        function goDingdanAddQian() {
            var url = "${contextPath}/dingdanAddQian.jsp?jine=${shangpin.jiage}&shangpinid=${shangpin.id}";
            window.location.href = url;

        }
        //跳转到子表dingdanxiang添加页面
        function shangpindingdanxiangAddQian(id) {
            var url="${contextPath}/shangpindingdanxiangAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function shangpindingdanxiangGetByshangpinidQian(id) {
            var url="${contextPath}/shangpindingdanxiangGetByshangpinidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche添加页面
        function shangpingouwucheAddQian(id) {
            var url="${contextPath}/shangpingouwucheAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche查看页面
        function shangpingouwucheGetByshangpinidQian(id) {
            var url="${contextPath}/shangpingouwucheGetByshangpinidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia添加页面
        function shangpinpingjiaAddQian(id) {
            var url="${contextPath}/shangpinpingjiaAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia查看页面
        function shangpinpingjiaGetByshangpinidQian(id) {
            var url="${contextPath}/shangpinpingjiaGetByshangpinidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang添加页面
        function shangpinshoucangAddQian(id) {
            var url="${contextPath}/shangpinshoucangAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang查看页面
        function shangpinshoucangGetByshangpinidQian(id) {
            var url="${contextPath}/shangpinshoucangGetByshangpinidQian/"+id;
            window.location.href=url;
        }

    </script>
</head>
<body style="padding-top:220px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">商品信息</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="#00FFFF"
                   style="border-collapse:collapse" class="newsline">
    <tr>
        <td width="39%" height="44px">
            名称:
        </td>
        <td width="39%">
            ${shangpin.mingcheng }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            编号:
        </td>
        <td width="39%">
            ${shangpin.bianhao }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            分类:
        </td>
        <td width="39%">
            ${shangpin.zhonglei.mingcheng}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            品牌:
        </td>
        <td width="39%">
            ${shangpin.pinpai.pinpaimingcheng}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            内容介绍:
        </td>
        <td width="39%">
            ${shangpin.neirong }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            图片:
        </td>
        <td idth="39%" height="240px">
            <img src="${contextPath}/${shangpin.image}" alt="" width="228px" height="215px" border="0" onerror="this.src='${staticPath}/images/zanwu.jpg'" />
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
        <td width="39%" height="44px">
            原价:
        </td>
        <td width="39%">
            ${shangpin.yuanshijiage }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            现价:
        </td>
        <td width="39%">
            ${shangpin.jiage }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            单位:
        </td>
        <td width="39%">
            ${shangpin.danwei }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            是否上架:
        </td>
        <td width="39%">
            ${shangpin.shenhe}
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            库存数量:
        </td>
        <td width="39%">
            ${shangpin.kucunshuliang }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            销售数量:
        </td>
        <td width="39%">
            ${shangpin.xiaoshoushuliang }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            商家:
        </td>
        <td width="39%">
            ${shangpin.users.loginname}
        </td>

    </tr>

                <tr>
                    <td colspan=3 align=center>
                        <input type="button" value="立即购买"  onClick="goDingdanAddQian();" />
                <%--<input type="button" value="订单项添加" onclick="shangpindingdanxiangAddQian(${shangpin.id})"/>--%>
                <%--<input type="button" value="订单项查看" onclick="shangpindingdanxiangGetByshangpinidQian(${shangpin.id})"/>--%>
                <input type="button" value="购物车添加" onclick="shangpingouwucheAddQian(${shangpin.id})"/>
                <%--<input type="button" value="购物车查看" onclick="shangpingouwucheGetByshangpinidQian(${shangpin.id})"/>--%>
                <%--<input type="button" value="商品评价添加" onclick="shangpinpingjiaAddQian(${shangpin.id})"/>--%>
                <input type="button" value="商品评价查看" onclick="shangpinpingjiaGetByshangpinidQian(${shangpin.id})"/>
                <input type="button" value="商品收藏添加" onclick="shangpinshoucangAddQian(${shangpin.id})"/>
                <%--<input type="button" value="商品收藏查看" onclick="shangpinshoucangGetByshangpinidQian(${shangpin.id})"/>--%>

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



