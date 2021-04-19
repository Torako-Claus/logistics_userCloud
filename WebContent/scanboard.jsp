<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="com.entity.Entity"%> --%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>监控面板</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/scanboard.css" />
<link rel="stylesheet" type="text/css" href="css/animsition.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.shCircleLoader.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.shCircleLoader-min.js"></script>
</head>

<jsp:useBean id="entityDao" class="com.dao.EntityDao" />


<body>	
	<div class="scanboardWp animsition">
		<!--Top Start!-->
		<div id="top">
			<div class="wp clearfix">
				<div class="left topBar"></div>
				<div class="center topLogo">
					<img src="images/logo.png">
				</div>
				<div class="right topBar">
					<div class="topTime">时间加载中...</div>  <!-- scanboard.js获取时间 -->
					<div class="clearfix">
						<a href="mainPage.jsp" class="signOut fr">退出</a>
					</div>
				</div>
			</div>
		</div>
		<!--Top End!-->
	
		<!--Main Start!-->
		<div id="main" class="wp clearfix">
			<div class="left">
				<!--今日运单数量-->
				<div class="item waybill">
					<div class="itemTit">
						<span class="border-yellow">运输车辆概况</span>
					</div>
					<div class="itemCon itembg">
						<div class="progress" progress="50%">
							<h3 class="clearfix"><span>运行(在线)车辆</span><i>80单</i></h3>
							<div class="progressBar">
								<span></span>
							</div>
							<h4>0%</h4>
						</div>
						<div class="progress" progress="15%">
							<h3 class="clearfix"><span>空闲(离线)车辆</span><i>15单</i></h3>
							<div class="progressBar">
								<span></span>
							</div>
							<h4>0%</h4>
						</div>
						<div class="progress" progress="5%">
							<h3 class="clearfix"><span>车辆总数</span><i>5单</i></h3>
							<div class="progressBar">
								<span></span>
							</div>
							<h4>0%</h4>
						</div>
					</div>
				</div>
			</div>

			<!--中间大地图-->
			<div class="center">
				<div class="mapContainer">
					<div id="myMap" class="item"></div>
				</div>
			</div>

			<div class="right">
				<!--报警信息 -->
				<div class="item basicInfo">
					<div class="itemTit">
						<span class="border-green">报警信息</span>
					</div>
					<div class="itemCon itembg">
						<div class="infoPie">
							<ul class="clearfix">
								<li class="color-red">
									<span class="border-red" id="indicator1" total="32">0</span>
									<p>未处理报警</p>
								</li>
								<li class="color-green">
									<span class="border-green" id="indicator2" total="65">0</span>
									<p>已处理报警</p>
								</li>
								<li class="color-blue">
									<span class="border-blue" id="indicator3" total="100">0</span>
									<p>报警总数</p>
								</li>
							</ul>
							<div id="indicatorContainer"></div>
						</div>
					</div>
				</div>

				<!--实时数据-->
				<div class="item billState">
					<div class="itemTit">
						<span class="border-green">实时数据</span>
					</div>
					<div class="itemCon" style="height:300px">
						<div class="StateBox">
							<div class="StateTit">
								<span>变量名</span>
								<span>变量值</span>
								<span>更新时间</span>
							</div>
								<ul>
									<li>
										<div class="fontInner clearfix">
											<span>温度</span>
											<span id="clockFunc1" ><%=entityDao.getTemperature()%> ℃</span>
											<h3><i><h4></h4></i></h3>
											
											<span class="topTime2"></span>
										</div>
									</li>
									<li>
										<div class="fontInner clearfix">
											<span>湿度</span>
											<span id="clockFunc2"><%=entityDao.getHumidity()%> %</span>
											<h3><i><h4></h4></i></h3>
											<span class="topTime2"></span>
											
										</div>
									</li>
									
								</ul>
<!-- 							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Main End!-->
	</div>

<!-- 地图上的按钮——车辆信息 -->
	<div class="carInfo">
		<a href="javascript:;" class="carClose"></a>
		<div class="infoBox">
			<div class="infoTop">
				<div class="infoTit">
					<img src="images/tit3.png">
				</div>
			</div>
		</div>
	</div>
<!-- 	<canvas id="canvas" style="position: absolute;top: 0;left: 0;"></canvas>  -->
	
</body>
<script type="text/javascript" src="js/bg.js"></script>
<script type="text/javascript" src="js/scanboard.js"></script>
<script type="text/javascript" src="js/fontscroll.js"></script>
<script type="text/javascript" src="js/jquery.animsition.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.3&key=f8ffe058b8e6f5b05e8ff43ca4207393"></script>

<script>
	setInterval(function() {
	  $("#clockFunc1").load("scanboard.jsp #clockFunc1");
	  $("#clockFunc2").load("scanboard.jsp #clockFunc2");
	  $("myMap").load("scanboard.jsp #myMap");
	}, 1000);
</script>


</html>

