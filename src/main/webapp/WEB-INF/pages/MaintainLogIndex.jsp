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
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/panel-dropdown.css"/>
</head>

<body>

<div id="wrapper">

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
            <div class="col-lg-3">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">选择车辆</div>
                    <div class="panel-body">
                        <li class="dropdown dropdown1">
                            <a href="#" data-toggle="dropdown">按照车辆查看</a>
                            <div class="arrow-section arrow-section1">
                                <div class="arrow-down arrow-down1"></div>
                            </div>
                            <ul class="dropdown-menu panel-menu">

                                <li class="dropdown dropdown2">
                                    <a href="#" data-toggle="dropdown">上海高架养护公司</a>
                                    <div class="arrow-section arrow-section2">
                                        <div class="arrow-down arrow-down2"></div>
                                    </div>
                                    <ul class="dropdown-menu panel-menu">
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="dropdown">养护车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu">
                                                <c:forEach items="${GyList}" var="Gy">
                                                    <li onclick="search('${Gy.vehicleLicence}')">${Gy.vehicleLicence}</li>
                                                </c:forEach>
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="dropdown">牵引车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu">
                                                <c:forEach items="${GqList}" var="Gq">
                                                    <li onclick="search('${Gq.vehicleLicence}')">${Gq.vehicleLicence}</li>
                                                </c:forEach>
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="dropdown">巡查车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu">
                                                <c:forEach items="${GxList}" var="Gx">
                                                    <li onclick="search('${Gx.vehicleLicence}')">${Gx.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown dropdown2">
                                    <a href="#" data-toggle="dropdown">上海成基公司</a>
                                    <div class="arrow-section arrow-section2">
                                        <div class="arrow-down arrow-down2"></div>
                                    </div>
                                    <ul class="dropdown-menu panel-menu">
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="dropdown">养护车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu">
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                                <c:forEach items="${CyList}" var="Cy">
                                                    <li onclick="search('${Cy.vehicleLicence}')">${Cy.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="dropdown">牵引车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu">
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                                <c:forEach items="${CqList}" var="Cq">
                                                    <li onclick="search('${Cq.vehicleLicence}')">${Cq.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="dropdown">巡查车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu">
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                                <c:forEach items="${CxList}" var="Cx">
                                                    <li onclick="search('${Cx.vehicleLicence}')">${Cx.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="row">
                    <div class="col-lg-12 text-left search-row">
                        <p>选择查看日志时间</p>
                        从<input type="text" id="date1" placeholder="选择开始日期" value="${date1}"/>到
                        <input type="text" id="date2" placeholder="选择结束日期" value="${date2}"/>
                        <button class="btn btn-default" onclick="searchByTime()">确认</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 time-row">
                        <a href="MaintainLog/add0" class="add-operation"><img src="images/add1.png" alt="增加"/>新增养护纪录</a>
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
        $("#progress").dropdown('toggle');
    });

    $('#date1').datetimepicker({
        lang:'ch',
        timepicker:false,
        format:"Y-m-d",
        yearStart: 2016,
        yearEnd: 2050
    });

    $('#date2').datetimepicker({
        lang:'ch',
        timepicker:false,
        format:"Y-m-d",
        yearStart: 2016,
        yearEnd: 2050
    });

    $('a[data-toggle="dropdown"]').click(function() {
        $(this).nextAll().toggle();
    });
</script>

<script type="text/javascript">

    function MaintainLog_detail(id)
    {
        location.href="MaintainLogDetail?id="+id;


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

    function searchByTime()
    {
        var date1=$("#date1").val();
        var date2=$("#date2").val();
         /*$.ajax({
            url:"MaintainLog/search",
            type:"post",
            data:{date1:date1,
                  date2:date2},
            success:function(){

                if(data=="success"){
                    location.reload();
                }else {
                    alert("error");
                }
            }
        })*/
        location.href="MaintainLogSearchByTime?date1="+date1+"&date2="+date2;
    }

    function search(search)
    {
        location.href="MaintainLogSearch?search="+search;
    }

</script>

</body>
</html>
