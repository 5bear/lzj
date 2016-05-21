<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/15
  Time: 19:32
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
    <jsp:param name="pageName" value="base6"></jsp:param>
    <jsp:param name="pageFather" value="base"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 基础数据</a></li>
          <li class="active"><i class="icon-file-alt"></i> 监管规则管理</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-6 col-lg-offset-3">
        <p class="text-center">监管规则管理</p>
        <table class="table vertical-table">
          <tbody id="Deviate">
          <tr>
            <td rowspan="3">车辆偏离容差</td>
            <td class="table-th">清扫车</td>
            <td class="vertical-table-content">
              <span id="CleanCarDeviate1"></span>
              <span id="CleanCarDeviate2">m</span>
            </td>
          </tr>
          <tr>
            <td>牵引车</td>
            <td><span id="PullCarDeviate1"></span><span id="PullCarDeviate2">m</span></td>
          </tr>
          <tr>
            <td>巡视车</td>
            <td class="vertical-table-content"><span id="ViewCarDeviate1"></span>
              <span id="ViewCarDeviate2">m</span></td>
          </tr>
          </tbody>

          <tbody id="Speed">
          <tr>
            <td rowspan="3">车辆最大车速</td>
            <td class="table-th">清扫车</td>
            <td class="vertical-table-content"><span id="CleanCarSpeed1"></span><span id="CleanCarSpeed2">km/h</span></td>
          </tr>
          <tr>
            <td>牵引车</td>
            <td class="vertical-table-content"><span id="PullCarSpeed1"></span><span id="PullCarSpeed2">km/h</span></td>
          </tr>
          <tr>
            <td>巡视车</td>
            <td class="vertical-table-content"><span id="ViewCarSpeed1"></span><span id="ViewCarSpeed2">km/h</span></td>
          </tr>
          </tbody>

          <tbody id="Times">
          <tr>
            <td colspan="2">超速记录阈值</td>
            <td class="vertical-table-content"><span id="Times1"></span><span id="Times2">次</span></td>
          </tr>
          </tbody>

          <tbody id="StartTime">
          <tr>
            <td colspan="2">封道开始时间</td>
            <td class="vertical-table-content" id="table-hour1"><span id="StartTime1"></span><span id="StartTime2"></span></td>
          </tr>
          </tbody>

          <tbody id="EndTime">
          <tr>
            <td colspan="2">封道结束时间</td>
            <td class="vertical-table-content" id="table-hour2"><span id="EndTime1"></span><span id="EndTime2"></span></td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
        <button class="btn btn-default" id="button">更改</button>
        <button class="btn btn-default" id="button1">恢复默认值</button>
      </div>
    </div>


  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>

  $('#StartTime1').datetimepicker({
    lang:'ch',
    timepicker:false,
    format:"Y-m-d",
    yearStart: 2016,
    yearEnd: 2050
  });


  $(document).ready(function() {
    $.ajax({
      url: "Rules/list",
      type: "post",
      data: {},
      dataType: "json",
      success: function (data) {
        $(data).each(function (index) {
          $("#Deviate").html("<tr> <td rowspan='3'>车辆偏离容差</td> " +
          "<td class='table-th'>清扫车</td>" +
          "<td class='vertical-table-content'> <span id='CleanCarDeviate1'>" + data[index].cleanCarDeviate + "</span> <span id='CleanCarDeviate2'>m</span> </td> </tr>" +
          "<tr> <td>牵引车</td>" +
          "<td class='vertical-table-content'><span id='PullCarDeviate1'>" + data[index].pullCarDeviate + "</span><span id='PullCarDeviate2'>m</span></td></tr>" +
          "<tr> <td>巡视车</td>" +
          "<td class='vertical-table-content'><span id='ViewCarDeviate1'>" + data[index].viewCarDeviate + "</span> <span id='ViewCarDeviate2'>m</span></td> </tr>");

          $("#Speed").html("<tr> <td rowspan='3'>车辆最大车速</td> " +
          "<td class='table-th'>清扫车</td>" +
          "<td class='vertical-table-content'><span id='CleanCarSpeed1'>" + data[index].cleanCarSpeed + "</span><span id='CleanCarSpeed2'>km/h</span></td> </tr>" +
          "<tr> <td>牵引车</td>" +
          " <td class='vertical-table-content'><span id='PullCarSpeed1'>" + data[index].pullCarSpeed + "</span><span id='PullCarSpeed2'>km/h</span></td> </tr>" +
          "<tr> <td>巡视车</td>" +
          " <td class='vertical-table-content'><span id='ViewCarSpeed1'>" + data[index].viewCarSpeed + "</span><span id='ViewCarSpeed2'>km/h</span></td> </tr>");
          $("#Times").html("<tr> <td colspan='2'>超速记录阈值</td> <td><span id='Times1' class='vertical-table-content'>" + data[index].times + "</span><span id='Times2'>次</span></td> </tr>");
          $("#StartTime").html("<tr> <td colspan='2'>封道开始时间</td> <td id='table-hour1' class='vertical-table-content'><span id='StartTime1'>" + data[index].startTime + "</span><span id='StartTime2'></span></td> </tr>");
          $("#EndTime").html("<tr> <td colspan='2'>封道结束时间</td> <td id='table-hour2' class='vertical-table-content'><span id='EndTime1'>" + data[index].endTime + "</span><span id='EndTime2'></span></td> </tr>");
        })
      }
    });
  })
  $("#button1").click(function(){
      var CleanCarDeviate = 20;
      var PullCarDeviate = 40;
      var ViewCarDeviate = 40;
      var CleanCarSpeed = 20;
      var PullCarSpeed = 80;
      var ViewCarSpeed = 80;
      var Times = 2;
      var StartTime="00:00";
      var EndTime = "05:00";
        $("#Deviate").html("<tr> <td rowspan='3'>车辆偏离容差</td> " +
                "<td class='table-th'>清扫车</td>" +
                "<td class='vertical-table-content'> <span id='CleanCarDeviate1'>" + CleanCarDeviate + "</span> <span id='CleanCarDeviate2'>m</span> </td> </tr>" +
                "<tr> <td>牵引车</td>" +
                "<td class='vertical-table-content'><span id='PullCarDeviate1'>" + PullCarDeviate + "</span><span id='PullCarDeviate2'>m</span></td></tr>" +
                "<tr> <td>巡视车</td>" +
                "<td class='vertical-table-content'><span id='ViewCarDeviate1'>" + ViewCarDeviate + "</span> <span id='ViewCarDeviate2'>m</span></td> </tr>");

        $("#Speed").html("<tr> <td rowspan='3'>车辆最大车速</td> " +
                "<td class='table-th'>清扫车</td>" +
                "<td class='vertical-table-content'><span id='CleanCarSpeed1'>" + CleanCarSpeed + "</span><span id='CleanCarSpeed2'>km/h</span></td> </tr>" +
                "<tr> <td>牵引车</td>" +
                " <td class='vertical-table-content'><span id='PullCarSpeed1'>" + PullCarSpeed + "</span><span id='PullCarSpeed2'>km/h</span></td> </tr>" +
                "<tr> <td>巡视车</td>" +
                " <td class='vertical-table-content'><span id='ViewCarSpeed1'>" + ViewCarSpeed + "</span><span id='ViewCarSpeed2'>km/h</span></td> </tr>");
        $("#Times").html("<tr> <td colspan='2'>超速记录阈值</td> <td class='vertical-table-content'><span id='Times1'>" + Times + "</span><span id='Times2'>次</span></td> </tr>");
        $("#StartTime").html("<tr> <td colspan='2'>封道开始时间</td > <td id='table-hour1' class='vertical-table-content'><span id='StartTime1'>" + StartTime + "</span><span id='StartTime2'></span></td> </tr>");
        $("#EndTime").html("<tr> <td colspan='2'>封道结束时间</td> <td id='table-hour2' class='vertical-table-content'><span id='EndTime1'>" + EndTime + "</span><span id='EndTime2'></span></td> </tr>");

        $.ajax({
          url: "Rules/edit",
          type: "post",
          dataType: "json",
          data: {
            CleanCarDeviate1: CleanCarDeviate,
            PullCarDeviate1: PullCarDeviate,
            ViewCarDeviate1: ViewCarDeviate,
            CleanCarSpeed1: CleanCarSpeed,
            PullCarSpeed1: PullCarSpeed,
            ViewCarSpeed1: ViewCarSpeed,
            Times1: Times,
            StartTime1: StartTime,
            EndTime1: EndTime
          },
          success: function (data) {
          }
        })
  })
  $("#button").click(function() {
    var Button = document.getElementById("button").innerHTML;
    if (Button == "更改") {
      var CleanCarDeviate = document.getElementById("CleanCarDeviate1").innerHTML;
      var PullCarDeviate = document.getElementById("PullCarDeviate1").innerHTML;
      var ViewCarDeviate = document.getElementById("ViewCarDeviate1").innerHTML;
      var CleanCarSpeed = document.getElementById("CleanCarSpeed1").innerHTML;
      var PullCarSpeed = document.getElementById("PullCarSpeed1").innerHTML;
      var ViewCarSpeed = document.getElementById("ViewCarSpeed1").innerHTML;
      var Times = document.getElementById("Times1").innerHTML;
      var StartTime = document.getElementById("StartTime1").innerHTML;
      var EndTime = document.getElementById("EndTime1").innerHTML;
      document.getElementById("button").innerHTML = "保存";

      $("#Deviate").html("<tr> <td rowspan='3'>车辆偏离容差</td> " +
      "<td class='table-th'>清扫车</td>" +
      "<td class='vertical-table-content'> <input class='left-input' id='CleanCarDeviate1'value=" + CleanCarDeviate + "> <span id='CleanCarDeviate2'>m</span> </td> </tr>" +
      "<tr> <td>牵引车</td>" +
      "<td class='vertical-table-content'><input class='left-input' id='PullCarDeviate1'value=" + PullCarDeviate + "></span><span id='PullCarDeviate2'>m</span></td></tr>" +
      "<tr> <td>巡视车</td>" +
      "<td class='vertical-table-content'><input class='left-input' id='ViewCarDeviate1'value=" + ViewCarDeviate + "></span> <span id='ViewCarDeviate2'>m</span></td> </tr>");

      $("#Speed").html("<tr> <td rowspan='3'>车辆最大车速</td> " +
      "<td class='table-th'>清扫车</td>" +
      "<td class='vertical-table-content'><input class='left-input' id='CleanCarSpeed1'value=" + CleanCarSpeed + "></span><span id='CleanCarSpeed2'>km/h</span></td> </tr>" +
      "<tr> <td>牵引车</td>" +
      " <td class='vertical-table-content'><input class='left-input' id='PullCarSpeed1'value=" + PullCarSpeed + "></span><span id='PullCarSpeed2'>km/h</span></td> </tr>" +
      "<tr> <td>巡视车</td>" +
      " <td class='vertical-table-content'><input class='left-input' id='ViewCarSpeed1'value=" + ViewCarSpeed + "></span><span id='ViewCarSpeed2'>km/h</span></td> </tr>");
      $("#Times").html("<tr> <td colspan='2'>超速记录阈值</td> <td class='vertical-table-content'><input class='left-input' id='Times1'value=" + Times + "></span><span id='Times2'>次</span></td> </tr>");
      $("#StartTime").html("<tr> <td colspan='2'>封道开始时间</td> <td id='table-hour1' class='vertical-table-content'><input class='left-input' id='StartTime1' value=" + StartTime + "></span><span id='StartTime2'></span></td> </tr>");
      $("#EndTime").html("<tr> <td colspan='2'>封道结束时间</td> <td id='table-hour2' class='vertical-table-content'><input class='left-input' id='EndTime1' value=" + EndTime + "></span><span id='EndTime2'></span></td> </tr>");

      $('#StartTime1').datetimepicker({
        datepicker: false,
        format: 'H:i',
        step: 5
      });

      $('#EndTime1').datetimepicker({
        datepicker: false,
        format: 'H:i',
        step: 5
      });
    }
    else {
      var CleanCarDeviate = document.getElementById("CleanCarDeviate1").value;
      var PullCarDeviate = document.getElementById("PullCarDeviate1").value;
      var ViewCarDeviate = document.getElementById("ViewCarDeviate1").value;
      var CleanCarSpeed = document.getElementById("CleanCarSpeed1").value;
      var PullCarSpeed = document.getElementById("PullCarSpeed1").value;
      var ViewCarSpeed = document.getElementById("ViewCarSpeed1").value;
      var Times = document.getElementById("Times1").value;
      var StartTime = document.getElementById("StartTime1").value;
      var EndTime = document.getElementById("EndTime1").value;

      var validArray = [];
      validArray.push(CleanCarDeviate);
      validArray.push(PullCarDeviate);
      validArray.push(ViewCarDeviate);
      validArray.push(CleanCarSpeed);
      validArray.push(PullCarSpeed);
      validArray.push(ViewCarSpeed);
      validArray.push(Times);

      if (valid(validArray) && (StartTime != "") && (EndTime != "")&&(EndTime > StartTime)) {
        document.getElementById("button").innerHTML = "更改";

        $("#Deviate").html("<tr> <td rowspan='3'>车辆偏离容差</td> " +
        "<td class='table-th'>清扫车</td>" +
        "<td class='vertical-table-content'> <span id='CleanCarDeviate1'>" + CleanCarDeviate + "</span> <span id='CleanCarDeviate2'>m</span> </td> </tr>" +
        "<tr> <td>牵引车</td>" +
        "<td class='vertical-table-content'><span id='PullCarDeviate1'>" + PullCarDeviate + "</span><span id='PullCarDeviate2'>m</span></td></tr>" +
        "<tr> <td>巡视车</td>" +
        "<td class='vertical-table-content'><span id='ViewCarDeviate1'>" + ViewCarDeviate + "</span> <span id='ViewCarDeviate2'>m</span></td> </tr>");

        $("#Speed").html("<tr> <td rowspan='3'>车辆最大车速</td> " +
        "<td class='table-th'>清扫车</td>" +
        "<td class='vertical-table-content'><span id='CleanCarSpeed1'>" + CleanCarSpeed + "</span><span id='CleanCarSpeed2'>km/h</span></td> </tr>" +
        "<tr> <td>牵引车</td>" +
        " <td class='vertical-table-content'><span id='PullCarSpeed1'>" + PullCarSpeed + "</span><span id='PullCarSpeed2'>km/h</span></td> </tr>" +
        "<tr> <td>巡视车</td>" +
        " <td class='vertical-table-content'><span id='ViewCarSpeed1'>" + ViewCarSpeed + "</span><span id='ViewCarSpeed2'>km/h</span></td> </tr>");
        $("#Times").html("<tr> <td colspan='2'>超速记录阈值</td> <td class='vertical-table-content'><span id='Times1'>" + Times + "</span><span id='Times2'>次</span></td> </tr>");
        $("#StartTime").html("<tr> <td colspan='2'>封道开始时间</td > <td id='table-hour1' class='vertical-table-content'><span id='StartTime1'>" + StartTime + "</span><span id='StartTime2'></span></td> </tr>");
        $("#EndTime").html("<tr> <td colspan='2'>封道结束时间</td> <td id='table-hour2' class='vertical-table-content'><span id='EndTime1'>" + EndTime + "</span><span id='EndTime2'></span></td> </tr>");

        $.ajax({
          url: "Rules/edit",
          type: "post",
          dataType: "json",
          data: {
            CleanCarDeviate1: CleanCarDeviate,
            PullCarDeviate1: PullCarDeviate,
            ViewCarDeviate1: ViewCarDeviate,
            CleanCarSpeed1: CleanCarSpeed,
            PullCarSpeed1: PullCarSpeed,
            ViewCarSpeed1: ViewCarSpeed,
            Times1: Times,
            StartTime1: StartTime,
            EndTime1: EndTime
          },
          success: function (data) {
          }
        })
      }
      else {
        alert("输入数据不符合规则");
      }
    }
  })

  /*var obj = $(this).text();
   if (obj == "更改"){
   $(this).text("保存");
   $(".vertical-table-content").each(function() {
   var val =  $(this).children().eq(0).text();
   var unit = $(this).children().eq(1).text();
   this.innerHTML = "<input class='left-input' value='"+ val + "'>" + "<span>"+ unit +"</span>";
   });
   } else {
   $(this).text("更改");
   $(".vertical-table-content").each(function() {
   var val =  $(this).children().eq(0).val();
   var unit = $(this).children().eq(1).text();
   this.innerHTML = "<span>"+ val +"</span>" + "<span>"+ unit +"</span>";
   });
   }*/

  function valid(validArray){
    var arr = validArray;
    var reg = /^\d+(\.\d+)?$/;
    for (x in arr) {
      if(!reg.test(arr[x])) {
        return false;
      }
    }
    return true;
  }

</script>
</body>
</html>
