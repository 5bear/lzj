<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/14
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
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
    $(function () {
      var chart;

      $(document).ready(function () {

        // Build the chart
        chart = new Highcharts.Chart({
          chart: {
            renderTo: 'container2',
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
              ['有效作业率',   90.0],
              ['无效作业率',       10.0],

            ]
          }]
        });
      });
    });


    $(function () {
      var chart;

      $(document).ready(function () {

        // Build the chart
        chart = new Highcharts.Chart({
          chart: {
            renderTo: 'container1',
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
              ['覆盖 3个',   75.0],
              ['未覆盖 1个', 25.0],

            ]
          }]
        });
      });
    });
  </script>



  <style>
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
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海成基市政建设发展有限公司</a>
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
                          <c:forEach items="${cyList}" var="item">
                            <li>
                              <a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">牵引车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${cqList}" var="item">
                            <li>
                              <a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">巡视车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${cxList}" var="item">
                            <li>
                              <a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                    </ul>
                  </li>
                </ul>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护管理有限公司</a>
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
                          <c:forEach items="${gyList}" var="item">
                            <li>
                              <a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">牵引车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${gqList}" var="item">
                            <li>
                              <a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">巡视车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${gxList}" var="item">
                            <li>
                              <a href="#" onclick="setVehicle('${item.OBUId}')">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                    </ul>
                  </li>
              </ul>
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

        <div id="in-right" style="width:249px;">
          <div class="panel panel-primary panel-right panel-index">
            <div class="panel-heading text-center" style="letter-spacing:3px">本日养护作业进度表</div>
            <div class="panel-body">
              <div class="panel-section">
                <select class="panel-select">
                  <option value="">上海</option>
                  <option value="">上海成基市政建设发展有限公司</option>
                  <option value="">上海高架养护管理有限公司</option>
                </select>
              </div>
              <div class="panel-section">
                <h5>作业进度</h5>
                <div class="progressbar_1" >
                  <div class="bar" style="width: 50%;"></div>
                </div>
                <span style="margin-left: 130px;">50%</span>
                <span>247km</span>
              </div>
              <div class="panel-section">
                <div class="panel-section-left">
                  <div id="container2" style="width:120px;height:208px;"></div>
                </div>
                <div class="panel-section-left">
                  <div id="container1" style="width:120px;height:208px;"></div>
                </div>
                <div class="clearboth"></div>
              </div>
              <div class="panel-section explain-row">
                <p>说明：</p>
                <p>1、有效作业率：指在路段中没有出现超速、偏离路线等异常情况的清扫作业长度与计划清扫作业长度之比。</p>
                <p>2、匝道覆盖率：指被检测到清扫的匝道个数与清扫个数之比。</p>
              </div>
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
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script>
  var myCar;//汽车图标
  var vehicleList=new Array()
  var vehicle//车辆
  var vehiclePos//车辆轨迹
  /*信息窗口*/
  var opts = {
    width : 100,     // 信息窗口宽度
    height: 200,     // 信息窗口高度
    title :"车辆信息" ,// 信息窗口标题
    enableMessage:true,//设置允许信息窗发送短息
    message:""
  }
  var infoWindow
  var points=new Array();//创建点的数组
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
  map.enableScrollWheelZoom();//允许放大缩放
  map.addControl(top_left_control);
  var local = new BMap.LocalSearch(map, {
    renderOptions:{map: map}
  });//用于搜索
  function localSearch(){
    var localSearch=$("#localSearch").val();
    local.search(localSearch);
  }
