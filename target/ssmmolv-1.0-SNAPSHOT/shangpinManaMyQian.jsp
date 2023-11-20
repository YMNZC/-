<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品列表</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
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
        <h2 class="t">商品</h2>
        <p class="t_en"></p>
        <div class="desc">
            <form name="formSearch" id="formSearch" method="post" action="${contextPath}/shangpinManaMyQian" style="width:100%">
        名称:<input type="text" name="mingcheng" id="mingcheng" size="15px" value="${req.mingcheng}"/>&nbsp;&nbsp;
        编号:<input type="text" name="bianhao" id="bianhao" size="15px" value="${req.bianhao}"/>&nbsp;&nbsp;
        分类:
        <select name="zhongleiid" id="zhongleiid">
            <option value="">全部</option>
            <c:forEach items="${zhongleiList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.zhongleiid}">
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
        品牌:
        <select name="pinpaiid" id="pinpaiid">
            <option value="">全部</option>
            <c:forEach items="${pinpaiList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.pinpaiid}">
                        <option value="${s.id}" selected>
                                ${s.pinpaimingcheng }
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.id}">
                                ${s.pinpaimingcheng}
                        </option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>&nbsp;&nbsp;
        单位:<input type="text" name="danwei" id="danwei" size="15px" value="${req.danwei}"/>&nbsp;&nbsp;
        是否上架:
        <select name="shenhe" id="shenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.shenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.shenhe == 'no'}">selected</c:if>>no</option>
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

                <input type="submit" name="Submit" value="查找" />
            </form>
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <tr>
                    <td width="40" align="center" bgcolor="">序号</td>
        <td align="center">名称</td>
        <td align="center">编号</td>
        <td align="center">分类</td>
        <td align="center">品牌</td>
        <td align="center">图片</td>
        <td align="center">原价</td>
        <td align="center">现价</td>
        <td align="center">单位</td>
        <td align="center">是否上架</td>
        <td align="center">库存数量</td>
        <td align="center">销售数量</td>
        <td align="center">用户</td>

                    <td width="40" align="center" bgcolor="">详细</td>
                </tr>
                <c:forEach items="${pageInfo.records}" var="info" varStatus="s">

                    <tr>
                        <td width="40px" align="center">
                                ${s.index+1}
                        </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.mingcheng)>'16'}">
                        ${fn:substring(info.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.mingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.bianhao)>'16'}">
                        ${fn:substring(info.bianhao,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.bianhao}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.zhonglei.mingcheng)>'16'}">
                        ${fn:substring(info.zhonglei.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.zhonglei.mingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.pinpai.pinpaimingcheng)>'16'}">
                        ${fn:substring(info.pinpai.pinpaimingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.pinpai.pinpaimingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td width='90' align='center'>
                <a href='${contextPath}/${info.image}' target='_blank'>
                    <img src='${contextPath}/${info.image}' width="88" height="99" border="0"  onerror="this.src='${staticPath}/images/zanwu.jpg'" />
                </a>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.yuanshijiage}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.jiage}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.danwei)>'16'}">
                        ${fn:substring(info.danwei,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.danwei}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shenhe)>'16'}">
                        ${fn:substring(info.shenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shenhe}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.kucunshuliang}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.xiaoshoushuliang}
            </td>
            <td bgcolor="#FFFFFF" align="center">
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
                            <a href="${contextPath}/shangpinDetailQian/${info.id}">
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
