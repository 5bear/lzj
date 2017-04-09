<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/13
  Time: 下午3:24
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
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

<body onload="init()">

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
                    <li><a href="html/index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 车辆管理</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <!--<a href="javascript:history.back();" class="operation"><< 返回</a>-->
                <a onclick="history.go(-1)" class="operation"> << 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                车辆管理信息录入
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <form>
                    <table class="table vertical-table">
                        <tbody>
                        <tr>
                            <td>所属养护公司</td>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionScope.company eq '养护中心'}">
                                        <select class="table-input" name="company" id="company" onchange="changeCompany()">
                                            <option>上海成基市政建设发展有限公司</option>
                                            <option>上海高架养护管理有限公司</option>
                                        </select>
                                    </c:when>
                                    <c:when test="${sessionScope.company ne '养护中心'}">
                                        ${sessionScope.company}
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>车辆类型</td>
                            <td>
                                <select class="table-input" name="vehicleType" id="vehicleType"  onchange="banSelect()">
                                    <option value="0">请选择</option>
                                    <option value="清扫车">清扫车</option>
                                    <option value="巡视车">巡视车</option>
                                    <option value="牵引车">牵引车</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>车辆牌照</td>
                            <td><input type="text" class="table-input" id="vehicleLicense"/></td>
                        </tr>
                        <tr>
                            <td>车辆型号</td>
                            <td><input type="text" class="table-input" id="vehicleModel"/></td>
                        </tr>
                        <tr>
                            <td>车载设备编号</td>
                            <td><input type="text" class="table-input" id="OBUId"/></td>
                        </tr>
                        <tr id="dzwl">
                            <td>电子围栏</td>
                            <td>

                                <select class="table-input" id="eFence" >
                                    <option value="0"></option>
                                    <c:forEach items="${eFenceList}" var="eFence">
                                        <option value="${eFence.id}">${eFence.eFence}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <!--<td><input type="text" class="table-input" id="eFence"/></td>-->
                        </tr>
                        <tr>
                            <td>备注</td>

                            <td><textarea class="table-input" rows="3" id="remark"></textarea></td>
                        </tr>
                        <!--<tr>
                            <td><input id="isDelete" type="hidden" value="0"/></td>
                        </tr>-->

                        <input name="msg1" type="hidden" value="123"/>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 text-center">
                <button class="btn btn-default" onclick="addVehicle('${sessionScope.company}')">提交</button>
            </div>
        </div>


    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

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
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">重复提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>同一车辆不能重复添加</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<div class="modal fade" id="null" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>车辆牌照不能为空</p>
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


<script type="text/javascript">
    $(function () {
        $("#base").dropdown('toggle');
    });

    function go() {
        window.location.href = "<%=request.getContextPath()%>/Vehicle/list";
    }
    function init() {
        $("#dzwl").hide();
    }

    function banSelect(){
        var selector = document.getElementById("vehicleType");
        var index  = selector.selectedIndex;
        var val = selector.options[index].value;
        if(val == "巡视车"){
           /* $("#eFence").removeAttr("disabled");*/
           $("#dzwl").show();
        }else{
            /*$("#eFence").attr("disabled", "disabled");*/
            $("#dzwl").hide();
        }
    }

    function changeCompany(){
        var selector = document.getElementById("company");
        var index  = selector.selectedIndex;
        var company = selector.options[index].value;

        $.ajax({
            url:"<%=request.getContextPath()%>/getEFence",
            type:"post",
            data: {
                company:company
            },
            success:function(data) {
                if (data == "NoPower") {
                    alert("无操作权限")
                    return false
                }
                var r = $.parseJSON(data);
                if (r.result==0) {
                    var list = r.obj;
                    $("#eFence").empty();
                    if (list != null && list.length > 0) {
                        $(list).each(function (index, element) {
                            var node = " " +
                                    "<option value='"+element.id+"'>"+element.eFence+"</option>";
                            $("#eFence").append(node);
                        });

                    }
                }

            }
        });
    }


    function addVehicle(company) {

        if (company == "养护中心") {
             company = $("#company option:selected").text();
        }

        var vehicleType = $("#vehicleType option:selected").text();

        var vehicleLicense = $("#vehicleLicense").val();
        var vehicleModel = $("#vehicleModel").val();
        var OBUId = $("#OBUId").val();
        var eFence = $("#eFence option:selected").text();
        var eFenceId = $("#eFence option:selected").val();
        var remark = $("#remark").val();

        if(vehicleType!="巡视车"){
            eFence="";
            eFenceId="";
        }

        if(typeof (vehicleType)=="undefined" || vehicleType==null ||vehicleType=="请选择"){
            alert("车辆类型必须选择");
        }else if(typeof (vehicleLicense)=="undefined" || vehicleLicense==null ||vehicleLicense==""){
            alert("车辆牌照必须填写");
        }else if(typeof (vehicleModel)=="undefined" || vehicleModel==null ||vehicleModel==""){
            alert("车辆型号必须填写");
        }else if(typeof (OBUId)=="undefined" || OBUId==null ||OBUId==""){
            alert("车辆设备编号必须填写");
        } else if(vehicleType=="巡视车" && (eFenceId==null || eFenceId=="0")){
            alert("巡视车必须选择电子围栏");
        }else{
            $.ajax({
                url: "<%=request.getContextPath()%>/Vehicle/add",
                type: "post",
                data: {
                    company: company,
                    vehicleType: vehicleType,
                    vehicleLicense: vehicleLicense,
                    vehicleModel: vehicleModel,
                    OBUId: OBUId,
                    eFence: eFence,
                    eFenceId: eFenceId,
                    remark: remark/*,
                     isDelete:isDelete*/
                },
                success: function (data) {

                    if (data == "success") {
                        //alert("已经成功提交");
                        $('#success').modal('show');

                    }
                    else if (data == "false"){
                        $('#false').modal('show');
                        //alert("同一车辆不能重复添加");
                    }
                    else if(data=="null") {
                        $('#null').modal('show');
                    }else if(data=="NoPower"){
                        alert("无操作权限");
                    }
                }
            });
        }

    }
</script>


</body>
</html>

