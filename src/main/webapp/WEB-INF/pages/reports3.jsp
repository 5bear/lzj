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
    <jsp:param name="pageName" value="report3"></jsp:param>
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
          <option value="" selected="selected">上海成基市政建设发展有限公司</option>
        </select>
        <input type="text" id="date" placeholder="选择日期"/>
        <input type="text" id="hour1" placeholder="选择起始时间"/>
        <input type="text" id="hour2" placeholder="选择结束时间"/>
        <button class="btn btn-default">搜索</button>
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
            <th>累计停留时间（分钟）</th>
            <th>累计作业时间（分钟）</th>
            <th>里程（米）</th>
            <th>备注</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td rowspan="10">成基公司</td>
            <td>1</td>
            <td>沪A86574</td>
            <td>中山北路外侧</td>
            <td>0时30分</td>
            <td>4时30分</td>
            <td>30</td>
            <td>210</td>
            <td>85300</td>
            <td>无</td>
          </tr>
          <tr>
            <td>2</td>
            <td>沪A32574</td>
            <td>曹安公路外侧</td>
            <td>2时30分</td>
            <td>4时30分</td>
            <td>60</td>
            <td>60</td>
            <td>20100</td>
            <td>无</td>
          </tr>

          <tr>
            <td>3</td>
            <td>沪A3k576</td>
            <td>中环路外侧</td>
            <td>1时30分</td>
            <td>4时30分</td>
            <td>30</td>
            <td>180</td>
            <td>31047</td>
            <td>无</td>
          </tr>

          <tr>
            <td>4</td>
            <td>沪A74789</td>
            <td>中山西路外侧</td>
            <td>1时20分</td>
            <td>5时00分</td>
            <td>23</td>
            <td>220</td>
            <td>65408</td>
            <td>无</td>
          </tr>

          <tr>
            <td>5</td>
            <td>沪A32US7</td>
            <td>延安高架外侧</td>
            <td>0时34分</td>
            <td>4时54分</td>
            <td>87</td>
            <td>263</td>
            <td>62214</td>
            <td>无</td>
          </tr>


          <tr>
            <td>6</td>
            <td>沪A32KK1</td>
            <td>杨高南路外侧</td>
            <td>0时30分</td>
            <td>4时30分</td>
            <td>74</td>
            <td>214</td>
            <td>58336</td>
            <td>无</td>
          </tr>


          <tr>
            <td>7</td>
            <td>沪A32749</td>
            <td>内环高架外侧</td>
            <td>0时20分</td>
            <td>4时30分</td>
            <td>25</td>
            <td>260</td>
            <td>62841</td>
            <td>无</td>
          </tr>


          <tr>
            <td>8</td>
            <td>沪A1K574</td>
            <td>南北高架路外侧</td>
            <td>2时30分</td>
            <td>4时30分</td>
            <td>45</td>
            <td>130</td>
            <td>71749</td>
            <td>无</td>
          </tr>


          <tr>
            <td>9</td>
            <td>沪A32532</td>
            <td>沪闵高架外侧</td>
            <td>2时30分</td>
            <td>4时30分</td>
            <td>60</td>
            <td>60</td>
            <td>61200</td>
            <td>无</td>
          </tr>


          <tr>
            <td>10</td>
            <td>沪A67574</td>
            <td>嘉闵路外侧</td>
            <td>0时30分</td>
            <td>4时30分</td>
            <td>30</td>
            <td>248</td>
            <td>59671</td>
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
