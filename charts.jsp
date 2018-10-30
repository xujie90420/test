<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <link rel="stylesheet" type="text/css" href="/static/b2b/css/charts.css">
    
    <div class="container">

        <div class="col_1 col">
            
            <div class="item">
                <div class="chart" id="chart1" style="width:340px;height:290px;"></div>
                <div class="title">经销商-<span>订单数量排名</span><em></em></div>
                <!-- <div class="chart_label" id="x1">
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                </div> -->
            </div>

            <div class="item">
                <div class="chart" id="chart2" style="width:340px;height:290px;"></div>
                <div class="title">经销商-<span>订单金额排名</span><em></em></div>
                <!-- <div class="chart_label" id="x2">
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                    <div class="txt">经销商经销商经销商经销商经销商经销商</div>
                </div> -->
            </div>

            <div class="item">
                <div class="chart" id="chart3" style="width:340px;height:290px;"></div>
                <div class="title">产品热销<em></em></div>
                <div class="chart3_info" id="x3">
                    <!-- <p>srkqf25c1sa<span>30%</span></p>
                    <p>srkqfc1sa<span>25%</span></p>
                    <p>srkqf5c1sa<span>20%</span></p>
                    <p>srkqf25csa<span>15%</span></p>
                    <p>srkqf21sa<span>10%</span></p>
                    <p>其他<span>5%</span></p> -->
                </div>
            </div>

        </div>

        <div class="col_2 col">
            
            <div class="map item">
                <div class="chart" id="chart4" style="width:580px;height:600px;"></div>
                <div class="title">销售热力分布图<br><em></em></div>
            </div>

            <div class="item">
                <div class="chart" id="chart5" style="width:580px;height:290px;"></div>
                <div class="title">菱感舜天销售金额对比</div>
            </div>


        </div>

        <div class="col_3 col">
            
            <div class="item">
                <div class="chart" id="chart6" style="width:320px;height:290px;"></div>
                <div class="title">事务所-<span>订单数量排名</span><em></em></div>
            </div>

            <div class="item">
                <div class="chart" id="chart7" style="width:320px;height:290px;"></div>
                <div class="title">事务所-<span>订单金额排名</span><em></em></div>
            </div>

            <div class="item">
                <div class="chart" id="chart8" style="width:320px;height:290px;"></div>
                <div class="title">各大区销售金额<em></em></div>
            </div>

        </div>
        


    </div>

    


<!-- 脚本 -->
<!-- <script src="/static/b2b/js/jquery.min.js"></script> -->
<script src="/static/b2b/js/echarts.min.js"></script>
<script src="/static/b2b/js/map/china.js"></script>
<script>
var totalWidth = $('.container').width() - 60,
mapWidth = Math.floor(totalWidth * 58/126),
chartWidth = Math.floor(totalWidth * 34/126),
chartHeight = Math.floor(chartWidth*29/34);
var chart1 = echarts.init(document.getElementById('chart1')),
chart2 = echarts.init(document.getElementById('chart2')),
chart3 = echarts.init(document.getElementById('chart3')),
chart4 = echarts.init(document.getElementById('chart4')),
chart5 = echarts.init(document.getElementById('chart5')),
chart6 = echarts.init(document.getElementById('chart6')),
chart7 = echarts.init(document.getElementById('chart7')),
chart8 = echarts.init(document.getElementById('chart8'));

$('.chart').css({
    width: chartWidth,
    height: chartHeight
});   

$('#chart4').css({
    width: mapWidth,
    height: chartHeight*2 + 20
}); 

$('#chart5').css({
    width: mapWidth
});

