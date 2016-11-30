<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/14
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String company= (String) session.getAttribute("company");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
  <meta name="description" content="">
  <meta name="author" content="">

  <title>上海市快速路养护作业监管设施完善工程</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <link rel="stylesheet" href="css/style.css"/>
  <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
  <script src="js/bootstrap.js"></script>
  <script type="text/javascript" src="js/highcharts.js"></script>
  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->

  <script>
    $(document).ready(function () {
      setTable();
    });

    var Company;
    var EffectiveDistance;
    var EffectiveCoverage;
    var roads=new Array();
    var myDate = new Date();
    var year = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
    var Month = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
    var Day = myDate.getDate();        //获取当前日(1-31);
    var month="";
    var day="";
    if(Month<10)
      month="0"+Month;
    else
      month=Month;
    if(Day<10)
      day="0"+Day;
    else
      day=Day;
//    year="2016";
//    month="11";
//    day="14";
    function setTable() {
      Company="<%=session.getAttribute("company")%>";
      if (Company == "养护中心") {
        $.ajax({
          url: "progress1/AllCompany",
          type: "get",
          dataType: "json",
          async: false,                   //设置同步
          data:{
            company:Company
          },
          success: function (data) {
            var lineName = "";
            $(data).each(function (index) {
              lineName = data[index].line;
              roads.push(lineName);
            })
          }
        });
        getTable(roads);
        getdata("container1","container2");

        Company = "上海成基市政建设发展有限公司";
        getTableAllPackage();
        getTable(roads);
        getdata("container3","container4");

        Company = "上海高架养护管理有限公司";
        getTableAllPackage();
        getTable(roads);
        getdata("container5","container6");
      }
      else if (Company == "上海成基市政建设发展有限公司") {
        getTableAllPackage();
        getTable(roads);
        getdata("container3","container4");
      }
      else {
        getTableAllPackage();
        getTable(roads);
        getdata("container5","container6");
      }
    }
      function getTableAllPackage(){
        roads.length=0;
        $.ajax({
          url: "progress1/AllPackage",
          type: "get",
          dataType: "json",
          async : false,                   //设置同步
          data: {
            company: Company
          },
          success: function (data) {
            var lineName="";
            $(data).each(function (index) {
              lineName=data[index].line;
              roads.push(lineName);
            })
          }
        })
      }

      function getTable(roads){

        $.ajax({
          url:"progress1-day/getDay",
          type:"get",
          data:{
            year:year,
            month:month,
            day:day,
            Roads:roads
          },
          dataType: "json",
          traditional: true,
          async : false,                   //设置同步
          success:function(data) {
            totalDistance+=data[0];                                       //作业+匝道
            toDistance+=data[1];
            totalCoverage+=data[2];
            toCoverage+=data[4];
            toRealCoverage+=data[3];
          }
        });
      }
    var totalCoverage=0;
    var totalDistance=0;
    var toDistance=0;
    var toCoverage=0;
    var toRealCoverage=0;
    function getdata(elementID1,elementID2){
      EffectiveDistance = (totalDistance).toFixed(2);
      EffectiveCoverage=(totalCoverage).toFixed(2);
      if(EffectiveDistance>100){
        EffectiveDistance="100.00";
      }

      if(EffectiveCoverage>100) {
        EffectiveCoverage = "100.00";
      }
      setChart(elementID1,elementID2);
      roads.length=0;
      totalDistance=0;
      totalCoverage=0;
      toCoverage=0;
      toRealCoverage=0;
      toDistance=0;
    }
    function setChart(elementID1,elementID2){
//      document.getElementById("progress3").style.width=""+EffectiveDistance+"%";
//      document.getElementById("progress1").innerHTML=EffectiveDistance+"%";
//      document.getElementById("progress2").innerHTML=toDistance+"m";
      var chart;
      // Build the chart
      chart = new Highcharts.Chart({
        chart: {
          renderTo:elementID1,
          backgroundColor: 'rgb(242, 242, 242)',
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false

        },
        title: {
          text: '有效作业率',
          style:{fontSize:"13px"}
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
          style: {                      // 文字内容相关样式
            width:'5px',
            fontWeight: "blod",
            fontFamily: "Courir new"
          }


        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: false
            },
            showInLegend: true
          }
        },
        series: [{
          fontSize:"2px",
          type: 'pie',
          name: ' ',
          data: [
            ['有效作业率',   Number(EffectiveDistance)],
            ['无效作业率',   Number(100.0-EffectiveDistance)],

          ]
        }]
      });

      // Build the chart
      chart = new Highcharts.Chart({
        chart: {
          renderTo: elementID2,
          backgroundColor: 'rgb(242, 242, 242)',
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false

        },



        title: {
          text: '匝道覆盖率',
          style:{fontSize:"13px"}
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
          style: {                      // 文字内容相关样式
            width:'10px',
            fontWeight: "blod",
            fontFamily: "Courir new"
          }


        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: false
            },
            showInLegend: true
          }
        },
        series: [{
          fontSize:"5px",
          type: 'pie',
          name: ' ',
          data: [
            ["覆盖 "+toRealCoverage+"个",   Number(EffectiveCoverage)],
            ["未覆盖 "+(toCoverage-toRealCoverage)+"个", Number(100-EffectiveCoverage)],

          ]
        }]
      });

    }
  </script>



  <style>
    .table.infoWindow{
      font-size: 10px;
      margin-bottom: -10px;
    }
    #container{
      height: 600px;
      float: left;
      margin-left: 5px;
      margin-right: 5px;}

    #index { width:100%; height:100%; min-width:960px; margin-left:16px; padding:0px; background-color:transparent; position:relative; }
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:58%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-right {  height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;width:249px;}
    #index-checkbox
    {
      position:absolute;
      top: 620px;
      left: 10px;
    }
    #_select
    {
      position: absolute;
      top: 55px;
      left: 35px;
      width: 200px;
      height:25px;
    }

    .progressbar_1{

      background-color: white;
      height: 3%;
      border: 2px solid rgb(179,179,179);
      position: absolute;
      width: 47%;


    }
    .progressbar_1 .bar {
      background-color:rgb(2,96,142);
      height:89%;
      width:0;
      margin:1px;
    }
  </style>


