<%@ page import="bean.UserBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>水稻直播机系统</title>
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


        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%
                // 获取登录的用户信息
                UserBean user = (UserBean) session.getAttribute("user");

                // 判断用户是否登录
                if (user != null) {
            %>
            <h2 class="sub-header">您的位置:首页></h2><br>
            <p style="font-size:25px; ">
                尊敬的用户<%=user.getUname() %>:
            </p>
            <p style="font-size:25px; text-indent: 50px;">
                您好,欢迎来到水稻直播机系统！

            </p>
            <%
                } else {
                    out.println("<br>对不起，您还没有登录！");
                }
            %>
            <%--系统公告--%>
            <br>
            <br>
            <table class="table table-responsive">
                <tr>
                    <th>系统公告</th>
                    <th><a href="message.jsp">更多</a></th>
                </tr>
                <tr>
                    <td><a href="message_1.jsp">关于水稻直播机系统正式于7月1日上线的通知</a></td>
                    <td>2017年4月20日</td>
                </tr>
            </table>
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