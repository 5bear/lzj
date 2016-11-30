<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/5/9
  Time: 下午9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html><html lang="en">
<head>
    <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>上海市快速路养护作业监管设施完善工程</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/panel-dropdown.css"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="plan4"></jsp:param>
        <jsp:param name="pageFather" value="plan"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 计划管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 驾驶员计划</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <a href="javascript:history.back();" class="operation"><< 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                驾驶员信息录入
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table vertical-table">
                    <tbody>
                    <tr>
                        <td>所属养护公司</td>
                        <td>
                            <select class="table-input"/>
                            <option value="">公司</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>车辆类型</td>
                        <td>
                            <select class="table-input"/>
                            <option value="">车辆类型</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>车辆牌照</td>
                        <td>
                            <select class="table-input"/>
                            <option value="">车辆牌照</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>驾驶员</td>
                        <td><input type="text" class="table-input"/></td>
                    </tr>
                    <tr>
                        <td>日期</td>
                        <td><input type="text" class="table-input" id="date3"/></td>
                    </tr>
                    <tr>
                        <td>开始时间</td>
                        <td><input type="text" class="table-input" id="hour1"/></td>
                    </tr>
                    <tr>
                        <td>结束时间</td>
                        <td><input type="text" class="table-input" id="hour2"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
                <button class="btn btn-default" data-toggle="modal" data-target="#success">提交</button>
                <button class="btn btn-default">取消</button>
            </div>
        </div>


    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">成功提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>已经成功提交</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>


    $('#date3').datetimepicker({
        lang:'ch',
        timepicker:false,
        format:"Y-m-d",
        yearStart: 2016,
        yearEnd: 2050
    });

    $('#hour1').datetimepicker({
        datepicker:false,
        format:'H:i',
        step:10
    });

    $('#hour2').datetimepicker({
        datepicker:false,
        format:'H:i',
        step:10
    });
</script>
</body>
</html>
