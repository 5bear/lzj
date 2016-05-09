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
    <jsp:param name="pageFather" value="report"></jsp:param>
    <jsp:param name="pageName" value="report1"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 报表查询</a></li>
          <li class="active"><i class="icon-file-alt"></i> 牵引车辆位置报表</li>
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
        牵引车辆位置信息报表
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
            <th>责任段</th>
            <th>车牌号</th>
            <th>计划待命位置</th>
            <th>实际待命位置</th>
            <th>状态</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>1</td>
            <td>沪A86572</td>
            <td>中山北路外侧</td>
            <td>中山北路外侧</td>
            <td class="await">待命</td>
          </tr>
          <tr>
            <td>2</td>
            <td>沪A63234</td>
            <td>漕宝路外侧</td>
            <td>虹桥路内侧</td>
            <td class="going">出动</td>
          </tr>
          <tr>
            <td>3</td>
            <td>沪A66578</td>
            <td>大渡河路外侧</td>
            <td>中山北路内侧</td>
            <td class="going">出动</td>
          </tr>
          <tr>
            <td>4</td>
            <td>沪A76585</td>
            <td>七浦路外侧</td>
            <td>七浦路外侧</td>
            <td class="await">待命</td>
          </tr>
          <tr>
            <td>5</td>
            <td>沪A7K889</td>
            <td>莲花南路外侧</td>
            <td>银都路外侧</td>
            <td class="going">出动</td>
          </tr>
          <tr>
            <td>6</td>
            <td>沪A26576</td>
            <td>延安西路外侧</td>
            <td>延安西路外侧</td>
            <td class="await">待命</td>
          </tr>
          <tr>
            <td>7</td>
            <td>沪A27574</td>
            <td>曹阳路外侧</td>
            <td>南京西路路外侧</td>
            <td class="going">出动</td>
          </tr>
          <tr>
            <td>8</td>
            <td>沪A54147</td>
            <td>吴江路路外侧</td>
            <td>黄河路路外侧</td>
            <td class="going">出动</td>
          </tr>
          <tr>
            <td>9</td>
            <td>沪A87US0</td>
            <td>沪闵高架外侧</td>
            <td>嘉善南路外侧</td>
            <td class="going">出动</td>
          </tr>
          <tr>
            <td>10</td>
            <td>沪A18789</td>
            <td>漕河泾路外侧</td>
            <td>漕河泾路内侧</td>
            <td class="going">出动</td>
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
