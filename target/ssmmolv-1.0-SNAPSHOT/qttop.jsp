<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<div class="header">
    <div class="top_bar">
        <div class="w1200">
            <div style="font-size: 25px;color: #ffffff;float: left;">欢迎进入！<a href="#"> <span style="font-size: 35px;color: #974df1">网络购物商城 </span>
            </a></div>

            <div style=" float: left; margin-left: 10px; " class="dd">
                <c:if test="${sessionScope.user==null}">
                    <a href="${contextPath}/userlog.jsp" style="cursor:pointer;">登录</a> &nbsp;&nbsp;<a
                    href="${contextPath}/usersAddQian.jsp" style="cursor:pointer;">注册</a>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    ${sessionScope.user.loginname},[${sessionScope.user.typename}]&nbsp;
                    <a href="${contextPath}/userlogout.jsp" onclick="return confirm('确定要退出？')">退出</a>&nbsp;&nbsp;<a
                    href="${contextPath}/main.jsp">个人信息</a>
                </c:if>
            </div>
            <ul class="fr">
                <li class="wx"><a href="javascript:;">官方微信</a>
                    <div class="wxerweima">
                        <img src="static/img/二维码.png" />
                    </div></li>
                <li><a href="#">官方微博</a></li>
            </ul>
        </div>
    </div>
<%--    <div class="top">--%>
<%--        <div class="w1200">--%>
<%--            <div class="logo fl">--%>
<%--                <a href="#"> <span style="font-size: 35px;color: #974df1">网络购物商城 </span>--%>
<%--                </a>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
    <div class="nav">
        <div class="w1200">
            <ul>
                <li><a href="${contextPath}/default.jsp">网站首页</a></li>

                <li><a href='${contextPath}/gonggaoManaQiantp'>公告</a></li>

                <li><a href="">商品信息</a>
                    <div class="sub_nav">
                        <ul>
                            <li><a href='${contextPath}/shangpinManaQiantp'>新品上架</a>
                            </li>
                            <li><a href='${contextPath}/shangpinManaQianSort'>热销商品</a>
                            </li>
                        </ul>
                    </div>
                </li>
                </li>
                <li><a href="${contextPath}/gouwucheManaMyQian" style="cursor:pointer">购物车</a></li>
                <li><a href="">在线留言</a>
                    <div class="sub_nav">
                        <ul>
                            <li><a href='${contextPath}/liuyanAddQian.jsp'>我要留言</a>
                            </li>
                            <li><a href='${contextPath}/liuyanManaQian'>留言信息</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <!--yoxulixuyaxn-->
                <li><a href="${contextPath}/login.jsp">个人信息</a>
                </li>
                <li><a href='${contextPath}/dxManaQian'>介绍</a></li>
            </ul>
        </div>

    </div>
</div>
<div class="go-top">
    <a href="${contextPath}/gouwucheManaMyQian" style="cursor:pointer">
    <img src="static/qtimages/images/R-C.png" alt="" height="60px" width="60px">
    </a>
</div>
<style>
    .go-top {
        z-index: 2;
        position: fixed; /* 设置fixed固定定位 */
        bottom: 200px; /* 距离浏览器窗口下边框20px */
        right: 60px; /* 距离浏览器窗口右边框20px */
        transform: rotateY(180deg);
        background-size:100% 100%;
        width: 60px;
        height: 60px;
        transition: all 0.5s;
    }
    .go-top a {
        display: block;          /* 将<a>标签设为块元素，用于美化样式 */
        text-decoration: none;    /* 取消超链接下画线 */
        border: 1px solid #ccc;       /* 设置边框样式 */
        padding: 0px;        /* 设置内边距 */
        border-radius: 5px;          /* 设置圆角矩形 */
    }
    .go-top a:hover{
        background-color: mediumslateblue;
        transform: rotateY(0deg);
        bottom: 210px;
    }

</style>