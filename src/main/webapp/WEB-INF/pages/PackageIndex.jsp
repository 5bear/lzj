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
    <input type="hidden" id="curoffset" value="${PackageList.offset}">
    <input type="hidden" id="total" value="${PackageList.total}">
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
                            <img src="<%=request.getContextPath()%>/images/search1.png" alt="搜索"/>
                            <input  type="text" id="search" placeholder="请输入包件名称/公司" value="${name}"  onkeypress="if(event.keyCode==13) {subSearch.click();return false;}"/>
                        </div>
                        <button id="subSearch" name="subSearch" type="button" class="btn btn-default" onclick="searchPackage()">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="<%=request.getContextPath()%>/Package/add" class="add-operation"><img src="<%=request.getContextPath()%>/images/add1.png" alt="增加"/>新增包件信息</a>
                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>所属养护公司</th>
                                <th>包件名称</th>
                                <th>总里程</th>
                                <th>实际里程</th>
                              <%--  <th>包含路段名称</th>--%>
                                <th>次数</th>
                                <th>执行时间</th>
                                <th>包件描述</th>
                                <th>录入人</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${PackageList.datas}" var="item">
                                <tr>
                                    <td>${item.company}</td>
                                    <td>${item.packageName}</td>
                                    <td>${item.distance}</td>
                                    <td>${item.realDistance}</td>
                                  <%--  <td>${item.roads}</td>--%>
                                    <td>${item.time}</td>
                                    <td>${item.runtime}</td>
                                    <td>${item.remark}</td>
                                    <td>${item.inputMan}</td>
                                    <td>
                                        <a onclick="editPackage('${item.id}')" class="operation"><label><img src="<%=request.getContextPath()%>/images/edit.png" alt="编辑">编辑</label></a>
                                        <a data-toggle="modal" data-target="#delete" onclick="getId(${item.id})"  class="operation"><label><img src="<%=request.getContextPath()%>/images/delete1.png" alt="删除">删除</label></a>

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
                <jsp:param value="Package" name="url"/>
                <jsp:param value="${PackageList.total }" name="item"/>
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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deletePackage(${PackageList.offset},${PackageList.total},${PackageList.size})">确定</button>
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
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.js"></script>

<script type="text/javascript">

    var id;

    function getId(Id) {
        id=Id;

    }

    function editPackage(id)
    {
        location.href="<%=request.getContextPath()%>/Package/edit?id="+id;


    }
    function deletePackage(offset,total,size)
    {
        $.ajax({
            url:"<%=request.getContextPath()%>/Package/delete",
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
                    //alert("包含路段不为空,此时不能删除该包件!");
                    $('#false').modal('show');
                }
            }
        })
    }

    function searchPackage()
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
