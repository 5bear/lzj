<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/17
  Time: 上午0:34
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
        <jsp:param name="pageName" value="base1"></jsp:param>
        <jsp:param name="pageFather" value="base"></jsp:param>
    </jsp:include>


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 停车场管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 time-row text-right">
                        <div class="search-div">
                            <img src="images/search1.png" alt="搜索"/>
                            <input type="text" id="search" value="${search}"/>
                        </div>
                        <button class="btn btn-default" onclick="searchPark(document.getElementById('search').value)">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="ParkAdd0" class="add-operation"><img src="images/add1.png" alt="增加"/>新增停车场信息</a>
                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>所属养护公司</th>
                                <th>停车场名称</th>
                                <th>联系电话</th>
                                <th>地址</th>
                                <th>服务器IP地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ParkList}" var="park">
                                <tr>
                                    <td>${park.company}</td>
                                    <td>${park.parkName}</td>
                                    <td>${park.tel}</td>
                                    <td>${park.addr}</td>
                                    <td>${park.serverIP}</td>
                                    <td>
                                        <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="editPark('${park.id}')">编辑</button>
                                        <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="deletePark('${park.id}')">删除</button>
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
    $(function(){
        $("#base").dropdown('toggle');
    });
</script>

<script type="text/javascript">

    function editPark(id)
    {
        location.href="ParkEdit?id="+id;


    }
    function deletePark(id)
    {
        alert("delete");
        $.ajax({
            url:"ParkDelete",
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

    function searchPark(search)
    {
        location.href="ParkSearch?search="+search;
    }

</script>


</body>
</html>
