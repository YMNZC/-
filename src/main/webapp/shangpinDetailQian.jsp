<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品详情</title>
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
        .all{
            width: 100%;
            height: 810px;
            padding-bottom: 50px;
            margin-top: -80px;
            margin-bottom: 1px;
        }
        .all .content{
            margin-top: 0px;
            float: left;
        }
        #content{
            /* 	border: 1px solid red; */
            width: 1200px;
            margin-top: -80px;
            margin: auto;
        }
        #content .a1{
            float: left;
            margin-left: 10px;
        }
        #content .a1 .big{
            /* float: left; */
            width: 450px;
            height: 400px;
        }
        #content .a11 ul li{
            list-style: none;
            float: left;
            margin: 20px 15px;
        }
        .a11 ul li img{
            border: 3px white solid;
            width: 80px;
            height: 80px;
        }
        .a11 ul li img:hover{
            border: 3px #FF4F0D solid;
        }
        .a2{
            float: left;
            margin-left: 90px;
        }
        .a21 .color{
            color: #758188;
        }
        .a21 .a211{
            background-color: #F2F5F8;
            color: #758188;
        }
        .a21 .a211 .prices,.shic{
            margin-left: 40px;
        }
        .a21 .a211 .prices{
            color: #FF4F0D;
            font-size: 35px;
            font-weight: bold;
        }
        .a21 .a211 .prices2{
            text-decoration: line-through;
        }
        .a21 .a211 .yis{
            margin-left: 230px;
        }
        .a22{
            background-color: #F6F9FB;
        }
        .a22 span,p{
            margin-top: 10px;
        }
        .a22 .neir{
            margin-left: 50px;
        }
        .a23{
            margin-top: 10px;
        }
        .a25{
            margin-top: 30px;
        }
        .a25 input{
            display: inline-block;
            width: 100px;
            height: 60px;
            border-radius: 30px;
            margin-left: 20px;
        }
        .a25 .a25color1{
            background-color: #FFEEE8;
            color: #FF4F0D;
            font-size: 20px;
            font-weight: bolder;
            border: 1px #FF4F0D solid;
        }
        .a25 .a25color2{
            background-color: #FF4F0D;
            color: white;
            font-size: 20px;
            font-weight: bolder;
            border: 1px #FF4F0D solid;
        }
        .m{
            margin-top: 50px;
        }
    </style>
    <script language="javascript">
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //立即购买
        function goDingdanAddQian() {
            var url = "${contextPath}/dingdanAddQian.jsp?jine=${shangpin.jiage}&shangpinid=${shangpin.id}";
            window.location.href = url;
        }
        //跳转到子表dingdanxiang添加页面
        function shangpindingdanxiangAddQian(id) {
            var url="${contextPath}/shangpindingdanxiangAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function shangpindingdanxiangGetByshangpinidQian(id) {
            var url="${contextPath}/shangpindingdanxiangGetByshangpinidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche添加页面
        function shangpingouwucheAddQian(id) {
            var url="${contextPath}/shangpingouwucheAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche查看页面
        function shangpingouwucheGetByshangpinidQian(id) {
            var url="${contextPath}/shangpingouwucheGetByshangpinidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia添加页面
        function shangpinpingjiaAddQian(id) {
            var url="${contextPath}/shangpinpingjiaAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia查看页面
        function shangpinpingjiaGetByshangpinidQian(id) {
            var url="${contextPath}/shangpinpingjiaGetByshangpinidQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang添加页面
        function shangpinshoucangAddQian(id) {
            var url="${contextPath}/shangpinshoucangAddQian/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang查看页面
        function shangpinshoucangGetByshangpinidQian(id) {
            var url="${contextPath}/shangpinshoucangGetByshangpinidQian/"+id;
            window.location.href=url;
        }

    </script>
</head>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">商品详情</h2>
        <p class="t_en"></p>
<div id="all" class="m">
    <div style="clear: both;"></div>
    <div id="content">
        <div class="a1">
            <img src="${contextPath}/${shangpin.image}" onerror="this.src='${staticPath}/images/zanwu.jpg'" class="big"/>
        </div>
        <div class="a2">
            <h2>${shangpin.mingcheng }</h2>
            <div class="a21">
                <div class="a211">
                    <span class="color">售价</span>
                    <span class="prices">￥${shangpin.yuanshijiage }</span>
                    <span class="yis">已售${shangpin.xiaoshoushuliang }件</span>
                </div>
                <div class="a22">
                    <p></p>
                    <span class="color">分类</span>
                    <span class="neir"> ${shangpin.zhonglei.mingcheng}</span>
                    <p></p>
                    <span class="color">编号</span>
                    <span class="neir">${shangpin.bianhao }</span>
                    <p></p>
                    <span class="color">内容介绍</span>
                    <span class="neir"> ${shangpin.neirong }</span>
                    <p></p>
                    <span class="color">库存数量</span>
                    <span class="neir">${shangpin.kucunshuliang }</span>
                </div>
                <div class="a23">
                    <p></p>
                    <span class="color">配送说明</span>
                    <p>北京、上海、广州、深圳、天津、重庆、南京、长沙</p>
                    <span class="color">配送至</span>
                    <p>郑州</p>
                    <span class="color">说明</span>
                    <p>深圳大鹏新区暂不配送</p>
                </div>
                <div class="a25">
                            <input type="button" value="立即购买"  onClick="goDingdanAddQian();" />
                            <input type="button" value="购物车添加" onclick="shangpingouwucheAddQian(${shangpin.id})"/>
                            <input type="button" value="商品评价查看" onclick="shangpinpingjiaGetByshangpinidQian(${shangpin.id})"/>
                            <input type="button" value="商品收藏添加" onclick="shangpinshoucangAddQian(${shangpin.id})"/>
                            <input type=button name=Submit5 value=返回 onClick="javascript:history.back()"/>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both;"></div>
</div>
    </div>
</div>
<%@ include file="kefutiao.jsp"%>
</body>
</html>



