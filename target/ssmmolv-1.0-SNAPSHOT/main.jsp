<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>网站后台</title>
  <%@include file="common/head.jsp" %>
  <%@include file="common/loginstate.jsp" %>
  <link rel="shortcut icon" href="${staticPath}/favicon.ico" type="image/x-icon"/>
  <link rel="stylesheet" href="${staticPath}/images/css/font.css">
  <link rel="stylesheet" href="${staticPath}/images/css/xadmin.css">
  <link rel="stylesheet" href="${staticPath}/images/hsg3.css">
  <script type="text/javascript" src="${staticPath}/images/hsg1.js"></script>
  <script type="text/javascript" src="${staticPath}/images/hsg2.js"></script>
  <script src="${staticPath}/images/lib/layui/layui.js" charset="utf-8"></script>
  <script type="text/javascript" src="${staticPath}/images/js/xadmin.js"></script>
</head>
<body>
<div class="container">
  <div class="logo">${sessionScope.user.typename}中心</div>
  <div class="open-nav"><i class="iconfont"></i></div>
  <ul class="layui-nav right" lay-filter="">
    <li class="layui-nav-item">当前用户：${sessionScope.user.loginname} [${sessionScope.user.typename}]</li>
    <li class="layui-nav-item">
      <a href="javascript:;">返回</a>
      <dl class="layui-nav-child">
        <dd><a href="default.jsp">前台</a></dd>

        <dd><a href="logout.jsp">退出</a></dd>
      </dl>
    </li>
  </ul>
</div>
<div class="wrapper">
  <div class="left-nav">
    <div id="side-nav">
      <ul id="nav">
        <c:if test="${sessionScope.userType==0}">
          <%@ include file="left.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userType==1}">
          <%@ include file="left1.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userType==2}">
          <%@ include file="left2.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userType==3}">
          <%@ include file="left3.jsp" %>
        </c:if>
        <c:if test="${sessionScope.userType==4}">
          <%@ include file="left4.jsp" %>
        </c:if>

        <%--	  <%
        if (request.getSession().getAttribute("cx").equals("超级管理员") || request.getSession().getAttribute("cx").equals("普通管理员")){%><%@ include file="left_guanliyuan.jsp"%><%}
        if (request.getSession().getAttribute("cx").equals("注册用户")){%><%@ include file="left_zhuceyonghu.jsp"%><%}


        %>--%>


      </ul>
    </div>
  </div>
  <div class="page-content">
    <iframe frameborder="0" id="hsgmain" name="hsgmain" scrolling="yes" src="sy.jsp" height="100%"
            style="  visibility:inherit; width:100%;z-index:1;"></iframe>
  </div>
</div>
<div class="footer">
  <div class="copyright">Copyright @xxxxxx All Rights Reserved.<%-- 本后台系统由xxxxxxx技术支持--%></div>
</div>
<%--<div class="bg-changer">
  <div class="swiper-container changer-list">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/a.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/b.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/c.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/d.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/e.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/f.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/g.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/h.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/i.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/j.jpg" alt=""></div>
      <div class="swiper-slide"><img class="item" src="${staticPath}/images/k.jpg" alt=""></div>
      <div class="swiper-slide"><span class="reset">初始化</span></div>
    </div>
  </div>--%>
  <div class="bg-out"></div>
  <div id="changer-set"><%--<i class="iconfont">&#xe696;</i>--%></div>
</div>
</body>
</html>
