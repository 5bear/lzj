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
                <a onclick="history.go(-1)" class="operation"><< 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                养护日志信息编辑
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table vertical-table">
                    <tbody>
                    <!--<tr>
                        <td>编号</td>
                        <td><input type="text" class="table-input"/></td>
                    </tr>-->
                    <tr>
                        <td>公司</td>
                        <td>
                            <c:choose>
                            <c:when test="${company eq '养护中心'}">
                                <select class="table-input" id="company" onchange="changeCompany()">
                                    <option value="上海成基市政建设发展有限公司"  <c:if test="${MaintainLog_edit.company eq '上海成基市政建设发展有限公司'}">selected="selected"</c:if>>上海成基市政建设发展有限公司</option>
                                    <option value="上海高架养护管理有限公司" <c:if test="${MaintainLog_edit.company eq '上海高架养护管理有限公司'}">selected="selected"</c:if>>上海高架养护管理有限公司</option>
                                </select>
                            </c:when>
                            <c:when test="${company ne '养护中心'}">
                                ${company}
                            </c:when>
                        </c:choose></td>
                    </tr>
                    <tr>
                        <td>车辆类型</td>
                        <td>
                            <select class="table-input" id="vehicleType" onchange="changeType('${company}')">
                                <option value="清扫车" <c:if test="${type eq '清扫车'}">selected="selected"</c:if>>清扫车</option>
                                <option value="牵引车" <c:if test="${type eq '牵引车'}">selected="selected"</c:if>>牵引车</option>
                                <option value="巡视车" <c:if test="${type eq '巡视车'}">selected="selected"</c:if>>巡视车</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>车辆牌照</td>
                        <td>
                            <select class="table-input" id="vehicleLicense">
                                <c:forEach items="${VehicleList}" var="vehicle">
                                    <option value="${vehicle.vehicleLicense}" <c:if test="${vehicle.vehicleLicense eq MaintainLog_edit.vehicleLicense}">selected="selected"</c:if>>${vehicle.vehicleLicense}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>负责人</td>
                        <td><input type="text" class="table-input" id="principal" value="${MaintainLog_edit.principal}"/></td>
                    </tr>
                    <tr>
                        <td>路段信息</td>
                        <td>
                            <select class="table-input" id="road">
                                <c:forEach items="${LineList}" var="line">
                                    <option value="${line.line}" <c:if test="${line.line eq MaintainLog_edit.road}">selected="selected"</c:if> >${line.line}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>事件类型</td>
                        <td><input type="text" class="table-input" id="eventType" value="${MaintainLog_edit.eventType}"/></td>
                    </tr>
                    <tr>
                        <td>日期</td>
                        <td><input type="text" class="table-input" id="happen-date" value="${MaintainLog_edit.dayTime}"/></td>
                    </tr>
                    <tr>
                        <td>发生时间</td>
                        <td><input type="text" class="table-input" id="happen-hour" value="${MaintainLog_edit.time}"/></td>
                    </tr>
                    <tr>
                        <td>事件介绍</td>
                        <td><textarea class="table-input" rows="3" id="remark">${MaintainLog_edit.remark}</textarea></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 text-center">
                <button class="btn btn-default"  onclick="addMaintainLog()">提交</button>
            </div>
        </div>


    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">成功提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>已经成功提交</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="go()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" id="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">重复提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>同一车辆同一时间不能重复添加养护日志</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!-- JavaScript -->
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.js"></script>

<!-- JavaScript -->
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#progress").dropdown('toggle');
    });

    $('#happen-date').datetimepicker({
        lang:'ch',
        timepicker:false,
        format:"Y-m-d",
        yearStart: 2016,
        yearEnd: 2050
    });

    $('#happen-hour').datetimepicker({
        datepicker:false,
        format:'H:i',
        step:10
    });