</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageFather" value="index"></jsp:param>
    <jsp:param name="pageName" value="index"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index"><i class="icon-dashboard"></i>首页</a></li>
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
                <a href="#" data-toggle="droplist">按照车辆查看</a>
                  <a href="#" onclick="setVehicle()">显示全部</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <%
                  if(company.equals("养护中心")||company.equals("上海成基市政建设发展有限公司")){
                %>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海成基市政建设发展有限公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                          <a href="#" onclick="setVehicle(1)">显示全部</a>
                          <a href="#" data-toggle="droplist">清扫车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${cyList}" var="item">
                            <li>
                              <a href="#" id="v${item.id}" style="color: #6e6e6e" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicense}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <%--<li class="dropdown dropdown3">--%>
                        <%--<a href="#" data-toggle="droplist">牵引车</a>--%>
                        <%--<div class="arrow-section arrow-section3">--%>
                          <%--<div class="arrow-down arrow-down3"></div>--%>
                        <%--</div>--%>
                        <%--<ul class="dropdown-menu panel-menu">--%>
                          <%--<c:forEach items="${cqList}" var="item">--%>
                            <%--<li>--%>
                              <%--<a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicense}</a>--%>
                            <%--</li>--%>
                          <%--</c:forEach>--%>
                        <%--</ul>--%>
                      <%--</li>--%>
                      <%--<li class="dropdown dropdown3">--%>
                        <%--<a href="#" data-toggle="droplist">巡视车</a>--%>
                        <%--<div class="arrow-section arrow-section3">--%>
                          <%--<div class="arrow-down arrow-down3"></div>--%>
                        <%--</div>--%>
                        <%--<ul class="dropdown-menu panel-menu">--%>
                          <%--<c:forEach items="${cxList}" var="item">--%>
                            <%--<li>--%>
                              <%--<a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicense}</a>--%>
                            <%--</li>--%>
                          <%--</c:forEach>--%>
                        <%--</ul>--%>
                      <%--</li>--%>
                    </ul>
                  </li>
                </ul>
                <%
                  }
                  if(company.equals("养护中心")||company.equals("上海高架养护管理有限公司")){
                %>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护管理有限公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                          <a href="#" onclick="setVehicle(0)">显示全部</a>
                        <a href="#" data-toggle="droplist">清扫车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${gyList}" var="item">
                            <li>
                              <a href="#" id="v${item.id}" style="color: #6e6e6e" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicense}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <%--<li class="dropdown dropdown3">--%>
                        <%--<a href="#" data-toggle="droplist">牵引车</a>--%>
                        <%--<div class="arrow-section arrow-section3">--%>
                          <%--<div class="arrow-down arrow-down3"></div>--%>
                        <%--</div>--%>
                        <%--<ul class="dropdown-menu panel-menu">--%>
                          <%--<c:forEach items="${gqList}" var="item">--%>
                            <%--<li>--%>
                              <%--<a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicense}</a>--%>
                            <%--</li>--%>
                          <%--</c:forEach>--%>
                        <%--</ul>--%>
                      <%--</li>--%>
                      <%--<li class="dropdown dropdown3">--%>
                        <%--<a href="#" data-toggle="droplist">巡视车</a>--%>
                        <%--<div class="arrow-section arrow-section3">--%>
                          <%--<div class="arrow-down arrow-down3"></div>--%>
                        <%--</div>--%>
                        <%--<ul class="dropdown-menu panel-menu">--%>
                          <%--<c:forEach items="${gxList}" var="item">--%>
                            <%--<li>--%>
                              <%--<a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicense}</a>--%>
                            <%--</li>--%>
                          <%--</c:forEach>--%>
                        <%--</ul>--%>
                      <%--</li>--%>
                    </ul>
                  </li>
              </ul>
                <%
                  }
                %>
              </li>
            </div>
          </div>
        </div><!--in-left-->

        <!-- <div id="in-mid">--><!--<img src="images/map1.png" width="100%"/>-->
        <!-- <div id="" style="height: 601px; width: 638px; top: 123px;left:447px; float:left">-->
        <div id="mid" style="height:700px; width:55%; float:left;position:relative">
          <div class="mid-btn-row text-right">
            <button class="btn btn-default" onclick="addArea()">设置常用区域</button>
          </div>

          <div style="position: relative;">
            <div id="container" style="height: 610px; width:99%;"></div>
            <div class="map-search">
              <input type="text" id="localSearch" onchange="localSearch()"/>
              <button onclick="localSearch()"></button>
            </div>
          </div>




          <!--<form id="index-checkbox">
         <input type="checkbox" name="speed" id="speed" />
          显示车速
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
   <input type="checkbox" name="chepai" id="chepai"/>
    显示车牌
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
            <input type="checkbox" name="path" id="path" />
    显示路径
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
   </form>-->
        </div>

        <div id="in-right" style="width:280px;">
          <div class="panel panel-primary panel-right panel-index">
            <div class="panel-heading text-center" style="letter-spacing:3px">本日养护作业进度表</div>
            <div class="panel-body">
              <%--<div class="panel-section">--%>
                <%--<select class="panel-select" id="company" onchange="javascript:setTable()">--%>
                  <%--<%--%>
                    <%--if(company.equals("养护中心")){--%>
                    <%--%>--%>
                  <%--<option value="上海">上海</option>--%>
                  <%--<%--%>
                    <%--}--%>
                    <%--if(company.equals("养护中心")||company.equals("上海成基市政建设发展有限公司")){--%>
                  <%--%>--%>
                  <%--<option value="上海成基市政建设发展有限公司">上海成基市政建设发展有限公司</option>--%>
                  <%--<%--%>
                    <%--}--%>
                    <%--if(company.equals("养护中心")||company.equals("上海高架养护管理有限公司")){--%>
                  <%--%>--%>
                  <%--<option value="上海高架养护管理有限公司">上海高架养护管理有限公司</option>--%>
                  <%--<%--%>
                    <%--}--%>
                  <%--%>--%>

                <%--</select>--%>
              <%--</div>--%>
              <%--<div class="panel-section">--%>
                <%--<h5>作业进度</h5>--%>
                <%--<div class="progressbar_1" >--%>
                  <%--<div class="bar" id= "progress3"></div>--%>
                <%--</div>--%>
                <%--<span style="margin-left: 130px;"id="progress1"></span>--%>
                <%--<span id ="progress2"></span>--%>
              <%--</div>--%>
                <%
                  if(company.equals("养护中心")){
                %>
                <div class="panel-section">
                  <h5 style="padding: 10px;margin-bottom: 10px"><b>上海市</b></h5>
                  <div class="panel-section-left">
                    <div id="container1" style="width:120px;height:208px;"></div>
                  </div>
                  <div class="panel-section-left">
                    <div id="container2" style="width:120px;height:208px;"></div>
                  </div>
                  <div class="clearboth"></div>
                </div>
                <%
                  }
                  if(company.equals("养护中心")||company.equals("上海成基市政建设发展有限公司")){
                %>
                <div class="panel-section">
                  <h5 style="padding: 10px;margin-bottom: 10px"><b>上海成基市政建设发展有限公司</b></h5>
                  <div class="panel-section-left">
                    <div id="container3" style="width:120px;height:208px;"></div>
                  </div>
                  <div class="panel-section-left">
                    <div id="container4" style="width:120px;height:208px;"></div>
                  </div>
                  <div class="clearboth"></div>
                </div>
                <%
                  }
                  if(company.equals("养护中心")||company.equals("上海高架养护管理有限公司")){
                %>
                <div class="panel-section">
                  <h5 style="padding: 10px;margin-bottom: 10px"><b>上海高架养护管理有限公司</b></h5>
                  <div class="panel-section-left">
                    <div id="container5" style="width:120px;height:208px;"></div>
                  </div>
                  <div class="panel-section-left">
                    <div id="container6" style="width:120px;height:208px;"></div>
                  </div>
                  <div class="clearboth"></div>
                </div>
                <%
                  }
                %>
              <%--<div class="panel-section explain-row">--%>
                <%--<p>说明：</p>--%>
                <%--<p>1、有效作业率：指在路段中没有出现超速、偏离路线等异常情况的清扫作业长度与计划清扫作业长度之比。</p>--%>
                <%--<p>2、匝道覆盖率：指被检测到清扫的匝道个数与清扫个数之比。</p>--%>
              <%--</div>--%>
            </div>
          </div>
          <!--<img src="images/in-right1.png" width="100%" />-->
          <!--<select id="_select">-->
          <!--<option value="SH">上海</option>-->
          <!--</select> -->


          <!--<p style="font-size:10px; color:rgb(2,96,142);position: absolute;top: 23%;left: 61%;">50% &nbsp;&nbsp;&nbsp;247km</p>-->
        </div>

      </div>
