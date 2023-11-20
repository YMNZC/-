<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品评价列表</title>
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
        table{
            width: 100%;
            border-collapse: collapse;
        }

        table caption{
            font-size: 2em;
            font-weight: bold;
            margin: 1em 0;
        }

        th,td{
            border: 1px solid #999;
            text-align: center;
            padding: 20px 0;
        }

        table thead tr{
            background-color: #008c8c;
            color: #fff;
        }

        table tbody tr:nth-child(odd){
            background-color: #eee;
        }

        table tbody tr:hover{
            background-color: #ccc;
        }

        table tbody tr td:first-child{
            color: #f40;
        }

        table tfoot tr td{
            text-align: right;
            padding-right: 20px;
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
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">商品评价</h2>
        <p class="t_en"></p>
        <div class="desc">
            <form name="formSearch" id="formSearch" method="post" action="${contextPath}/${actionName}" style="width:100%">
        评语:<input type="text" style='border:solid 1px #000000; color:#666666' name="biaoti" id="biaoti" size="12px" value="${req.biaoti}"/>&nbsp;&nbsp;
        商品:
        <select style="border:solid 1px #000000; color:#666666;height: 25px;" name="shangpinid" id="shangpinid">
            <option value="">全部</option>
            <c:forEach items="${shangpinList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.shangpinid}">
                        <option value="${s.id}" selected>
                                ${s.mingcheng }
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.id}">
                                ${s.mingcheng}
                        </option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>&nbsp;&nbsp;
<%--        用户:
        <select name="usersid" id="usersid">
            <option value="">全部</option>
            <c:forEach items="${usersList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.usersid}">
                        <option value="${s.id}" selected>
                                ${s.loginname }
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.id}">
                                ${s.loginname}
                        </option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>&nbsp;&nbsp;--%>

                <input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu'/>
            </form>
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <thead>
<%--                    <td width="40px" align="center" bgcolor="">序号</td>--%>
    <th bgcolor='' align="center">评语</th>
        <th bgcolor='' align="center">分数（范围1-5）</th>
        <th bgcolor='' align="center">评价时间</th>
        <th bgcolor='' align="center">商品</th>
        <th bgcolor='' align="center">用户</th>
    <th width="40px" align="center" bgcolor=""></th>
                </thead>
                <c:forEach items="${pageInfo.records}" var="info" varStatus="s">
                    <tr>
<%--                        <td width="40px" align="center">--%>
<%--                                ${s.index+1}--%>
<%--                        </td>--%>
                                    <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.biaoti)>'16'}">
                        ${fn:substring(info.biaoti,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.biaoti}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.fenshu)>'16'}">
                        ${fn:substring(info.fenshu,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.fenshu}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shijian)>'16'}">
                        ${fn:substring(info.shijian,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shijian}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shangpin.mingcheng)>'16'}">
                        ${fn:substring(info.shangpin.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shangpin.mingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.users.loginname)>'16'}">
                        ${fn:substring(info.users.loginname,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.users.loginname}
                    </c:otherwise>
                </c:choose>
            </td>

                        <td width="40px" align="center">
                            <a href="${contextPath}/pingjiaDetailQian/${info.id}">
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
