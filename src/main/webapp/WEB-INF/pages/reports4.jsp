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
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageFather" value="report"></jsp:param>
    <jsp:param name="pageName" value="report4"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 报表查询</a></li>
          <li class="active"><i class="icon-file-alt"></i> 养护车辆超速</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-12 text-right search-row">
        <select name="" id="">
          <option value="" selected="selected">上海成基公司</option>
        </select>
        <input type="text" id="date" placeholder="选择日期"/>
        <input type="text" id="hour1" placeholder="选择起始时间"/>
        <input type="text" id="hour2" placeholder="选择结束时间"/>
        <button class="btn btn-default">搜索</button>
      </div>
      <div class="col-lg-12 text-center table-title">
        养护车辆超速
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
            <th>公司名称</th>
            <th>车辆牌照</th>
            <th>车辆类型</th>
            <th>车辆使用人</th>
            <th>启始时间</th>
            <th>结束时间</th>
            <th>超速时间(分)</th>
            <th>超速里程(米)</th>
            <th>最大速度</th>
            <th>最小速度</th>
            <th>原因</th>
            <th>反馈</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>上海成基公司</td>
            <td>沪A47859</td>
            <td>清扫车</td>
            <td>张司机</td>
            <td>7时20分</td>
            <td>12时24分</td>
            <td>20</td>
            <td>15100</td>
            <td>45</td>
            <td>30</td>
            <td>超速</td>
            <td>无</td>
          </tr>
          <tr>
            <td>上海成基公司</td>
            <td>沪A68721</td>
            <td>清扫车</td>
            <td>卫司机</td>
            <td>8时20分</td>
            <td>12时24分</td>
            <td>50</td>
            <td>25100</td>
            <td>39</td>
            <td>28</td>
            <td>超速</td>
            <td>无</td>
          </tr>
          <tr>
            <td>上海成基公司</td>
            <td>沪A68721</td>
            <td>巡视车</td>
            <td>孙司机</td>
            <td>8时20分</td>
            <td>13时24分</td>
            <td>10</td>
            <td>17100</td>
            <td>87</td>
            <td>60</td>
            <td>超速</td>
            <td>无</td>
          </tr>
          <tr>
            <td>上海成基公司</td>
            <td>沪A1K249</td>
            <td>清扫车</td>
            <td>胡司机</td>
            <td>9时20分</td>
            <td>12时24分</td>
            <td>15</td>
            <td>9568</td>
            <td>35</td>
            <td>30</td>
            <td>超速</td>
            <td>无</td>
          </tr>
          <tr>
            <td>上海成基公司</td>
            <td>沪A68147</td>
            <td>清扫车</td>
            <td>何司机</td>
            <td>8时20分</td>
            <td>12时24分</td>
            <td>50</td>
            <td>25100</td>
            <td>39</td>
            <td>28</td>
            <td>超速</td>
            <td>无</td>
          </tr>
          <tr>
            <td>上海成基公司</td>
            <td>沪A62478</td>
            <td>巡视车</td>
            <td>赵司机</td>
            <td>8时20分</td>
            <td>13时24分</td>
            <td>10</td>
            <td>17100</td>
            <td>87</td>
            <td>60</td>
            <td>超速</td>
            <td>无</td>
          </tr>
          <tr>
            <td>上海成基公司</td>
            <td>沪A89653</td>
            <td>清扫车</td>
            <td>李司机</td>
            <td>14时30分</td>
            <td>17时54分</td>
            <td>15</td>
            <td>9568</td>
            <td>35</td>
            <td>30</td>
            <td>超速</td>
            <td>无</td>
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