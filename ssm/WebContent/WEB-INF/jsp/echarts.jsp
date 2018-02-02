<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
    <script type="text/javascript">
    $(function(){
    	
    	 // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init($('#main')[0]);
		// $取main返回的是一个数组对象
        myChart.setOption({
            series : [
                {
                    name: '访问来源',
                    type: 'pie',
                    radius: '55%',
                    roseType: 'angle',
                    data:[
                        {value:235, name:'视频广告'},
                        {value:274, name:'联盟广告'},
                        {value:310, name:'邮件营销'},
                        {value:335, name:'直接访问'},
                        {value:400, name:'搜索引擎'}
                    ]
                }
            ],
            itemStyle: {
                normal: {
                    // 阴影的大小
                    shadowBlur: 200,
                    // 阴影水平方向上的偏移
                    shadowOffsetX: 0,
                    // 阴影垂直方向上的偏移
                    shadowOffsetY: 0,
                    // 阴影颜色
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        });
    });
    </script>
</head>
<body>
 <div id="main" style="width: 600px;height:400px;"></div>
</body>
</html>