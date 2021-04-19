<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.form.GoodsForm"%>
<%@page import="com.form.CarForm"%>
<%@page import="com.form.CustomerForm"%>
<%@page import="com.form.LogForm"%>
<link href="css/style.css" type="text/css" rel="stylesheet">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流配货网――回执发货单确认</title>
</head>
<script language="javascript" type="text/javascript">
//验证表单内容是否为空
function checkEmpty(form){
	for(i=0;i<form.length;i++){
		if(form.elements[i].value==""){
			alert(form.elements[i].title);
		return false;
		}
	}
}
</script>

<jsp:useBean id="carDao" class="com.dao.CarDao" scope="page"/>
<jsp:useBean id="customerDao" class="com.dao.CustomerDao" scope="page"/>
<jsp:useBean id="goodsAndLogDao" class="com.dao.GoodsAndLogDao" scope="page"/>
<body>
<jsp:include page="main_top.jsp"/>
<div class="section ">
  <div class="maintitleBox">
    <div class="maintitle">首页  >>  回执发货单确认 </div>
    <!-- end maintitle--></div>
  <!-- end maintitleBox-->
  <div class="mainbg">
    <div id="maintable">
  
      <s:form action="goods_queryGoodsId" name="form" onsubmit="return checkEmpty(form)">
    <table width="305" height="23">     
      <tr>
        <td width="81" height="18">订单编号：</td>
        <td width="90"><s:textfield name="goods_id" title="请输入订单编号"/></td>
        <td width="118"  align="center">        <s:submit value="订单确认"/></td>
      </tr>      
    </table>
	</s:form>
	
	
	<%if(request.getAttribute("goodsForm")!=null){ 
		GoodsForm goodsForm=(GoodsForm)request.getAttribute("goodsForm");
		CarForm carForm=carDao.queryCarForm(goodsForm.getCar_id());	
		CustomerForm customerForm=customerDao.queryCustomerForm(Integer.valueOf(goodsForm.customer_id));
		LogForm logForm=goodsAndLogDao.queryCarLogForm(Integer.valueOf(goodsForm.getCar_id()));			
	%>
    <table width="100%" class="table">
      <tr>
        <td width="15%" height="30" class="td">车主姓名：</td>
        <td width="35%" class="td"><%=carForm.getUsername()%></td>
        <td width="15%" class="td">车牌号码：</td>
        <td width="35%" class="td"><%=carForm.getCar_number()%></td>
      </tr>
      <tr>
        <td height="30" class="td">车主地址：</td>
        <td  class="td"><%=carForm.getAddress()%></td>
        <td class="td">车主电话：</td>
        <td  class="td"><%=carForm.getTel()%></td>
      </tr>
      <tr>
        <td height="30" class="td">运输路线：</td>
        <td colspan="3" class="td"><%=carForm.getCar_road()%></td>
        </tr>
      
      <tr>
        <td height="30">发货人姓名：</td>
        <td class="td"><%=customerForm.getCustomer_user()%></td>
        <td class="td">发货人电话：</td>
        <td class="td"><%=customerForm.getCustomer_tel()%></td>
      </tr>    
      <tr>
        <td height="30" class="td">发货人地址：</td>
        <td colspan="3"  class="td"><%=customerForm.getCustomer_address()%></td>
        </tr>
      <tr>
        <td height="30" class="td">收货人姓名：</td>
        <td  class="td"><%=goodsForm.getGoods_name()%></td>
        <td class="td">收货人电话：</td>
        <td class="td"><%=goodsForm.getGoods_tel()%></td>
      </tr>
      <tr>
        <td height="30" class="td">收货人地址：</td>
        <td  class="td" colspan="3"><%=goodsForm.getGoods_address()%></td>
        </tr>
      
      <%if(logForm!=null){ %>
      <tr>
        <td class="td" height="30">发货时间：</td>
        <td  class="td"><%=logForm.getStartTime()%></td>
        <td class="td">收货时间：</td>
        <td class="td"><%=logForm.getEndTime()%></td>
      </tr>
      <tr>
        <td class="td" height="30">发货单号：</td>
        <td  class="td"><%=logForm.getGoods_id()%></td>
        <td class="td">货物描述</td>
        <td  class="td"><%=logForm.getDescribe()%></td>
      </tr>     
      <tr bgcolor="#FFFFFF">
						<td class="td" height="50" colspan="4" align="center"><input
							type="button" name="Submit" value=" 回执发货单确认 "
							onclick="javasrcipt:window.location.href='goods_changeOperation.action?goods_id=<%=logForm.getGoods_id()%>'"></td>
					</tr>
        <%}else{ %>
       <tr bgcolor="#FFFFFF">
        <td class="td" height="50" colspan="4" align="center">已经确认完毕</td>
        </tr>   
        <%} %>
        
    </table>
<br>
    <%} %>
    </div>
    <!-- end maintable--> 
    
  </div>
  <!-- end mainbg--> 
</div>
<jsp:include page="main_down.jsp"/>
</body>
</html>
