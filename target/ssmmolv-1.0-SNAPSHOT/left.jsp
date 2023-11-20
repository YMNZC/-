<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<li class="list">
    <a href="javascript:;"><i class="iconfont">&#xe70b;</i>系统用户管理<i class="iconfont nav_right">&#xe697;</i></a>
    <ul class="sub-menu">
        <li><a href="${contextPath}/usersAdd.jsp" target="hsgmain">用户添加</a></li>
        <li><a href="${contextPath}/usersMana" target="hsgmain">用户查询</a></li>
        <li><a href="${contextPath}/userPw.jsp" target="hsgmain">修改密码</a></li>
        <li><a href="${contextPath}/usersSet2.jsp" target="hsgmain">修改资料</a></li>
    </ul>
</li>


<li class="list">
    <a href="javascript:;"><i class="iconfont">&#xe70b;</i>公告管理<i class="iconfont nav_right">&#xe697;</i></a>
    <ul class="sub-menu">
        <li><a href="${contextPath}/gonggaoAdd.jsp" target="hsgmain" onclick="$(this).show();">公告添加</a></li>
        <li><a href="${contextPath}/gonggaoMana" target="hsgmain">公告查询</a></li>

    </ul>
</li>


<li class="list">
    <a href="javascript:;"><i class="iconfont">&#xe70b;</i>轮播管理<i class="iconfont nav_right">&#xe697;</i></a>
    <ul class="sub-menu">
        <li><a href="${contextPath}/lunboAdd.jsp" target="hsgmain">轮播图添加</a></li>
        <li><a href="${contextPath}/lunboMana" target="hsgmain">轮播图查询</a></li>

    </ul>
</li>


<li class="list">
    <a href="javascript:;"><i class="iconfont">&#xe70b;</i>商品管理<i class="iconfont nav_right">&#xe697;</i></a>
    <ul class="sub-menu">
        <li><a href="${contextPath}/zhongleiAdd.jsp" target="hsgmain">类别添加</a></li>
        <li><a href="${contextPath}/zhongleiMana" target="hsgmain">类别查询</a></li>

        <li><a href="${contextPath}/shangpinAdd.jsp" target="hsgmain">商品添加</a></li>
        <li><a href="${contextPath}/shangpinMana" target="hsgmain">商品查询</a></li>
        <li><a href='${contextPath}/pinpaiAdd.jsp' target='hsgmain'>品牌添加</a></li>
        <li><a href='${contextPath}/pinpaiMana' target='hsgmain'>品牌查询</a></li>
        <li><a href="${contextPath}/shoucangMana" target="hsgmain">收藏查询</a></li>
        <li><a href="${contextPath}/pingjiaMana" target="hsgmain">评论查询</a></li>
    </ul>
</li>

<li class="list">
    <a href="javascript:;"><i class="iconfont">&#xe70b;</i>订单管理<i class="iconfont nav_right">&#xe697;</i></a>
    <ul class="sub-menu">
        <li><a href="${contextPath}/dingdanMana" target="hsgmain">订单查询</a></li>

    </ul>
</li>

<li class="list">
    <a href="javascript:;"><i class="iconfont">&#xe70b;</i>支付方式管理<i class="iconfont nav_right">&#xe697;</i></a>
    <ul class="sub-menu">
        <li><a href="${contextPath}/fukuanfangshiAdd.jsp" target="hsgmain">支付方式添加</a></li>
        <li><a href="${contextPath}/fukuanfangshiMana" target="hsgmain">支付方式查询</a></li>

    </ul>
</li>

<li class="list">
    <a href="javascript:;"><i class="iconfont">&#xe70b;</i>系统管理<i class="iconfont nav_right">&#xe697;</i></a>
    <ul class="sub-menu">
        <li><a href="${contextPath}/lianjieAdd.jsp" target="hsgmain">友情链接添加</a></li>
        <li><a href="${contextPath}/lianjieMana" target="hsgmain">友情链接查询</a></li>

        <li><a href="${contextPath}/dxAdd.jsp" target="hsgmain">介绍添加</a></li>
        <li><a href="${contextPath}/dxMana" target="hsgmain">介绍查询</a></li>

        <li><a href="${contextPath}/liuyanMana" target="hsgmain">留言查询</a></li>

    </ul>
</li>


