<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/4
  Time: 13:39
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

  <title>历史轨迹查询</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <link rel="stylesheet" href="css/style.css"/>

  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
  <script type="text/javascript" src="js/highcharts.js"></script>
  <script type="text/javascript" src="js/jquery.js"></script>

  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->



  <style>
    #index { width:100%; height:100%; min-width:966px;margin-left:16px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:57%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-right {width:246px; height:90%; margin:0px; padding:0px; float:left; background-color:transparent; margin-left:5px;position:relative; }

    .button{
      position:absolute;
      border-radius:5px;
      border:none;
      background-color: #00608B;
      color: white;
      font-size: 12px;
      padding: 0;}

    .bt1{
      height: 23px;
      width: 60px;
      position: absolute;
      border:0;
      background-size:100% 100%;
    }

    .p
    {
      position: absolute;
      left:108px;
      font-family: Microsoft YaHei,STHeiti;
    }

    .p1
    {
      position: absolute;
      left:916px;
      font-family: Microsoft YaHei,STHeiti;
    }
    .t
    {
      position: absolute; left: 892px; width: 141px;
    }

    .tt
    {border: none;
      background-color: #F2F2F2;
      border-radius: 5px;
      padding: 3px 6px;
      margin-right: 10px;
      width: 112px;
      color: rgb(62,133,167);
    }

    .date
    {border: none;
      background-color: #F2F2F2;
      border-radius: 5px;
      padding: 3px 6px;
      margin-right: 10px;
      width: 112px;
      color: rgb(62,133,167);
    }
    .hour
    {border: none;
      background-color: #F2F2F2;
      border-radius: 5px;
      padding: 3px 6px;
      margin-right: 10px;
      width: 112px;
      color: rgb(62,133,167);
    }

    .map_bt
    {
      border: 0;
      width: 22px;
      position:absolute;
    }

    .bt{
      height: 20px;
      width: 50px;
      position: absolute;
      border:0;
    }

    #container{width: 56%;
      height: 600px;
      float: left;
      margin-left: 5px;
      margin-right: 5px;}

  </style>

</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageFather" value="history"></jsp:param>
    <jsp:param name="pageName" value="history1"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="history1.html">历史数据</a></li>
          <li><a href="history1.html">历史轨迹查询</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>





      <div id="index">
        <!--<img src="images/index.jpg" width="100%"/>-->
        <div id="in-left">
          <div class="panel panel-primary">
            <div class="panel-heading text-center" style=" letter-spacing:3px">选择查看区域</div>
            <div class="panel-body">
              <li class="dropdown dropdown1">
                <a href="#" data-toggle="droplist">按照区域查</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海成基公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">中环路</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">中环路立交</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">上中路隧道</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">军工路隧道交</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">外滩隧道</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                    </ul>
                  </li>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">内环高架路路</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>

                    </ul>
                  </li>
                </ul>
              </li><!--dropdown1-->



              <li class="dropdown dropdown1">
                <a href="#" data-toggle="droplist">按照车辆查看</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">清扫车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <li>
                            <a href="#">沪BD4802</a>
                          </li>
                          <li><a href="#">沪BD4802</a></li>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">牵引车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <li>
                            <a href="#">沪BD4802</a>
                          </li>
                          <li><a href="#">沪BD4802</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>

                </ul>
              </li><!--dropdown1-->



            </div>
          </div>
        </div><!--in-left-->

        <div id="in-mid"><!--<img src="images/mid2.png" width="100%"/>-->

          <input type="text" value="起始时间" class="date" style="position: absolute; top: 2%; left: 4%; width:17%"/>
          <input type="text"  class="hour" style="position: absolute; top: 2%; left: 22%; width:10%"/>
          <input type="text" value="结束时间" class="date"  style="position: absolute; top: 2%; left: 33%; width:17%"/>
          <input type="text"  class="hour"  style="position: absolute; top: 2%; left: 51%; width:10%"/>
          <!--<input class="bt" type="button"  style=" position: absolute;top: 2%;left: 40%; width:13%;height:4%;
                 background:url(images/xuanze.png); background-size:100% 100%" /> -->
          <!-- <button class="button" style="top:2%;left:57%; width:13%;height:4%">选择时间段</button>-->

          <select id="_select" style="position: absolute; top: 2%; left: 62%; width:13%">
            <option value="SH">按包件</option>
            <option value="SH">按车牌</option>
          </select>

          <input type="text" class="tt" style="position: absolute; top: 2%; left: 76%; width:14%"/>
          <!--<input class="bt" type="button"  style=" position: absolute;top: 2%;left: 90%;width:10%;height:4%;
               background:url(images/queren.png); background-size:100% 100%" /> -->
          <button class="button" style="top:2%;left:91%; width:9%;height:4%">确认</button>

          <div style="width: 4%;height: 4%; position: absolute; top: 2%;">
            <img src="images/search_icon.png" style="width:100%" />
          </div>

          <div id="container" style="width:99%;top:52px"></div>
        </div><!--in-mid-->

        <div id="in-right" style="249px">
          <div class="panel panel-primary panel-right">
            <div class="panel-heading text-center" style="letter-spacing:3px">车辆信息</div>
            <div class="panel-body">
              <div class="row">
                <label>选择点的左边</label>
                <p>(X, Y)</p>
              </div>
              <div class="row">
                <label>精度：</label>
                <p>112</p>
              </div>
              <div class="row">
                <label>纬度：</label>
                <p>148</p>
              </div>
              <div class="row">
                <label>作业车辆信息：</label>
              </div>
              <div class="row">
                <label>车牌：</label>
                <p>XXXXXXX</p>
              </div>
              <div class="row">
                <label>平均行驶速度：</label>
                <p>XXXXXXX</p>
              </div>
              <div class="row">
                <label>开始时间：</label>
                <input type="text"/>
              </div>
              <div class="row">
                <label>结束时间：</label>
                <input type="text"/>
              </div>
              <div class="row">
                <label>异常：</label>
                <p>XXXXXXX</p>
              </div>
              <div class="row text-center">
                <button class="btn btn-default">增加/修改</button>
                <button class="btn btn-default">删除</button>
              </div>
            </div>
          </div>

          <!--  <a href="history2.html" >
            <button class="button"  style="width:69px;top:360px;left:85px;height:28px;vertical-align:central">获取视频</button>
            </a>-->
        </div><!--in-right-->

      </div>


    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>

  $('a[data-toggle="droplist"]').click(function() {
    $(this).nextAll().toggle();
  });
</script>

<script>
  $(function(){
    $("#history").dropdown('toggle');
  });

  $('.date').datetimepicker({
    lang:'ch',
    timepicker:false,
    format:"Y-m-d",
    yearStart: 2016,
    yearEnd: 2050
  });


  $('.hour').datetimepicker({
    datepicker:false,
    format:'H:i',
    step:10
  });

</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>

<script>
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
  map.enableScrollWheelZoom();//允许放大缩放
  map.addControl(top_left_control);
  map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海
</script>
</body>
</html>