<button data-target="#success" data-toggle="modal" id="setBtn" style="display: none"></button>

      <div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">成功提示</h4>
            </div>
            <div class="modal-body text-center">
              <p>设置成功</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
            </div>
          </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->


    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script>
  $('a[data-toggle="droplist"]').click(function(e) {
    e.preventDefault();
    $(this).nextAll().toggle();
  });
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>
<script type="text/javascript" src="js/BMaplib.js"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script>
  var myCar;//汽车图标
  var lineList=new Array();//线路集合
  var tempList=new Array()//车辆信息集合
  var vehicleList=new Array()//车辆信息集合
  var vehicle//车辆
  var vehiclePos//车辆轨迹
  var points=new Array();//创建点的数组
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
  var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
  map.addControl(top_left_control);
  map.addControl(top_left_navigation);  map.enableScrollWheelZoom();//允许放大缩放
  var local = new BMap.LocalSearch(map, {
    renderOptions:{map: map}
  });//用于搜索
  function localSearch(){
    var localSearch=$("#localSearch").val();
    local.search(localSearch);
  }
  /*点数组转json*/
  function pointsTojson(points) {
    return JSON.stringify(points);
  }

  /*json数据转成点数组*/
  function jsonToPoints(jsonData) {
    var points=eval(jsonData);
    var retunPoints=new Array();
    for(var i=0;i<points.length;i++ ){
      var point=new BMap.Point(points[i].lng,points[i].lat)
      retunPoints.push(point)
    }
    return retunPoints
  }

  // 初始化地图，设置中心点坐标和地图级别 设置为上海
  $(document).ready(function(){
    $.ajax({
      url:"getMap",
      type:"get",
      data:{},
      dataType:"json",
      success:function(data){
        if(data=="fail")
        {
          map.centerAndZoom("上海");
        }else{
          if(data.center=="")
            map.centerAndZoom("上海");
          else{
            var point = new BMap.Point(jsonToPoints("["+data.center+"]")[0].lng, jsonToPoints("["+data.center+"]")[0].lat);
            map.centerAndZoom(point,data.zoom);
          }

        }
        /*
         do nothing
         */
      }
    })
    getTrack()
   /* getLine()*/
  });
  function getTrack() {
    $.ajax({
      url: "Track/getCurrentTrack",
      type: "get",
      data: {},
      dataType: "json",
      success: function (data) {
        $(data).each(function (index, element) {
            if(element.vehicle==undefined||element.list==undefined)
                return true
          var map = new Map();
          map.put("vehicle", element.vehicle)
          map.put("vehiclePos", element.list);
          map.put("gpsTime",element.list[element.list.length-1].GPSTime.time)
          var point=new BMap.Point(element.list[element.list.length-1].lng/100000,element.list[element.list.length-1].lat/100000)
          map.put("currentPoint",point)
          var car=setCar(element.vehicle.vehicleType,point,element.list[element.list.length-1].direction,element.list[element.list.length-1].HDD);
          map.put("car",car)
          vehicleList.push(map)
         /* var rfid=element.rfid;
            showRFID(rfid)*/
          showTrack(car,element.vehicle,element.list,point)
        })
        tempList=vehicleList
      }
    })}
  /*setTimeout(function () {
      getLatestRFID()
  },7000)
  function getLatestRFID() {
      $.ajax({
          url:"Track/getLatestRFID",
          type:"get",
          data:{},
          success:function(result){
              if(result!="fail"){
                  result=eval(result)
                  $.each(result,function (index,data) {
                      var rfid=data.rfid
                      showRFID(rfid)
                  })
              }
          }
      })
  }*/
  function setVehicle(devIDNO){
    var newList=new Array();
      if(devIDNO==undefined){
          map.clearOverlays();
          $(tempList).each(function(index,element){
              var vehicle=element.get("vehicle")
              var map1 = new Map();
              map1.put("vehicle", element.get("vehicle"))
              map1.put("vehiclePos", element.get("vehiclePos"));
              map1.put("currentPoint", element.get("currentPoint"))
              map1.put("car", element.get("car"))
              showTrack(element.get("car"), element.get("vehicle"), element.get("vehiclePos"), element.get("currentPoint"))
              newList.push(map1)
              vehicleList = newList;
          })
      } else if(devIDNO==0){
          map.clearOverlays();
          $(tempList).each(function(index,element){
              var vehicle=element.get("vehicle")
              if(vehicle.company=="上海高架养护管理有限公司") {
                  var map1 = new Map();
                  map1.put("vehicle", element.get("vehicle"))
                  map1.put("vehiclePos", element.get("vehiclePos"));
                  map1.put("currentPoint", element.get("currentPoint"))
                  map1.put("car", element.get("car"))
                  showTrack(element.get("car"), element.get("vehicle"), element.get("vehiclePos"), element.get("currentPoint"))
                  newList.push(map1)
                  vehicleList = newList;
              }
          })
      }else if(devIDNO==1){
          map.clearOverlays();
          $(tempList).each(function(index,element){
              var vehicle=element.get("vehicle")
              if(vehicle.company=="上海成基市政建设发展有限公司") {
                  var map1 = new Map();
                  map1.put("vehicle", element.get("vehicle"))
                  map1.put("vehiclePos", element.get("vehiclePos"));
                  map1.put("currentPoint", element.get("currentPoint"))
                  map1.put("car", element.get("car"))
                  showTrack(element.get("car"), element.get("vehicle"), element.get("vehiclePos"), element.get("currentPoint"))
                  newList.push(map1)
                  vehicleList = newList;
              }
          })
      }else{
          $(tempList).each(function(index,element){
              var point=element.get("currentPoint")
              var vehicle=element.get("vehicle")
              if(vehicle.OBUId==devIDNO){
                  map.clearOverlays();
                  var map1 = new Map();
                  map1.put("vehicle", element.get("vehicle"))
                  map1.put("vehiclePos", element.get("vehiclePos"));
                  map1.put("currentPoint",element.get("currentPoint"))
                  map1.put("car",element.get("car"))
                  showTrack(element.get("car"),element.get("vehicle"),element.get("vehiclePos"),element.get("currentPoint"))
                  newList.push(map1)
                  vehicleList=newList;
                  panTo(point)
                  return false
              }
          })
      }
      if(devIDNO!=0&&devIDNO!=1&&devIDNO!=undefined){
          $.ajax({
              url:"Track/getLatestRFID",
              type:"get",
              data:{devIDNO:devIDNO},
              success:function(result){
                  if(result!="fail"){
                      result=eval(result)
                      showRFID(result)
                  }
              }
          })
      }
  }
    function addArea() {
      var center = pointsTojson(map.getCenter());
      var zoom = map.getZoom();
      $.ajax({
        url: "addArea",
        type: "post",
        data: {center: center, zoom: zoom},
        success: function (data) {
          if (data == "fail")
            alert("请先登录")
          else {
            $("#setBtn").click();
          }
          /*
         do nothing
         */
      }
    })
  }
  setInterval(function(){
    getLatestPos()
  }, "10000");
   function getLatestPos(){
     var map=new Map();
     var postString="";
     $.each(vehicleList,function (index,element) {
       var devIDNO=element.get("vehicle").OBUId;
       map.put(devIDNO,element);
       if(index==0)
         postString+=devIDNO
       else
         postString+=","+devIDNO
     })
     $.ajax({
       url:"Track/getLatest",
       type:"get",
       data:{postString:postString},
       success:function(result){
         if(result!="fail"){
           result=eval(result)
           $.each(result,function (index,data) {
             var pos=data.pos;
            /* var rfid=data.rfid;
             showRFID(rfid,element)*/
             var online=data.online;
             var element=map.get(data.devIDNO)
             checkOnline(online,element)
             showPos(pos,element)
           })
         }
       }
     })
  }

  function  checkOnline(data,element) {
    var vc=element.get("vehicle").vehicleType
    var myCar=element.get("car")
    var d=myCar.getRotation()
    var obj=document.getElementById("v"+element.get("vehicle").id);
      if(obj==null)
          return false
    if(data=="Online") {
      obj.style.color = "#005F8E";
      if(vc=="巡视车") {
        element.get("car").setIcon(new BMap.Icon("images/xun.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}))
        element.get("car").setRotation(d)
      } else if(vehicle=="牵引车") {
        element.get("car").setIcon(new BMap.Icon("images/qian.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}))
        element.get("car").setRotation(d)
      }else{
        element.get("car").setIcon(new BMap.Icon("images/sao.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}))
        element.get("car").setRotation(d)
      }
    }else if(data=="Offline"){
      obj.style.color = "#6e6e6e";
      if(vc=="巡视车") {
        element.get("car").setIcon(new BMap.Icon("images/off-line-xun.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}))
        element.get("car").setRotation(d)
      } else if(vehicle=="牵引车") {
        element.get("car").setIcon(new BMap.Icon("images/off-line-qian.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}))
        element.get("car").setRotation(d)
      }else{
        element.get("car").setIcon(new BMap.Icon("images/off-line-sao.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}))
        element.get("car").setRotation(d)
      }
    }
  }
  function showPos(data,element) {
      if(data!=null&data!="fail") {
      var oldGPSTime=element.get("gpsTime").time;
      var newGPSTime=data.GPSTime.time
      var point = new BMap.Point(data.lng / 100000, data.lat / 100000);
      var currentPoint=element.get("currentPoint")
      var overSpeed=element.get("overspeed");
      element.removeByKey("currentPoint")
      element.put("currentPoint",point)
      element.removeByKey("gpsTime")
      element.put("gpsTime",newGPSTime)
      if(newGPSTime-oldGPSTime>=60000){
        return false;
      }
      var polyLine;
      if(overSpeed==1&&data.overSpeed==1)
        polyLine=new BMap.Polyline([currentPoint,point],{strokeColor:"red", strokeWeight:4, strokeOpacity:0.5});
      else{
        polyLine=new BMap.Polyline([currentPoint,point],{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});//#1a9818
      }
      map.addOverlay(polyLine)
      changeInfoWindow(element.get("car"),element.get("vehicle").vehicleLicense,element.get("vehicle").vehicleType, data.devIDNO, data.speed, data.isDriver,data.HDD, point, data.direction,data.directioninfo)
      element.get("car").setPosition(point)
      element.get("car").setRotation(data.direction)
    }
  }
  function showRFID(result) {
    $(result).each(function (index,data) {
      var point = new BMap.Point(data.lng, data.lat);
      var marker= new BMap.Marker(point)
      var opts = {
        width : 100,     // 信息窗口宽度
        height: 100,     // 信息窗口高度
        title : "RFID信息" , // 信息窗口标题
        enableMessage:true,//设置允许信息窗发送短息
        message:""
      }
      var infoWindow = new BMap.InfoWindow("<p>安装位置:"+data.installPos+"<br/>路段:"+data.road+"<br/>所属公司:"+data.company+"</p>", opts);  // 创建信息窗口对象
      /*marker.setLabel(id);*/
      marker.setTitle(data.serialNumber)
      marker.removeEventListener("mouseover");
      marker.removeEventListener("mouseout");
      marker.addEventListener("mouseover",function(e){
        map.openInfoWindow(infoWindow,marker.getPosition());
      });
      marker.addEventListener("mouseout",function(e){
        map.closeInfoWindow(infoWindow,marker.getPosition());
      });
      map.addOverlay(marker);             // 将标注添加到地图中
      marker.disableDragging();           // 不可拖拽
    })
  }
  function showTrack(myCar,vehicle,vehiclePos,currentPoint){

    addVehicle(myCar,vehicle.vehicleLicense,vehicle.vehicleType,vehicle.OBUId,vehiclePos[vehiclePos.length-1].speed,vehiclePos[vehiclePos.length-1].isDrive,vehiclePos[vehiclePos.length-1].HDD,currentPoint,vehiclePos[vehiclePos.length-1].directioninfo)
    var points=new Array();
    var oldGPSTime;
    $(vehiclePos).each(function(index,element){
      if(index>=1&&element.GPSTime.time-oldGPSTime>60000){
        var polyLine=new BMap.Polyline(points,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});;
        map.addOverlay(polyLine)
        points=new Array();
        oldGPSTime=element.GPSTime.time
        return true
      }
      oldGPSTime=element.GPSTime.time
      var point=new BMap.Point(element.lng/100000,element.lat/100000)
      points.push(point)
    })
    /*#1a9818*/
    var polyLine=new BMap.Polyline(points,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});;
    map.addOverlay(polyLine)
  }

    /*5s*/
   /* setInterval(function(){
      showVehiclePos(vehicleLicense, vehicle, devIDNO);
  }, "5000");*/

    /* map.addEventListener('click',mapClick)*/

  function changeInfoWindow(myCar,vehicleLicense, vehicle, devIDNO, speed, isDriver,HDD, point, direction,directioninfo)
  {
    myCar.removeEventListener("mouseover");
    myCar.removeEventListener("mouseout");
    if(HDD== "00") {
      HDD = "硬盘不存在"
    }
    else if(HDD== "01")
      HDD="硬盘存在";
    else {
      HDD = "断电"
    }
    if(speed==0)
      isDriver="静止"
    else
      isDriver="正在作业"
    var opts = {
      width : 0,     // 信息窗口宽度
      height: 0,     // 信息窗口高度
      title :"<h4>车辆信息</h4>" ,// 信息窗口标题
      enableMessage:true,//设置允许信息窗发送短息
      message:""
    }

/*
    var infoWindow = new BMap.InfoWindow("车辆牌照:" + vehicleLicense +"<br >车辆类型:" + vehicle +"<br >车载设备编号:" + devIDNO +"<br >经度:" + point.lng + "<br>纬度:" + point.lat+ "<br>速度:" + speed+ "km/h"+"<br > 方向:" + directioninfo+"<br > 车辆状态:"+ isDriver+"<br> 硬盘状态:"+HDD, opts);  // 创建信息窗口对象
*/
    var infoWindow = new BMap.InfoWindow("<table class='table infoWindow'><tbody><tr><td>车辆牌照</td><td colspan='3'>" + vehicleLicense +"</td></tr><tr><td>车辆类型</td><td colspan='3'>" + vehicle +"</td></tr><tr><td>车载设备编号</td><td colspan='3'>" + devIDNO +"</td></tr><tr><td>经度</td><td colspan='3'>" + point.lng + "</td></tr><tr><td>纬度</td><td colspan='3'>" + point.lat+ "</td></tr><tr><td>速度</td><td colspan='3'>" + speed+ "km/h"+"</td></tr><tr><td>方向</td><td colspan='3'>" + directioninfo+"</td></tr><tr><td>车辆状态</td><td colspan='3'>"+ isDriver+"</td></tr><tr><td>硬盘状态</td><td colspan='3'>"+HDD+"</td></tr></tbody></table>", opts);  // 创建信息窗口对象

    /* myCar.addEventListener('click',function(){
     if(vehicle =="巡视车")
     location.
     href = "progress2-2?id=" + devIDNO
     else
     location.href = "progress2-1?id=" + devIDNO
     });*/
    myCar.addEventListener("mouseover", function (e) {
      map.openInfoWindow(infoWindow, point);
    });
    myCar.addEventListener("mouseout", function (e) {
      map.closeInfoWindow(infoWindow, point);
    });
  }
  function setCar(vehicle,point,direction,HDD){
    var myCar;
    if(vehicle=="巡视车"){
      if(HDD=="01")
        myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/xun.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}), rotation:direction});
      else
        myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/off-line-xun.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}), rotation:direction});
    }
    else if(vehicle=="牵引车") {
      if (HDD == "01")
        myCar = new BMap.Marker(point, {
          icon: new BMap.Icon("images/qian.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}),
          rotation: direction
        });
      else
        myCar = new BMap.Marker(point, {
          icon: new BMap.Icon("images/off-line-qian.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}),
          rotation: direction
        });
    }
    else {
      if (HDD == "01")
        myCar = new BMap.Marker(point, {
          icon: new BMap.Icon("images/sao.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}),
          rotation: direction
        });
      else
        myCar = new BMap.Marker(point, {
          icon: new BMap.Icon("images/off-line-sao.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}),
          rotation: direction
        });
    }
    return myCar;
  }

    function addVehicle(myCar,vehicleLicense, vehicle, devIDNO, speed, isDriver,HDD, point,directioninfo){
      if(HDD== "00")
        HDD= "硬盘不存在"
      else if(HDD== "01")
        HDD="硬盘存在";
      else
        HDD="断电"
      if(speed==0)
        isDriver="静止"
      else
        isDriver="正在作业"
      var opts = {
        width : 0,     // 信息窗口宽度
        height: 0,     // 信息窗口高度
        title :"<h4>车辆信息</h4>" ,// 信息窗口标题
        enableMessage:true,//设置允许信息窗发送短息
        message:""
      }

      /*
       var infoWindow = new BMap.InfoWindow("车辆牌照:" + vehicleLicense +"<br >车辆类型:" + vehicle +"<br >车载设备编号:" + devIDNO +"<br >经度:" + point.lng + "<br>纬度:" + point.lat+ "<br>速度:" + speed+ "km/h"+"<br > 方向:" + directioninfo+"<br > 车辆状态:"+ isDriver+"<br> 硬盘状态:"+HDD, opts);  // 创建信息窗口对象
       */
      var infoWindow = new BMap.InfoWindow("<table class='table infoWindow'><tbody><tr><td>车辆牌照</td><td colspan='3'>" + vehicleLicense +"</td></tr><tr><td>车辆类型</td><td colspan='3'>" + vehicle +"</td></tr><tr><td>车载设备编号</td><td colspan='3'>" + devIDNO +"</td></tr><tr><td>经度</td><td colspan='3'>" + point.lng + "</td></tr><tr><td>纬度</td><td colspan='3'>" + point.lat+ "</td></tr><tr><td>速度</td><td colspan='3'>" + speed+ "km/h"+"</td></tr><tr><td>方向</td><td colspan='3'>" + directioninfo+"</td></tr><tr><td>车辆状态</td><td colspan='3'>"+ isDriver+"</td></tr><tr><td>硬盘状态</td><td colspan='3'>"+HDD+"</td></tr></tbody></table>", opts);  // 创建信息窗口对象


      /* myCar.addEventListener('click',function(){
         if(vehicle =="巡视车")
         location.
                 href = "progress2-2?id=" + devIDNO
         else
           location.href = "progress2-1?id=" + devIDNO
       });*/
      myCar.addEventListener("mouseover", function (e) {
        map.openInfoWindow(infoWindow, point);
      });
      myCar.addEventListener("mouseout", function (e) {
        map.closeInfoWindow(infoWindow, point);
      });
      map.addOverlay(myCar);
    }



  /**/
  function panTo(point){
    map.panTo(point);
  }

    /*
   map
   */
    function Map() {
      this.elements = new Array();

      //获取MAP元素个数
      this.size = function() {
        return this.elements.length;
    };

      //判断MAP是否为空
      this.isEmpty = function() {
        return (this.elements.length < 1);
    };

      //删除MAP所有元素
      this.clear = function() {
        this.elements = new Array();
    };

      //向MAP中增加元素（key, value)
      this.put = function(_key, _value) {
        this.elements.push( {
          key :_key,
          value :_value
      })
        ;
    };

    //删除指定KEY的元素，成功返回True，失败返回False
    this.removeByKey = function(_key) {
      var bln = false;
      try {
        for (i = 0; i < this.elements.length; i++) {
          if (this.elements[i].key == _key) {
            this.elements.splice(i, 1);
            return true;
          }
        }
      } catch (e) {
        bln = false;
      }
      return bln;
    };

    //删除指定VALUE的元素，成功返回True，失败返回False
    this.removeByValue = function(_value) {//removeByValueAndKey
      var bln = false;
      try {
        for (i = 0; i < this.elements.length; i++) {
          if (this.elements[i].value == _value) {
            this.elements.splice(i, 1);
            return true;
          }
        }
      } catch (e) {
        bln = false;
      }
      return bln;
    };

    //删除指定VALUE的元素，成功返回True，失败返回False
    this.removeByValueAndKey = function(_key,_value) {
      var bln = false;
      try {
        for (i = 0; i < this.elements.length; i++) {
          if (this.elements[i].value == _value && this.elements[i].key == _key) {
            this.elements.splice(i, 1);
            return true;
          }
        }
      } catch (e) {
        bln = false;
      }
      return bln;
    };

    //获取指定KEY的元素值VALUE，失败返回NULL
    this.get = function(_key) {
      try {
        for (i = 0; i < this.elements.length; i++) {
          if (this.elements[i].key == _key) {
            return this.elements[i].value;
          }
        }
      } catch (e) {
        return false;
      }
      return false;
    };

    //获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL
    this.element = function(_index) {
      if (_index < 0 || _index >= this.elements.length) {
        return null;
      }
      return this.elements[_index];
    };

      //判断MAP中是否含有指定KEY的元素
      this.containsKey = function (_key) {
        var bln = false;
        try {
          for (i = 0; i < this.elements.length; i++) {
            if (this.elements[i].key == _key) {
              bln = true;
            }
          }
        } catch (e) {
          bln = false;
        }
        return bln;
      };

      //判断MAP中是否含有指定VALUE的元素
      this.containsValue = function (_value) {
        var bln = false;
        try {
          for (i = 0; i < this.elements.length; i++) {
            if (this.elements[i].value == _value) {
              bln = true;
            }
          }
        } catch (e) {
          bln = false;
        }
        return bln;
      };

      //判断MAP中是否含有指定VALUE的元素
      this.containsObj = function (_key, _value) {
        var bln = false;
        try {
          for (i = 0; i < this.elements.length; i++) {
            if (this.elements[i].value == _value && this.elements[i].key == _key) {
              bln = true;
            }
          }
        } catch (e) {
          bln = false;
        }
        return bln;
      };

      //获取MAP中所有VALUE的数组（ARRAY）
      this.values = function () {
        var arr = new Array();
        for (i = 0; i < this.elements.length; i++) {
          arr.push(this.elements[i].value);
        }
        return arr;
      };

      //获取MAP中所有VALUE的数组（ARRAY）
      this.valuesByKey = function (_key) {
        var arr = new Array();
        for (i = 0; i < this.elements.length; i++) {
          if (this.elements[i].key == _key) {
            arr.push(this.elements[i].value);
          }
        }
        return arr;
      };

      //获取MAP中所有KEY的数组（ARRAY）
      this.keys = function () {
        var arr = new Array();
        for (i = 0; i < this.elements.length; i++) {
          arr.push(this.elements[i].key);
        }
        return arr;
      };

      //获取key通过value
      this.keysByValue = function (_value) {
        var arr = new Array();
        for (i = 0; i < this.elements.length; i++) {
          if (_value == this.elements[i].value) {
            arr.push(this.elements[i].key);
          }
        }
        return arr;
      };

      //获取MAP中所有KEY的数组（ARRAY）
      this.keysRemoveDuplicate = function () {
        var arr = new Array();
        for (i = 0; i < this.elements.length; i++) {
          var flag = true;
          for (var j = 0; j < arr.length; j++) {
            if (arr[j] == this.elements[i].key) {
              flag = false;
              break;
            }
          }
          if (flag) {
            arr.push(this.elements[i].key);
          }
        }
        return arr;
      };
    }
</script>
</body>
</html>
