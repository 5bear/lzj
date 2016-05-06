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
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageName" value="reports3"></jsp:param>
    <jsp:param name="pageFather" value="reports"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 报表查询</a></li>
          <li class="active"><i class="icon-file-alt"></i> 养护车辆作业情况</li>
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
        养护车辆作业情况
      </div>
      <div class="col-lg-12 text-right time-row">
        夜间计划清扫时间：2016年1月11日0时0分至5时0分
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12 text-center">
        <table class="table">
          <thead>
          <tr>
            <th>公司</th>
            <th>序号</th>
            <th>车牌号</th>
            <th>实际作业区域</th>
            <th>起始时间</th>
            <th>结束</th>
            <th>累计停留时间</th>
            <th>累计作业时间</th>
            <th>里程</th>
            <th>备注</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td rowspan="2">成基公司</td>
            <td>1</td>
            <td>沪A86574</td>
            <td>中山北路外侧</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>1</td>
            <td>沪A86574</td>
            <td>中山北路外侧</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
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
