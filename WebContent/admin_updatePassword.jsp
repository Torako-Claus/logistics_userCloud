<%@ page contentType="text/html; charset=utf-8" language="java"
	errorPage=""%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流配货网――修改管理员密码</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<%
	String admin = (String) session.getAttribute("admin_user");
%>
<body>
	<jsp:include page="main_top.jsp" />
	<div class="section ">
		<div class="maintitleBox">
			<div class="maintitle">修改管理员密码</div>
			<!-- end maintitle-->
		</div>
		<!-- end maintitleBox-->
		<div class="mainbg">
			<div id="maintable">
				<s:form action="admin_updatePassword">
					<table width="70%" class="table"  style="float: right;">
						<tr>
							<td width="20%">原&nbsp;密&nbsp;码：</td>
							<td bgcolor="#FFFFFF"><s:password
									name="admin_password" />
								<s:fielderror>
									<s:param value="%{'admin_password'}" />
								</s:fielderror></td>
						</tr>
						<tr>
							<td>新&nbsp;密&nbsp;码：</td>
							<td bgcolor="#FFFFFF"><s:password name="admin_repassword1" />
								<s:fielderror>
									<s:param value="%{'admin_repassword1'}" />
								</s:fielderror></td>
						</tr>
						<tr>
							<td>密码确认：</td>
							<td bgcolor="#FFFFFF"><s:password name="admin_repassword2" />
								<s:fielderror>
									<s:param value="%{'admin_repassword2'}" />
								</s:fielderror></td>
						</tr>
						<tr align="left" bgcolor="#FFFFFF">
							<td></td>
							<td height="50"><s:hidden name="admin_user"
									value="%{#session.admin_user}" />
								<s:submit value="修改" />&nbsp;&nbsp;<s:reset value="重置" /></td>
						</tr>
					</table>
				</s:form>
				<s:actionerror />
				<%
					if (request.getAttribute("editPassword") != null) {
						String editPassword = (String) request.getAttribute("editPassword");
						out.print("<script language=javascript>alert('" + editPassword
								+ "');window.location.href='admin_loginout.jsp';</script>");
					}
				%>
			</div>
			<!-- end maintable-->

		</div>
		<!-- end mainbg-->
	</div>
	<jsp:include page="main_down.jsp" />
</body>
</html>