chart1.setOption({
title: {},
tooltip : {},
grid:{
    y: 70,
    y2: 60,
},
xAxis: {
    data: [],
    axisLabel: {

        textStyle: {
            color: '#333',
        },
        formatter:function(value){
            var ret = "";//拼接加\n返回的类目项
            var maxLength = 3;//每项显示文字个数
            var valLength = value.length;//X轴类目项的文字个数
            var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
            if (rowN > 1)//如果类目项的文字大于3,
            {
                for (var i = 0; i < rowN; i++) {
                	if(rowN<4){
                		var temp = "";//每次截取的字符串
                        var start = i * maxLength;//开始截取的位置
                        var end = start + maxLength;//结束截取的位置
                        //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
                        temp = value.substring(start, end) + "\n";
                        ret += temp; //凭借最终的字符串
                	}else{
                		ret +="...";
                		break;
                	}
                }
                return ret;
            }
            else {
                return value;
            }
        }
    },
    axisLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisTick: {
        alignWithLabel: true,
        length: 6,
    }
},
yAxis: {
    axisTick: {
        show: false,
    },
    splitLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisLine: {
        lineStyle: {
            width: 0,
        }
    }
},
series: [{
    name: '订单数量',
    type: 'bar',
    data: [],
    itemStyle: {
        normal: {
            color: new echarts.graphic.LinearGradient(
                0, 0, 0, 1,
                [
                    {offset: 0, color: '#379dff'},
                    {offset: 1, color: '#69cfff'}
                ]
            )
        },
    },
    barWidth: 22,
}]
});

chart2.setOption({
title: {},
tooltip : {},
grid:{
	x: 50,
    y: 70,
    y2: 60,
},
xAxis: {
    data: [],
    axisLabel: {
        textStyle: {
            color: '#333'
        },
        formatter:function(value){
            var ret = "";//拼接加\n返回的类目项
            var maxLength = 3;//每项显示文字个数
            var valLength = value.length;//X轴类目项的文字个数
            var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
            if (rowN > 1)//如果类目项的文字大于3,
            {
                for (var i = 0; i < rowN; i++) {
                	if(rowN<4){
                		var temp = "";//每次截取的字符串
                        var start = i * maxLength;//开始截取的位置
                        var end = start + maxLength;//结束截取的位置
                        //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
                        temp = value.substring(start, end) + "\n";
                        ret += temp; //凭借最终的字符串
                	}else{
                		ret +="...";
                		break;
                	}
                }
                return ret;
            }
            else {
                return value;
            }
        }
    },
    axisLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisTick: {
        alignWithLabel: true,
        length: 6,
    }
},
yAxis: {
    axisTick: {
        show: false,
    },
    splitLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisLine: {
        lineStyle: {
            width: 0,
        }
    },
    type:'value',
    axisLabel: {
        formatter: '{value}w'
    }
},
series: [{
    name: '订单金额',
    type: 'bar',
    data: [],
    itemStyle: {
        normal: {
            color: new echarts.graphic.LinearGradient(
                0, 0, 0, 1,
                [
                    {offset: 0, color: '#379dff'},
                    {offset: 1, color: '#69cfff'}
                ]
            )
        },
    },
    barWidth: 22,
}]
});

chart3.setOption({
tooltip: {
    trigger: 'item',
    formatter: "{c}w ({d}%)"
},
color:['#2ec9ff', '#81cf58','#edca66','#e19261','#df655a','#777'],
series: [
    {
        name:'产品',
        type:'pie',
        center: ['22%', '55%'],
        radius: ['32%', '40%'],
        avoidLabelOverlap: false,
        label: {
            normal: {
                show: false,
                position: 'center'
            },
            emphasis: {
                show: true,
                textStyle: {
                    fontSize: '12',
                    fontWeight: 'bold'
                }
            }
        },
        labelLine: {
            normal: {
                show: false
            }
        },
        data:[]
    }
]
});


