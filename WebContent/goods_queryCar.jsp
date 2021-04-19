<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.form.LogForm"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<jsp:directive.page import="java.util.List"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流配货网――车源信息查询</title>
</head>
<jsp:useBean id="goodsAndLogDao" scope="page" class="com.dao.GoodsAndLogDao"/>
<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"/>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=5;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
request.setAttribute("list1",list);
%>


<s:set var="list" value="#request.list1"/>
<body>
<jsp:include page="main_top.jsp"/>
          
<div class="section ">
  <div class="maintitleBox">
    <div class="maintitle">车源信息查询</div>
    <!-- end maintitle--></div>
  <!-- end maintitleBox-->
  <div class="mainbg">
    <div id="maintable">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" >
      <tr align="center">
        <td width="10%" class="td" height="30">车牌号码</td>
        <td  width="20%" class="td">路线</td>
        <td  width="30%" class="td">车辆描述</td>
        <td  width="20%" class="td">使用日志</td>
        <td  width="20%" class="td">是否使用</td>
      </tr>
      <s:iterator value="list" status="carList" var="car"> 
        <s:set var="car_id" value="%{#car.id}" scope="request"/>   
        <s:set var="car_number" value="%{#car.car_number}" scope="request"/>  
      <tr bgcolor="#FFFFFF" align="center">
        <td  class="td" height="40"><s:property value="car_number"/></td>
        <td class="td"><s:property value="car_road"/></td>
        <td class="td"><s:property value="car_content"/></td>
        <td class="td">
        <%
         Integer car=  (Integer)request.getAttribute("car_id");      
          LogForm logForm=goodsAndLogDao.queryCarLogForm(car);
        if(logForm!=null){  
    	  out.print("发货时间："+logForm.getStartTime()+"<br>");
       out.print("收货时间："+logForm.getEndTime()+"<br>");
      	 }else{
         out.print("&nbsp;");	 
       }
      	 %>
        </td>
        <td class="td">
        <%
       String information="已经使用";
    
       if(logForm==null){   
    	   String carNumber=request.getAttribute("car_number").toString();
    	   carNumber=URLEncoder.encode(carNumber,"utf-8");
     information="<a href='goods_insertGoods.jsp?car_id="+car+"&car_number="+carNumber+"'>未被使用</a>";
      }
       out.print(information);
	  
        %>
        </td>
      </tr>
      </s:iterator>
    </table>

	<%=pagination.printCtrl(Page)%>

	
    </div>
    <!-- end maintable--> 
    
  </div>
  <!-- end mainbg--> 
</div>
<jsp:include page="main_down.jsp"/>
</body>
</html>
