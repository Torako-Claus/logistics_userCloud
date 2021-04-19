<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>物流配货网--车源信息管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<s:set var="carForm" value="#request.carForm"/>         
<body>
<jsp:include page="main_top.jsp"/>
<div class="section ">
  <div class="maintitleBox">
    <div class="maintitle">车源信息管理&nbsp;&nbsp;>>&nbsp;&nbsp;修改车源信息 </div>
    <!-- end maintitle--></div>
  <!-- end maintitleBox-->
  <div class="mainbg">
    <div id="maintable">
  <s:form action="car_updateCar">
    <table width="100%"  class="table" >
      <tr>
        <td width="75" height="30">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="username" size="36" value="%{#carForm.username}"/><s:fielderror><s:param value="%{'username'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">身份证号：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="user_number" size="36" value="%{#carForm.user_number}"/><s:fielderror><s:param value="%{'user_number'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">地&nbsp;&nbsp;&nbsp;&nbsp;址：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="address" size="36" value="%{#carForm.address}"/><s:fielderror><s:param value="%{'address'}"/></s:fielderror></td>
        </tr>
	   <tr>
        <td height="30">车&nbsp;牌&nbsp;号：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="car_number" size="36" value="%{#carForm.car_number}"/><s:fielderror><s:param value="%{'car_number'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="30">电&nbsp;&nbsp;&nbsp;&nbsp;话：</td>
        <td bgcolor="#FFFFFF"><s:textfield name="tel" size="36" value="%{#carForm.tel}"/><s:fielderror><s:param value="%{'tel'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="120">运输路线：</td>
        <td bgcolor="#FFFFFF"><s:textarea name="car_road" rows="7" cols="60" value="%{#carForm.car_road}"/><s:fielderror><s:param value="%{'car_road'}"/></s:fielderror></td>
        </tr>
      <tr>
        <td height="120">车辆描述：</td>
        <td bgcolor="#FFFFFF"><s:textarea name="car_content" rows="7" cols="60" value="%{#carForm.car_content}"/><s:fielderror><s:param value="%{'car_content'}"/></s:fielderror></td>
        </tr>
		  <tr bgcolor="#FFFFFF">
        <td height="30" colspan="2" align="center"><s:submit value="修改"/>&nbsp;&nbsp;<s:reset value="重置"/><s:hidden name="id" value="%{#carForm.id}"/></td>
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
