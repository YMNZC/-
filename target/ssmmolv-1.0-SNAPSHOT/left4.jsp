<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>


<h5 class="sidenav-heading">系统菜单</h5>
<ul id="side-main-menu" class="side-menu list-unstyled">


    <li><a href="#ww1" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>用户管理 </a>
        <ul id="ww1" class="collapse list-unstyled ">
            <li><a href="usersAdd.jsp" target="hsgmain">用户添加</a></li>
            <li><a href="usersMana.action" target="hsgmain">用户查询</a></li>

            <li><a href="userPw.jsp" target="hsgmain">修改密码</a></li>
            <li><a href="usersSet2.jsp" target="hsgmain">修改资料</a></li>

        </ul>
    </li>
    <li><a href="#ww12" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>轮播图管理 </a>
        <ul id="ww12" class="collapse list-unstyled ">

            <li><a href="lunboAdd.jsp" target="hsgmain">轮播图添加</a></li>
            <li><a href="lunboMana.action" target="hsgmain">轮播图查询</a></li>
        </ul>
    </li>
    <li><a href="#ww2" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>公告管理 </a>
        <ul id="ww2" class="collapse list-unstyled ">
            <li><a href="gonggaoAdd.jsp" target="hsgmain">公告添加</a></li>
            <li><a href="gonggaoMana.action" target="hsgmain">公告查询</a></li>

        </ul>
    </li>
    <li><a href="#ww3" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>商品管理 </a>
        <ul id="ww3" class="collapse list-unstyled ">

            <li><a href="leibieAdd.jsp" target="hsgmain">类别添加</a></li>
            <li><a href="leibieMana.action" target="hsgmain">类别查询</a></li>

            <li><a href="shangpinAdd.jsp" target="hsgmain">商品添加</a></li>
            <li><a href="shangpinMana.action" target="hsgmain">商品查询</a></li>

            <li><a href="shoucangMana.action" target="hsgmain">收藏查询</a></li>
            <li><a href="chanpinpingjiaMana.action" target="hsgmain">评论查询</a></li>

        </ul>
    </li>
    <li><a href="#ww4" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>订单管理 </a>
        <ul id="ww4" class="collapse list-unstyled ">
            <%--<li><a href="dingdanAdd.jsp" target="hsgmain">订单添加</a></li>--%>
            <li><a href="dingdanMana.action" target="hsgmain">订单查询</a></li>

        </ul>
    </li>
    <li><a href="#ww5" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>支付方式管理 </a>
        <ul id="ww5" class="collapse list-unstyled ">
            <li><a href="zhifufangshiAdd.jsp" target="hsgmain">支付方式添加</a></li>
            <li><a href="zhifufangshiMana.action" target="hsgmain">支付方式查询</a></li>

        </ul>
    </li>

    <li><a href="#ww6" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>售后管理 </a>
        <ul id="ww6" class="collapse list-unstyled ">
            <%--<li><a href="shouhouAdd.jsp" target="hsgmain">售后添加</a></li>--%>
            <li><a href="shouhouMana.action" target="hsgmain">售后查询</a></li>

        </ul>
    </li>

    <%--<li><a href="#ww61" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>售后管理 </a>
        <ul id="ww61" class="collapse list-unstyled ">
            <li><a href="usersAdd.jsp" target="hsgmain">售后添加</a></li>
            <li><a href="usersMana.action" target="hsgmain">售后查询</a></li>

        </ul>
    </li>


    <li><a href="#ww9" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>售后管理 </a>
        <ul id="ww9" class="collapse list-unstyled ">
            <li><a href="usersAdd.jsp" target="hsgmain">用户添加</a></li>
            <li><a href="usersMana.action" target="hsgmain">用户查询</a></li>

        </ul>
    </li>
    <li><a href="#ww10" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>借阅管理 </a>
        <ul id="ww10" class="collapse list-unstyled ">
            <li><a href="usersAdd.jsp" target="hsgmain">售后添加</a></li>
            <li><a href="usersMana.action" target="hsgmain">售后查询</a></li>

        </ul>
    </li>
    <li><a href="#ww11" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>还书管理 </a>
        <ul id="ww11" class="collapse list-unstyled ">

            <li><a href="usersAdd.jsp" target="hsgmain">用户添加</a></li>
            <li><a href="usersMana.action" target="hsgmain">用户查询</a></li>

        </ul>
    </li>--%>

    <li><a href="#ww111" aria-expanded="false" data-toggle="collapse"> <i class="icon-interface-windows"></i>系统管理 </a>
        <ul id="ww111" class="collapse list-unstyled ">

            <li><a href="lianjieAdd.jsp" target="hsgmain">友情连接添加</a></li>
            <li><a href="lianjieMana.action" target="hsgmain">友情连接查询</a></li>

            <li><a href="dxAdd.jsp" target="hsgmain">介绍添加</a></li>
            <li><a href="dxMana.action" target="hsgmain">介绍查询</a></li>

            <%--<li><a href="liuyanAdd.jsp" target="hsgmain">留言添加</a></li>--%>
            <li><a href="liuyanMana.action" target="hsgmain">留言查询</a></li>

        </ul>
    </li>


</ul>
</div>