/*转换为地图坐标*/
  function transferPoint(point){
    return new BMap.Point(point.lng+(121.35053994012-121.339485),point.lat+(31.217964392252-31.213757));
  }
  /*点数组转json*/
  function pointsTojson(points) {
    return JSON.stringify(points);
  }

  /*json数据转成点数组*/
  function jsonToPoints(jsonData) {
    return eval(jsonData);
  }

  // 初始化地图，设置中心点坐标和地图级别 设置为上海
  $(document).ready(function(){
    $.ajax({
      url:"getMap",
      type:"post",
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
  });
  function getTrack() {
    $.ajax({
      url: "Track/getCurrentTrack",
      type: "post",
      data: {},
      dataType: "json",
      success: function (data) {
        console.log(data)
        $(data).each(function (index, element) {
          var map = new Map();
          map.put("vehicle", element.vehicle)
          map.put("vehiclePos", element.list);
          var point=new BMap.Point(element.list[element.list.length-1].lng/100000,element.list[element.list.length-1].lat/100000)
          console.log(point.lng)
          map.put("currentPoint",transferPoint(point))
          var car=setCar(element.vehicle.vehicleType,transferPoint(point),element.list[element.list.length-1].direction);
          map.put("car",car)
          vehicleList.push(map)
          showTrack(car,element.vehicle,element.list,transferPoint(point))
        })
      }
    })}

  function setVehicle(devIDNO){
    $(vehicleList).each(function(index,element){
      var point=element.get("currentPoint")
      var vehicle=element.get("vehicle")
      if(vehicle.OBUId==devIDNO){
        panTo(point)
        return false
      }
    })
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
    $(vehicleList).each(function(index,element){
      $.ajax({
        url:"Track/getLatestPos",
        type:"post",
        data:{DevIDNO:element.get("vehicle").OBUId},
        dataType:"json",
        success:function(data){
          if(data!=null) {
            var point = new BMap.Point(data.lng / 100000, data.lat / 100000);
            var currentPoint=element.get("currentPoint")
            element.removeByKey("currentPoint")
            element.put("currentPoint",transferPoint(point))
            var polyLine=new BMap.Polyline([currentPoint,transferPoint(point)],{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});
            map.addOverlay(polyLine)
            changeInfoWindow(element.get("car"),element.get("vehicle").vehicleLicence,element.get("vehicle").vehicleType, data.devIDNO, data.speed/10, data.isDriver,data.HDD, transferPoint(point), data.direction)
            element.get("car").setPosition(transferPoint(point))
            element.get("car").setRotation(data.direction)
          }
        }
      })
    })
  }


  function showTrack(myCar,vehicle,vehiclePos,currentPoint){

    addVehicle(myCar,vehicle.vehicleLicence,vehicle.vehicleType,vehicle.OBUId,vehiclePos[vehiclePos.length-1].speed,vehiclePos[vehiclePos.length-1].isDrive,vehiclePos[vehiclePos.length-1].HDD,currentPoint,vehiclePos[vehiclePos.length-1].direction)
    var points=new Array();
    $(vehiclePos).each(function(index,element){
      var point=new BMap.Point(element.lng/100000,element.lat/100000)
      points.push(transferPoint(point))
    })
    var polyLine=new BMap.Polyline(points,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});
    map.addOverlay(polyLine)
  }

    /*5s*/
   /* setInterval(function(){
      showVehiclePos(vehicleLicence, vehicle, devIDNO);
  }, "5000");*/

    /* map.addEventListener('click',mapClick)*/

  function changeInfoWindow(myCar,vehicleLicence, vehicle, devIDNO, speed, isDriver,HDD, point, direction)
  {
    myCar.removeEventListener("mouseover");
    myCar.removeEventListener("mouseout");
    if(HDD== "00")
      HDD= "硬盘不存在"
    else if(HDD== "01")
      HDD="硬盘存在";
    else
      HDD="断电"
    if(isDriver==0)
      isDriver="正在作业"
    else
      isDriver="静止"
    var opts = {
      width : 100,     // 信息窗口宽度
      height: 200,     // 信息窗口高度
      title :"车辆信息" ,// 信息窗口标题
      enableMessage:true,//设置允许信息窗发送短息
      message:""
    }

    infoWindow = new BMap.InfoWindow("车辆牌照:" + vehicleLicence +"<br >车辆类型:" + vehicle +"<br >车载设备编号:" + devIDNO +"<br >经度:" + point.lng + "<br>纬度:" + point.lat+ "<br>速度:" + speed+ "km/h"+"<br > 方向:" + direction+"<br > 车辆状态:"+ isDriver+"<br> 硬盘状态:"+HDD, opts);  // 创建信息窗口对象
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
  function setCar(vehicle,point,direction){
    var myCar;
    if(vehicle=="巡视车")
      myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/xun.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}), rotation:direction});
    else if(vehicle=="牵引车")
      myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/qian.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}),rotation:direction});
    else
      myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/sao.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)}),rotation:direction});
    return myCar;
  }

    function addVehicle(myCar,vehicleLicence, vehicle, devIDNO, speed, isDriver,HDD, point, direction){
      if(HDD== "00")
        HDD= "硬盘不存在"
      else if(HDD== "01")
        HDD="硬盘存在";
      else
        HDD="断电"
      if(isDriver==0)
        isDriver="正在作业"
      else
        isDriver="静止"
      var opts = {
        width : 100,     // 信息窗口宽度
        height: 200,     // 信息窗口高度
        title :"车辆信息" ,// 信息窗口标题
        enableMessage:true,//设置允许信息窗发送短息
        message:""
      }

       infoWindow = new BMap.InfoWindow("车辆牌照:" + vehicleLicence +"<br >车辆类型:" + vehicle +"<br >车载设备编号:" + devIDNO +"<br >经度:" + point.lng + "<br>纬度:" + point.lat+ "<br>速度:" + speed+ "km/h"+"<br > 方向:" + direction+"<br > 车辆状态:"+ isDriver+"<br> 硬盘状态:"+HDD, opts);  // 创建信息窗口对象
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
