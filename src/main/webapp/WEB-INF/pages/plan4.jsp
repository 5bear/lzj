<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/5/9
  Time: 下午9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
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
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 time-row text-right">
                        <select name="" id="">
                            <option value="" selected="selected">2016年</option>
                        </select>
                        <div class="search-div">
                            <img src="images/search1.png" alt="搜索"/>
                            <input type="text"/>
                        </div>
                        <button class="btn btn-default">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="DriverPlanEdit" class="add-operation"><img src="images/add1.png" alt="增加"/>新增纪录</a>
                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>所属养护公司</th>
                                <th>驾驶员</th>
                                <th>车辆牌照</th>
                                <th>车辆类型</th>
                                <th>日期</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>上海成基市政建设发展有限公司</td>
                                <td>XXX</td>
                                <td>沪A42423</td>
                                <td>清扫车</td>
                                <td>20160403</td>
                                <td>12:00</td>
                                <td>17:00</td>
                                <td><a href="plan4-edit.html" class="operation"><label><img src="images/edit.png" alt="编辑"/>编辑</label></a><label>
                                    <a class="operation" data-toggle="modal" data-target="#delete"><label><img src="images/delete1.png" alt="删除"/>删除</label></a>
                                </td>
                            </tr>
                            <tr>
                                <td>上海成基市政建设发展有限公司</td>
                                <td>XXX</td>
                                <td>沪A42423</td>
                                <td>清扫车</td>
                                <td>20160403</td>
                                <td>12:00</td>
                                <td>17:00</td>
                                <td><a href="plan4-edit.html" class="operation"><label><img src="images/edit.png" alt="编辑"/>编辑</label></a>
                                    <a class="operation" data-toggle="modal" data-target="#delete"><label><img src="images/delete1.png" alt="删除"/>删除</label></a>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">删除提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>你确定要删除吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>

</body>
</html>
