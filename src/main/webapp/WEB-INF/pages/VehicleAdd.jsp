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
                    <li><a href="index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 车辆管理</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <!--<a href="javascript:history.back();" class="operation"><< 返回</a>-->
                <a href="Vehicle" class="operation"><< 返回</a>
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
                                <select name="company" id="company">
                                    <option>上海成基市政建设发展有限公司</option>
                                    <option>上海高架养护管理有限公司</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>车辆类型</td>
                            <td>
                                <select name="vehicleType" id="vehicleType"  onchange="banSelect()">
                                    <option value="">请选择</option>
                                    <option value="清扫车">清扫车</option>
                                    <option value="巡视车">巡视车</option>
                                    <option value="牵引车">牵引车</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>车辆牌照</td>
                            <td><input type="text" class="table-input" id="vehicleLicence"/></td>
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

                                <select id="eFence" >
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
            <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
                <button class="btn btn-default" onclick="addVehicle()">提交</button>
                <button class="btn btn-default">取消</button>
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
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>


<script type="text/javascript">
    $(function () {
        $("#base").dropdown('toggle');
    });

    function go() {
        window.location.href = "Vehicle";
    }
    function init() {
        $("#dzwl").hide();
    }

    function banSelect(){
        var selector = document.getElementById("vehicleType");
        index  = selector.selectedIndex;
        var val = selector.options[index].value;
        if(val == "巡视车"){
           /* $("#eFence").removeAttr("disabled");*/
           $("#dzwl").show();
        }else{
            /*$("#eFence").attr("disabled", "disabled");*/
            $("#dzwl").hide();
        }
    }




    function addVehicle() {


        var company = $("#company option:selected").text();
        var vehicleType = $("#vehicleType option:selected").text();

        var vehicleLicence = $("#vehicleLicence").val();
        var vehicleModel = $("#vehicleModel").val();
        var OBUId = $("#OBUId").val();
        var eFence = $("#eFence option:selected").text();
        var eFenceId = $("#eFence option:selected").val();
        var remark = $("#remark").val();
        if(vehicleType=="巡视车" && (eFenceId==null || eFenceId=="0")){
            alert("巡视车必须选择电子围栏");
        }else{
            $.ajax({
                url: "VehicleAdd1",
                type: "post",
                data: {
                    company: company,
                    vehicleType: vehicleType,
                    vehicleLicence: vehicleLicence,
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
                    }
                }
            });
        }

    }
</script>


</body>
</html>

