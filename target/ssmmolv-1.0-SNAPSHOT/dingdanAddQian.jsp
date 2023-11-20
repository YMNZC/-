<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单提交</title>
    <%@include file="common/head.jsp" %>
    <%@include file="common/loginstate.jsp" %>
    <script type="text/javascript" src="${staticPath}/js/popup.js"></script>
    <script language="JavaScript" src="${staticPath}/js/public.js" type="text/javascript"></script>
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

        .basic-grey {

            margin-left:auto;

            margin-right:auto;

            max-width: 500px;

            background: #63ff7d;

            padding: 25px 15px 25px 10px;

            font: 12px Georgia, "Times New Roman", Times, serif;

            color: #888;

            text-shadow: 1px 1px 1px #FFF;

            border:1px solid #E4E4E4;

        }

        .basic-grey h1 {

            font-size: 25px;

            padding: 0px 0px 10px 40px;

            display: block;

            border-bottom:1px solid #E4E4E4;

            margin: -10px -15px 30px -10px;;

            color: #888;

        }

        .basic-grey h1>span {

            display: block;

            font-size: 11px;

        }

        .basic-grey label {

            display: block;

            margin: 0px;

        }

        .basic-grey label>span {

            float: left;

            width: 20%;

            text-align: right;

            padding-right: 10px;

            margin-top: 10px;

            color: #888;

        }

        .basic-grey input[type="text"], .basic-grey input[type="email"], .basic-grey textarea, .basic-grey select {

            border: 1px solid #DADADA;

            color: #888;

            height: 30px;

            margin-bottom: 16px;

            margin-right: 6px;

            margin-top: 2px;

            outline: 0 none;

            padding: 3px 3px 3px 5px;

            width: 70%;

            font-size: 12px;

            line-height:15px;

            box-shadow: inset 0px 1px 4px #ECECEC;

            -moz-box-shadow: inset 0px 1px 4px #ECECEC;

            -webkit-box-shadow: inset 0px 1px 4px #ECECEC;

        }

        .basic-grey textarea{

            padding: 5px 3px 3px 5px;

        }

        .basic-grey select {
            appearance:none;
            -webkit-appearance:none;
            -moz-appearance: none;
            text-indent: 0.01px;
            text-overflow: '';
            width: 70%;
            height: 35px;
            line-height: 25px;
        }
        .basic-grey textarea{
            height:100px;
        }
        .basic-grey .button {
            background: #E27575;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            box-shadow: 1px 1px 5px #B6B6B6;
            border-radius: 3px;
            text-shadow: 1px 1px 1px #9E3F3F;
            cursor: pointer;
        }
        .basic-grey .button:hover {
            background: #CF7A7A
        }
        .m{
            margin-top: 50px;
        }
    </style>
    <script type="text/javascript">
        //文件上传
        function upx(id) {
            var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
            pop.setContent("contentUrl","${contextPath}/common/upload/?id="+id);
            pop.setContent("title","文件上传");
            pop.build();
            pop.show();
        }
        // 添加订单
        function dingdanAdd() {
            var shangpinid=$('#shangpinid').val();
            var bianhao=$('#bianhao').val().trim();
            if(bianhao == "")
            {
                alert("please input:编号");
                return false;
            }
            var jine=$('#jine').val().trim();
            if(jine == "")
            {
                alert("please input:订单金额");
                return false;
            }
            var zhifushenhe=$('#zhifushenhe').val().trim();
            var fahuoshenhe=$('#fahuoshenhe').val().trim();
            var shouhuoshenhe=$('#shouhuoshenhe').val().trim();
            var fukuanfangshiid=$('#fukuanfangshiid').val().trim();
            var xingming=$('#xingming').val().trim();
            if(xingming == "")
            {
                alert("please input:姓名");
                return false;
            }
            var dianhua=$('#dianhua').val().trim();
            if(dianhua == "") {
                alert("please input:电话");
                return false;
            }else{
                if (/^[1][3,4,5,6,7,8,9][0-9]{9}$/.test(dianhua)) {
                } else {
                    alert("必需手机格式");
                    return false;
                }
            }
            var dizhi=$('#dizhi').val().trim();
            if(dizhi == "")
            {
                alert("please input:送货地址");
                return false;
            }
            var shangjia=$('#shangjia').val().trim();
            var usersid=$('#usersid').val().trim();
            var shijian=$('#shijian').val().trim();
            if(shijian == "")
            {
                alert("please input:时间");
                return false;
            }
            var wuliu=$('#wuliu').val().trim();
            var beizhu=$('#beizhu').val().trim();
            if(beizhu == "")
            {
                alert("please input:备注");
                return false;
            }

            var param = {
                'bianhao':bianhao,
                'jine':jine,
                'zhifushenhe':zhifushenhe,
                'fahuoshenhe':fahuoshenhe,
                'shouhuoshenhe':shouhuoshenhe,
                'fukuanfangshiid':fukuanfangshiid,
                'xingming':xingming,
                'dianhua':dianhua,
                'dizhi':dizhi,
                'shangjia':shangjia,
                'usersid':usersid,
                'shijian':shijian,
                'wuliu':wuliu,
                'beizhu':beizhu,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/dingdanAddOrUpdate?shangPinId='+shangpinid,
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    alert(resp.message);
                    if (resp.success) {
                        window.location.href = "${contextPath}/default.jsp";
                    }
                }
            });
        }
    </script>

