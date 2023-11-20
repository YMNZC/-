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
    <title>品牌管理列表</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <script type="text/javascript">
        //导出信息
        function daochu() {
            var url = "${contextPath}/pinpaiMana?d=1";
            window.location.href=url;
        }
        //删除信息
        function pinpaiDel(id) {
            if (confirm('您确定删除吗?')) {
                $.get(basePath + '/pinpaiDel/' + id, function (resp) {
                    if (resp.success) {
                        alert("删除成功！");
                        //window.location.href = "${contextPath}/pinpaiMana";
                        document.formSearch.submit();
                        return;
                    } else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到信息修改页
        function pinpaiGet(id) {
            window.location.href = "${contextPath}/pinpaiGet/" + id;
        }

        //跳转到信息详细页
        function pinpaiDetail(id) {
            window.location.href = "${contextPath}/pinpaiDetail/" + id;
        }

        //附件下载
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //更新信息
        function pinpaiSet(id,property,value) {
            if (confirm('您确定操作吗?')) {
                var param = {};
                param["id"]=id;
                param[property]=value;
                $.post(basePath + '/pinpaiSet', param, function(resp) {
                    if (resp.success) {
                        alert("操作成功！");
                        //window.location.href = "${contextPath}/pinpaiMana";
                        document.formSearch.submit();
                        return;
                    }else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到子表shangpin添加页面
        function pinpaishangpinAdd(id) {
            var url="${contextPath}/pinpaishangpinAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表shangpin查看页面
        function pinpaishangpinGetBypinpaiid(id) {
            var url="${contextPath}/pinpaishangpinGetBypinpaiid/"+id;
            window.location.href=url;
        }


    </script>
</head>
<body leftmargin="2" topmargin="2">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px"
       bordercolor="#008080">
    <form action="${contextPath}/pinpaiMana" name="formSearch" id="formSearch" method="post">
        品牌名:<input type="text" name="pinpaimingcheng" id="pinpaimingcheng" size="15px" value="${req.pinpaimingcheng}"/>&nbsp;&nbsp;

        <input type="submit" value="搜索"/>
    </form>
    <tr bgcolor="#E7E7E7">
        <td height="14" colspan="100" background="${staticPath}/images/tbg.gif">品牌管理</td>
    </tr>
    <tr align="center" bgcolor="#C0C0C0" height="22">
        <td width="2%">序号</td>
        <td width="5%">品牌名</td>

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
                    <c:when test="${fn:length(info.pinpaimingcheng)>'16'}">
                        ${fn:substring(info.pinpaimingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.pinpaimingcheng}
                    </c:otherwise>
                </c:choose>
            </td>

            <td bgcolor="#FFFFFF" align="center">

                <input type="button" value="修改" onclick="pinpaiGet(${info.id})"/>
                <input type="button" value="详情" onclick="pinpaiDetail(${info.id})"/>
                <input type="button" value="删除" onclick="pinpaiDel(${info.id})"/>
                    <%--sonTable本表子表管理--%>
                <%--<input type="button" value="品牌商品查看" onclick="pinpaishangpinGetBypinpaiid(${info.id})"/>--%>
                <%--<input type="button" value="品牌商品添加" onclick="pinpaishangpinAdd(${info.id})"/>--%>

            </td>
        </tr>
    </c:forEach>
</table>
<%@include file="common/fenye.jsp" %>
<table width='98%' border='0' style="margin-top:8px;margin-left: 8px;">
    <tr>
        <td>
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
