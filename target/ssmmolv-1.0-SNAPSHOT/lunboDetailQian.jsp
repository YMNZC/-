<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>轮播图详情</title>
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


    </script>
</head>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">轮播图信息</h2>
        <p class="t_en"></p>
        <div class="desc">
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="#00FFFF"
                   style="border-collapse:collapse" class="newsline">
    <tr>
        <td width="39%" height="44px">
            标题:
        </td>
        <td width="39%">
            ${lunbo.biaoti }
        </td>

    </tr>
    <tr>
        <td width="39%" height="44px">
            图片:
        </td>
        <td idth="39%" height="240px">
            <img src="${contextPath}/${lunbo.image}" alt="" width="228px" height="215px" border="0" onerror="this.src='${staticPath}/images/zanwu.jpg'" />
            <br />
        <c:choose>
            <c:when test='${ null != lunbo.image && !lunbo.image.equals("")}'>
                <a href="#" onclick="down('${lunbo.image}')" style="font-size: 11px;color: red">下载</a>
            </c:when>
            <c:otherwise>
                暂无
            </c:otherwise>
        </c:choose>
        </td>

    </tr>

                <tr>
                    <td colspan=3 align=center>

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



