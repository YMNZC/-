<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<div class="header">
    <div class="top_bar">
        <div class="w1200">
            <div class="fl">欢迎进入！</div>
            <div style=" float: left; margin-left: 10px; " class="dd">
                <c:if test="${sessionScope.user==null}">
                    <a href="${contextPath}/userlog.jsp" style="cursor:pointer;">登录</a> &nbsp;&nbsp;<a
                    href="${contextPath}/usersAddQian.jsp" style="cursor:pointer;">注册</a>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    ${sessionScope.user.loginname},[${sessionScope.user.typename}]&nbsp;
                    <a href="${contextPath}/userlogout.jsp" onclick="return confirm('确定要退出？')">退出</a>&nbsp;&nbsp;<a
                    href="${contextPath}/main.jsp">后台</a>
                </c:if>
            </div>
            <%--<ul class="fr">
                <li class="wx"><a href="javascript:;">官方微信</a>
                    <div class="wxerweima">
                        <img src="qtimages/images/erweima.png" />
                    </div></li>
                <li><a href="#">官方微博</a>
                </li>
            </ul>--%>
        </div>
    </div>
    <div class="top">
        <div class="w1200">
            <div class="logo fl">
                <a href="#"> <span style="font-size: 35px;color: green">网络购物商城 </span><%--<img src="qtimages/images/logo.png" alt="" />--%>
                </a>
            </div>
            <!--		<div class="search fl">
                        <form action="news.jsp">
                            <input type="text" name="biaoti" id="biaoti" placeholder="请输入搜索内容"/>
                            <input type="submit" value=""/>
                        </form>
                    </div>-->
            <%--<div class="tel fr">400-800-8888</div>--%>
        </div>
    </div>
    <div class="nav">
        <div class="w1200">
            <ul>
                <li><a href="${contextPath}/default.jsp">网站首页</a></li>
                <li><a href='${contextPath}/dxManaQian'>介绍</a></li>
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
                <li><a href="${contextPath}/login.jsp">后台管理</a>
                </li>
            </ul>
        </div>
    </div>
</div>
