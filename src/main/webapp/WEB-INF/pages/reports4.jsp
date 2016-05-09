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

  <title>上海市快速路养护监管系统</title>

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
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html">上海市快速路养护监管系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav side-nav">
        <li class="text-right aside-li">
          <button type="button" class="navbar-aside" title="收起/展开菜单">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </li>
        <li><a href="index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="base"><i class="fa fa-bar-chart-o"></i> 基础数据 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="base1.html">停车场管理</a></li>
            <li><a href="base2.html">车辆管理</a></li>
            <li><a href="base3.html">RFID监测点管理</a></li>
            <li><a href="base4.html">包件信息管理</a></li>
            <li><a href="base5.html">电子围栏管理</a></li>
            <li><a href="base6.html">监管规则管理</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="plan"><i class="fa fa-table"></i> 计划管理 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="plan1.html">养护作业计划</a></li>
            <li><a href="plan2.html">作业线路管理</a></li>
            <li><a href="plan3.html">布点计划</a></li>
            <li><a href="plan4.html">驾驶员计划</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="progress"><i class="fa fa-edit"></i> 进度管理 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="progress1.html">养护进度监控</a></li>
            <li><a href="progress2.html">实时监控</a></li>
            <li><a href="progress3.html">养护日志管理</a></li>
          </ul>
        </li>

        <li class="dropdown ">
          <a  href="#" class="dropdown-toggle"  data-toggle="dropdown" id="history"><i class="fa fa-font"></i> 历史数据 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="history1.html">历史轨迹查询</a></li>
            <li><a href="history2.html">历史视频查询</a></li>
            <li><a href="history3.html">异常查询</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="reports"><i class="fa fa-desktop"></i> 报表查询 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="reports1.html">牵引车辆位置报表</a></li>
            <li><a href="reports2.html">养护车辆作业区域</a></li>
            <li><a href="reports3.html">养护车辆作业情况</a></li>
            <li class="active"><a href="reports4.html">养护车辆超速</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="management"><i class="fa fa-wrench"></i>系统管理 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="management1.html">用户管理</a></li>
            <li><a href="management2.html">权限管理</a></li>
            <li><a href="management3.html">网络状态图</a></li>
          </ul>
        </li>

      </ul>

      <ul class="nav navbar-nav navbar-right navbar-user">
        <li class="dropdown user-dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎， 领导 <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="personalManagement.html"><i class="fa fa-user"></i> 个人信息</a></li>
            <li class="divider"></li>
            <li><a href="#"><i class="fa fa-power-off"></i> 安全退出</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </nav>

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