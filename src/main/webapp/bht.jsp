<%@ page language="java" pageEncoding="UTF-8" %>
<div class="slider">
<div id="slideBox" class="slideBox">
    <div class="hd">
			<ul id="ulIndex"></ul>
    </div>
    <div class="bd">
        <ul id="ulLunbo">
        </ul>
    </div>
		<a class="prev" href="javascript:void(0)"></a>
		<a class="next" href="javascript:void(0)"></a>
</div>
</div>
<script src="${staticPath}/jquery/jquery.SuperSlide.2.1.3.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $.get(basePath + '/lunboAll/', function(resp) {
        if (resp.success) {
            if(resp.data!=null){
                var list = resp.data;
                var ulIndexHtml = [];
                var ulLunboHtml = [];
                for(var i=0; i<list.length; i++){
                    var info = list[i];
                    ulIndexHtml.push('<li></li>');
                    ulLunboHtml.push('<li style="background: url(');
                    ulLunboHtml.push('${contextPath}/'+info.image+') center center no-repeat;background-size: 100% 100%">');
                    ulLunboHtml.push('</li>');
                }
                $("#ulLunbo").empty().html(ulLunboHtml.join(''));
                $("#ulIndex").empty().html(ulIndexHtml.join(''));
                $(".slideBox").slide({mainCell:".bd ul",effect:"left",autoPlay:true,delayTime:500});
            }
        }else {
            alert(resp.message);
        }
    })
</script>