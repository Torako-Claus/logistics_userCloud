<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<link href="css/style.css" type="text/css" rel="stylesheet">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流配货网――首页</title>
</head>

<body>
<jsp:include page="main_top.jsp"/>
<div class="section ">
  <div class="maintitleBox">
    <div class="maintitle">首页  >> 物流配货流程 </div>
    <!-- end maintitle--></div>
  <!-- end maintitleBox-->
  <div class="mainbg">
    <div id="maintable">
       <img src="images/logistics_flow.jpg">        

    </div>
    <!-- end maintable--> 
  </div>
  <!-- end mainbg--> 
</div>	
<jsp:include page="main_down.jsp"/>
</body>
</html>
