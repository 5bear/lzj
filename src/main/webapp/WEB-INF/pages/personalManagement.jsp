<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/19
  Time: 10:00
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
    <jsp:param name="pageName" value="management2"></jsp:param>
    <jsp:param name="pageFather" value="management2"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href=""><i class="icon-dashboard"></i> 个人信息</a></li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-6 col-lg-offset-3 text-center time-row">
        个人信息
      </div>
      <div class="col-lg-6 col-lg-offset-3">
        <table class="table vertical-table vertical-table1">
          <tbody>
          <tr>
            <td>用户名</td>
            <td class="vertical-table-content" id="username">${account.username}</td>
          </tr>
          <tr>
            <td>用户权限</td>
            <td class="vertical-table-select" id="power">${account.power}</td>
          </tr>
          <tr>
            <td>所属部门</td>
            <td class="vertical-table-content" id="company">${account.company}</td>
          </tr>
          <tr>
            <td>联系电话</td>
            <td class="vertical-table-content" id="phoneNum">${account.phoneNum}</td>
          </tr>
          <tr>
            <td>最后登陆时间</td>
            <td>${account.lastLogin}</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
        <button class="btn btn-default" data-toggle="modal" data-target="#password">更改密码</button>
        <button class="btn btn-default" id="save">编辑信息</button>
      </div>
    </div>

    <div class="modal fade" id="password" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">更改密码</h4>
          </div>
          <div class="modal-body text-center">
            <div class="row password-row">
              <table class="table vertical-table">
                <tbody>
                <tr>
                  <td>新密码</td>
                  <td><input type="text" class="table-input" id="newPwd"/></td>
                </tr>
                <tr>
                  <td>请确认新密码</td>
                  <td><input type="text" class="table-input" id="renewPwd"/></td>
                </tr>
                </tbody>
              </table>
              <p class="red-alert text-center" hidden="hidden" id="error">两次密码不正确！请重新输入。</p>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-default"  onclick="changePwd()">确定</button>
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
  $("#save").click(function() {
    var text = $(this).text();
    if (text == "编辑信息"){
      $(this).text("保存信息");
      $(".vertical-table-content").each(function() {
        var val =  $(this).text();
        this.innerHTML = "<input class='table-input' name='info' value='"+ val + "'>";
      });
      $(".vertical-table-select").html("<select class='table-input' name='info'><option value='系统管理员'>系统管理员</option>" +
      "<option value='领导'>领导</option>" +
      "<option value='监理'>监理</option>" +
      "<option value='养护公司管理'>养护公司管理</option>" +
      "<option value='普通用户'>普通用户</option></select>");
    } else {
      $(this).text("编辑信息");
      edit();
      $(".vertical-table-content").each(function() {
        var val =  $(this).children().val();
        this.innerHTML = val;
      });
      $(".vertical-table-select").html($(".vertical-table-select select option:selected").text());
    }
  });
  function changePwd(){
    var newPwd=$("#newPwd").val();
    var renewPwd=$("#renewPwd").val();
    if(newPwd!=renewPwd) {
      $("#error").attr("hidden", false);
      return false;
    }
    $.ajax({
      url:"User/changePwd",
      type:"post",
      data:{id:'${account.id}',newPwd:newPwd},
      success:function(data){
        location.reload(true);
      }
    })
    }
  function edit(){
    var infos=document.getElementsByName("info");
    console.log(infos)
    var username=infos[0].value
    var power=infos[1].value
    var company=infos[2].value
    var phoneNume=infos[3].value
    $.ajax({
      url:"User/myEdit",
      type:"post",
      data:{id:'${account.id}',username:username,power:power,company:company,phoneNum:phoneNume},
      success:function(data){
       /* location.reload(true);*/
      }
    })
  }
</script>
</body>
</html>
