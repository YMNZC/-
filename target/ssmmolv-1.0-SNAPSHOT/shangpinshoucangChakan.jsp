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
    <title>商品收藏查看列表</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <script type="text/javascript">
        //导出信息
        function daochu() {
            var url = "${contextPath}/shoucangChakan?d=1";
            window.location.href=url;
        }
        //删除信息
        function shoucangDel(id) {
            if (confirm('您确定删除吗?')) {
                $.get(basePath + '/shoucangDel/' + id, function (resp) {
                    if (resp.success) {
                        alert("删除成功！");
                        //window.location.href = "${contextPath}/shoucangChankan";
                        document.formSearch.submit();
                        return;
                    } else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到信息修改页
        function shoucangGet(id) {
            window.location.href = "${contextPath}/shoucangGet/" + id;
        }

        //跳转到信息详细页
        function shoucangDetail(id) {
            window.location.href = "${contextPath}/shoucangDetail/" + id;
        }

        //附件下载
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //更新信息
        function shoucangSet(id,property,value) {
            if (confirm('您确定操作吗?')) {
                var param = {};
                param["id"]=id;
                param[property]=value;
                $.post(basePath + '/shoucangSet', param, function(resp) {
                    if (resp.success) {
                        alert("操作成功！");
                        //window.location.href = "${contextPath}/shoucangChankan";
                        document.formSearch.submit();
                        return;
                    }else {
                        alert(resp.message);
                    }
                })
            }
        }



    </script>
</head>
<body leftmargin="2" topmargin="2">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px"
       bordercolor="#008080">
    <form action="${contextPath}/shoucangChakan" name="formSearch" id="formSearch" method="post">
        <div style="display: none">
        商品:
        <select name="shangpinid" id="shangpinid">
            <option value="">全部</option>
            <c:forEach items="${shangpinList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.shangpinid}">
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
<%--        用户:
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
        </select>&nbsp;&nbsp;--%>

            <input type="submit" value="搜索"/>
        </div>
    </form>
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="100" background="${staticPath}/images/tbg.gif">商品收藏查看</td>
    </tr>
    <tr align="center" bgcolor="#C0C0C0" height="22">
        <td width="2%">序号</td>
        <td width="5%">收藏时间</td>
        <td width="4%">商品</td>
        <td width="4%">用户</td>

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
                    <c:when test="${fn:length(info.shangpin.mingcheng)>'16'}">
                        ${fn:substring(info.shangpin.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shangpin.mingcheng}
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

<%--                <input type="button" value="修改" onclick="shoucangGet(${info.id})"/>--%>
                <input type="button" value="详情" onclick="shoucangDetail(${info.id})"/>
<%--                <input type="button" value="删除" onclick="shoucangDel(${info.id})"/>--%>
                    <%--sonTable本表子表管理--%>

            </td>
        </tr>
    </c:forEach>
</table>
<%@include file="common/fenye.jsp" %>
<table width='98%' border='0' style="margin-top:8px;margin-left: 8px;">
    <tr>
        <td>
            <%--<input type="button" value="导出"  onclick="daochu();" />--%>
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
