<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:directive.page import="java.util.List"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流配货网――车源信息管理</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">


<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"></jsp:useBean>

<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=4;      //指定每页显示的记录数
	list=pagination.getInitPage(list,Page,pagesize);     //初始化分页信息
}else{
	Page=pagination.getPage(str);
	list=pagination.getAppointPage(Page);     //获取指定页的数据
}
request.setAttribute("list1",list);
%>






<body>
<jsp:include page="main_top.jsp"/>
<div class="section ">
  <div class="maintitleBox">
    <div class="maintitle">车源信息管理 </div>
    <!-- end maintitle--></div>
  <!-- end maintitleBox-->
  <div class="mainbg">
    <div id="maintable">
      <s:set var="carList" value="#request.list1"/>     
        <s:if test="#carList==null||#carList.size()==0">
        <br>
               ★★★目前没有车源信息★★★   
    <a href="car_insertCar.jsp" class="a2">添加车源信息</a>
         </s:if>  
        <s:else>
             <s:iterator status="carListStatus" value="carList">       
      <table width="100%"  class="table" >
        <tr align="center">
          <td width="82" class="td">序号</td>
          <td width="82" class="td">姓名</td>
          <td width="105" class="td">车牌号</td>
          <td width="139" class="td">地址</td>
          <td width="78" class="td">电话</td>
          <td width="119" class="td">身份证号</td>
          <td class="td">运输路线</td>
          <td class="td">车辆描述</td>
          <td class="td">操作</td>
        </tr>
        <tr align="center" >
          <td height="35" class="td"><s:property value="id"/></td>
          <td class="td"><s:property value="username"/></td>
          <td class="td"><s:property value="car_number"/></td>
          <td class="td"><s:property value="address"/></td>
          <td class="td"><s:property value="tel"/></td>
          <td class="td"><s:property value="user_number"/></td>
          <td class="td"><s:property value="car_road"/></td>
          <td class="td"><s:property value="car_content"/></td>
          <td class="td"><s:a href="car_queryCarForm.action?id=%{id}">修改</s:a>
            &nbsp;&nbsp;&nbsp;
            <s:a href="car_deleteCar.action?id=%{id}">删除</s:a></td>
        </tr>
      </table>
	 </s:iterator> 
	 <div style="width:100%;padding-left:10px;text-align: left;font-size: 14pt;">
	      <img src="images/add.jpg" width="16" height="16">&nbsp;<a href="car_insertCar.jsp" class="a2">添加车源信息</a>
          <%=pagination.printCtrl(Page) %></div>     
    </s:else>       
      
    </div>
    <!-- end maintable--> 
    
  </div>
  <!-- end mainbg--> 
</div>



<jsp:include page="main_down.jsp" flush="true"/>
</body>
</html>
