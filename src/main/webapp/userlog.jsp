<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>用户登陆</title>
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
</head>
<body style="padding-top:220px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
  <div class="w1200">
    <h2 class="t">用户登陆</h2>
    <p class="t_en">UserLog</p>
    <div class="desc">


      <table width="100%" border="0" bgcolor="#a6e2fe">
        <tr>
          <td width="35%" >  <img src="${staticPath}/qtimages/qtlog.jpg" class="fl about-img" /> </td>
          <td width="65%"><%@ include file="qtuserlog.jsp"%></td>
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