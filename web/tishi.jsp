<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/10
  Time: 19:08
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
    <title>提示信息</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
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
                <li class="active">
                    <a href="homepage.jsp">首页</a>
                </li>
                <li>
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
                <li class="active"><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>&nbsp;&nbsp;首页</a></li>
                <li><a href="history.jsp"><i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;历史记录</a></li>
                <li><a href="map_car.jsp"><i class="glyphicon glyphicon-book"></i>&nbsp;&nbsp;实时轨迹</a></li>
                <li><a href="perinfo.jsp"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;个人信息</a></li>
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>&nbsp;&nbsp;账户设置</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;&nbsp;使用指南</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" align="center">
            <br>
            <h2 class="page-header">提示消息</h2>
            <p><%=request.getAttribute("message") %>
            </p><br>
            <a href=<%=request.getAttribute("href")%>>返回</a>
        </div>
    </div>
</div>

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

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>

<script type="text/javascript">
    function paintABline(){
        var loction= "ok"
        loction = <%=location%>;
        if (location != "ok"){
            alert("hhhhh");
        }
    }
</script>

// alert("hhh");
// var xs=x.split(",");
// var ys=y.split(",");



// for ( var i = 0; i < xs.length ; i++){
//     var fPoint = new BMap.Point(xs[i],ys[i]);
//     polyPoint.push(fPoint);
// }
//
// var polyField = new BMap.Polygon(polyPoint,polyOptions)
// map.addOverlay(polyField);



alert("hh");
var polyPoint = [];
var x = <%=fPLats%>;
var y = <%=fPLngs%>;



<%
    ArrayList<FieldBean> Fieldlist = (ArrayList<FieldBean>)session.getAttribute("FiledSingle");
    int numP = Fieldlist.size();
    String fPLat = null;
    String fPLng = null;
    String location ;
    StringBuffer fPLats = new StringBuffer();//Fieldlist.get(0).getfPLat();
    StringBuffer fPLngs = new StringBuffer();//Fieldlist.get(0).getfPLng();
    location = Fieldlist.get(0).getfLocation();
    out.println(numP);

    fPLat = Fieldlist.get(0).getfPLat();
    fPLng = Fieldlist.get(0).getfPLng();
    fPLats = fPLats.append(fPLat);//+ "," + fPLat;
    fPLngs = fPLngs.append(fPLng);// + "," + fPLng;
    if (Fieldlist!=null && Fieldlist.size()!=0){
        for ( int i = 1; i < numP ; i++){
            fPLats = fPLats.append(",");//+ "," + fPLat;
            fPLngs = fPLngs.append(",");// + "," + fPLng;
            fPLat = Fieldlist.get(i).getfPLat();
            fPLng = Fieldlist.get(i).getfPLng();
            fPLats = fPLats.append(fPLat);//+ "," + fPLat;
            fPLngs = fPLngs.append(fPLng);// + "," + fPLng;
        }
    }
    String fPLatss = null;
    String fPLngss = null;
    fPLatss=fPLats.toString();
    fPLngss=fPLngs.toString();
%>

<script type="text/javascript">

    var polyOptions = {
        strokeColor:"red",
        fillColor : "red",
        strokWeight:"3",
        strokeOpacity:0.8,
        fillOpacity:0.5,
        strokeStyle:"solid"
    }
    var polyPoint = [];
    var x = <%=fPLatss%>;
    var y = <%=fPLngss%>;

    var lat = <%=fPLat%>;
    var lng = <%=fPLng%>;
    var point = new BMap.Point(lat, lng); // 创建点坐标
    var marker = new BMap.Marker(point); // 创建标注
    map.addOverlay(marker); // 将标注添加到地图中
    map.centerAndZoom(point, 15); // 初始化地图，设置中心点坐标和地图级别

</script>


<%--<%=Fieldlist.get(0).getfLocation()%>--%>
<br>

<form action="ABlineServlet?action=show" method="post">

    <button type="submit" onclick="paintABline">ABline</button>
</form>

<br>

<%
    ArrayList<ABlineBean> ABlinelist = (ArrayList<ABlineBean>)session.getAttribute("ABline");
    if (ABlinelist!=null && ABlinelist.size()!=0){
        out.println(ABlinelist.get(0).getA_Lat());
    }

%>
<%--<%%>  <%=ABlinelist.get(0).getA_Lat()%>     <%}%>--%>












