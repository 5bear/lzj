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
    <input type="hidden" id="curoffset" value="${VehicleList.offset}">
    <input type="hidden" id="total" value="${VehicleList.total}">
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
                        <select  id="type" onchange="searchVehicle()">
                            <option value="0" <c:if test="${type eq '0'}">selected="selected"</c:if>>选择车辆类型</option>
                            <option value="清扫车" <c:if test="${type eq '清扫车'}">selected="selected"</c:if>>清扫车</option>
                            <option value="巡视车" <c:if test="${type eq '巡视车'}">selected="selected"</c:if>>巡视车</option>
                            <option value="牵引车" <c:if test="${type eq '牵引车'}">selected="selected"</c:if>>牵引车</option>

                        </select>
                        <div class="search-div">
                            <img src="<%=request.getContextPath()%>/images/search1.png" alt="搜索"/>
                            <input width="166px" type="text" id="search" value="${name}" placeholder="请输入公司/车牌" onkeypress="if(event.keyCode==13) {subSearch.click();return false;}"/>
                        </div>
                        <button id="subSearch" name="subSearch" type="button" class="btn btn-default" onclick="searchVehicle()">搜索</button>
                    </div>
                    <div class="col-lg-12 time-row">
                        <a href="<%=request.getContextPath()%>/Vehicle/add" class="add-operation"><img src="<%=request.getContextPath()%>/images/add1.png" alt="增加"/>新增车辆信息</a>
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
                            <c:forEach items="${VehicleList.datas}" var="vehicle">
                                <tr>
                                    <td>${vehicle.company}</td>
                                    <td>${vehicle.vehicleType}</td>
                                    <td>${vehicle.vehicleLicense}</td>
                                    <td>${vehicle.vehicleModel}</td>
                                    <td>${vehicle.OBUId}</td>
                                    <td>${vehicle.eFence}</td>
                                    <td>${vehicle.remark}</td>
                                    <td>
                      <%--                  <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="editVehicle('${vehicle.id}')">编辑</button>
                                        <button class="btn btn-default" data-toggle="modal" data-target="#delete" onclick="getId('${vehicle.id}')">删除</button>--%>
                                        <a onclick="editVehicle('${vehicle.id}')" class="operation"><img src="<%=request.getContextPath()%>/images/edit.png" alt="编辑" />编辑</a>
                                        <a onclick="getId('${vehicle.id}')" class="operation" ><img src="<%=request.getContextPath()%>/images/delete1.png" alt="删除" />删除</a>
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
            <jsp:include page="pagerV.jsp">
                <jsp:param value="Vehicle" name="url"/>
                <jsp:param value="${VehicleList.total }" name="item"/>
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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteVehicle(${VehicleList.offset},${VehicleList.total},${VehicleList.size})">确定</button>
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

    function getId(Id)
    {
        id=Id;
        $("#delete").modal("show");
    }

    function editVehicle(Id)
    {
        location.href="<%=request.getContextPath()%>/Vehicle/edit?id="+Id;

    }
    function deleteVehicle(offset,total,size)
    {

        //alert("delete");
        $.ajax({
            url:"<%=request.getContextPath()%>/Vehicle/delete",
            type:"post",
            data:{id:id},
            success:function(data){

                if(data=="success"){
                    if(total%size==1){
                        var selector = document.getElementById("type");
                        var index = selector.selectedIndex;
                        var type = selector.options[index].value;
                        var name = $("#search").val();

                        var goPath = "<%=request.getContextPath()%>/Vehicle/list?pager.offset="+(offset-size);
                        if(typeof(type) != "undefined" && type!=null && type!="0"){
                            goPath+="&type="+type;
                        }
                        if(typeof(name) != "undefined" && name!=null && name!=""){
                            goPath+="&name="+name;
                        }
                        window.location=goPath;
                    }else{
                        location.reload();
                    }
                }else if(data=="NoPower"){
                    alert("无操作权限")
                }else {
                    alert("error");
                }
            }
        })
    }

    function searchVehicle()
    {
        var selector = document.getElementById("type");
        var index = selector.selectedIndex;
        var type = selector.options[index].value;
        var name = $("#search").val();

        if (name == null) {
            name = "";
        }
        if(type==null){
            type="0";
        }
        var goPath = "<%=request.getContextPath()%>/Vehicle/list";
        if(type!="0"){
            goPath+="?type="+type;
            if(name!=""){
                goPath+="&name="+name;
            }
        }else{
            if(name!=""){
                goPath += "?name="+name;
            }
        }
        window.location = goPath;
    }



</script>
</body>
</html>



