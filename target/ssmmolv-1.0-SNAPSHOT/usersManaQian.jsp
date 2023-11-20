<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>用户列表</title>
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
        <h2 class="t">用户</h2>
        <p class="t_en"></p>
        <div class="desc">
            <form name="formSearch" id="formSearch" method="post" action="${contextPath}/${actionName}" style="width:100%">
        用户名称:<input type="text" style='border:solid 1px #000000; color:#666666' name="loginname" id="loginname" size="12px" value="${req.loginname}"/>&nbsp;&nbsp;
        类型:<input type="text" style='border:solid 1px #000000; color:#666666' name="type" id="type" size="12px" value="${req.type}"/>&nbsp;&nbsp;
        类型名称:<input type="text" style='border:solid 1px #000000; color:#666666' name="typename" id="typename" size="12px" value="${req.typename}"/>&nbsp;&nbsp;
        姓名:<input type="text" style='border:solid 1px #000000; color:#666666' name="xingming" id="xingming" size="12px" value="${req.xingming}"/>&nbsp;&nbsp;
        性别:
        <select size="1px"  name="xingbie" id="xingbie">
            <option value="">全部</option>
            <option value="男" <c:if test="${req.xingbie == '男'}">selected</c:if>>男</option>
            <option value="女" <c:if test="${req.xingbie == '女'}">selected</c:if>>女</option>
        </select>&nbsp;&nbsp;
        年龄:<input type="text" style='border:solid 1px #000000; color:#666666' name="nianling" id="nianling" size="12px" value="${req.nianling}"/>&nbsp;&nbsp;
        地址:<input type="text" style='border:solid 1px #000000; color:#666666' name="address" id="address" size="12px" value="${req.address}"/>&nbsp;&nbsp;
        电话:<input type="text" style='border:solid 1px #000000; color:#666666' name="dianhua" id="dianhua" size="12px" value="${req.dianhua}"/>&nbsp;&nbsp;
        审核:
        <select name="shenhe" id="shenhe" size="1px" >
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.shenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.shenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;

                <input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu'/>
            </form>
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <tr>
<%--                    <td width="40px" align="center" bgcolor="">序号</td>--%>
                            <td bgcolor='' align="center">用户名称</td>
        <td bgcolor='' align="center">密码</td>
        <td bgcolor='' align="center">类型</td>
        <td bgcolor='' align="center">类型名称</td>
        <td bgcolor='' align="center">姓名</td>
        <td bgcolor='' align="center">性别</td>
        <td bgcolor='' align="center">年龄</td>
        <td bgcolor='' align="center">地址</td>
        <td bgcolor='' align="center">电话</td>
        <td bgcolor='' align="center">审核</td>

                    <td width="40px" align="center" bgcolor="">详细</td>
                </tr>
                <c:forEach items="${pageInfo.records}" var="info" varStatus="s">
                    <tr>
<%--                        <td width="40px" align="center">--%>
<%--                                ${s.index+1}--%>
<%--                        </td>--%>
                                    <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.loginname)>'16'}">
                        ${fn:substring(info.loginname,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.loginname}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.loginpw)>'16'}">
                        ${fn:substring(info.loginpw,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.loginpw}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.type)>'16'}">
                        ${fn:substring(info.type,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.type}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.typename)>'16'}">
                        ${fn:substring(info.typename,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.typename}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.xingming)>'16'}">
                        ${fn:substring(info.xingming,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.xingming}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.xingbie)>'16'}">
                        ${fn:substring(info.xingbie,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.xingbie}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.nianling)>'16'}">
                        ${fn:substring(info.nianling,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.nianling}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.address)>'16'}">
                        ${fn:substring(info.address,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.address}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.dianhua)>'16'}">
                        ${fn:substring(info.dianhua,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.dianhua}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shenhe)>'16'}">
                        ${fn:substring(info.shenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shenhe}
                    </c:otherwise>
                </c:choose>
            </td>

                        <td width="40px" align="center">
                            <a href="${contextPath}/usersDetailQian/${info.id}">
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
