$(function(){
	//页面淡入效果
	$(".animsition").animsition({
	    inClass               :   'fade-in',
	    outClass              :   'fade-out',
	    inDuration            :    300,
	    outDuration           :    1000,
	    // e.g. linkElement   :   'a:not([target="_blank"]):not([href^=#])'
	    loading               :    false,
	    loadingParentElement  :   'body', //animsition wrapper element
	    loadingClass          :   'animsition-loading',
	    unSupportCss          : [ 'animation-duration',
	                              '-webkit-animation-duration',
	                              '-o-animation-duration'
	                            ],
	    //"unSupportCss" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
	    //The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
	    
	    overlay               :   false,
	    
	    overlayClass          :   'animsition-overlay-slide',
	    overlayParentElement  :   'body'
  	});
	
	document.onreadystatechange = subSomething;
	function subSomething() 
	{ 
		if(document.readyState == "complete"){
			$('#loader').hide();
		} 
	} 

	//顶部时间
	function getTime(){
		var myDate = new Date();
		var myYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
		var myMonth = myDate.getMonth()+1; //获取当前月份(0-11,0代表1月)
		var myToday = myDate.getDate(); //获取当前日(1-31)
		var myDay = myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
		var myHour = myDate.getHours(); //获取当前小时数(0-23)
		var myMinute = myDate.getMinutes(); //获取当前分钟数(0-59)
		var mySecond = myDate.getSeconds(); //获取当前秒数(0-59)
		var week = ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'];
		var nowTime;
		
		nowTime = myYear+'-'+fillZero(myMonth)+'-'+fillZero(myToday)+'&nbsp;&nbsp;'+week[myDay]+'&nbsp;&nbsp;'+fillZero(myHour)+':'+fillZero(myMinute)+':'+fillZero(mySecond);
		$('.topTime').html(nowTime);
		nowTime2 =fillZero(myHour)+':'+fillZero(myMinute)+':'+fillZero(mySecond);
		$('.topTime2').html(nowTime2);
	};
	
	function fillZero(str){
		var realNum;
		if(str<10){
			realNum	= '0'+str;
		}else{
			realNum	= str;
		}
		return realNum;
	}
	setInterval(getTime,1000);

	function totalNum(obj,speed){
		var singalNum = 0;
		var timer;
		var totalNum = obj.attr('total');

		if(totalNum){
			timer = setInterval(function(){
				singalNum+=speed;
				if(singalNum>=totalNum){
					singalNum=totalNum;
					clearInterval(timer);
				}
				obj.html(singalNum);
			},1);
		}
	}
	

	
//	高德地图
    var myMap = new AMap.Map('myMap',{
        resizeEnable: true,
        zoom: 14,
        center: [120.089679,30.196808],
    });
    
    var point =[ 
    	[120.089679,30.196808]     //经纬度（数据库给数据）
	];
	
    var maker;
    for (var i = 0; i < point.length; i += 1) {         //显示icon的信息和个数
        var marker = new AMap.Marker({          
            position: point[i],
            map: myMap,
            icon:'images/s_ico4.png',
        });
        marker.content='<p>车牌号：XXXXXX</p>'+           //数据来自数据库
				'<p>温度：XX℃</p>'+
				'<p>湿度：XX%</p>';
        marker.on('click', markerClick);
        //map.setFitView(); 
    }
    var infoWindow = new AMap.InfoWindow({
    	offset: new AMap.Pixel(16, -36)
    });
  	function markerClick(e){
    	infoWindow.setContent(e.target.content);
    	infoWindow.open(myMap,e.target.getPosition());
	}
	myMap.on('click',function(){
		infoWindow.close();
	});








    function Schedule(){
    	var Item = $('.dataBox');
    	var Size = Item.eq(0).width();
    	var oDay = 24*60;

    	function getMin(timeStr){
    		var timeArray = timeStr.split(":");
    		var Min = parseInt(timeArray[0])*60+parseInt(timeArray[1]);
    		return Min;
    	}



    	//添加总用时与总单数
    	var Total = $('.totalItem');
    	Total.each(function(i,ele){
    		var ItemData = carData[i].data.workTime;
    		var timeUsed = 0;
    		for(var j=0;j<ItemData.length;j++){
				timeUsed+= getMin(ItemData[j].end)-getMin(ItemData[j].start);
    		}
    		var realHour = Math.floor(timeUsed/60);
    		$(ele).find('span').eq(0).html(realHour+':'+(timeUsed-realHour*60));
    		$(ele).find('span').eq(1).html(ItemData.length);
    	});
    };

    Schedule();

});