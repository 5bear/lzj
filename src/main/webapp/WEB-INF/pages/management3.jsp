<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body onload="init(${size})">

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
                        <td>120.24.79.63</td>
                        <td>123456789</td>
                        <td></td>
                        <td id="s0">正在测试连接...</td>
                    </tr>
                    <tr>
                        <td>分中心主机</td>
                        <td>成基公司</td>
                        <td>192.168.160.10</td>
                        <td>123456789</td>
                        <td></td>
                        <td id="s1">正在测试连接...</td>
                    </tr>
                    <tr>
                        <td>分中心主机</td>
                        <td>高架公司</td>
                        <td>192.168.160.20</td>
                        <td>123456789</td>
                        <td></td>
                        <td id="s2">正在测试连接...</td>
                    </tr>
                    <c:forEach items="${parks}" var="park" varStatus="v">
                        <tr>
                            <td>停车场主机</td>
                            <td>【${park.company}】${park.parkName}</td>
                            <td id="ip${v.index}">${park.serverIP}</td>
                            <td>${park.tel}</td>
                            <td></td>
                            <td  id="s${v.index+3}">正在测试连接...</td>
                        </tr>
                    </c:forEach>

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
    function init(size){
        var ips = new Array();
        ips.push("120.24.79.63"); //养护中心主机
        ips.push("192.168.160.10");//成基公司主机
        ips.push("192.168.160.20");//高架公司主机

        for(var i=0;i<size;i++){
            ips.push($("#ip"+i).text());
        }


        $.ajax({
            url: "pingIps",
            type: "post",
            data: {
                "ips[]":ips
            },
            success: function (data) {
                var r = $.parseJSON(data);
                if(r.result==0){
                    var states = r.obj;
                    $.each(states,function(index,state){

                        if(state=="连通"){
                            $("#s"+index).attr("class","going");
                        }else if(state=="断线"){
                            $("#s"+index).attr("class","await");
                        }
                        $("#s"+index).text(state);
                    });
                }
            }
        });

    }
</script>
</body>
</html>