chart4.setOption({
visualMap: {
    min: 0,
    max: 1000,
    left: 20,
    bottom: 20,
    text: ['高', '低'],
    calculable: false,
    orient: 'horizontal',
    inRange: {
        color: ['#e0ffff', '#006edd'],
        symbolSize: [30, 100]
    }
},
tooltip: {
    padding: 0,
    enterable: true,
    transitionDuration: 1,
    textStyle: {
        color: '#000',
        decoration: 'none',
    },
    trigger: 'item',
    formatter: function (params) {
        if (params.data ) {
            return params.name+" : "+params.value+"w";
        }
    }
    
},
series: [{
    name: 'iphone4',
    type: 'map',
    mapType: 'china',
    layoutCenter: ['50%', '52%'],
    layoutSize: 520,
    itemStyle: {
        normal: {
            label: {
                show: false
            }
        },
        emphasis: {
            label: {
                show: true
            }
        }
    },
    data: [
        {
            name: '澳门',
            value: Math.round(Math.random() * 1000),
            tipData: [Math.round(Math.random() * 1000), Math.round(Math.random() * 1000)]
        }
    ]
}, ]
});



chart5.setOption({
tooltip: {
    trigger: 'axis',
    axisPointer: {
        type: 'shadow'
    }
},
legend: {
    top: 20,
    right: 45,
    itemGap: 30,
},
grid:{
    x: 60,
    x2: 45,
    y: 70,
    y2: 50,
},
dataset: {
    source: [
        []
    ]
},
xAxis: {
    type: 'category',
    axisLabel: {
        textStyle: {
            color: '#333'
        }
    },
    axisLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisTick: {
        alignWithLabel: true,
        length: 6,
    }
},
yAxis: {
    axisTick: {
        show: false,
    },
    splitLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisLine: {
        lineStyle: {
            width: 0,
        }
    },
    type:'value',
    axisLabel: {
        formatter: '{value}w'
    }
},
series: [
	{
	    type: 'bar',
	    seriesLayoutBy: 'row',
	    itemStyle: {
	        normal: {
	            color: '#419ffa',
	        },
	    },
	},
	{
	    type: 'bar',
	    seriesLayoutBy: 'row',
	    itemStyle: {
	        normal: {
	            color: '#54c975',
	        },
	    },
	},
],
barWidth: 22,
});

chart7.setOption({
title: {},
tooltip : {},
grid:{
    x: 80,
    y: 70,
    y2: 50,
},
xAxis: {
    axisTick: {
        show: false,
    },
    splitLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisLine: {
        lineStyle: {
            width: 0,
        }
    },
    type:'value',
    axisLabel: {
        formatter: '{value}w'
    }
},
yAxis: {
    data: [],
    axisLabel: {
        textStyle: {
            color: '#333'
        }
    },
    axisLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisTick: {
        alignWithLabel: true,
        length: 6,
    }
},
series: [{
    name: '订单数量',
    type: 'bar',
    data: [],
    itemStyle: {
        normal: {
            color: new echarts.graphic.LinearGradient(
                1, 0, 0, 0,
                [
                    {offset: 0, color: '#379dff'},
                    {offset: 1, color: '#69cfff'}
                ]
            )
        },
    },
    barWidth: 12,
}]
});

chart6.setOption({
title: {},
tooltip : {},
grid:{
    x: 80,
    y: 70,
    y2: 50,
},
xAxis: {
    axisTick: {
        show: false,
    },
    splitLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisLine: {
        lineStyle: {
            width: 0,
        }
    }
},
yAxis: {
    data: [],
    axisLabel: {
        textStyle: {
            color: '#333'
        }
    },
    axisLine: {
        lineStyle: {
            color:'#deeefe'
        }
    },
    axisTick: {
        alignWithLabel: true,
        length: 6,
    }
},
series: [{
    name: '订单金额',
    type: 'bar',
    data: [],
    itemStyle: {
        normal: {
            color: new echarts.graphic.LinearGradient(
                1, 0, 0, 0,
                [
                    {offset: 0, color: '#379dff'},
                    {offset: 1, color: '#69cfff'}
                ]
            )
        }
        
    },
    barWidth: 12,
}]
});

