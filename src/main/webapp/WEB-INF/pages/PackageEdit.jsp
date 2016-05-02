<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/17
  Time: 上午0:09
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
        <jsp:param name="pageName" value="base4"></jsp:param>
        <jsp:param name="pageFather" value="base"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 包件信息管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <!--<a href="javascript:history.back();" class="operation"><< 返回</a>-->
                <a href="Package" class="operation"><< 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                包件信息录入
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table vertical-table vertical-table1">
                    <tbody>
                    <tr>
                        <td>所属养护公司</td>
                        <td>
                            <select name="company" id="company">
                                <option value="上海成基公司" <c:if test="${Package_edit.company=='上海成基公司'}">selected="selected"</c:if>>上海成基公司</option>
                                <option value="上海高架公司" <c:if test="${Package_edit.company=='上海高架公司'}">selected="selected"</c:if>>上海高架公司</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>包件名称</td>
                        <td><input type="text" class="table-input"  id="packageName" value="${Package_edit.packageName}"/></td>
                    </tr>
                    <tr>
                        <td>总里程</td>
                        <td><input type="text" class="table-input"  id="distance" value="${Package_edit.distance}"/></td>
                    </tr>
                    <!--<tr>
                        <td>实际里程</td>
                        <td><input type="text" class="table-input"/></td>
                    </tr>
                    <tr>
                        <td>包含路段名称</td>
                        <td><input type="text" class="table-input" readonly="readonly"/></td>
                    </tr>-->
                    <tr>
                        <td>录入人</td>
                        <td><input type="text" class="table-input"  id="inputMan" value="${Package_edit.inputMan}"/></td>
                    </tr>
                    <tr>
                        <td>次数</td>
                        <td><input type="text" class="table-input"  id="time" value="${Package_edit.time}"/></td>
                    </tr>
                    <tr>
                        <td>执行时间</td>
                        <td><input type="text" class="table-input"  id="runtime" value="${Package_edit.runtime}"/></td>
                    </tr>
                    <tr>
                        <td>包件描述</td>
                        <td><input type="text" class="table-input"  id="remark" value="${Package_edit.remark}"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
                <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="editPackage()">提交</button>
                <button class="btn btn-default">取消</button>
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

    function editPackage(){

        alert("edit");
        var company=$("#company option:selected").text();
        var packageName=$("#packageName").val();
        var distance=$("#distance").val();
        var inputMan=$("#inputMan").val();
        var time=$("#time").val();
        var runtime=$("#runtime").val();
        var remark=$("#remark").val();
        $.ajax({
            url:"PackageEdit1",
            type:"post",
            data:{id:'${Package_edit.id}',
                company:company,
                packageName:packageName,
                distance:distance,
                inputMan:inputMan,
                time:time,
                runtime:runtime,
                remark:remark},
            success:function(data){

            }
        })


    }
</script>

</body>
</html>
