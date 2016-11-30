<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/17
  Time: 上午0:41
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

<body >

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="base1"></jsp:param>
        <jsp:param name="pageFather" value="base"></jsp:param>
    </jsp:include>
        <!-- Brand and toggle get grouped for better mobile display -->


    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 停车场管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <!--<a href="javascript:history.back();" class="operation"><< 返回</a>-->
                <a onclick="history.go(-1)" class="operation"> << 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                停车场信息录入
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
                                    <select class="table-input" name="company" id="company" >
                                        <option value="上海成基市政建设发展有限公司" <c:if test="${Park_edit.company eq '上海成基市政建设发展有限公司'}">selected="selected"</c:if>>上海成基市政建设发展有限公司</option>
                                        <option value="上海高架养护管理有限公司" <c:if test="${Park_edit.company eq '上海高架养护管理有限公司'}">selected="selected"</c:if>>上海高架养护管理有限公司</option>
                                    </select>
                                </c:when>
                                <c:when test="${sessionScope.company ne '养护中心'}">
                                    ${sessionScope.company}
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>停车场名称</td>
                        <td><input type="text" class="table-input"  id="parkName" value="${Park_edit.parkName}"/></td>
                    </tr>
                    <tr>
                        <td>联系电话</td>
                        <td><input type="text" class="table-input"  id="tel" value="${Park_edit.tel}"/></td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td><input type="text" class="table-input"  id="addr" value="${Park_edit.addr}"/></td>
                    </tr>
                    <tr>
                        <td>服务器IP地址</td>
                        <td><input type="text" class="table-input"  id="serverIP" value="${Park_edit.serverIP}"/></td>
                    </tr>
                    </tbody>
                </table>
                </form>

            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-4 col-md-offset-4 col-sm-4 col-sm-offset-4 text-center">
                <button class="btn btn-default" onclick="editPark('${sessionScope.company}')" >提交</button>

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
                <p>同一停车场不能重复存储</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="null" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body text-center">
                <p>停车场名称不能为空</p>
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

    function setSelect(company) {
        var obj = document.getElementById("company");
        _Select(obj, company);
    }

    function _Select(o, s) {
        for (var i = 0; i < o.options.length; i++)
            if (o.options[i].value == s) {
                o.options[i].selected = true;
                break;
            }
    }

    function go() {
        location.href="<%=request.getContextPath()%>/Park/list";
    }

    function editPark(company){

        if (company == "养护中心") {
            company=$("#company option:selected").text();
        }

        var parkName=$("#parkName").val();
        var tel=$("#tel").val();
        var addr=$("#addr").val();
        var serverIP=$("#serverIP").val();
        $.ajax({
            url:"<%=request.getContextPath()%>/Park/edit",
            type:"post",
            data:{id:'${Park_edit.id}',company:company,parkName:parkName,tel:tel,
                addr:addr,serverIP:serverIP},
            success:function(data){

                if(data=="success")
                    $('#success').modal('show');
                else if(data=="false")
                    $('#false').modal('show');
                else if(data=="null")
                    $('#null').modal('show');
                else if(data=="NoPower")
                    alert("无操作权限")
            }
        })


    }



</script>

</body>
</html>
