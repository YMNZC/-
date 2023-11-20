<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>品牌列表</title>
    <%@include file="common/head.jsp" %>
    <link rel="stylesheet" type="text/css" href="${staticPath}/qtimages/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${staticPath}/qtimages/css/mislider.css" />
    <link rel="stylesheet" href="${staticPath}/images/hsgcommon/divqt.css" type="text/css">
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
</head>
<script type="text/javascript">
    //附件下载
    function down(fujianPath) {
        var url = "${contextPath}/common/download?filename=" + fujianPath;
        url = encodeURI(url);
        window.open(url, "_self");
    }
</script>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">品牌</h2>
        <p class="t_en"></p>
        <div class="desc">
            <form name="formSearch" id="formSearch" method="post" action="${contextPath}/${actionName}" style="width:100%">
        品牌名:<input type="text" style='border:solid 1px #000000; color:#666666' name="pinpaimingcheng" id="pinpaimingcheng" size="12px" value="${req.pinpaimingcheng}"/>&nbsp;&nbsp;

                <input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu'/>
            </form>
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <tr>
<%--                    <td width="40px" align="center" bgcolor="">序号</td>--%>
                            <td bgcolor='' align="center">品牌名</td>

                    <td width="40px" align="center" bgcolor="">详细</td>
                </tr>
                <c:forEach items="${pageInfo.records}" var="info" varStatus="s">
                    <tr>
<%--                        <td width="40px" align="center">--%>
<%--                                ${s.index+1}--%>
<%--                        </td>--%>
                                    <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.pinpaimingcheng)>'16'}">
                        ${fn:substring(info.pinpaimingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.pinpaimingcheng}
                    </c:otherwise>
                </c:choose>
            </td>

                        <td width="40px" align="center">
                            <a href="${contextPath}/pinpaiDetailQian/${info.id}">
                                详细
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <%@ include file="common/fenye.jsp"%>
            <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <tr>
                    <td align="center" bgcolor="">
                        <%--<input type="button" value="打印" style="width: 60px;" onClick="javascript:window.print()" />--%>
                        <input type="button" value="返回" style="width: 60px;" onClick="javascript:history.back()" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<%@ include file="yqlj.jsp"%>
<%@ include file="qtdown.jsp"%>
<%@ include file="kefutiao.jsp"%>
</body>
</html>
