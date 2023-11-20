<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单列表</title>
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
        <h2 class="t">订单</h2>
        <p class="t_en"></p>
        <div class="desc">
            <form name="formSearch" id="formSearch" method="post" action="${contextPath}/dingdanManaMyQian" style="width:100%">
                        编号:<input type="text" name="bianhao" id="bianhao" size="15px" value="${req.bianhao}"/>&nbsp;&nbsp;
        订单金额:<input type="text" name="jine" id="jine" size="15px" value="${req.jine}"/>&nbsp;&nbsp;
        是否支付:
        <select name="zhifushenhe" id="zhifushenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.zhifushenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.zhifushenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;
        是否发货:
        <select name="fahuoshenhe" id="fahuoshenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.fahuoshenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.fahuoshenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;
        是否收货:
        <select name="shouhuoshenhe" id="shouhuoshenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.shouhuoshenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.shouhuoshenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;
        付款方式:
        <select name="fukuanfangshiid" id="fukuanfangshiid">
            <option value="">全部</option>
            <c:forEach items="${fukuanfangshiList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.fukuanfangshiid}">
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
        姓名:<input type="text" name="xingming" id="xingming" size="15px" value="${req.xingming}"/>&nbsp;&nbsp;
        电话:<input type="text" name="dianhua" id="dianhua" size="15px" value="${req.dianhua}"/>&nbsp;&nbsp;
        送货地址:<input type="text" name="dizhi" id="dizhi" size="15px" value="${req.dizhi}"/>&nbsp;&nbsp;
        商家ID:<input type="text" name="shangjia" id="shangjia" size="15px" value="${req.shangjia}"/>&nbsp;&nbsp;
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
        物流信息:<input type="text" name="wuliu" id="wuliu" size="15px" value="${req.wuliu}"/>&nbsp;&nbsp;
        备注:<input type="text" name="beizhu" id="beizhu" size="15px" value="${req.beizhu}"/>&nbsp;&nbsp;

                <input type="submit" name="Submit" value="查找" />
            </form>
            <table width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <tr>
                    <td width="40" align="center" bgcolor="">序号</td>
                            <td align="center">编号</td>
        <td align="center">订单金额</td>
        <td align="center">是否支付</td>
        <td align="center">是否发货</td>
        <td align="center">是否收货</td>
        <td align="center">付款方式</td>
        <td align="center">姓名</td>
        <td align="center">电话</td>
        <td align="center">送货地址</td>
        <td align="center">商家ID</td>
        <td align="center">用户</td>
        <td align="center">时间</td>
        <td align="center">物流信息</td>
        <td align="center">备注</td>

                    <td width="40" align="center" bgcolor="">详细</td>
                </tr>
                <c:forEach items="${pageInfo.records}" var="info" varStatus="s">

                    <tr>
                        <td width="40px" align="center">
                                ${s.index+1}
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
                ${info.jine}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.zhifushenhe)>'16'}">
                        ${fn:substring(info.zhifushenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.zhifushenhe}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.fahuoshenhe)>'16'}">
                        ${fn:substring(info.fahuoshenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.fahuoshenhe}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shouhuoshenhe)>'16'}">
                        ${fn:substring(info.shouhuoshenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shouhuoshenhe}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.fukuanfangshi.mingcheng)>'16'}">
                        ${fn:substring(info.fukuanfangshi.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.fukuanfangshi.mingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.xingming)>'16'}">
                        ${fn:substring(info.xingming,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.xingming}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.dianhua)>'16'}">
                        ${fn:substring(info.dianhua,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.dianhua}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.dizhi)>'16'}">
                        ${fn:substring(info.dizhi,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.dizhi}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shangjia)>'16'}">
                        ${fn:substring(info.shangjia,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shangjia}
                    </c:otherwise>
                </c:choose>
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
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shijian)>'16'}">
                        ${fn:substring(info.shijian,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shijian}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.wuliu)>'16'}">
                        ${fn:substring(info.wuliu,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.wuliu}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.beizhu)>'16'}">
                        ${fn:substring(info.beizhu,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.beizhu}
                    </c:otherwise>
                </c:choose>
            </td>

                        <td width="40px" align="center">
                            <a href="${contextPath}/dingdanDetailQian/${info.id}">
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
