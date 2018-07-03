<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>历史记录</title>
    <!-- Bootstrap core CSS -->
    <!-- Custom styles for this template -->
    <link href="css/bootstrap.min.css" rel="stylesheet" >
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
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

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="sub-header">请选择日期范围查询历史记录</h1>
            <%--<form action="InfoServlet?action=time" class="form-horizontal"  role="form" METHOD="post">--%>
            <form class="form-horizontal">
                <fieldset>
                    <div class="form-group">
                        <label for="dtp_input2" class="col-sm-2 control-label">选择起始日期</label>
                        <div class="input-group date startdate col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                            <input class="form-control" size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                        <input type="hidden" name="startdate" id="dtp_input2" value="" /><br/>
                    </div>
                    <div class="form-group">
                        <label for="dtp_input3" class="col-sm-2 control-label">选择截止日期</label>
                        <div class="input-group date enddate col-sm-6" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input3" data-link-format="yyyy-mm-dd">
                            <input class="form-control"size="16" type="text" value="" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                        </div>
                        <input type="hidden"  name="enddate"  id="dtp_input3" value="" /><br/>
                    </div>
                    <div>
                        <div class="col-sm-offset-2 col-sm-6">
                            <button type="button" id="timeselect" class="btn  btn-primary">确认查询</button><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                            <button type="button" id="allselect" class="btn btn-primary">查询所有记录</button>
                        </div>
                    </div>
                </fieldset>
            </form>

            <table  id="recordstable" data-toggle="table" data-url=""
                    data-method="post"
                    data-query-params="queryParams"
                    data-toolbar="#toolbar"
                    data-pagination="true"
                    data-search="true"
                    data-show-refresh="true"
                    data-show-toggle="true"
                    data-show-columns="true"
                    data-page-size="10"
            <%--data-pageList:="[10, 25, 50, 100]"--%>
                    data-striped="true"
                    <%--style="VISIBILITY:hidden"--%>
            >
                <thead>
                <tr>
                    <th data-field="fName">地块名称</th>
                    <th data-field="fDate">创建时间</th>
                    <th data-field="fLocation">地块所在位置</th>
                    <th data-field="read" align="center">操作</th>
                    <th data-field="del" align="center">删除</th>
                </tr>
                </thead>
            </table>
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
<script type="text/javascript" src="js/jquery-3.1.1.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
<<script src="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

<!-- Latest compiled and minified Locales -->
<script src="//cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
<script>
    $('.startdate').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,

        startView: 2,
        minView: 2,
        forceParse: 0,
        pickerPosition: "bottom-left"
    });
    $('.enddate').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        pickerPosition: "bottom-left"
    });
    $("#timeselect").click(function(){
        var a=$("#dtp_input2").val();
        var b=$("#dtp_input3").val();
//        在这个地方要注意不能写javascript格式，第二不能用.text()获取数据
        var url="FieldServlet?action=show&startdate="+a+"&enddate="+b;
        $("#recordstable").bootstrapTable('refresh', {url: url});
        alert(c);
    });
    $("#allselect").click(function(){
        var a=$("#dtp_input2").val();
        var b=$("#dtp_input3").val();
//        在这个地方要注意不能写javascript格式，第二不能用.text()获取数据
        var url="FieldServlet?action=showall&startdate="+a+"&enddate="+b;
        $("#recordstable").bootstrapTable('refresh', {url: url});
        alert(c);
    });

</script>
</body>
</html>
