<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/22
  Time: 18:58
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
    <jsp:param name="pageName" value="management2"></jsp:param>
    <jsp:param name="pageFather" value="management"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 系统管理</a></li>
          <li class="active"><i class="icon-file-alt"></i> 权限管理</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-6 col-lg-offset-3 text-center time-row">
        权限管理
      </div>
      <table class="table vertical-table">
        <thead>
        <tr>
          <th rowspan="3" colspan="2" class="w200">用户权限</th>
          <th colspan="10">用户角色</th>
        </tr>
        <tr>
          <th colspan="2">系统管理员</th>
          <th colspan="2">领导</th>
          <th colspan="2">监理</th>
          <th colspan="2">养护公司管理</th>
          <th colspan="2">普通用户</th>
        </tr>
        <tr>
          <th>管理</th>
          <th>查看</th>
          <th>管理</th>
          <th>查看</th>
          <th>管理</th>
          <th>查看</th>
          <th>管理</th>
          <th>查看</th>
          <th>管理</th>
          <th>查看</th>
        </tr>
        </thead>
        <tbody id="myBody">
<%--        <tr>
          <td rowspan="6">基础数据</td>
          <td  class="table-th">停车场管理</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-yellow">no</td>
        </tr>
        <tr>
          <td class="pageName">车辆管理</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-yellow">no</td>
        </tr>
        <tr>
          <td class="pageName">RFID管理</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-yellow">no</td>
        </tr>
        <tr>
          <td class="pageName">包件管理</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-yellow">no</td>
        </tr>
        <tr>
          <td class="pageName">电子围栏</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-yellow">no</td>
        </tr>
        <tr>
          <td class="pageName">监控规则</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-yellow">no</td>
        </tr>
        <tr>
          <td rowspan="4">计划管理</td>
          <td class="table-th">养护作业计划</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">作业路线管理</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">布点计划</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">驾驶员计划</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td rowspan="3">进度管理</td>
          <td class="table-th">养护进度监控</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">实时监控</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">养护日志管理</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td rowspan="3">历史数据</td>
          <td class="table-th">历史线路查询</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">历史视频查询</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">异常查询</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td rowspan="2">其他</td>
          <td class="table-th">报表查询</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>
        <tr>
          <td class="pageName">网络状态</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man-fixed man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-green">yes</td>
          <td class="man man-yellow">no</td>
          <td class="man man-green">yes</td>
        </tr>--%>
        </tbody>
      </table>
      <button type="button" class="btn btn-default float-right" id="save">编辑</button>
      <div class="col-lg-12 float-left">本表只有系统管理员能修改，点击编辑后出现下拉框可以更改yes与no，系统管理员不能改变自己的权限。</div>
    </div>

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
  $(function(){
    $("#management").dropdown('toggle');
  });

  $(document).ready(function(){
    $.ajax({
      url:"Power/get",
      type:"post",
      data:{},
      dataType:"json",
      success:function(data) {
        if (data != "") {
          var pageNames = ["停车场管理", "车辆管理", "RFID管理", "包件管理", "电子围栏", "监控规则", "养护作业计划", "作业路线管理", "布点计划", "驾驶员计划",
            "养护进度监控", "实时监控", "养护日志管理", "历史线路查询", "历史视频查询", "异常查询", "报表查询", "网络状态"];
          var myTbody = document.getElementsByTagName("tbody");
          var trList = myTbody[0].children;
          var info = ""
          $(data).each(function (index) {
            if (pageNames[index] == "停车场管理") {
              info += "<tr>" +
              "<td rowspan='6'>基础数据</td>" +
              "<td  class='table-th'>停车场管理</td>" +
              "<td class='man-fixed man-green'>yes</td>" +
              "<td class='man-fixed man-green'>yes</td>";
              $(data[index][pageNames[index]]).each(function (i) {
                info += "<td class='man man-green'>" + data[index][pageNames[index]][i].management + "</td>" +
                "<td class='man man-green'>" + data[index][pageNames[index]][i].visit + "</td>";
              })
              info += "</tr>";
            } else if (pageNames[index] == "养护作业计划") {
              info += "<tr>" +
              "<td rowspan='4'>计划管理</td>" +
              "<td  class='table-th'>养护作业计划</td>" +
              "<td class='man-fixed man-green'>yes</td>" +
              "<td class='man-fixed man-green'>yes</td>";
              $(data[index][pageNames[index]]).each(function (i) {
                info += "<td class='man man-green'>" + data[index][pageNames[index]][i].management + "</td>" +
                "<td class='man man-green'>" + data[index][pageNames[index]][i].visit + "</td>";
              })
              info += "</tr>";
            } else if (pageNames[index] == "养护进度监控") {
              info += "<tr>" +
              "<td rowspan='3'>进度管理</td>" +
              "<td  class='table-th'>进度计划监控</td>" +
              "<td class='man-fixed man-green'>yes</td>" +
              "<td class='man-fixed man-green'>yes</td>";
              $(data[index][pageNames[index]]).each(function (i) {
                info += "<td class='man man-green'>" + data[index][pageNames[index]][i].management + "</td>" +
                "<td class='man man-green'>" + data[index][pageNames[index]][i].visit + "</td>";
              })
              info += "</tr>";
            } else if (pageNames[index] == "历史线路查询") {
              info += "<tr>" +
              "<td rowspan='3'>历史数据</td>" +
              "<td  class='table-th'>历史线路查询</td>" +
              "<td class='man-fixed man-green'>yes</td>" +
              "<td class='man-fixed man-green'>yes</td>";
              $(data[index][pageNames[index]]).each(function (i) {
                info += "<td class='man man-green'>" + data[index][pageNames[index]][i].management + "</td>" +
                "<td class='man man-green'>" + data[index][pageNames[index]][i].visit + "</td>";
              })
              info += "</tr>";
            } else if (pageNames[index] == "报表查询") {
              info += "<tr>" +
              "<td rowspan='2'>其他</td>" +
              "<td  class='table-th'>报表查询</td>" +
              "<td class='man-fixed man-green'>yes</td>" +
              "<td class='man-fixed man-green'>yes</td>";
              $(data[index][pageNames[index]]).each(function (i) {
                info += "<td class='man man-green'>" + data[index][pageNames[index]][i].management + "</td>" +
                "<td class='man man-green'>" + data[index][pageNames[index]][i].visit + "</td>";
              })
              info += "</tr>";
            } else {
              info += "<tr>" +
              "<td  class='table-th'>" + pageNames[index] + "</td>" +
              "<td class='man-fixed man-green'>yes</td>" +
              "<td class='man-fixed man-green'>yes</td>";
              $(data[index][pageNames[index]]).each(function (i) {
                info += "<td class='man man-green'>" + data[index][pageNames[index]][i].management + "</td>" +
                "<td class='man man-green'>" + data[index][pageNames[index]][i].visit + "</td>";
              })
              info += "</tr>";
            }
          })
          /*console.log(info)*/
          $("#myBody").html(info)
        }
      }
    })
  })

  $("#save").click(function() {


    var text = $(this).text();
    if (text == "编辑") {
      $(this).text("保存");
      $(".man-green").html("<select class='table-input'><option value='1' selected='selected'>yes</option>" +
      "<option value='0'>no</option></select>");
      $(".man-yellow").html("<select class='table-input'><option value='1'>yes</option>" +
      "<option value='0' selected='selected'>no</option></select>");
      $(".man-fixed").html("yes");
    } else {
      var myTbody=document.getElementsByTagName("tbody");
      var trList=myTbody[0].children;
      console.log(trList)
      var chooses="";
      $(trList).each(function(index){
        var tdList=trList[index].children;
        var count=0;
        var choose="";
        var pageName="";
        $(tdList).each(function (index) {
          if(tdList[index].className=="pageName"||tdList[index].className=="table-th")
            pageName=tdList[index].innerHTML;
          if(tdList[index].className=="man man-green"||tdList[index].className=="man man-yellow")
          {
            var tmp=tdList[index].childNodes[0].value==0?"no":"yes";
            if(count==0)
              choose+=tmp;
            else
              choose+=","+tmp;
            count++;
          }
        })
        choose=choose+"#"+pageName;
        if(index==0)
          chooses+=choose;
        else
          chooses+="!"+choose;
      })
      $.ajax({
        url:"Power/editPower",
        type:"post",
        data:{chooses:chooses},
        success:function(data){
          location.reload(true)
        }
      })
      $(this).text("编辑");
      $(".man").each(function(){
        if($(this).children("select").children(":selected").text()=="yes"){
          $(this).html("yes").addClass("man-green").removeClass("man-yellow");
        } else{
          $(this).html("no").addClass("man-yellow").removeClass("man-green");
        }
      });
    }
  });
</script>
</body>
</html>
