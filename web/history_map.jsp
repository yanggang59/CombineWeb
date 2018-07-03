<%@ page import="java.util.ArrayList" %>
<%@ page import="bean.FieldBean" %>
<%@ page import="bean.ABlineBean" %>
<%@ page import="bean.PathBean" %>
<%--
  Created by IntelliJ IDEA.
  User: sjtume
  Date: 2018/6/4
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>

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
        var polyOptions = {
            strokeColor:"red",
            fillColor : "red",
            strokWeight:0,
            strokeOpacity:0.3,
            fillOpacity:0.3,
            strokeStyle:"solid"
        }

        function paintField(){
            $.ajax({
                type: "get",
                url: "FieldServlet?action=single&fDate=<%=request.getParameter("fDate")%>",
                dataType: "json",
                success: function (data) {
                    var numP= data.length;
                    if(numP != 0){
                        var polyPoints = [];
                        var i = 0;
                        for (i=0;i<numP;i++)
                        {
                            var point = new BMap.Point(data[i].fPLat, data[i].fPLng); // 创建点坐标
                            polyPoints.push(point);
                        }
                        var point = new BMap.Point(data[0].fPLat, data[0].fPLng); // 创建点坐标
                        map.centerAndZoom(point, 19);
                        var polyField = new BMap.Polygon(polyPoints,polyOptions );
                        map.addOverlay(polyField);
                    }
                    else{
                        alert("数据丢失!");
                    }

                },
                error: function () {
                    alert("数据传输失败!");
                }
            });
        }
        function paintABline(){
            $.ajax({
                type: "get",
                url: "ABlineServlet?action=show&fDate=<%=request.getParameter("fDate")%>",
                dataType: "json",
                success: function (data) {
                    var numP= data.length;
                    if(numP != 0){
                        var i = 0;
                        var abPoints = [];
                        for (i=0;i<numP;i++)
                        {
                            abPoints = [];
                            var point = new BMap.Point(data[i].a_Lat, data[i].a_Lng); // 创建点坐标
                            abPoints.push(point);
                            var point = new BMap.Point(data[i].b_Lat, data[i].b_Lng); // 创建点坐标
                            abPoints.push(point);
                            var abline = new BMap.Polyline(abPoints,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5} );
                            map.addOverlay(abline);
                        }
                    }
                },
                error: function () {
                    alert("数据传输失败!");
                }
            });
        }
        function paintPath(){
            $.ajax({
                type: "get",
                url: "PathServlet?action=show&fDate=<%=request.getParameter("fDate")%>",
                dataType: "json",
                success: function (data) {
                    var numP= data.length;
                    if(numP != 0){
                        var pathPoints = [];
                        var i = 0;
                        for (i=0;i<numP;i++)
                        {
                            var point = new BMap.Point(data[i].latitude, data[i].longitude); // 创建点坐标
                            pathPoints.push(point);
                        }
                        var path = new BMap.Polyline(pathPoints,{strokeColor:"black", strokeWeight:4, strokeOpacity:0.5} );
                        map.addOverlay(path);
                    }
                    else{
                        alert("数据丢失!");
                    }

                },
                error: function () {
                    alert("数据传输失败!");
                }
            });
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
                <li class="active">
                    <a href="history.jsp">历史记录</a>
                </li>
                <li>
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
                <li class="active"><a href="history.jsp"><i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;历史记录</a></li>
                <li><a href="map_car.jsp"><i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;实时轨迹</a></li>
                <li><a href="perinfo.jsp"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;个人信息</a></li>
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>&nbsp;&nbsp;账户设置</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;使用指南</a></li>
            </ul>
        </div>

        <%--百度地图 API加载--%>
        <div class="col-sm-9 col-sm-offset-3 col-md-9 col-md-offset-2">
            <h1 class="page-header">历史记录</h1>

            <div class="row">

                <div  class="col-sm-9 col-sm-offset-1 col-md-9 col-md-offset-1" style="height:500px;" id="container">
                    <script type="text/javascript">
                        var map = new BMap.Map("container"); // 创建地图实例
                        var point = new BMap.Point(121.71, 30.92); // 创建点坐标
                        map.centerAndZoom(point, 15); // 初始化地图，设置中心点坐标和地图级别
                        map.enableScrollWheelZoom();
                        map.addControl(new BMap.NavigationControl());
                        map.addControl(new BMap.ScaleControl());
                        map.addControl(new BMap.OverviewMapControl());
                        map.addControl(new BMap.MapTypeControl());


                        // paintField();

                    </script>
                </div>

                <div class="col-sm-1 col-md-1"></div>
                <%--地图控件--%>
                <div class="col-sm-1 col-md-1">
                    <br>
                    <p id="p"></p><br><br><br>
                    <button onclick="paintField()" class="btn  btn-primary">&nbsp;加载地块&nbsp;</button><br><br><br>
                    <button onclick="paintABline()" class="btn  btn-primary">&nbsp;加载AB线</button><br><br><br>
                    <button onclick="paintPath()" class="btn  btn-primary">&nbsp;加载轨迹&nbsp;</button>
                </div>

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

