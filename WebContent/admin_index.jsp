<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>思睿211物流配货网</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
</head>

<body>
	<div class="header">
		<div class="headerbg ">
			<div class="headerbd">

				<!-- start 服务电话-->
				<div class="servestel">
					全国服务热线：<span>XXXX-XXXXXXX</span>
				</div>
				<!-- end 服务电话-->

			</div>
			<!-- end headerbd-->
			<div class="top">
				<div class="logo">
					<a href="#" title="思睿211物流有限公司"><img
						src="images/logo.jpg" alt="思睿211物流有限公司" style="margin: 5px 100px 5px" height="60px" width="60px" ></a>
				</div>
				<!-- end logo-->

				<div class="search">
					<form id="search" name="search" method="get" action="">
						<input type="text" class="text" value="请输入搜索关键词" name="kws"
							id="kws" onFocus="this.value=''"
							onBlur="if(!value){value=defaultValue}" /> <input
							class="searchsubmit" type="submit" value="搜索">
					</form>
				</div>
				<!-- end 搜索栏-->

			</div>
			<!-- end 顶部-->
		</div>
		<div class="section ">
			<div class="mainbg">
				<div id="maintable">
					<div style="width: 42%; float: left;color: #525252;padding-top: 110;">
						<s:form action="admin_index" method="post">
							<ul class="login_ul">
								<li style="color:red;text-align: center;"><s:fielderror>
										<s:param value="%{'admin_user'}" />
									</s:fielderror> <s:fielderror>
										<s:param value="%{'admin_password'}" />
									</s:fielderror> <s:actionerror /></li>
								<li>用户名：<s:textfield name="admin_user" />
								</li>
								<li>密　码：<s:password name="admin_password" /></li>
								<li style="padding-left:138px;"><s:submit value="登录" /> &nbsp;&nbsp;&nbsp; <s:reset
										value="重置" /></li>
							</ul>

						</s:form>
					</div>
					<div style="width: 49%; float: left;">
						<img src="images/logistics_14.jpg" width="578" height="467">
					</div>
					<%
						if (null != session.getAttribute("admin_user")) {
							out.print("<script language=javascript>window.location.href='mainPage.jsp';</script>");
						}
					%>
				</div>
				<!-- end maintable-->

			</div>
			<!-- end mainbg-->
		</div>
		<jsp:include page="main_down.jsp" />
	</div>
</body>
</html>
