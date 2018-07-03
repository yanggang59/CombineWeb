<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>实时轨迹</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">

    <script type="text/javascript"
            src="http://api.map.baidu.com/api?v=2.0&ak=BE2aKX21dnaMuoNyKx8anNTeg8RZFsUv">
    </script>
    <% //此为v2.0版本的引用方式 ak=BE2aKX21dnaMuoNyKx8anNTeg8RZFsUv %>

    <script type="text/javascript" src="js/jquery-3.1.1.min.js" ></script>
    <script type="text/javascript">
        function getCars(){
            $.ajax({
                type: "get",
                url: "PathNowServlet?action=get",
                dataType: "json",
                success: function (data) {
                    var numP= data.length;
                    // alert(data[0].latitude);
                    if(numP != 0){
                        var polyPoints = [];
                        var i = 0;
                        for (i=0;i<numP;i++)
                        {
                            if(data[i].latitude != null)
                            {
                                var point = new BMap.Point(data[i].latitude, data[i].longitude); // 创建点坐标
                                polyPoints.push(point);
                                // var marker = new BMap.Marker(point); // 创建标注
                                // map.addOverlay(marker); // 将标注添加到地图中
                            }
                            if ( centerFlag == 0){
                                map.centerAndZoom(point, 19);
                                centerPoint = point;
                                centerFlag = centerFlag+1;
                            }
                        }
                        var polyline = new BMap.Polyline(polyPoints,{strokeColor:"red", strokeWeight:1, strokeOpacity:0.5} );
                        map.addOverlay(polyline);

                    }
                },
                error: function () {
                    alert("数据传输失败!");
                }
            });
            setTimeout(function(){  //setTimeout() 方法用于在指定的毫秒数后调用函数或计算表达式。setTimeout() 只执行 code 一次。如果要多次调用，请使用 setInterval() 或者让 code 自身再次调用 setTimeout()。
                getCars();
            }, 1000);
        }
    </script>

</head>
<body>


<%--水平导航栏--%>
<nav class="navbar navbar-default navbar-custom navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span></button>
            <a class="navbar-brand" href="homepage.jsp"><strong>水稻直播机系统</strong></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="homepage.jsp">首页</a>
                </li>
                <li>
                    <a href="history.jsp">历史记录</a>
                </li>
                <li class="active">
                    <a href="map_car.jsp">实时轨迹</a>
                </li>
                <li>
                    <a href="perinfo.jsp">个人信息</a>
                </li>
                <li>
                    <a href="count.jsp">账户设置</a>
                </li>
                <li>
                    <a href="message.jsp">消息通知</a>
                </li>
                <li>
                    <a href="suggestion.jsp">意见反馈</a>
                </li>
                <li>
                    <a href="UserServlet?action=exit">退出登陆</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%--竖直菜单栏--%>
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;首页</a></li>
                <li><a href="history.jsp"><i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;历史记录</a></li>
                <li class="active"><a href="map_car.jsp"><i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;实时轨迹</a></li>
                <li><a href="perinfo.jsp"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;个人信息</a></li>
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>&nbsp;&nbsp;账户设置</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;使用指南</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">百度地图</h1>
            <div  style="width:100%;height:500px;" id="container">
                <script type="text/javascript">
                    var centerFlag = 0;
                    var map = new BMap.Map("container"); // 创建地图实例
                    var centerPoint = new BMap.Point(121.7,30.9); // 创建点坐标
                    // map.setCurrentCity("上海市");
                    map.centerAndZoom(centerPoint, 19); // 初始化地图，设置中心点坐标和地图级别
                    map.enableScrollWheelZoom();
                    map.addControl(new BMap.NavigationControl());
                    map.addControl(new BMap.ScaleControl());
                    map.addControl(new BMap.OverviewMapControl());
                    // map.addControl(new BMap.MapTypeControl());

                    // 定义一个控件类,即function
                    function ZoomControl(){
                        // 默认停靠位置和偏移量
                        this.defaultAnchor = BMAP_ANCHOR_TOP_LEFT;
                        this.defaultOffset = new BMap.Size(10, 210); // 距离右上角位置
                    }

                    // 通过JavaScript的prototype属性继承于BMap.Control
                    ZoomControl.prototype = new BMap.Control();

                    // 自定义控件必须实现自己的initialize方法,并且将控件的DOM元素返回
                    // 在本方法中创建个div元素作为控件的容器,并将其添加到地图容器中
                    ZoomControl.prototype.initialize = function(map){
                        // 创建一个DOM元素
                        // var div = document.createElement("div");
                        // 添加文字说明
                        var centerBtn = document.createElement("button");
                        centerBtn.class = "btn  btn-primary";
                        centerBtn.name = "center";
                        centerBtn.appendChild(document.createTextNode("最大化"));
                        // div.appendChild(centerBtn);
                        // div.appendChild(document.createTextNode("最大化"));
                        // 设置样式
                        // div.style.cursor = "pointer";
                        // div.style.width = "70px";
                        // div.style.height = "40px";
                        // div.style.fontSize = "22px";
                        // div.style.border = "1px solid gray";
                        // div.style.backgroundColor = "blue";
                        // 绑定事件
                        centerBtn.onclick = function(e){
                            map.centerAndZoom(centerPoint, 19); // 动作
                        }
                        // 添加DOM元素到地图中
                        map.getContainer().appendChild(centerBtn);
                        // 将DOM元素返回
                        return centerBtn;
                    }
                    // 创建控件
                    var myZoomCtrl = new ZoomControl();
                    // 添加到地图当中
                    map.addControl(myZoomCtrl);

                    getCars();

                </script>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="footer" class="container">
            <nav class="navbar navbar-default navbar-fixed-bottom">
                <div class="navbar-inner navbar-content-center">
                    <div class="text-center">
                        <p class="text-muted credit" style="padding:10px;">
                            &copy 上海夏先机电科技发展有限公司 版权所有 2014-2016 服务热线:400-775-2629
                        </p>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


</body>
</html>