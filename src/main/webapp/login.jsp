<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>后台登陆</title>
    <%@include file="common/head.jsp" %>

    <link rel="shortcut icon" href="${staticPath}/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${staticPath}/images/css/font.css">
    <link rel="stylesheet" href="${staticPath}/images/css/xadmin.css">
    <link rel="stylesheet" href="${staticPath}/images/hsg3.css">
    <script type="text/javascript" src="${staticPath}/images/hsg1.js"></script>
    <script type="text/javascript" src="${staticPath}/images/hsg2.js"></script>
    <script src="${staticPath}/images/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${staticPath}/images/js/xadmin.js"></script>
</head>

<script type="text/javascript">

    <c:if test="${sessionScope.user!=null}">
    window.location.href = "${contextPath}/main.jsp";
    </c:if>

    function login() {
        var loginname = $("#loginname").length > 0 ? $('#loginname').val().trim():null;
        var loginpw = $('#loginpw').length > 0 ? $('#loginpw').val().trim():null;
        var captcha = $('#captcha').length > 0 ? $('#captcha').val().trim():null;
        var type = $('#type').length > 0 ? $('#type').val().trim():null;
        if ($("#loginname").length > 0 && loginname == "") {
            alert("请输入用户名");
            $('#loginname').focus();
            return false;
        }
        if ($("#loginpw").length > 0 && loginpw == "") {
            alert("请输入密码");
            $('#loginpw').focus();
            return false;
        }
        if ($("#captcha").length > 0 && captcha == "") {
            alert("请输入验证码");
            $('#captcha').focus();
            return false;
        }

        var param = {
            loginname: loginname,
            loginpw: loginpw,
            type: type,
            captcha: captcha
        };
        $.ajax({
            type: 'post',
            url: '${basePath}/login',
            data: param,
            dataType: "json",
            success: function (resp) {
                if (resp.success) {
                    alert("登陆成功！");
                    window.location.href = "${contextPath}/main.jsp";
                } else {
                    alert(resp.message);
                }
            }
        });
    }

    function loadimage() {
        document.getElementById("randImage").src = "${contextPath}/captcha?" + Math.random();
    }

</script>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" background="${staticPath}/images/img/login.png">
<div class="login-logo"><h1>后台登录</h1></div>
<div class="login-box">
    <form action="" method="post" name="form1" style="display: inline"
          class="layui-form layui-form-pane">
        <h3>登录你的帐号</h3>
        <label class="login-title" for="username">帐号</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe6b8;</i></label>
            <div class="layui-input-inline login-inline">
                <input type="text" id="loginname" name="loginname" lay-verify="required" placeholder="请输入你的帐号"
                       autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <label class="login-title" for="password">密码</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe82b;</i></label>
            <div class="layui-input-inline login-inline">
                <input type="password" id="loginpw" name="loginpw" placeholder="请输入你的密码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <label class="login-title" for="password">权限</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe6b8;</i></label>
            <div class="layui-input-inline login-inline">
                <select name="type" id="type">

                    <option value="0">管理员</option>
                    <option value="1">商家</option>
                    <option value="2">用户</option>

                </select>
            </div>
        </div>
        <label class="login-title" for="password">验证码</label>
        <div class="layui-form-item">
            <label class="layui-form-label login-form"><i class="iconfont">&#xe6b8;</i></label>
            <div class="layui-input-inline login-inline">

                <table width="100%" border="0">
                    <tr>
                        <td>
                            <input type="text" id="captcha" name="captcha" placeholder="验证码" autocomplete="off"
                                   class="layui-input" style="width:100px;">
                        </td>
                        <td>
                            <a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage"
                                                                   id="randImage"
                                                                   src="${contextPath}/captcha"
                                                                   width="60"
                                                                   height="20" border="1" align="absmiddle">
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="form-actions">
            <input type="button" name="Submit" value="登陆" class="btn btn-warning pull-right" onClick="login();">

            <%--<div class="forgot"><a href="#" class="forgot">忘记帐号或者密码</a></div>--%>
        </div>
    </form>
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
    <div id="changer-set"><i class="iconfont">&#xe696;</i></div>
</div>
<%--<script>--%>
<%--  $(function () {--%>
<%--    layui.use('form', function () {--%>
<%--      var form = layui.form();--%>
<%--      //监听提交--%>
<%--      form.on('submit(login)', function (data) {--%>
<%--        layer.msg(JSON.stringify(data.field), function () {--%>
<%--          location.href = 'index.html'--%>
<%--        });--%>
<%--        return false;--%>
<%--      });--%>
<%--    });--%>
<%--  })--%>

<%--</script>--%>

</body>
</html>
