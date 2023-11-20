<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String d = request.getParameter("d");
    if (null != d && d.equals("1")) {
        response.setHeader("Content-disposition", "attachment; filename=daochu.xls");
    }
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单管理列表</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <script type="text/javascript">
        //导出信息
        function daochu() {
            var url = "${contextPath}/dingdanMana?d=1";
            window.location.href=url;
        }
        //删除信息
        function dingdanDel(id) {
            if (confirm('您确定删除吗?')) {
                $.get(basePath + '/dingdanDel/' + id, function (resp) {
                    if (resp.success) {
                        alert("删除成功！");
                        //window.location.href = "${contextPath}/dingdanMana";
                        document.formSearch.submit();
                        return;
                    } else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到信息修改页
        function dingdanGet(id) {
            window.location.href = "${contextPath}/dingdanGet/" + id;
        }

        //跳转到信息详细页
        function dingdanDetail(id) {
            window.location.href = "${contextPath}/dingdanDetail/" + id;
        }

        //附件下载
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //更新信息
        function dingdanSet(id,property,value) {
            if (confirm('您确定操作吗?')) {
                var param = {};
                param["id"]=id;
                param[property]=value;
                $.post(basePath + '/dingdanSet', param, function(resp) {
                    if (resp.success) {
                        alert("操作成功！");
                        //window.location.href = "${contextPath}/dingdanMana";
                        document.formSearch.submit();
                        return;
                    }else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到子表dingdanxiang添加页面
        function dingdandingdanxiangAdd(id) {
            var url="${contextPath}/dingdandingdanxiangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function dingdandingdanxiangGetBydingdanid(id) {
            var url="${contextPath}/dingdandingdanxiangGetBydingdanid/"+id;
            window.location.href=url;
        }


    </script>
</head>
<body leftmargin="2" topmargin="2">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px"
       bordercolor="#008080">
    <form action="${contextPath}/dingdanMana" name="formSearch" id="formSearch" method="post">
        编号:<input type="text" name="bianhao" id="bianhao" size="15px" value="${req.bianhao}"/>&nbsp;&nbsp;
        订单金额:<input type="text" name="jine" id="jine" size="15px" value="${req.jine}"/>&nbsp;&nbsp;
        是否支付:
        <select name="zhifushenhe" id="zhifushenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.zhifushenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.zhifushenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;
        是否发货:
        <select name="fahuoshenhe" id="fahuoshenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.fahuoshenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.fahuoshenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;
        是否收货:
        <select name="shouhuoshenhe" id="shouhuoshenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.shouhuoshenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.shouhuoshenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;
        付款方式:
        <select name="fukuanfangshiid" id="fukuanfangshiid">
            <option value="">全部</option>
            <c:forEach items="${fukuanfangshiList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.fukuanfangshiid}">
                        <option value="${s.id}" selected>
                                ${s.mingcheng }
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.id}">
                                ${s.mingcheng}
                        </option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>&nbsp;&nbsp;
        姓名:<input type="text" name="xingming" id="xingming" size="15px" value="${req.xingming}"/>&nbsp;&nbsp;
        电话:<input type="text" name="dianhua" id="dianhua" size="15px" value="${req.dianhua}"/>&nbsp;&nbsp;
        送货地址:<input type="text" name="dizhi" id="dizhi" size="15px" value="${req.dizhi}"/>&nbsp;&nbsp;
        商家:
<%--        <input type="text" name="shangjia" id="shangjia" size="15px" value="${req.shangjia}"/>&nbsp;&nbsp;--%>
        <select name="shangjia" id="shangjia" value="${req.shangjia}">
            <option value="">全部</option>
            <c:forEach items="${usersList}" var="s">
                <c:if test="${s.type=='1'}">
                <c:choose>
                    <c:when test="${s.id==req.shangjia}">
                        <option value="${s.id}" selected>
                                ${s.loginname }
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.id}">
                                ${s.loginname}
                        </option>
                    </c:otherwise>
                </c:choose>
                </c:if>
            </c:forEach>
        </select>&nbsp;
        用户:
        <select name="usersid" id="usersid">
            <option value="">全部</option>
            <c:forEach items="${usersList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.usersid}">
                        <option value="${s.id}" selected>
                                ${s.loginname }
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.id}">
                                ${s.loginname}
                        </option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>&nbsp;&nbsp;
        物流信息:<input type="text" name="wuliu" id="wuliu" size="15px" value="${req.wuliu}"/>&nbsp;&nbsp;
        备注:<input type="text" name="beizhu" id="beizhu" size="15px" value="${req.beizhu}"/>&nbsp;&nbsp;

        <input type="submit" value="搜索"/>
    </form>
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="100" background="${staticPath}/images/tbg.gif">订单管理</td>
    </tr>
    <tr align="center" bgcolor="#C0C0C0" height="22">
        <td width="2%">序号</td>
        <td width="5%">编号</td>
        <td width="5%">订单金额</td>
        <td width="4%">是否支付</td>
        <td width="4%">是否发货</td>
        <td width="4%">是否收货</td>
        <td width="4%">付款方式</td>
        <td width="5%">姓名</td>
        <td width="4%">电话</td>
        <td width="5%">送货地址</td>
        <td width="5%">商家</td>
        <td width="4%">用户</td>
        <td width="5%">时间</td>
        <td width="5%">物流信息</td>
        <td width="5%">备注</td>

        <td width="10%">操作</td>
    </tr>
    <c:forEach items="${pageInfo.records}" var="info" varStatus="s">
        <tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';"
            onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
            <td bgcolor="#FFFFFF" align="center">
                    ${s.index +1 }
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.bianhao)>'16'}">
                        ${fn:substring(info.bianhao,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.bianhao}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.jine}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.zhifushenhe)>'16'}">
                        ${fn:substring(info.zhifushenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.zhifushenhe}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.fahuoshenhe)>'16'}">
                        ${fn:substring(info.fahuoshenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.fahuoshenhe}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shouhuoshenhe)>'16'}">
                        ${fn:substring(info.shouhuoshenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shouhuoshenhe}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.fukuanfangshi.mingcheng)>'16'}">
                        ${fn:substring(info.fukuanfangshi.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.fukuanfangshi.mingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.xingming)>'16'}">
                        ${fn:substring(info.xingming,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.xingming}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.dianhua)>'16'}">
                        ${fn:substring(info.dianhua,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.dianhua}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.dizhi)>'16'}">
                        ${fn:substring(info.dizhi,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.dizhi}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.shangjia)>'16'}">
                        ${fn:substring(info.shangjia,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shangjia}
                    </c:otherwise>
                </c:choose>
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
                <c:choose>
                    <c:when test="${fn:length(info.shijian)>'16'}">
                        ${fn:substring(info.shijian,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shijian}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.wuliu)>'16'}">
                        ${fn:substring(info.wuliu,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.wuliu}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.beizhu)>'16'}">
                        ${fn:substring(info.beizhu,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.beizhu}
                    </c:otherwise>
                </c:choose>
            </td>

            <td bgcolor="#FFFFFF" align="center">
            <c:choose>
                <c:when test="${info.fahuoshenhe=='no'}">
                <input type="button" value="发货" onclick="dingdanSet(${info.id},'fahuoshenhe','yes')"/>
                </c:when>
                <c:otherwise>
                <input type="button" value="取消发货" onclick="dingdanSet(${info.id},'fahuoshenhe','no')"/>
                </c:otherwise>
            </c:choose>

                <input type="button" value="修改" onclick="dingdanGet(${info.id})"/>
                <input type="button" value="详情" onclick="dingdanDetail(${info.id})"/>
                <input type="button" value="删除" onclick="dingdanDel(${info.id})"/>
                    <%--sonTable本表子表管理--%>
                <input type="button" value="订单订单项查看" onclick="dingdandingdanxiangGetBydingdanid(${info.id})"/>
                <%--<input type="button" value="订单订单项添加" onclick="dingdandingdanxiangAdd(${info.id})"/>--%>

            </td>
        </tr>
    </c:forEach>
</table>
<%@include file="common/fenye.jsp" %>
<table width='98%' border='0' style="margin-top:8px;margin-left: 8px;">
    <tr>
        <td>
            总金额：<strong style="color: red;" id="strongTotalAmount">${totalAmount}元</strong>
            <input type="button" value="导出"  onclick="daochu();" />
            <%--<input type="button" value="打印"  onClick="javascript:window.print()" />--%>
            <input type="button" value="返回" style="width: 120px;" onClick="javascript:history.back()"/>
        </td>

    </tr>
</table>

<div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
    <TABLE id="tipTable" border="0" bgcolor="#ffffee">
        <TR align="center">
            <TD><img id="photo" src="" height="160" width="200"></TD>
        </TR>
    </TABLE>
</div>
</body>
</html>
