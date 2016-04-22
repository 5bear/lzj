<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/19
  Time: 下午10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                养护日志详细信息
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table vertical-table">
                    <tbody>
                    <tr>
                        <td>编号</td>
                        <td>${MaintainLog_detail.id}</td>
                    </tr>
                    <tr>
                        <td>车辆牌照</td>
                        <td>${MaintainLog_detail.vehicleLicence}</td>
                    </tr>
                    <tr>
                        <td>负责人</td>
                        <td>${MaintainLog_detail.principal}</td>
                    </tr>
                    <tr>
                        <td>路段信息</td>
                        <td>${MaintainLog_detail.road}</td>
                    </tr>
                    <tr>
                        <td>事件类型</td>
                        <td>${MaintainLog_detail.eventType}</td>
                    </tr>
                    <tr>
                        <td>日期</td>
                        <td>${MaintainLog_detail.dayTime}</td>
                    </tr>
                    <tr>
                        <td>事件介绍</td>
                        <td>${MaintainLog_detail.remark}</td>
                    </tr>
                    <tr>
                        <td>发生时间</td>
                        <td>${MaintainLog_detail.time}</td>
                    </tr>
                    <tr>
                        <td>养护公司</td>
                        <td>${MaintainLog_detail.company}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
                <button class="btn btn-default" onclick="editMaintainLog('${MaintainLog_detail.id}')">编辑</button>
                <button class="btn btn-default" onclick="deleteMaintainLog('${MaintainLog_detail.id}')">删除</button>
            </div>
        </div>


    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#progress").dropdown('toggle');
    });

</script>

<script type="text/javascript">

    function editMaintainLog(id)
    {
        location.href="MaintainLogEdit?id="+id;


    }
    function deleteMaintainLog(id)
    {
        alert("delete");
        $.ajax({
            url:"MaintainLogDelete",
            type:"post",
            data:{id:id},
            success:function(){

                if(data=="success"){
                    location.reload();
                }else {
                    alert("error");
                }
            }
        })
    }
</script>

</body>
</html>