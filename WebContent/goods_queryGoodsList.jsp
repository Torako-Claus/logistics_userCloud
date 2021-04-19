<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="com.form.GoodsForm"%>
<%@page import="com.form.CarForm"%>
<%@page import="com.form.CustomerForm"%>
<%@page import="com.form.LogForm"%>
<%@page import="java.util.List"%>

<link href="css/style.css" type="text/css" rel="stylesheet">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>物流配货网――发货单查询</title>
</head>
<script language="javascript" type="text/javascript">
	function checkEmpty(form) {
		for (i = 0; i < form.length; i++) {
			if (form.elements[i].value == "") {
				alert(form.elements[i].title);
				return false;
			}
		}
	}
</script>

<jsp:useBean id="carDao" class="com.dao.CarDao" scope="page" />
<jsp:useBean id="customerDao" class="com.dao.CustomerDao" scope="page" />
<jsp:useBean id="goodsAndLogDao" class="com.dao.GoodsAndLogDao"
	scope="page" />
<jsp:useBean id="pagination" class="com.tools.MyPagination"
	scope="session" />

<body>
	<jsp:include page="main_top.jsp" />
	<div class="section ">
		<div class="maintitleBox">
			<div class="maintitle">首页 >> 发货单查询</div>
			<!-- end maintitle-->
		</div>
		<!-- end maintitleBox-->
		<div class="mainbg">
			<div id="maintable">

				<%
					String str = (String) request.getParameter("Page");
					int Page = 1;
					List list = null;
					if (str == null) {
						list = (List) request.getAttribute("list");
						int pagesize = 2; //指定每页显示的记录数
						list = pagination.getInitPage(list, Page, pagesize); //初始化分页信息
					} else {
						Page = pagination.getPage(str);
						list = pagination.getAppointPage(Page); //获取指定页的数据
					}

					for (int i = 0; i < list.size(); i++) {
						GoodsForm goodsForm = (GoodsForm) list.get(i);

						CarForm carForm = carDao.queryCarForm(goodsForm.getCar_id());

						CustomerForm customerForm = customerDao.queryCustomerForm(Integer.valueOf(goodsForm.customer_id));

						LogForm logForm = goodsAndLogDao.queryCarLogForm(Integer.valueOf(goodsForm.getCar_id()));
				%>

				<%
					if (carForm == null) {
							out.print("该车辆已经被管理员删除<br>");
						} else {
				%>
				<ul class="queryGoodslistul">
					<li style="width: 15%;"><span class="lispan">车主姓名：</span><%=carForm.getUsername()%></li>
					<li style="width: 20%;"><span class="lispan">车牌号码：</span><%=carForm.getCar_number()%></li>
					<li style="width: 25%;"><span class="lispan">车主地址：</span><%=carForm.getAddress()%></li>
					<li style="width: 20%;"><span class="lispan">车主电话：</span><%=carForm.getTel()%></li>
					<li style="width: 20%;"><span class="lispan">运输路线：</span><%=carForm.getCar_road()%></li>
				</ul>

				<%
					}
				%>

				<%
					if (customerForm == null) {
							out.print("该客户已经被管理员删除<br>");
						} else {
				%>
				<ul class="queryGoodslistul">
					<li style="width: 25%;"><span class="lispan">发货人姓名：</span><%=customerForm.getCustomer_user()%></li>
					<li style="width: 25%;"><span class="lispan">发货人电话：</span><%=customerForm.getCustomer_tel()%></li>
					<li style="width: 50%;"><span class="lispan">发货人地址：</span><%=customerForm.getCustomer_address()%></li>
				</ul>

				<%
					}
				%>
				<ul class="queryGoodslistul"
					style="font-size: 16px; height: 30px; padding-top: 10px;">
					<li style="width: 25%;"><span class="lispan">订单编号：</span><%=goodsForm.getGoods_id()%></li>
					<li style="width: 20%;"><span class="lispan">收货人姓名：</span><%=goodsForm.getGoods_name()%></li>
					<li style="width: 20%;"><span class="lispan">收货人电话：</span><%=goodsForm.getGoods_tel()%></li>
					<li style="width: 35%;"><span class="lispan">收货人地址：</span><%=goodsForm.getGoods_address()%></li>
				</ul>
				<%
					if (goodsForm.getGoods_sure().equals("0")) {
				%>
				<div width="100%" class="table">
					<div align="center">已经确认完毕</div>
					<div align="center">
						<a href="goods_deleteGoods.action?id=<%=goodsForm.getId()%>">删除订货单</a>
					</div>
				</div>
				<%
					} else {
				%>

				<ul class="queryGoodslistul">
					<li style="width: 25%;"><span class="lispan">发货时间：</span><%=logForm.getStartTime()%></li>
					<li style="width: 25%;"><span class="lispan">收货时间：</span><%=logForm.getEndTime()%></li>
					<li style="width: 50%;"><span class="lispan">货物描述：</span><%=logForm.getDescribe()%></li>
				</ul>

				<%
					}
				%>
				<hr>
				<%
					}
				%>
				<%=pagination.printCtrl(Page)%>
			</div>
			<!-- end maintable-->

		</div>
		<!-- end mainbg-->
	</div>
	<jsp:include page="main_down.jsp" />
</body>
</html>
