<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/5/9
  Time: 下午8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>上海市快速路养护监管系统</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="management3"></jsp:param>
        <jsp:param name="pageFather" value="management"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 系统管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 网络状态</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12 text-center">
                <table class="table">
                    <thead>
                    <tr>
                        <th>设备类型</th>
                        <th>设备名称</th>
                        <th>服务器IP</th>
                        <th>联系电话</th>
                        <th>备注</th>
                        <th>联通状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>养护中心主机</td>
                        <td>养护中心主机</td>
                        <td>32.32.2.1</td>
                        <td>123456789</td>
                        <td></td>
                        <td class="await">断线</td>
                    </tr>
                    <tr>
                        <td>养护中心主机</td>
                        <td>养护中心主机</td>
                        <td>32.32.2.1</td>
                        <td>123456789</td>
                        <td></td>
                        <td class="going">在线</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#management").dropdown('toggle');
    });
</script>
</body>
</html>
