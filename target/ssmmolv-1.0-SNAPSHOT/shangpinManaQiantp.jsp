<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>商品图片列表</title>
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


		.main-tit {
			text-align: center;
			color: rgb(238, 238, 238);
			font-size: 24px;
			margin: 20px 0;
		}
		.rush-list {
			width: 1400px;
			margin: 50px auto 0;
			padding: 5px;
			overflow: hidden;
			transition: all .4s;
		}

		.rush-item {
			display: flex;

			float: left;
		}

		.rush-item:nth-child(1), .rush-item:nth-child(2), .rush-item:nth-child(3) {
			margin-top: 0;
		}

		.shadow {
			margin-right: 40px;
			height: 190px;
			width: 100%;
			transition: all .3s;
			border-radius: 5px;
			overflow: hidden;
		}

		.shadow:hover {
			transform: translateY(-5px);
			box-shadow: 0px 5px 10px #dedede;
		}

		.sec3-img {
			width: 190px;
			height: 190px;
			cursor: pointer;
			float: left;
			position: relative;
		}
		.info {
			overflow: hidden;
			padding-left: 25px;
			background: #9a9afb;
			height: 100%;
		}
		.da{
			color: white;
			font-size: 20px;
		}

	</style>
</head>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
	<div class="w1200">
		<h2 class="t">最新商品</h2>
		<p class="t_en"></p>
		<div class="desc">
			<form name="formSearch" id="formSearch" method="post" action="${contextPath}/shangpinManaQiantp" style="width:100%">
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
				<input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu'/>
			</form>






		<div class="main-tit">
			<section class="section3">
				<ul class="rush-list">
						<c:forEach items="${pageInfo.records}" var="info" varStatus="s">
					<li class="rush-item">
						<div class="shadow">
							<div class="sec3-img">
								<a href="${contextPath}/shangpinDetailQian/${info.id}">
									<img src="${contextPath}/${info.image}"height="190px" width="200px" border="0"   onerror="this.src='${staticPath}/images/zanwu.jpg'"/>
								</a>
							</div>
							<div class="info">
								<a href="${contextPath}/shangpinDetailQian/${info.id}" class="da">
									<c:if test="${fn:length(info.mingcheng)>'16'} ">
										${fn:substring(info.mingcheng,0,16)}...
									</c:if>
									<c:if test="${fn:length(info.mingcheng)<='16'}">
										${info.mingcheng}
									</c:if>
								</a>
							</div>
						</div>
					</li>
					<c:if test="${(s.index+1)%4==0}">
					</c:if>
					</c:forEach>
				</ul>
			</section>
		</div>








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
