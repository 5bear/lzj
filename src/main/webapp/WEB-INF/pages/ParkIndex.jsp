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
    <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <input type="hidden" id="curoffset" value="${ParkList.offset}">
    <input type="hidden" id="total" value="${ParkList.total}">
    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="base1"></jsp:param>
        <jsp:param name="pageFather" value="base"></jsp:param>
    </jsp:include>


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="html/index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 停车场管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 time-row text-right">
                        <div class="search-div">
                            <img src="<%=request.getContextPath()%>/images/search1.png" alt="搜索"/>
                            <input  placeholder="请输入停车场名称/公司"  type="text" id="search" value="${name}" onkeypress="if(event.keyCode==13) {subSearch.click();return false;}"/>
                        </div>
                        <button id="subSearch" name="subSearch" type="button" class="btn btn-default" onclick="searchPark()">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="<%=request.getContextPath()%>/Park/add" class="add-operation"><img src="<%=request.getContextPath()%>/images/add1.png" alt="增加"/>新增停车场信息</a>
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
                            <c:forEach items="${ParkList.datas}" var="park">
                                <tr>
                                    <td>${park.company}</td>
                                    <td>${park.parkName}</td>
                                    <td>${park.tel}</td>
                                    <td>${park.addr}</td>
                                    <td>${park.serverIP}</td>
                                    <td>
                                        <a  onclick="editPark('${park.id}')"  class="operation"><label><img src="<%=request.getContextPath()%>/images/edit.png" alt="编辑">编辑</label></a>
                                        <a onclick="getID('${park.id}')"  class="operation"><label><img src="<%=request.getContextPath()%>/images/delete1.png" alt="删除">删除</label></a>

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
                <jsp:include page="pager.jsp">
                    <jsp:param value="Park" name="url"/>
                    <jsp:param value="${ParkList.total }" name="item"/>
                    <jsp:param value="method,name" name="param"/>
                </jsp:include>
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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deletePark(${ParkList.offset},${ParkList.total},${ParkList.size})">确定</button>
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

    function getID(Id) {
        id=Id;
        $("#delete").modal("show");
    }

    function editPark(id)
    {
        location.href="<%=request.getContextPath()%>/Park/edit?id="+id;


    }
    function deletePark(offset,total,size)
    {

        $.ajax({
            url:"<%=request.getContextPath()%>/Park/delete",
            type:"post",
            data:{id:id},
            success:function(data){

                if(data=="success"){
                    if(total%size==1){
                        var name = $("#search").val();
                        if (name == null) {
                            name = "";
                        }
                        window.location = "?name=" + name + "&pager.offset=" + (offset-size);
                    }else{
                        location.reload();
                    }
                }else if(data=="NoPower")
                    alert("无操作权限")
                else {
                    alert("error");
                }
            }
        })
    }

    function searchPark()
    {
            var name = $("#search").val();

            if (name == null) {
                name = "";
            }
            window.location = "?name=" + name;
    }

</script>


</body>
</html>