chart8.setOption({
color:['#33be6c', '#7cbf5a','#33be6c','#deaf3a','#de703a','#de554b','#16deb2','#aa70e0','#7087e0','#5770d4','#40cfff','#16deb2'],
tooltip : {
    trigger: 'item',
    formatter: "{a} <br/>{b} : {c}w ({d}%)"
},
series : [
    {
        name: '各大区销售金额',
        type: 'pie',
        radius : '55%',
        center: ['50%', '60%'],
        data:[],
        itemStyle: {
            emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
        }
    }
]
});

chart1.resize();
chart2.resize();
chart3.resize();
chart4.resize();
chart5.resize();
chart6.resize();
chart7.resize();
chart8.resize();

queryReport();

function queryReport(){
	queryCustomOrderNumReport();
	queryCustomOrderMoneyReport();
	querySWSOrderNumReport();
	querySWSOrderMoneyReport();
	queryOrderProdInfos();
	querySaleOrderInfo();
	queryRegionOrderInfos();
	queryLastMonthsOrderInfo();
}

var flag = setInterval(queryReport, 30000);


function queryCustomOrderNumReport(){
$.get("/report/custom/orderInfo",{ order:"num" },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		var xData=result.xData.split(",");
		chart1.setOption({
	        xAxis: {
	            data: xData
	        },
	        series: [{
	            data: result.yData.split(",")
	        }]
	    });
		var html="";
		for(i=0;i<xData.length;i++){
			html+='<div class="txt">'+xData[i]+'</div>'
		}
		$("#x1").html(html)
		
	}
});
}

function queryCustomOrderMoneyReport(){
$.get("/report/custom/orderInfo",{ order:"money" },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		var xData=result.xData.split(",");
		chart2.setOption({
	        xAxis: {
	            data: xData
	        },
	        series: [{
	            data: result.yData.split(",")
	        }]
	    });
		var html="";
		for(i=0;i<xData.length;i++){
			html+='<div class="txt">'+xData[i]+'</div>'
		}
		$("#x2").html(html)
		
	}
});
}

function querySWSOrderNumReport(){
$.get("/report/SWS/orderInfo",{ order:"num" },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		var xData=result.xData.split(",");
		chart6.setOption({
			yAxis: {
	            data: xData
	        },
	        series: [{
	            data: result.yData.split(",")
	        }]
	    });
	}
});
}

function querySWSOrderMoneyReport(){
$.get("/report/SWS/orderInfo",{ order:"money" },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		var xData=result.xData.split(",");
		chart7.setOption({
			yAxis: {
	            data: xData
	        },
	        series: [{
	            data: result.yData.split(",")
	        }]
	    });
	}
});
}

function queryOrderProdInfos(){
$.get("/report/orderProdInfos",{  },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		chart3.setOption({
	        
	        series: [{
	            data: result
	        }]
	    });
		var html="";
		for(i=0;i<result.length;i++){
			html+='<p>'+result[i].name+'</p>'
		}
		$("#x3").html(html)
		
	}
});
}

function querySaleOrderInfo(){
$.get("/report/sale/infos",{  },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		chart4.setOption({
	        series: [{
	            data: result
	        }]
	    });
	}
});
}

function queryRegionOrderInfos(){
$.get("/report/region/orderInfo",{  },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		chart8.setOption({
	        series: [{
	            data: result
	        }]
	    });
	}
});
}

function queryLastMonthsOrderInfo(){
$.get("/report/lastMonths/infos",{ order:"money" },function(data){
	if(data.resultCode=="00"){
		result=data.resultValue;
		chart5.setOption({
			dataset: {
	            source: [
	                result.xData.split(","),
	                result.yData.split(","),
	                result.y2Data.split(",")
	            ]
	        }
	    });
	}
});
}	
    

</script>
<!-- 脚本end -->
