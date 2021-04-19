<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>物流配货网--车源信息管理</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<body>
<jsp:include page="main_top.jsp"/>
<div class="section ">
  <div class="maintitleBox">
    <div class="maintitle">添加车源信息 </div>
    <!-- end maintitle--></div>
  <!-- end maintitleBox-->
  <div class="mainbg">
    <div id="maintable">  
	 <s:form action="car_insertCar">
    <table width="80%" class="table" style="float: right;" >
      <tr>
        <td width="60" height="30">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="username" size="36"/><s:fielderror><s:param value="%{'username'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">身份证号：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="user_number" size="36"/><s:fielderror><s:param value="%{'user_number'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">地&nbsp;&nbsp;&nbsp;&nbsp;址</td>
        <td bgcolor="#FFFFFF"><s:textfield name="address" size="36"/><s:fielderror><s:param value="%{'address'}"/></s:fielderror></td>
        </tr>
	   <tr>
        <td height="30">车&nbsp;牌&nbsp;号：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="car_number" size="36"/><s:fielderror><s:param value="%{'car_number'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="tel" size="36"/><s:fielderror><s:param value="%{'tel'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="120">运输路线：</td>
        <td bgcolor="#FFFFFF"><s:textarea name="car_road" rows="8" cols="35" cssClass="textarea"/><s:fielderror><s:param value="%{'car_road'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="120">车辆描述：</td>
        <td bgcolor="#FFFFFF"><s:textarea name="car_content" rows="8" cols="35" cssClass="textarea"/><s:fielderror><s:param value="%{'car_content'}"/></s:fielderror></td>
        </tr>
		  <tr bgcolor="#FFFFFF">
        <td height="30" colspan="2" align="center"><s:submit value="添加"/>&nbsp;&nbsp;<s:reset value="重置"/></td>
        </tr>
    </table>
    </s:form>
	 
    </div>
    <!-- end maintable--> 
    
  </div>
  <!-- end mainbg--> 
</div>
<jsp:include page="main_down.jsp"/>
</body>
</html>
