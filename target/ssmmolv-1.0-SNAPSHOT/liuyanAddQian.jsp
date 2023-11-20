<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>留言反馈添加</title>
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

            background: white;

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
            margin-top: 20px;
        }
        .basic-grey .button:hover {
            background: #CF7A7A;
        }
        .m{
            margin-top: 20px;
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
        // 添加留言反馈
        function liuyanAdd() {
			var biaoti=$('#biaoti').val().trim();
			if(biaoti == "")
			{
				alert("please input:标题");
				return false;
			}
			var neirong=$('#neirong').val().trim();
			var liuyanshijian=$('#liuyanshijian').val().trim();
			if(liuyanshijian == "")
			{
				alert("please input:留言时间");
				return false;
			}
			var usersid=$('#usersid').val().trim();

            var param = {
				'biaoti':biaoti,
				'neirong':neirong,
				'liuyanshijian':liuyanshijian,
				'usersid':usersid,

            };
            $.ajax({
                type: 'post',
                url: '${basePath}/liuyanAddOrUpdate',
                dataType: "json",
                contentType:"application/json",
                data : JSON.stringify(param),
                success: function (resp) {
                    if (resp.success) {
                        alert("添加成功！");
                        //window.location.href = "${contextPath}/liuyanManaMyQian";
                    } else {
                        alert(resp.message);
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
        <h2 class="t">留言反馈添加</h2>
        <p class="t_en"></p>
        <form name="formAdd" id="formAdd"  class="basic-grey">
            <h1>
                留言
            </h1>
            <label>
                <span>留言标题:</span>
                <input type="text" name="biaoti" id="biaoti"/>
            </label>

            <label>
                <span>留言内容:</span>
                <textarea name="neirong" id="neirong"></textarea>
            </label>
            <br>
            <label>
                <span>留言时间:</span>
                <input type="text" name="liuyanshijian" id="liuyanshijian" style="border:1px solid #cccccc;" readonly="readonly" size="25px" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date())%>" />
            </label>
            <table>
                <tr style="display: none;">
                    <td width="20%" bgcolor="#FFFFFF" align="right">
                        用户:
                    </td>
                    <td style="display: none">
                        <select name="usersid" id="usersid" style="border:solid 1px #000000; color:#666666">
                            <option value="${sessionScope.user.id }">${sessionScope.user.loginname }</option>
                        </select>
                    </td>
                </tr>
                <label>
                    <input type="button" name="Submit5" value="提交" onClick="liuyanAdd();" class="m"/>
                    <input type="button" value="返回" onClick="javascript:history.back()" class="m"/>
                    <input type="reset" name="Submit22" value="重置"  class="m"/>
                </label>
            </table>
        </form>
    </div>
</div>
<%@ include file="kefutiao.jsp"%>
</body>
</html>

