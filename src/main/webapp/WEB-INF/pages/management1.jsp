<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/17
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
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

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageName" value="management1"></jsp:param>
    <jsp:param name="pageFather" value="management"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index"><i class="icon-dashboard"></i> 系统管理</a></li>
          <li class="active"><i class="icon-file-alt"></i> 用户管理</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-12">
        <div class="row">
          <div class="col-lg-12 time-row">
            <a href="User" class="add-operation"><img src="images/add1.png" alt="增加"/>新增用户</a>
          </div>
          <div class="col-lg-12 text-center">
            <table class="table">
              <thead>
              <tr>
                <th>账号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>用户权限</th>
                <th>所属部门</th>
                <th>联系电话</th>
                <th>最后登陆</th>
                <th>备注</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${List}" var="account">
                <tr>
                  <td>${account.account}</td>
                  <td>${account.username}</td>
                  <td>******</td>
                  <td>${account.power}</td>
                  <td>${account.company}</td>
                  <td>${account.phoneNum}</td>
                  <td>${account.lastLogin}</td>
                  <td>${account.remark}</td>
                  <td><a href="User?id=${account.id}" class="operation"><img src="images/edit.png" alt="编辑"/>编辑</a>
                    <a class="operation" data-toggle="modal" data-target="#delete" onclick="getID('${account.id}')"><img src="images/delete1.png" alt="删除"/>删除</a>
                  </td>
                </tr>
              </c:forEach>
             <%-- <tr>
                <td>XXX</td>
                <td>XXX</td>
                <td>超级管理员</td>
                <td>路政局</td>
                <td>123456789</td>
                <td>3/4/16</td>
                <td></td>
                <td><a href="management1-edit.html" class="operation"><img src="images/edit.png" alt="编辑"/>编辑</a>
                  <a class="operation" data-toggle="modal" data-target="#delete"><img src="images/delete1.png" alt="删除"/>删除</a>
                </td>
              </tr>--%>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>

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
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteUser()">确定</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
  var idForDelete;
  function getID(id){
    idForDelete=id;
  }
  function deleteUser(){
    $.ajax({
      url:"User/delete",
      type:"post",
      data:{id:idForDelete},
      success:function(data){
        location.reload(true)
      }
    })
  }
</script>
</body>
</html>
