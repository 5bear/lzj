<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/10
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/bootstrap.js"></script>
  <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/login.css" rel="stylesheet">

  <title>上海市快速路养护作业监管设施完善工程</title>
</head>

<body>
<div class="login-div">
  <p class="text-center login-title">上海市快速路养护作业监管设施完善工程</p>
  <div class="panel panel-login">
    <div class="panel-heading text-center login-heading">用户登录</div>
    <div class="panel-body">
        <div class="panel-row">
          <div class="left">
            <p>用户名</p>
            <img src="images/user.png" alt="用户"/>
          </div>
          <div class="right">
            <input type="text" id="username"/>
          </div>
          <div class="clearboth"></div>
        </div>
        <div class="panel-row">
          <div class="left">
            <p>密码</p>
            <img src="images/password.png" alt="用户"/>
          </div>
          <div class="right">
            <input type="password" id="password"/>
          </div>
          <div class="clearboth"></div>
        </div>
        <p class="alert-red text-center" id="error"></p>
        <div class="text-center">
          <button class="btn btn-default" onclick="login()">登录</button>
        </div>
    </div>
  </div>
</div>
</body>
<script>
  function login(){
    var username=$("#username").val();
    var password=$("#password").val();
    $.ajax({
      url:"loginCheck",
      type:"post",
      data:{username:username,password:password},
      success:function(data){
        if(data=="success")
            location.href="index";
        else if(data=="usr_error")
            $("#error").html("登陆失败，用户不存在");
        else if(data=="pwd_error")
          $("#error").html("登陆失败，密码错误");
      }
    })
  }
</script>
</html>
