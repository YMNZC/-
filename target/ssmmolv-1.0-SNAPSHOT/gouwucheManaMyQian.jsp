<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>我的购物车</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
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
    <script type="text/javascript" src="${staticPath}/js/popup.js"></script>
    <script type="text/javascript">
        //删除信息
        function gouwucheDel(id) {
            if (confirm('您确定删除吗?')) {
                $.get(basePath + '/gouwucheDel/' + id, function (resp) {
                    if (resp.success) {
                        alert("删除成功！");
                        window.location.href = "${contextPath}/gouwucheManaMyQian";
                        return;
                    } else {
                        alert(resp.message);
                    }
                })
            }
        }
        //提交订单
        function goDingdanAddQian() {
            var totalAmount=parseInt($("#strongTotalAmount").text());
            var url = "${contextPath}/dingdanAddQian.jsp?jine="+totalAmount;

            if (totalAmount == 0){
                alert("请先添加商品到购物车再提交订单");
                return false;
            }

            var param = [];
            jQuery("#tbList tr").not(':eq(0)').each(function (i) {
                param.push({ "id": $("#id"+i).val(), "goumaishuliang": $("#goumaishuliang"+i).val()});
            });
            $.ajax({
                url: basePath + '/submitDingdan',
                data: JSON.stringify(param),
                type: "POST",
                contentType: "application/json;charset=UTF-8",
                success: function (resp) {
                    if (resp.success) {
                        window.location.href = url;
                        return;
                    }else {
                        alert(resp.message);
                    }
                }
            });
        }

        function getElementByAttr(tag, attr, value) {
            var aElements = document.getElementsByTagName(tag);
            var aEle = [];
            for (var i = 0; i < aElements.length; i++) {
                if (aElements[i].getAttribute(attr) == value)
                    aEle.push(aElements[i]);
            }
            return aEle;
        }

        window.onload = function () {
            var box = getElementByAttr("td", "data-box", "buy");
            for (var i = 0; i < box.length; i++) {
                calculate(box[i]);

            }
        }

        function calculate(box) {
            var oBtn = box.getElementsByTagName("button");
            var ipt = box.getElementsByTagName("input")[0];
            var jiage = parseInt(box.getElementsByTagName("input")[1].value);
            var number = parseInt(ipt.value);

            oBtn[0].onclick = function () {
                var totalAmount = parseInt($("#strongTotalAmount").text());
                var pop=new Popup({ contentType:4,isReloadOnClose:false,width:250,height:100});
                number--;
                if (number < ipt.min) {
                    //alert("购买数量不能少于" + ipt.min);
                    pop.setContent("title","温馨提示");
                    pop.setContent("alertCon","购买数量不能少于<strong style=\"color: red;\" >" + ipt.min + "</strong>");
                    pop.build();
                    pop.show();
                    number = ipt.min;
                    return;
                }
                ipt.value = number;
                totalAmount = totalAmount - jiage;
                $("#strongTotalAmount").html(totalAmount + "元");
            }
            oBtn[1].onclick = function () {
                var totalAmount = parseInt($("#strongTotalAmount").text());
                var pop=new Popup({ contentType:4,isReloadOnClose:false,width:250,height:100});
                number++;
                if (number > ipt.max) {
                    //alert("购买数量不能超过库存数量" + ipt.max);
                    pop.setContent("title","温馨提示");
                    pop.setContent("alertCon","购买数量不能超过库存数量<strong style=\"color: red;\" >" + ipt.max + "</strong>");
                    pop.build();
                    pop.show();
                    number = ipt.max;
                    return;
                }
                ipt.value = number;
                totalAmount = totalAmount + jiage;
                $("#strongTotalAmount").html(totalAmount + "元");
            }
        }
    </script>
</head>
<script type="text/javascript">
    //附件下载
    function down(fujianPath) {
        var url = "${contextPath}/common/download?filename=" + fujianPath;
        url = encodeURI(url);
        window.open(url, "_self");
    }
</script>
<body style="padding-top:220px;">
<%@ include file="qttop.jsp"%>
<%@ include file="bht.jsp"%>
<div class="index_about index">
    <div class="w1200">
        <h2 class="t">购物车</h2>
        <p class="t_en"></p>
        <div class="desc">
            <form name="formSearch" id="formSearch" method="post" action="${contextPath}/gouwucheManaMyQian" style="width:100%">
            </form>
            <table id="tbList" width="100%" border="0" align="center" cellpadding="3"
                   cellspacing="1" bordercolor="00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <tr>
                    <td width="30" align="center" bgcolor="">序号</td>
                    <td bgcolor='' align="center" >图片</td>
        <td align="center">商品</td>
        <td align="center">商品数量</td>
        <td align="center">用户</td>

                    <td align="center">单价</td>
                    <td width="30" align="center" bgcolor="">操作</td>
                </tr>
                <c:forEach items="${pageInfo.records}" var="info" varStatus="s">
                    <tr>
                        <td width="40px" align="center">
                                ${s.index+1}
                            <input type="hidden" id="id${s.index}" nam="id${s.index}" value="${info.id}">
                        </td>
                        <td align="center">
                            <a href='${contextPath}/${info.shangpin.image}' target='_blank'>
                                <img src='${contextPath}/${info.shangpin.image}' width="88px" height="99px" border="0px" onerror="this.src='${staticPath}/images/zanwu.jpg'" />
                            </a>
                        </td>
                                    <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shangpin.mingcheng)>'16'}">
                        ${fn:substring(info.shangpin.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shangpin.mingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td align="center" data-box="buy">
                <button type="button" style="width: 30px;">-</button>
                <input pattern="[0-9]*" min="1" max="${info.shangpin.kucunshuliang}" style="width: 40px;text-align: center;" readonly="readonly" type="text" id="goumaishuliang${s.index}" name="goumaishuliang${s.index}" value="${info.goumaishuliang}" />
                <input type="hidden" id="jiage${s.index}" nam="jiage${s.index}" value="${info.shangpin.jiage}">
                <button type="button" style="width: 30px;">+</button>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.users.loginname)>'16'}">
                        ${fn:substring(info.users.loginname,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.users.loginname}
                    </c:otherwise>
                </c:choose>
            </td>

                        <td bgcolor="#FFFFFF" align="center">
                                ${info.shangpin.jiage}
                        </td>
                        <td width="40px" align="center">
                            <a onclick="gouwucheDel(${info.id});" href="javascript:void(0);">
                                删除
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <%@ include file="common/fenye.jsp"%>
            <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF"
                   style="border-collapse:collapse" class="newsline">
                <tr>
                    <td align="center" bgcolor="">
                        总金额：<strong style="color: red;" id="strongTotalAmount">${totalAmount}元</strong>
                        <input type="button" value="提交订单" style="width: 100px;" onClick="goDingdanAddQian();" />
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
