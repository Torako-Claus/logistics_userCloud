<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:useBean id="currentTime" class="com.tools.CurrentTime" scope="page"/>
<div class="header">
	<div class="headerbg "></div>
  <!-- end headerbg-->
  <div class="top">
	<div class="logo">
					<a href="#" title="思睿211物流有限公司"><img
						src="images/logo.jpg" alt="思睿211物流有限公司" style="margin: 5px 100px 5px" height="60px" width="60px" ></a>
	</div>
    <!-- end logo-->
    
    <div class="search">
      <form id="search" name="search" method="get" action="">
        <input type="text" class="text" value="请输入搜索关键词" name="kws" id="kws" onFocus="this.value=''" onBlur="if(!value){value=defaultValue}"  />
        <input class="searchsubmit" type="submit" value="搜索" >
      </form>
    </div>
    <!-- end 搜索栏--> 
    
 </div>
  <!-- end 顶部-->
  
  <div  class="navgroup">
    <ul class="nav" id="nav">
      <li rel="admin_loginout.jsp"><a href="admin_loginout.jsp" class="a1">退出系统</a></li>
      <li rel="mainPage.jsp"><a href="mainPage.jsp" class="a1">返回首页</a></li>
      <li rel="admin_updatePassword.jsp"><a href="admin_updatePassword.jsp" class="a1">修改密码</a> </li>
      <li rel="car_queryCarList.action"><a href="car_queryCarList.action">车源信息管理</a> </li>
      <li rel="customer_queryCustomerList.action"><a href="customer_queryCustomerList.action">固定客户管理</a> </li>
    </ul>
  </div>
  <!-- end 导航一-->
  
  <div class="banner">
    <div class="bann"> <img src="images/logistics_15.jpg"  height="200" alt=""/> </div>
  </div>
  <!-- end 广告-->
  
  <div class="navlistBox">
    <div class="navlistList">
      <div class="navlismaintitle"> </div>
      <!-- end 占位符-->
      
      <ul class="navlistUlList">
        <li><a href="goods_insertGoods.jsp" title="发货单" class="navlistUlListHover">发货单</a></li>
        <li><a href="goods_queryGoodsId.jsp" title="回执发货单确认" class="navlistUlListHover">回执发货单确认</a></li>
        <li><a href="goods_queryCar.action" title="车源信息查询" class="navlistUlListHover">车源信息查询</a></li>
        <li><a href="goods_queryGoodsList.action" title="发货单查询" class="navlistUlListHover">发货单查询</a></li>
        <li><a href="scanboard.jsp" title="监控面板" class="navlistUlListHover">监控面板</a></li>
      </ul>
    </div>
  </div>
  <!-- end 导航二--> 
  
</div>
<!-- end header-->

<%
 	if (null == session.getAttribute("admin_user")) {

		out.print("<script language=javascript>alert('您已经与服务器断开');window.location.href='admin_index.jsp';</script>");

	} 
%>







