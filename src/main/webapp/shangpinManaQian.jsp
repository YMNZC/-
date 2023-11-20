<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品列表</title>
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

        .dhz{
            text-align: center;
            color: rgb(238, 238, 238);
            font-size: 24px;
            margin: 20px 0;
        }
        .dhz a{
            color: #545b62;
        }
        .dhz a:hover{
            color: #9a9afb;
            border-color: #9a9afb;
            background: #A9E4E9;
        }
        .xbf{
            width: 1400px;
            height: 210px;
            margin-top: 10px;
            background: #f8f9fa;
            border: 1px solid #f8f9fa;
            border-radius: 20px;
        }

        .bqa{
            border: 1px solid hsla(0,0%,100%,0);
            border-radius: 20px;
            display: inline-block;
            margin-bottom: 14px;
            padding: 2px;
            height: 100%;
            width: 100%
        }

        .mypic{
            width: 200px;
            height: 200px;
            float: left;
            border-radius: 20px;

        }
        .mchz{
            float: left;
            width: 400px;
            height: 30px;

        }
        .sj{

            margin-top: 50px;
            margin-right: 900px;
        }
        .jghxl{

            height: 30px;
            margin-top: 70px;
            margin-left: 700px;
        }
        .rmbys{
            font-size: 20px;
            color: #d61215;
        }
        .jgys{
            font-size: 30px;
            color: #d61215;
        }
        .shrys{
            font-size: 15px;
            color: #545b62;
        }

        .mmmmmm{
            font-weight: bold;
            font-size: 30px;
            color: black;
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
        <h2 class="t">热销商品</h2>
        <p class="t_en"></p>
        <div class="desc">
            <form name="formSearch" id="formSearch" method="post" action="${contextPath}/${actionName}" style="width:100%">
        名称:<input type="text" style='border:solid 1px #000000; color:#666666' name="mingcheng" id="mingcheng" size="12px" value="${req.mingcheng}"/>&nbsp;&nbsp;
        分类:
        <select style="border:solid 1px #000000; color:#666666;" name="zhongleiid" id="zhongleiid">
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
        <select style="border:solid 1px #000000; color:#666666;" name="pinpaiid" id="pinpaiid">
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
                <input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu'/>
            </form>



        <div class="dhz">
            <c:forEach items="${pageInfo.records}" var="info" varStatus="s">
            <div class="xbf">
                    <a href="${contextPath}/shangpinDetailQian/${info.id}" class="bqa">
                        <div class="tphz">
                            <img src='${contextPath}/${info.image}' class="mypic"   onerror="this.src='${staticPath}/images/zanwu.jpg'" />
                        </div>
                        <div class="mchz">
                         <%--名称--%>
                            <span class="mmmmmm" >
                            <c:choose>
                                <c:when test="${fn:length(info.mingcheng)>'16'}">
                                    ${fn:substring(info.mingcheng,0,16)}...
                                </c:when>
                                <c:otherwise>
                                    ${info.mingcheng}
                                </c:otherwise>
                            </c:choose>
                                </span>


                        <%--品牌--%>
                             <span class="mmmmmm">
                             <c:choose>
                                 <c:when test="${fn:length(info.pinpai.pinpaimingcheng)>'16'}">
                                     ${fn:substring(info.pinpai.pinpaimingcheng,0,16)}...
                                 </c:when>
                                 <c:otherwise>
                                     ${info.pinpai.pinpaimingcheng}
                                 </c:otherwise>
                             </c:choose>
                                   </span>
                                   <%--分类--%>
                             <span class="mmmmmm">
                            <c:choose>
                                <c:when test="${fn:length(info.zhonglei.mingcheng)>'16'}">
                                    ${fn:substring(info.zhonglei.mingcheng,0,16)}...
                                </c:when>
                                <c:otherwise>
                                    ${info.zhonglei.mingcheng}
                                </c:otherwise>
                            </c:choose>
                             </span>
                        </div>
                        <div class="jghxl">
                            <span class="rmbys">￥</span>
                            <span class="jgys">${info.jiage}</span>
                            <span class="shrys"> ${info.xiaoshoushuliang}+人收货</span>
                        </div>
                        <div class="sj">
                        <%--  商家--%>

                            <c:choose>
                                <c:when test="${fn:length(info.users.loginname)>'16'}">
                                    ${fn:substring(info.users.loginname,0,16)}...
                                </c:when>
                                <c:otherwise>
                                    ${info.users.loginname}
                                </c:otherwise>
                            </c:choose>

                        </div>

                    </a>

            </div>
            </c:forEach>
        </div>

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