</head>
<body style="padding-top:120px;">
<%@ include file="qttop.jsp"%>
<div class="index_about index">
    <div class="w1200">
    <h2 class="t">订单提交</h2>
    <p class="t_en"></p>
    <%
        String bianhao = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
        String jine = "0";
        if(null != request.getParameter("jine")){
            jine = request.getParameter("jine");
        }
        String shangpinid = "0";
        if(null != request.getParameter("shangpinid")){
            shangpinid = request.getParameter("shangpinid");
        }
    %>
    <form name="formAdd" id="formAdd" class="basic-grey">

        <h1>
            <span>订单信息</span>
        </h1>

        <label>
            <span>订单编号:</span>
            <input type="text" name="bianhao" id="bianhao" value="<%=bianhao %>"  readonly="readonly"/>
        </label>

        <label>

            <span>姓名：</span>

            <input id="xingming" type="text" name="xingming"/>

        </label>

        <label>

            <span>地址：</span>

            <input id="dizhi" type="text" name="dizhi"/>

        </label>

        <label>

            <span>电话号码：</span>

            <input type="text" name="dianhua" id="dianhua"/>

        </label>



        <label>

            <span>订单金额</span>

            <input type="text" name="jine" id="jine" value="<%=jine %>" readonly="readonly"/>

        </label>

        <label>

            <span>付款方式</span>
            <select name="fukuanfangshiid" id="fukuanfangshiid"></select>
            <script type="text/javascript">
                $.get(basePath + '/fukuanfangshiAll/', function(resp) {
                    if (resp.success) {
                        if(resp.data!=null){
                            var list = resp.data;
                            for(var i=0; i<list.length; i++){
                                var info = list[i];
                                $("#fukuanfangshiid").append("<option value='"+info.id+"' >" + info.mingcheng + "</option>");
                            }
                        }
                    }else {
                        alert(resp.message);
                    }
                });
            </script>

        </select>

        </label>
        <label>

            <span>时间</span>

            <input type="text" name="shijian" id="shijian" style="border:1px solid #cccccc;" readonly="readonly" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" />

        </label>
        <label>

            <span>备注:</span>

            <textarea id="beizhu" name="beizhu"></textarea>

        </label>
        <table>
        <tr style="display: none;">
            <td>
                物流信息:
            </td>
            <td>
                <input type="text" name="wuliu" id="wuliu" size="70px"/>
            </td>

        </tr>
        <tr style="display: none;">
            <td>
                商家ID:
            </td>
            <td>
                <input type="text" name="shangjia" id="shangjia" size="70px"/>
            </td>

        </tr>
        <tr style="display: none;">
            <td width="20%" bgcolor="#FFFFFF" align="right">
                用户:
            </td>
            <td style="display: none">
                <select name="usersid" id="usersid" style="border:solid 1px #000000; color:#666666">
                    <option value="${sessionScope.user.id }">${sessionScope.user.loginname }</option>
                </select>
            </td>
        <tr style="display: none;">
            <td>
                是否发货:
            </td>
            <td style="display: none">
                <select name="fahuoshenhe" id="fahuoshenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>

        </tr>
        <tr style="display: none;">
            <td>
                是否收货:
            </td>
            <td style="display: none">
                <select name="shouhuoshenhe" id="shouhuoshenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>
        <tr style="display: none;">
            <td>
                是否支付:
            </td>
            <td style="display: none">
                <select name="zhifushenhe" id="zhifushenhe" style="border:solid 1px #000000; color:#666666">
                    <option value="no">no</option>
                    <%--<option value="yes">yes</option>--%>
                </select>
            </td>

        </tr>
        </table>
        <label>

            <span>&nbsp;</span>

            <input type="hidden" id="shangpinid" name="shangpinid" value="<%= shangpinid %>">
            <input type="button" name="Submit5" value="提交" onClick="dingdanAdd();" />
            <input type="button" value="返回" onClick="javascript:history.back()"/>

        </label>

    </form>

        </div>
    </div>
<%@ include file="kefutiao.jsp"%>
<script>

    function changeStyle() {

        var template = document.getElementById("template");

        var index = template.selectedIndex;

        var templatevalue = template.options[index].value;

        var templatecss = document.getElementById("templatecss");

        templatecss.setAttribute("href","css/" + templatevalue + ".css");

        document.getElementsByTagName("form")[0].setAttribute("class",templatevalue);

    }

</script>
</body>
</html>

