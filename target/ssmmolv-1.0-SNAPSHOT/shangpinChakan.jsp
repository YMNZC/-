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
    <title>商品查看列表</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <script type="text/javascript">
        //导出信息
        function daochu() {
            var url = "${contextPath}/shangpinChakan?d=1";
            window.location.href=url;
        }
        //删除信息
        function shangpinDel(id) {
            if (confirm('您确定删除吗?')) {
                $.get(basePath + '/shangpinDel/' + id, function (resp) {
                    if (resp.success) {
                        alert("删除成功！");
                        //window.location.href = "${contextPath}/shangpinChankan";
                        document.formSearch.submit();
                        return;
                    } else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到信息修改页
        function shangpinGet(id) {
            window.location.href = "${contextPath}/shangpinGet/" + id;
        }

        //跳转到信息详细页
        function shangpinDetail(id) {
            window.location.href = "${contextPath}/shangpinDetail/" + id;
        }

        //附件下载
        function down(fujianPath) {
            var url = "${contextPath}/common/download?filename=" + fujianPath;
            url = encodeURI(url);
            window.open(url, "_self");
        }

        //更新信息
        function shangpinSet(id,property,value) {
            if (confirm('您确定操作吗?')) {
                var param = {};
                param["id"]=id;
                param[property]=value;
                $.post(basePath + '/shangpinSet', param, function(resp) {
                    if (resp.success) {
                        alert("操作成功！");
                        //window.location.href = "${contextPath}/shangpinChankan";
                        document.formSearch.submit();
                        return;
                    }else {
                        alert(resp.message);
                    }
                })
            }
        }

        //跳转到子表dingdanxiang添加页面
        function shangpindingdanxiangAdd(id) {
            var url="${contextPath}/shangpindingdanxiangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表dingdanxiang查看页面
        function shangpindingdanxiangGetByshangpinid(id) {
            var url="${contextPath}/shangpindingdanxiangGetByshangpinid/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche添加页面
        function shangpingouwucheAdd(id) {
            var url="${contextPath}/shangpingouwucheAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表gouwuche查看页面
        function shangpingouwucheGetByshangpinid(id) {
            var url="${contextPath}/shangpingouwucheGetByshangpinid/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia添加页面
        function shangpinpingjiaAdd(id) {
            var url="${contextPath}/shangpinpingjiaAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表pingjia查看页面
        function shangpinpingjiaGetByshangpinid(id) {
            var url="${contextPath}/shangpinpingjiaGetByshangpinid/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang添加页面
        function shangpinshoucangAdd(id) {
            var url="${contextPath}/shangpinshoucangAdd/"+id;
            window.location.href=url;
        }
        //跳转到子表shoucang查看页面
        function shangpinshoucangGetByshangpinid(id) {
            var url="${contextPath}/shangpinshoucangGetByshangpinid/"+id;
            window.location.href=url;
        }


    </script>
</head>
<body leftmargin="2" topmargin="2">
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px"
       bordercolor="#008080">
    <form action="${contextPath}/shangpinChakan" name="formSearch" id="formSearch" method="post">
        <div>
        名称:<input type="text" name="mingcheng" id="mingcheng" size="15px" value="${req.mingcheng}"/>&nbsp;&nbsp;
        编号:<input type="text" name="bianhao" id="bianhao" size="15px" value="${req.bianhao}"/>&nbsp;&nbsp;
        分类:
        <select name="zhongleiid" id="zhongleiid">
            <option value="">全部</option>
            <c:forEach items="${zhongleiList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.zhongleiid}">
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
        品牌:
        <select name="pinpaiid" id="pinpaiid">
            <option value="">全部</option>
            <c:forEach items="${pinpaiList}" var="s">
                <c:choose>
                    <c:when test="${s.id==req.pinpaiid}">
                        <option value="${s.id}" selected>
                                ${s.pinpaimingcheng }
                        </option>
                    </c:when>
                    <c:otherwise>
                        <option value="${s.id}">
                                ${s.pinpaimingcheng}
                        </option>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>&nbsp;&nbsp;
        单位:<input type="text" name="danwei" id="danwei" size="15px" value="${req.danwei}"/>&nbsp;&nbsp;
        是否上架:
        <select name="shenhe" id="shenhe">
            <option value="">全部</option>
            <option value="yes" <c:if test="${req.shenhe == 'yes'}">selected</c:if>>yes</option>
            <option value="no" <c:if test="${req.shenhe == 'no'}">selected</c:if>>no</option>
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
        <td height="14" colspan="100" background="${staticPath}/images/tbg.gif">商品查看</td>
    </tr>
    <tr align="center" bgcolor="#C0C0C0" height="22">
        <td width="2%">序号</td>
        <td width="5%">名称</td>
        <td width="5%">编号</td>
        <td width="4%">分类</td>
        <td width="4%">品牌</td>
        <td width="4%">图片</td>
        <td width="4%">原价</td>
        <td width="4%">现价</td>
        <td width="5%">单位</td>
        <td width="4%">是否上架</td>
        <td width="4%">库存数量</td>
        <td width="4%">销售数量</td>
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
                    <c:when test="${fn:length(info.mingcheng)>'16'}">
                        ${fn:substring(info.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.mingcheng}
                    </c:otherwise>
                </c:choose>
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
                <c:choose>
                    <c:when test="${fn:length(info.zhonglei.mingcheng)>'16'}">
                        ${fn:substring(info.zhonglei.mingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.zhonglei.mingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.pinpai.pinpaimingcheng)>'16'}">
                        ${fn:substring(info.pinpai.pinpaimingcheng,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.pinpai.pinpaimingcheng}
                    </c:otherwise>
                </c:choose>
            </td>
            <td width='90' align='center'>
                <a href='${contextPath}/${info.image}' target='_blank'>
                    <img src='${contextPath}/${info.image}' width="88" height="99" border="0"  onerror="this.src='${staticPath}/images/zanwu.jpg'" />
                </a>
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.yuanshijiage}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.jiage}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                <c:choose>
                    <c:when test="${fn:length(info.danwei)>'16'}">
                        ${fn:substring(info.danwei,0,16)}...
                    </c:when>
                    <c:otherwise>
                        ${info.danwei}
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
                ${info.kucunshuliang}
            </td>
            <td bgcolor="#FFFFFF" align="center">
                ${info.xiaoshoushuliang}
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
<%--
            <c:choose>
                <c:when test="${info.shenhe=='no'}">
                <input type="button" value="审核" onclick="shangpinSet(${info.id},'shenhe','yes')"/>
                </c:when>
                <c:otherwise>
                <input type="button" value="取消" onclick="shangpinSet(${info.id},'shenhe','no')"/>
                </c:otherwise>
            </c:choose>
 --%>

<%--                <input type="button" value="修改" onclick="shangpinGet(${info.id})"/>--%>
                <input type="button" value="详情" onclick="shangpinDetail(${info.id})"/>
<%--                <input type="button" value="删除" onclick="shangpinDel(${info.id})"/>--%>
                    <%--sonTable本表子表管理--%>
                <%--<input type="button" value="商品订单项查看" onclick="shangpindingdanxiangGetByshangpinid(${info.id})"/>--%>
                <%--<input type="button" value="商品订单项添加" onclick="shangpindingdanxiangAdd(${info.id})"/>--%>
                <%--<input type="button" value="商品购物车查看" onclick="shangpingouwucheGetByshangpinid(${info.id})"/>--%>
                <%--<input type="button" value="商品购物车添加" onclick="shangpingouwucheAdd(${info.id})"/>--%>
                <%--<input type="button" value="商品商品评价查看" onclick="shangpinpingjiaGetByshangpinid(${info.id})"/>--%>
                <%--<input type="button" value="商品商品评价添加" onclick="shangpinpingjiaAdd(${info.id})"/>--%>
                <%--<input type="button" value="商品商品收藏查看" onclick="shangpinshoucangGetByshangpinid(${info.id})"/>--%>
                <%--<input type="button" value="商品商品收藏添加" onclick="shangpinshoucangAdd(${info.id})"/>--%>

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
