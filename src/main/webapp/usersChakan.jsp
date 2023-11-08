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
    <title>用户查看列表</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <script type="text/javascript">
        //导出信息
        function daochu() {
            var url = "${contextPath}/usersChakan?d=1";
            window.location.href=url;
        }
        //删除信息
        function usersDel(id) {
            if (confirm('您确定删除吗?')) {
                $.get(basePath + '/usersDel/' + id, function (resp) {
                    if (resp.success) {
                        alert("删除成功！");
                        //window.location.href = "${contextPath}/usersChankan";
                        document.formSearch.submit();
                        return;
                    } else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到信息修改页
        function usersGet(id) {
            window.location.href = "${contextPath}/usersGet/" + id;
        }

        //跳转到信息详细页
        function usersDetail(id) {
            window.location.href = "${contextPath}/usersDetail/" + id;
        }

        //附件下载
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //更新信息
        function usersSet(id,property,value) {
            if (confirm('您确定操作吗?')) {
                var param = {};
                param["id"]=id;
                param[property]=value;
                $.post(basePath + '/usersSet', param, function(resp) {
                    if (resp.success) {
                        alert("操作成功！");
                        //window.location.href = "${contextPath}/usersChankan";
                        document.formSearch.submit();
                        return;
                    }else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到子表dingdan添加页面
        function usersdingdanAdd(id) {
            var url="${contextPath}/usersdingdanAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdan查看页面
        function usersdingdanGetByusersid(id) {
            var url="${contextPath}/usersdingdanGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang添加页面
        function usersdingdanxiangAdd(id) {
            var url="${contextPath}/usersdingdanxiangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function usersdingdanxiangGetByusersid(id) {
            var url="${contextPath}/usersdingdanxiangGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche添加页面
        function usersgouwucheAdd(id) {
            var url="${contextPath}/usersgouwucheAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche查看页面
        function usersgouwucheGetByusersid(id) {
            var url="${contextPath}/usersgouwucheGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表liuyan添加页面
        function usersliuyanAdd(id) {
            var url="${contextPath}/usersliuyanAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表liuyan查看页面
        function usersliuyanGetByusersid(id) {
            var url="${contextPath}/usersliuyanGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia添加页面
        function userspingjiaAdd(id) {
            var url="${contextPath}/userspingjiaAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia查看页面
        function userspingjiaGetByusersid(id) {
            var url="${contextPath}/userspingjiaGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表shangpin添加页面
        function usersshangpinAdd(id) {
            var url="${contextPath}/usersshangpinAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表shangpin查看页面
        function usersshangpinGetByusersid(id) {
            var url="${contextPath}/usersshangpinGetByusersid/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang添加页面
        function usersshoucangAdd(id) {
            var url="${contextPath}/usersshoucangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang查看页面
        function usersshoucangGetByusersid(id) {
            var url="${contextPath}/usersshoucangGetByusersid/"+id;
            window.location.href=url;
        }


    </script>
</head>
<body leftmargin="2" topmargin="2">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px"
       bordercolor="#008080">
    <form action="${contextPath}/usersChakan" name="formSearch" id="formSearch" method="post">
        <div>
        用户名称:<input type="text" name="loginname" id="loginname" size="15px" value="${req.loginname}"/>&nbsp;&nbsp;
        类型:<input type="text" name="type" id="type" size="15px" value="${req.type}"/>&nbsp;&nbsp;
        类型名称:<input type="text" name="typename" id="typename" size="15px" value="${req.typename}"/>&nbsp;&nbsp;
        姓名:<input type="text" name="xingming" id="xingming" size="15px" value="${req.xingming}"/>&nbsp;&nbsp;
        性别:
        <select name="xingbie" id="xingbie">
            <option value="">全部</option>
            <option value="男" <c:if test="${req.xingbie == '男'}">selected</c:if>>男</option>
            <option value="女" <c:if test="${req.xingbie == '女'}">selected</c:if>>女</option>
        </select>&nbsp;&nbsp;
        年龄:<input type="text" name="nianling" id="nianling" size="15px" value="${req.nianling}"/>&nbsp;&nbsp;
        地址:<input type="text" name="address" id="address" size="15px" value="${req.address}"/>&nbsp;&nbsp;
        电话:<input type="text" name="dianhua" id="dianhua" size="15px" value="${req.dianhua}"/>&nbsp;&nbsp;
        审核:
        <select name="shenhe" id="shenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.shenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.shenhe == 'no'}">selected</c:if>>no</option>
        </select>&nbsp;&nbsp;

            <input type="submit" value="搜索"/>
        </div>
    </form>
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="100" background="${staticPath}/images/tbg.gif">用户查看</td>
    </tr>
    <tr align="center" bgcolor="#C0C0C0" height="22">
        <td width="2%">序号</td>
        <td width="4%">用户名称</td>
        <td width="4%">密码</td>
        <td width="4%">类型</td>
        <td width="4%">类型名称</td>
        <td width="5%">姓名</td>
        <td width="4%">性别</td>
        <td width="5%">年龄</td>
        <td width="5%">地址</td>
        <td width="4%">电话</td>
        <td width="4%">审核</td>

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
                    <c:when test="${fn:length(info.loginname)>'16'}">
                        ${fn:substring(info.loginname,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.loginname}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.loginpw)>'16'}">
                        ${fn:substring(info.loginpw,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.loginpw}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.type)>'16'}">
                        ${fn:substring(info.type,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.type}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.typename)>'16'}">
                        ${fn:substring(info.typename,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.typename}
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
                    <c:when test="${fn:length(info.xingbie)>'16'}">
                        ${fn:substring(info.xingbie,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.xingbie}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.nianling)>'16'}">
                        ${fn:substring(info.nianling,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.nianling}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.address)>'16'}">
                        ${fn:substring(info.address,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.address}
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
                    <c:when test="${fn:length(info.shenhe)>'16'}">
                        ${fn:substring(info.shenhe,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.shenhe}
                    </c:otherwise>
                </c:choose>
            </td>

            <td bgcolor="#FFFFFF" align="center">
<%--
            <c:choose>
                <c:when test="${info.shenhe=='no'}">
                <input type="button" value="审核" onclick="usersSet(${info.id},'shenhe','yes')"/>
                </c:when>
                <c:otherwise>
                <input type="button" value="取消" onclick="usersSet(${info.id},'shenhe','no')"/>
                </c:otherwise>
            </c:choose>
 --%>

<%--                <input type="button" value="修改" onclick="usersGet(${info.id})"/>--%>
                <input type="button" value="详情" onclick="usersDetail(${info.id})"/>
<%--                <input type="button" value="删除" onclick="usersDel(${info.id})"/>--%>
                    <%--sonTable本表子表管理--%>
                <%--<input type="button" value="用户订单查看" onclick="usersdingdanGetByusersid(${info.id})"/>--%>
                <%--<input type="button" value="用户订单添加" onclick="usersdingdanAdd(${info.id})"/>--%>
                <%--<input type="button" value="用户订单项查看" onclick="usersdingdanxiangGetByusersid(${info.id})"/>--%>
                <%--<input type="button" value="用户订单项添加" onclick="usersdingdanxiangAdd(${info.id})"/>--%>
                <%--<input type="button" value="用户购物车查看" onclick="usersgouwucheGetByusersid(${info.id})"/>--%>
                <%--<input type="button" value="用户购物车添加" onclick="usersgouwucheAdd(${info.id})"/>--%>
                <%--<input type="button" value="用户留言反馈查看" onclick="usersliuyanGetByusersid(${info.id})"/>--%>
                <%--<input type="button" value="用户留言反馈添加" onclick="usersliuyanAdd(${info.id})"/>--%>
                <%--<input type="button" value="用户商品评价查看" onclick="userspingjiaGetByusersid(${info.id})"/>--%>
                <%--<input type="button" value="用户商品评价添加" onclick="userspingjiaAdd(${info.id})"/>--%>
                <%--<input type="button" value="用户商品查看" onclick="usersshangpinGetByusersid(${info.id})"/>--%>
                <%--<input type="button" value="用户商品添加" onclick="usersshangpinAdd(${info.id})"/>--%>
                <%--<input type="button" value="用户商品收藏查看" onclick="usersshoucangGetByusersid(${info.id})"/>--%>
                <%--<input type="button" value="用户商品收藏添加" onclick="usersshoucangAdd(${info.id})"/>--%>

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
