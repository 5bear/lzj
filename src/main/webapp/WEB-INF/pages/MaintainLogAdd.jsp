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

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <!--<a href="javascript:history.back();" class="operation"><< 返回</a>-->
                <a href="../MaintainLog" class="operation"><< 返回</a>
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
                    <!--<tr>
                        <td>日期</td>
                        <td><input type="text" class="table-input" id="_date"/> </td>
                    </tr>
                    <tr>-->
                        <td>事件介绍</td>
                        <td><input type="text" class="table-input" id="remark"/></td>
                    </tr>
                    <tr>
                        <td>发生时间</td>
                        <td><input type="text" class="table-input" id="time"/></td>
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
                <button class="btn btn-default"  onclick="addMaintainLog()">提交</button>
                <button class="btn btn-default">取消</button>
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

    function addMaintainLog(){


        var vehicleLicence=$("#vehicleLicence").val();
        var principal=$("#principal").val();
        var road=$("#road").val();
        var eventType=$("#eventType").val();
        //var _date=$("#_date").val();
        var remark=$("#remark").val();
        var time=$("#time").val();

        alert("add");
        $.ajax({
            url:"add1",
            type:"post",
            data:{vehicleLicence:vehicleLicence,
                principal:principal,
                road:road,
                eventType:eventType,
                //_date:_date,
                remark:remark,
                time:time
            },
            success:function(data){

                if(data==0)
                    alert("success");
            }
        })

    }
</script>

</body>
</html>
