<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/17
  Time: 上午0:12
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
        <jsp:param name="pageName" value="base4"></jsp:param>
        <jsp:param name="pageFather" value="base"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 包件信息管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 time-row text-right">
                        <div class="search-div">
                            <img src="images/search1.png" alt="搜索"/>
                            <input type="text" id="search" placeholder="请输入包件名称" value="${search}"/>
                        </div>
                        <button class="btn btn-default" onclick="searchPackage(document.getElementById('search').value)">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="PackageAdd0" class="add-operation"><img src="images/add1.png" alt="增加"/>新增包件信息</a>
                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>所属养护公司</th>
                                <th>包件名称</th>
                                <th>总里程</th>
                                <th>实际里程</th>
                                <th>包含路段名称</th>
                                <th>次数</th>
                                <th>执行时间</th>
                                <th>包件描述</th>
                                <th>录入人</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${PackageList}" var="item">
                                <tr>
                                    <td>${item.company}</td>
                                    <td>${item.packageName}</td>
                                    <td>${item.distance}</td>
                                    <td>${item.realDistance}</td>
                                    <td>${item.roads}</td>
                                    <td>${item.time}</td>
                                    <td>${item.runtime}</td>
                                    <td>${item.remark}</td>
                                    <td>${item.inputMan}</td>
                                    <td>
                                        <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="editPackage('${item.id}')">编辑</button>
                                        <button class="btn btn-default" data-toggle="modal" data-target="#delete" onclick="getId(${item.id})">删除</button>
                                    </td>
                                </tr>
                            </c:forEach>


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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deletePackage()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">删除提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>包含路段不为空,此时不能删除该包件!</p>
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

<script type="text/javascript">

    var id;

    function getId(Id) {
        id=Id;

    }

    function editPackage(id)
    {
        location.href="PackageEdit?id="+id;


    }
    function deletePackage()
    {
        $.ajax({
            url:"PackageDelete",
            type:"post",
            data:{id:id},
            success:function(data){

                if(data=="success"){
                    location.reload();
                }else {
                    //alert("包含路段不为空,此时不能删除该包件!");
                    $('#false').modal('show');
                }
            }
        })
    }

    function searchPackage(search)
    {
        location.href="PackageSearch?search="+search;
    }

</script>

</body>
</html>
