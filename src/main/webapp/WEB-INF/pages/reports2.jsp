<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/4
  Time: 13:31
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
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageFather" value="report"></jsp:param>
    <jsp:param name="pageName" value="report2"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 报表查询</a></li>
          <li class="active"><i class="icon-file-alt"></i> 养护车辆作业区域</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-12 text-right search-row">
        <select name="" id="">
          <option value="" selected="selected">上海成基市政建设发展有限公司</option>
        </select>
        <input type="text" id="date" placeholder="选择日期"/>
        <input type="text" id="hour1" placeholder="选择起始时间"/>
        <input type="text" id="hour2" placeholder="选择结束时间"/>、
        <button class="btn btn-default">搜索</button>
      </div>
      <div class="col-lg-12 text-center table-title">
        养护车辆作用区域
      </div>
      <div class="col-lg-12 text-right time-row">
        时间：2016年1月11日 7:00
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12 text-center">
        <table class="table">
          <thead>
          <tr>
            <th>序号</th>
            <th>作业车辆</th>
            <th>匝道名称</th>
            <th>车辆类型</th>
            <th>作业时间</th>
            <th>备注</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>沪A894k4</td>
            <td>中山北路外侧</td>
            <td>清扫车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>2</td>
            <td>沪A8544d</td>
            <td>万源路外侧</td>
            <td>清扫车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>3</td>
            <td>沪A14768</td>
            <td>莲花南路外侧</td>
            <td>清扫车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>4</td>
            <td>沪A79574</td>
            <td>七浦外侧</td>
            <td>清扫车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>5</td>
            <td>沪A98222</td>
            <td>南京西路外侧</td>
            <td>清扫车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>6</td>
            <td>沪A72143</td>
            <td>番禺路路外侧</td>
            <td>巡视车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>7</td>
            <td>沪A13179</td>
            <td>金沙江路外侧</td>
            <td>巡视车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>8</td>
            <td>沪A86573</td>
            <td>中山北路外侧</td>
            <td>巡视车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>9</td>
            <td>沪A98547</td>
            <td>曹杨路外侧</td>
            <td>牵引车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          <tr>
            <td>10</td>
            <td>沪A79US0</td>
            <td>漕宝路路外侧</td>
            <td>牵引车</td>
            <td>7:00</td>
            <td>备注</td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
  $(function(){
    $("#reports").dropdown('toggle');
  });

  $('#date').datetimepicker({
    lang:'ch',
    timepicker:false,
    format:"Y-m-d",
    yearStart: 2016,
    yearEnd: 2050
  });

  $('#hour1').datetimepicker({
    datepicker:false,
    format:'H:i',
    step:10
  });

  $('#hour2').datetimepicker({
    datepicker:false,
    format:'H:i',
    step:10
  });


</script>
</body>
</html>
