<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/19
  Time: 下午10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <jsp:param name="pageName" value="progress3"></jsp:param>
        <jsp:param name="pageFather" value="progress"></jsp:param>
    </jsp:include>


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 进度管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 养护日志管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <!--<a href="javascript:history.back();" class="operation"><< 返回</a>-->
                <a href="MaintainLog" class="operation"><< 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                养护日志信息录入
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table vertical-table">
                    <tbody>
                    <!--<tr>
                        <td>编号</td>
                        <td><input type="text" class="table-input"/></td>
                    </tr>-->
                    <tr>
                        <td>车辆牌照</td>
                        <td>
                            <select id="vehicleLicence">
                                <c:forEach items="${VehicleList}" var="vehicle">
                                    <option>${vehicle.vehicleLicence}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>负责人</td>
                        <td><input type="text" class="table-input" id="principal"/></td>
                    </tr>
                    <tr>
                        <td>路段信息</td>
                        <td>
                            <select id="road">
                                <c:forEach items="${LineList}" var="line">
                                    <option>${line.line}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>事件类型</td>
                        <td><input type="text" class="table-input" id="eventType"/></td>
                    </tr>
                    <tr>
                        <td>日期</td>
                        <td><input type="text" class="table-input" id="happen-date"/></td>
                    </tr>
                    <tr>
                        <td>发生时间</td>
                        <td><input type="text" class="table-input" id="happen-hour"/></td>
                    </tr>
                    <tr>
                        <td>事件介绍</td>
                        <td><textarea class="table-input" rows="3" id="remark"></textarea></td>
                    </tr>

                    <!--<tr>
                        <td>养护公司</td>
                        <td><input type="text" class="table-input"/></td>
                    </tr>-->
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
                <button class="btn btn-default" data-toggle="modal" data-target="#success" >提交</button>
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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="addMaintainLog()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#progress").dropdown('toggle');
    });

    $('#happen-date').datetimepicker({
        lang:'ch',
        timepicker:false,
        format:"Y-m-d",
        yearStart: 2016,
        yearEnd: 2050
    });

    $('#happen-hour').datetimepicker({
        datepicker:false,
        format:'H:i',
        step:10
    });

</script>

<script type="text/javascript">

    function addMaintainLog(){


        var vehicleLicence=$("#vehicleLicence").val();
        var principal=$("#principal").val();
        var road=$("#road").val();
        var eventType=$("#eventType").val();
        var _date=$("#happen-date").val();
        var remark=$("#remark").val();
        var time=$("#happen-hour").val();

        $.ajax({
            url:"MaintainLogAdd1",
            type:"post",
            data:{vehicleLicence:vehicleLicence,
                principal:principal,
                road:road,
                eventType:eventType,
                _date:_date,
                remark:remark,
                time:time
            },
            success:function(data){

                if(data=="success")
                    location.href="MaintainLog";
            }
        })

    }
</script>

</body>
</html>
