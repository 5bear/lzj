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

    <title>上海市快速路养护监管系统</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="../css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style.css"/>
    <link rel="stylesheet" href="../css/panel-dropdown.css"/>
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


    </div>

            <div class="col-lg-9">


                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3 time-row">

                        <a href="../MaintainLog" class="operation"><< 返回</a>

                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>编号</th>
                                <th>车辆牌照</th>
                                <th>负责人</th>
                                <th>路段信息</th>
                                <th>事件类型</th>
                                <th>日期</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${MaintainLogList}" var="maintainLog">
                                <tr>
                                    <td>${maintainLog.id}</td>
                                    <td>${maintainLog.vehicleLicence}</td>
                                    <td>${maintainLog.principal}</td>
                                    <td>${maintainLog.road}</td>
                                    <td>${maintainLog.eventType}</td>
                                    <td>${maintainLog.dayTime}</td>
                                    <td>
                                        <button class="btn btn-default" onclick="MaintainLog_detail('${maintainLog.id}')">详细</button>
                                        <button class="btn btn-default" onclick="deleteMaintainLog('${maintainLog.id}')">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row text-right">
                    <ul class="page">
                        <li><a href="#"><</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">></a></li>
                    </ul>
                </div>
            </div>
</div>


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
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#progress").dropdown('toggle');
    });


    $('a[data-toggle="dropdown"]').click(function() {
        $(this).nextAll().toggle();
    });
</script>

<script type="text/javascript">

    function MaintainLog_detail(id)
    {
        location.href="detail?id="+id;


    }
    function deleteMaintainLog(id)
    {
        alert("delete");
        $.ajax({
            url:"delete",
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

