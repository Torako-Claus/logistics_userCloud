<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:directive.page import="java.util.List"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流配货网--固定客户管理</title>
</head>
<link href="css/style.css" type="text/css" rel="stylesheet">
<jsp:useBean id="pagination" class="com.tools.MyPagination" scope="session"/>
<%
String str=(String)request.getParameter("Page");
int Page=1;
List list=null;
if(str==null){
	list=(List)request.getAttribute("list");
	int pagesize=10;      //指定每页显示的记录数
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
    <div class="maintitle">固定客户管理 </div>
    <!-- end maintitle--></div>
  <!-- end maintitleBox-->
  <div class="mainbg">
    <div id="maintable"> 
      <s:set var="customerList" value="#request.list1"/>      <s:if test="#customerList==null||#customerList.size()==0">
        <br>
             ★★★目前没有固定客户信息★★★  <br>	    <br>
      </s:if>      <s:else>      
         <table width="100%"  class="table" >
          <tr align="center" height="30">
            <td width="100" height="20" class="td">客户序号</td>
            <td width="100" class="td">客户姓名</td>
            <td width="100" class="td">客户电话</td>
            <td width="100" class="td">客户地址</td>
            <td width="100" class="td">操作</td>
          </tr> <s:iterator status="customerListStatus" value="customerList">        
          <tr align="center" bgcolor="#FFFFFF">     
            <td height="30" class="td"><s:property value="customer_id"/></td>
            <td class="td"><s:property value="customer_user"/></td>
            <td class="td"><s:property value="customer_tel"/></td>
            <td class="td"><s:property value="customer_address"/></td>
            <td class="td"><s:a href="customer_deleteCustomer.action?customer_id=%{customer_id}">删除</s:a></td>
          </tr>
		   </s:iterator>
      </table>   

       <div align="right"><%=pagination.printCtrl(Page)%></div>
       </s:else>
	  
    
 <table width="100%"  class="table" >
 <s:form action="customer_insertCustomer">	
        <tr>
          <td width="10%" height="30">客户姓名：</td>
          <td width="20%"><s:textfield name="customer_user"/></td>
          <td width="10%">客户电话：</td>
          <td width="20%"><s:textfield name="customer_tel"/></td>
          <td width="10%" height="30">客户地址：</td>
          <td width="20%"><s:textfield name="customer_address"/></td>
          </tr><tr>
          <td colspan="6" align="center" height="50"><s:submit value="添加"/>&nbsp;&nbsp;<s:reset value="重置"/></td>
        </tr>
</s:form>
 </table><br><br>
		
    </div>
    <!-- end maintable--> 
    
  </div>
  <!-- end mainbg--> 
</div>

<jsp:include page="main_down.jsp"/>
</body>
</html>
