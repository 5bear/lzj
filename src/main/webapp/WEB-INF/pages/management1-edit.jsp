<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/17
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <jsp:param name="pageName" value="management-edit"></jsp:param>
    <jsp:param name="pageFather" value="management"></jsp:param>
  </jsp:include>
  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 系统管理</a></li>
          <li class="active"><i class="icon-file-alt"></i> 用户管理</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-6 col-lg-offset-3 time-row">
        <a href="UserManage" class="operation"><< 返回</a>
      </div>
      <div class="col-lg-6 col-lg-offset-3 text-center time-row">
        用户管理信息录入
      </div>
      <div class="col-lg-6 col-lg-offset-3">
        <table class="table vertical-table">
          <tbody>
          <tr>
            <td>账号</td>
            <td><input type="text" class="table-input" id="account"/></td>
          </tr>
          <tr>
            <td>用户名</td>
            <td><input type="text" class="table-input" id="username"/></td>
          </tr>
          <tr>
            <td>密码</td>
            <td><input type="text" class="table-input" id="password"/></td>
          </tr>
          <tr>
            <td>用户权限</td>
            <td><select  class="table-input" id="power">
              <option value="系统管理员">系统管理员</option>
              <option value="领导">领导</option>
              <option value="监理">监理</option>
              <option value="养护公司管理">养护公司管理</option>
              <option value="普通用户">普通用户</option>
            </select></td>
          </tr>
          <tr>
            <td>所属部门</td>
            <td><input type="text" class="table-input" id="company"/></td>
          </tr>
          <tr>
            <td>联系电话</td>
            <td><input type="text" class="table-input" id="phoneNum"/></td>
          </tr>
          <tr>
            <td>备注</td>
            <td><input type="text" class="table-input" id="remark"/></td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
        <button class="btn btn-default" onclick="addUser()">提交</button>
        <button class="btn btn-default">取消</button>
      </div>
    </div>


  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
  $(document).ready(function(){
    $("#account").val('${account.account}')
    $("#username").val('${account.username}')
    $("#password").val('${account.password}')
    $("#power").find("option[value="+'${account.power}'+"]").attr("selected",true);
    $("#company").val('${account.company}')
    $("#phoneNum").val('${account.phoneNum}')
    $("#remark").val('${account.remark}')
  })
  function addUser(){
    var id='${account.id}';
    var account=$("#account").val();
    var username=$("#username").val();
    var password=$("#password").val();
    var power=$("#power").val();
    var company=$("#company").val();
    var phoneNum=$("#phoneNum").val();
    var remark=$("#remark").val();
    if(account==""){
      alert("账号不能为空")
      return true;
    }
    if(username==""){
      alert("用户名不能为空")
      return true;
    }
    if(password==""){
      alert("密码不能为空")
      return true;
    }
    if(id==''){
      $.ajax({
        url:"User/add",
        type:"post",
        data:{account:account,username:username,password:password,power:power,company:company,phoneNum:phoneNum,remark:remark},
        success:function(data){
          if(data=="duplicated"){
            alert("账号或用户名重复")
            return false;
          }
          location.href="UserManage";
        }
      })
    }else{
      $.ajax({
        url:"User/edit",
        type:"post",
        data:{id:'${account.id}',account:account,username:username,password:password,power:power,company:company,phoneNum:phoneNum,remark:remark},
        success:function(data){
          if(data=="duplicated"){
            alert("账号或用户名重复")
            return false;
          }
          location.href="UserManage";
        }
      })
    }
  }
  $(function(){
    $("#management").dropdown('toggle');
  });

</script>
</body>
</html>
