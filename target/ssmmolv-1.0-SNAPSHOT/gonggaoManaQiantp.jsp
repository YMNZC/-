<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
	<title>公告图片列表</title>
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
<body style="padding-top:220px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
	<div class="w1200">
		<h2 class="t">公告</h2>
		<p class="t_en"></p>
		<div class="desc">
			<form name="formSearch" id="formSearch" method="post" action="${contextPath}/gonggaoManaQiantp" style="width:100%">
        标题:<input type="text" name="biaoti" id="biaoti" size="15px" value="${req.biaoti}"/>&nbsp;&nbsp;

				<input type="submit" name="Submit" value="查找" class='hsgqiehuanshitu'/>
			</form>
			<table width="100%" border="0" align="center" cellpadding="3"
				   cellspacing="1" bordercolor="00FFFF"
				   style="border-collapse:collapse" class="newsline">
				<tr>
					<c:forEach items="${pageInfo.records}" var="info" varStatus="s">
					<td align="center">
						<table width="160" height="160" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="center">
									<a href="${contextPath}/gonggaoDetailQian/${info.id}">
										<img src="${contextPath}/${info.tupian}" width="240px" height="240px" border="0" onerror="this.src='${staticPath}/images/zanwu.jpg'"/>
									</a>
								</td>
							</tr>
							<tr>
								<td height="26" align="center">

									<a href="${contextPath}/gonggaoDetailQian/${info.id}">
										<c:if test="${fn:length(info.biaoti)>'16'}">
											${fn:substring(info.biaoti,0,16)}...
										</c:if>
										<c:if test="${fn:length(info.biaoti)<='16'}">
											${info.biaoti}
										</c:if>
									</a>

								</td>
							</tr>
						</table>
					</td>
					<c:if test="${(s.index+1)%4==0}">
				</tr><tr>
				</c:if>
				</c:forEach>
			</tr>
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