</script>
<script type="text/javascript">

    function changeCompany() {
        var selector = document.getElementById("company");
        var index = selector.selectedIndex;
        var company = selector.options[index].value;

        var selector1 = document.getElementById("vehicleType");
        var index1 = selector1.selectedIndex;
        var type = selector1.options[index1].value;

        $.ajax({
            url: "<%=request.getContextPath()%>/getVehicleByType",
            type: "post",
            data: {
                company: company,
                type: type
            },
            success: function (data) {

                var r = $.parseJSON(data);
                if (r.result == 0) {
                    var list = r.obj;
                    $("#vehicleLicense").empty();
                    if (list != null && list.length > 0) {
                        $(list).each(function (index, element) {
                            var node = "<option>" + element.vehicleLicense + "</option>";
                            $("#vehicleLicense").append(node);
                        });

                    }

                } else {
                    alert(r.msg);
                }
            }
        });
        var selector2 = document.getElementById("company");
        var index2 = selector2.selectedIndex;
        var company1 = selector2.options[index2].value;
        $.ajax({
            url: "<%=request.getContextPath()%>/getLine",
            type: "post",
            data: {
                company: company1
            },
            success: function (data) {

                var r = $.parseJSON(data);
                if (r.result == 0) {
                    var list = r.obj;
                    $("#road").empty();
                    if (list != null && list.length > 0) {
                        $(list).each(function (index, element) {
                            var node = "<option>" + element.line + "</option>";
                            $("#road").append(node);
                        });

                    }

                } else {
                    alert(r.msg);
                }
            }
        })
    }


    function changeType(company){
        var selector = document.getElementById("vehicleType");
        var index  = selector.selectedIndex;
        var type = selector.options[index].value;

        if (company == "养护中心") {
            var selector1 = document.getElementById("company");
            var index1 = selector1.selectedIndex;
            var company = selector1.options[index1].value;
        }

        $.ajax({
            url: "<%=request.getContextPath()%>/getVehicleByType",
            type: "post",
            data: {
                company: company,
                type: type
            },
            success: function (data) {

                var r = $.parseJSON(data);
                if (r.result==0) {
                    var list = r.obj;
                    $("#vehicleLicense").empty();
                    if (list != null && list.length > 0) {
                        $(list).each(function(index,element){
                            var node = "<option>"+element.vehicleLicense+"</option>";
                            $("#vehicleLicense").append(node);
                        });

                    }

                } else  {
                    alert(r.msg);
                }
            }
        })
    }



    function setSelect(vehicleLicense,line) {
        var obj = document.getElementById("vehicleLicense");
        _Select(obj, vehicleLicense);
        var obj = document.getElementById("road");
        _Select(obj, line);
    }

    function _Select(o, s) {
        for (var i = 0; i < o.options.length; i++)
            if (o.options[i].value == s) {
                o.options[i].selected = true;
                break;
            }
    }

    function go() {
        location.href="<%=request.getContextPath()%>/MaintainLog/list";
    }

    function addMaintainLog(){


        var vehicleLicense=$("#vehicleLicense option:selected").text();
        var principal=$("#principal").val();
        var road=$("#road option:selected").text();
        var eventType=$("#eventType").val();
        var dayTime=$("#happen-date").val();
        var remark=$("#remark").val();
        var time=$("#happen-hour").val();
        if(typeof (dayTime)=="undefined" || dayTime==null || dayTime==""){
            alert("养护日期必须填写！")
        }else{
        $.ajax({
            url:"<%=request.getContextPath()%>/MaintainLog/edit",
            type:"post",
            data:{id:'${MaintainLog_edit.id}',
                vehicleLicense:vehicleLicense,
                principal:principal,
                road:road,
                eventType:eventType,
                dayTime:dayTime,
                remark:remark,
                time:time
            },
            success:function(data){

                if(data=="success") {
                    $('#success').modal('show');
                }else if(data=="false"){
                    $('#false').modal('show');
                }else if(data=="NoPower"){
                    alert("无操作权限");
                }

            }
        })
        }
    }
</script>

</body>
</html>
