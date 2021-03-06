<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/17
  Time: 上午0:08
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
        <jsp:param name="pageName" value="base4"></jsp:param>
        <jsp:param name="pageFather" value="base"></jsp:param>
    </jsp:include>


        <!-- Brand and toggle get grouped for better mobile display -->


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
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <a onclick="history.go(-1)" class="operation"><< 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                包件信息录入
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <form>
                <table class="table vertical-table vertical-table1">
                    <tbody>
                    <tr>
                        <td>所属养护公司</td>
                        <td>
                            <c:choose>
                                <c:when test="${sessionScope.company eq '养护中心'}">
                                    <select class="table-input" name="company" id="company" >
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
                        <td>包件名称</td>
                        <td><input type="text" class="table-input" id="packageName"/></td>
                    </tr>
                    <!--<tr>
                        <td>包含路段名称</td>
                        <td>
                            <input type="text" class="table-input" id="roads"/>
                            <input type="button" onclick="getRoads()" value="button">
                        </td>
                        <td><input type="text" class="table-input" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td>实际里程</td>
                        <td><input type="text" class="table-input" id=""/></td>
                    </tr>-->
                    <tr>
                        <td>总里程(千米)</td>
                        <td><input type="text" class="table-input" id="distance" /></td>
                    </tr>

                    <!--<tr>
                        <td>录入人</td>
                        <td><input type="text" class="table-input" id="inputMan"/></td>
                    </tr>-->
                    <tr>
                        <td>次数</td>
                        <td><input type="text" class="table-input" id="time"/></td>
                    </tr>
                    <tr>
                        <td>执行时间(年)</td>
                        <!--<td><input type="text" class="table-input" id="happen-year" /></td>-->
                        <td>
                            <select id="happen-year" class="table-input" >
                                <c:forEach items="${yearList}" var="year">
                                    <option>${year}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>包件描述</td>
                        <td><textarea class="table-input" rows="3" id="remark"></textarea></td>
                    </tr>
                    </tbody>
                </table>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 text-center">
                <button class="btn btn-default" onclick="addPackage('${sessionScope.company}')">提交</button>
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

<div class="modal fade" id="null" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>包件名称不能为空!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>包件名称已存在,不能重复添加!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.datetimepicker.js"></script>
<script>

    $(function(){
        $("#base").dropdown('toggle');
    });

</script>

<script type="text/javascript">

    function go() {
        location.href="<%=request.getContextPath()%>/Package/list";
    }

    function addPackage(company){

        if (company == "养护中心") {
             company = $("#company option:selected").text();
        }
        var packageName=$("#packageName").val();
        var distance=$("#distance").val();
        //var inputMan=$("#inputMan").val();
        var time=$("#time").val();
        var runtime=$("#happen-year").val();
        var remark=$("#remark").val();

        if(typeof(distance) == "undefined" || distance==null || distance=="" || distance<=0){
           alert("总里程不能为空并且必须大于0");
        }else if(typeof(time) == "undefined" || time==null || time=="" || time<=0){
            alert("次数不能为空并且必须大于0");
        }else{
            $.ajax({
                url:"<%=request.getContextPath()%>/Package/add",
                type:"post",
                data:{
                    company:company,
                    packageName:packageName,
                    distance:distance,
                    //inputMan:inputMan,
                    time:time,
                    runtime:runtime,
                    remark:remark},

                success:function(data){

                    if(data=="success")
                        $('#success').modal('show');
                    else if(data=="null")
                        $('#null').modal('show');
                    else if(data=="false")
                        $('#false').modal('show');
                    else if(data=="NoPower")
                        alert("无操作权限")
                }
            })
        }

    }
</script>

</body>
</html>
