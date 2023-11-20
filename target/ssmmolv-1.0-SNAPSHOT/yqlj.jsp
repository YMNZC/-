
<%@ page language="java" import="java.util.*" pageEncoding="gb2312" %>
<div class="zj_team index">
	<h2 class="t">专精团队 值得信赖</h2>
	<p class="t_en">professional</p>
	<div class="w1200">
		<div class="zy_team">
			<div class="t">
				<ul>
					<li>
						<span><font>10</font>专业经验</span>
					</li>
					<li>
						<span><font>300</font>+客户认可</span>
					</li>
					<li>
						<span><font>40</font>+合作伙伴</span>
					</li>
				</ul>
			</div>
			<div class="b">
				<ul>
					<c:forEach items="${sessionScope.lianjieList }" var="lianjie" varStatus="ss">


						<li style="background: url(${lianjie.url }) center center no-repeat;height: 25px;width:100px; border: none; font-size: 20px;">
							<a target="_blank" href="${lianjie.url }">${lianjie.name }</a>
						</li>

					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
