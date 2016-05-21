<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/15
  Time: 上午11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

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
       <jsp:param name="pageName" value="base2"></jsp:param>
       <jsp:param name="pageFather" value="base"></jsp:param>
   </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 车辆管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 time-row text-right">
                        <div class="search-div">
                            <img src="images/search1.png" alt="搜索"/>
                            <input type="text" id="search" value="${search}" placeholder="请输入公司/车牌/车辆类型"/>
                        </div>
                        <button class="btn btn-default" onclick="searchVehicle(document.getElementById('search').value)">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="VehicleAdd0" class="add-operation"><img src="images/add1.png" alt="增加"/>新增车辆信息</a>
                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">

                            <thead>
                            <tr>
                                <th>所属养护公司</th>
                                <th>车辆类型</th>
                                <th>车辆牌照</th>
                                <th>车辆型号</th>
                                <th>车载设备编号</th>
                                <th>电子围栏</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${VehicleList}" var="vehicle">
                                <tr>
                                    <td>${vehicle.company}</td>
                                    <td>${vehicle.vehicleType}</td>
                                    <td>${vehicle.vehicleLicence}</td>
                                    <td>${vehicle.vehicleModel}</td>
                                    <td>${vehicle.OBUId}</td>
                                    <td>${vehicle.eFence}</td>
                                    <td>${vehicle.remark}</td>
                                    <td>
                                        <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="editVehicle('${vehicle.id}')">编辑</button>
                                        <button class="btn btn-default" data-toggle="modal" data-target="#delete" onclick="getId('${vehicle.id}')">删除</button>
                                        <!--<a href="#" class="operation"><img src="images/edit.png" alt="编辑" onclick="editVehicle('${vehicle.id}')"/>编辑</a>
                                        <a class="operation" data-toggle="modal" data-target="#delete"><img src="images/delete1.png" alt="删除" onclick="deleteVehicle(${vehicle.id})"/>删除</a>-->
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteVehicle()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>

<script type="text/javascript">

    var id;

    function getId(Id)
    {
        id=Id;
    }

    function editVehicle(Id)
    {
        location.href="VehicleEdit?id="+Id;


    }
    function deleteVehicle()
    {

        //alert("delete");
        $.ajax({
            url:"VehicleDelete",
            type:"post",
            data:{id:id},
            success:function(data){

                if(data=="success"){
                    location.reload();
                }else {
                    alert("error");
                }
            }
        })
    }

    function searchVehicle(search)
    {
        location.href="VehicleSearch?search="+search;
    }



</script>
</body>
</html>



