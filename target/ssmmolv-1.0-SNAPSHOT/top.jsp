<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a><a href="main.jsp" class="navbar-brand">
                  <div class="brand-text d-none d-md-inline-block"><span> </span><strong class="text-primary">${sessionScope.user.typename}中心</strong></div></a></div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
             
                <li class="nav-item dropdown"><a id="languages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link language "><%--<img src="images/img/flags/16/GB.png" alt="English">--%><span class="d-none d-sm-inline-block">当前用户：${sessionScope.user.loginname}   权限：${sessionScope.user.typename} </span></a>
                  <%--<ul aria-labelledby="languages" class="dropdown-menu">
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="images/img/flags/16/DE.png" alt="English" class="mr-2"><span>German</span></a></li>
                    <li><a rel="nofollow" href="#" class="dropdown-item"> <img src="images/img/flags/16/FR.png" alt="English" class="mr-2"><span>French                                                         </span></a></li>
                  </ul>--%>
                </li>
				<li class="nav-item"><a href="default.jsp"  class="nav-link logout"> <span class="d-none d-sm-inline-block">首页</span><i class="fa fa-sign-out"></i></a></li>
                <li class="nav-item"><a href="${contextPath}/logout.jsp" onclick="return confirm('确定要退出后台吗?');" class="nav-link logout"> <span class="d-none d-sm-inline-block">退出</span><i class="fa fa-sign-out"></i></a></li>
              </ul>
            </div>
          </div>
        </nav>
      </header>

