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
        <jsp:param name="pageName" value="base1"></jsp:param>
        <jsp:param name="pageFather" value="base"></jsp:param>
    </jsp:include>
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="../index.html">上海市快速路养护监管系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li><a href="../index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="base"><i class="fa fa-bar-chart-o"></i> 基础数据 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="../base1.html">停车场管理</a></li>
                        <li><a href="../base2.html">车辆管理</a></li>
                        <li><a href="../base3.html">RFID监测点管理</a></li>
                        <li><a href="../base4.html">包件信息管理</a></li>
                        <li><a href="../base5.html">电子围栏管理</a></li>
                        <li><a href="../base6.html">监管规则管理</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="plan"><i class="fa fa-table"></i> 计划管理 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="../plan1.html">养护作业计划</a></li>
                        <li><a href="../plan2.html">作业线路管理</a></li>
                        <li><a href="../plan3.html">布点计划</a></li>
                        <li><a href="../plan4.html">驾驶员计划</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="progress"><i class="fa fa-edit"></i> 进度管理 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="../progress1.html">养护进度监控</a></li>
                        <li><a href="../progress2.html">实时监控</a></li>
                        <li><a href="../progress3.html">养护日志管理</a></li>
                    </ul>
                </li>

                <li class="dropdown ">
                    <a  href="#" class="dropdown-toggle"  data-toggle="dropdown" id="history"><i class="fa fa-font"></i> 历史数据 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="../history1.html">历史轨迹查询</a></li>
                        <li><a href="../history2.html">历史视频查询</a></li>
                        <li><a href="../history3.html">异常查询</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="reports"><i class="fa fa-desktop"></i> 报表查询 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="../reports1.html">牵引车辆位置报表</a></li>
                        <li><a href="../reports2.html">养护车辆作业区域</a></li>
                        <li><a href="../reports3.html">养护车辆作业情况</a></li>
                        <li><a href="../reports4.html">养护车辆超速</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="management"><i class="fa fa-wrench"></i>系统管理 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="../management1.html">用户管理</a></li>
                        <li><a href="../management2.html">权限管理</a></li>
                        <li><a href="../management3.html">网络状态图</a></li>
                    </ul>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎， 领导 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="../personalManagement.html"><i class="fa fa-user"></i> 个人信息</a></li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-power-off"></i> 安全退出</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="../index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 停车场管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 time-row text-right">
                        <div class="search-div">
                            <img src="../images/search1.png" alt="搜索"/>
                            <input type="text" id="search" value="${search}"/>
                        </div>
                        <button class="btn btn-default" onclick="searchPark(document.getElementById('search').value)">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="add0" class="add-operation"><img src="../images/add1.png" alt="增加"/>新增停车场信息</a>
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
                                        <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="deletePark(${park.id})">删除</button>
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
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#base").dropdown('toggle');
    });
</script>

<script type="text/javascript">

    function editPark(id)
    {
        location.href="edit?id="+id;


    }
    function deletePark(id)
    {
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

    function searchPark(search)
    {
        location.href="search?search="+search;
    }

</script>


</body>
</html>
