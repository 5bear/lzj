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
    <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>上海市快速路养护作业监管设施完善工程</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="<%=request.getContextPath()%>/css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/panel-dropdown.css"/>
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
                    <li><a href="html/index.html"><i class="icon-dashboard"></i> 进度管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 养护日志管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <!--<a href="javascript:history.back();" class="operation"><< 返回</a>-->
                <a onclick="history.go(-1)" class="operation"><< 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                养护日志详细信息
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table vertical-table">
                    <tbody>
                    <!--<tr>
                        <td>编号</td>
                        <td>${MaintainLog_detail.id}</td>
                    </tr>-->
                    <tr>
                        <td>车辆牌照</td>
                        <td>${MaintainLog_detail.vehicleLicense}</td>
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
                        <td>发生时间</td>
                        <td>${MaintainLog_detail.time}</td>
                    </tr>
                    <tr>
                        <td>养护公司</td>
                        <td>${MaintainLog_detail.company}</td>
                    </tr>
                    <tr>
                        <td>事件介绍</td>
                        <td>${MaintainLog_detail.remark}</td>
                    </tr>


                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
                <button class="btn btn-default" onclick="editMaintainLog('${MaintainLog_detail.id}')">编辑</button>
                <button class="btn btn-default" data-toggle="modal" data-target="#delete" onclick="getId('${MaintainLog_detail.id}')">删除</button>
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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteMaintainLog()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->

<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.js"></script>
<script type="text/javascript">

    var id;

    function getId(Id) {
        id=Id;
    }

    function editMaintainLog(id)
    {
        location.href="<%=request.getContextPath()%>/MaintainLog/edit?id="+id;


    }
    function deleteMaintainLog()
    {

        $.ajax({
            url:"<%=request.getContextPath()%>/MaintainLog/delete",
            type:"post",
            data:{id:id},
            success:function(data){

                if(data=="success"){
                    location.href="<%=request.getContextPath()%>/MaintainLog/list";
                }
                else if(data=="NoPower"){
                    alert("无操作权限");
                }else {
                    alert("error");
                }
            }
        })
    }
</script>

</body>
</html>