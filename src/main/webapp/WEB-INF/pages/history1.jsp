<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/4
  Time: 13:39
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
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
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
    #index { width:100%; height:100%; min-width:980px;margin-left:16px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:73%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
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
          <li><a href="#">历史数据</a></li>
          <li><a href="#">历史轨迹查询</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>





      <div id="index">
        <!--<img src="images/index.jpg" width="100%"/>-->


        <div id="in-mid"><!--<img src="images/mid2.png" width="100%"/>-->

          <input type="text" value="起始时间" id="startDate" class="date" style="position: absolute; top: 2%; left: 4%; width:17%"/>
          <input type="text"  class="hour" id="startTime" style="position: absolute; top: 2%; left: 22%; width:10%"/>
          <input type="text" value="结束时间" id="endDate" class="date"  style="position: absolute; top: 2%; left: 33%; width:17%"/>
          <input type="text"  class="hour"  id="endTime" style="position: absolute; top: 2%; left: 51%; width:10%"/>
          <!--<input class="bt" type="button"  style=" position: absolute;top: 2%;left: 40%; width:13%;height:4%;
                 background:url(images/xuanze.png); background-size:100% 100%" /> -->
          <!-- <button class="button" style="top:2%;left:57%; width:13%;height:4%">选择时间段</button>-->
          <input id="license" list="lista" style="position: absolute; top: 2%; left: 62%; width:13%">
          <select id="playSpeed"  style="position: absolute; top: 2%; left: 78%; width:13%">
            <option value="2">2x</option>
            <option value="4">4x</option>
            <option value="8">8x</option>
            <option value="16">16x</option>
          </select>
          <datalist id="lista">
            <c:forEach items="${list}" var="item">
              <option value="${item.vehicleLicense}">${item.vehicleLicense}</option>
            </c:forEach>
          </datalist>

          <!--<input class="bt" type="button"  style=" position: absolute;top: 2%;left: 90%;width:10%;height:4%;
               background:url(images/queren.png); background-size:100% 100%" /> -->
          <button class="button" onclick="getTrack()" style="top:2%;left:91%; width:9%;height:4%">确认</button>

          <div style="position: relative;top:43px">
            <div id="container" style="height: 610px; width: 99%; overflow: hidden; position: relative; z-index: 0; color: rgb(0, 0, 0); text-align: left; background-color: rgb(243, 241, 236);"></div>
            <div class="map-search">
              <input type="text" id="localSearch" onchange="localSearch()"/>
              <button onclick="localSearch()"></button>
            </div>
          </div>
        </div><!--in-mid-->

        <div id="in-right" style="249px">
          <div class="panel panel-primary panel-right">
            <div class="panel-heading text-center" style="letter-spacing:3px">车辆信息</div>
            <div class="panel-body">
              <div class="row">
                <label>作业车辆信息：</label>
              </div>
              <div class="row">
                <label>车牌：</label>
                <p id="chepai"></p>
              </div>
              <div class="row">
                <label>平均行驶速度：</label>
                <p id="averSpeed"></p>
              </div>
              <%--<div class="row">
                <label>异常：</label>
                <p id="exception"></p>
              </div>--%>
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

  $('a[data-toggle="droplist"]').click(function(e) {
    e.preventDefault();
    $(this).nextAll().toggle();
  });
</script>

<script>


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
  var vehicleList=new Array()
  var time1;
  var vehicle//车辆
  var vehiclePos//车辆轨迹
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  map.enableScrollWheelZoom();//允许放大缩放
  var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
  var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
  map.addControl(top_left_control);
  map.addControl(top_left_navigation);
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
    return eval(jsonData);
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
  });
  function getTrack() {
    window.clearInterval(time1)
    map.clearOverlays();
    var startDate=$("#startDate").val();
    var startTime=$("#startTime").val()
    var endDate=$("#endDate").val()
    var endTime=$("#endTime").val()
    if(startDate>endDate){
      alert("开始时间小于结束时间！")
      return false
    }
    if(startDate==endDate&&startTime>endTime){
      alert("开始时间小于结束时间！")
      return false
    }
    var param=$("#license").val()
    var playSpeed=$("#playSpeed").val()
    $.ajax({
      url: "Track/getHistoryTrack",
      type: "get",
      data: {fromDate:startDate+" "+startTime,toDate:endDate+" "+endTime,param:param},
      success: function (data) {
       if(data=="fail"){
         alert(param+"在"+startDate+" "+startTime+"-"+endDate+" "+endTime+"间无行驶轨迹")
         return false;
       }else{
         data=JSON.parse(data)
         var map = new Map();
         map.put("vehicle", data.vehicle)
         map.put("vehiclePos", data.list);
         var point=new BMap.Point(data.list[data.list.length-1].lng/100000,data.list[data.list.length-1].lat/100000)
         console.log(point.lng)
         map.put("currentPoint",point)
         var constructP=new BMap.Point(data.list[0].lng/100000,data.list[0].lat/100000)
         var car=setCar(data.vehicle.vehicleType,constructP,data.list[0].direction);
         map.put("car",car)
         vehicleList.push(map)
         showTrack(car,data.vehicle,data.list,playSpeed)
       }
      }
    })}
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
         else if(data=="NoPower"){
          alert("没有操作权限");
          return false
        }
        else {
          $("#setBtn").click();
        }
        /*
         do nothing
         */
      }
    })
  }
  /*5s*/
  /* setInterval(function(){
   showVehiclePos(vehicleLicense, vehicle, devIDNO);
   }, "5000");*/

  /* map.addEventListener('click',mapClick)*/
  function showTrack(myCar,vehicle,vehiclePos,playSpeed){
    $("#chepai").html(vehicle.vehicleLicense)
    var sumSpeed= 0
    var count=0;
    map.addOverlay(myCar);
    var points=new Array();
/*
    var flag1=false,flag2=false;
*/
    $(vehiclePos).each(function(index,element){
      /*if(!flag1) {
        if (element.overSpeed == 1) {
          exception += "超速 "
          flag1 = true
        }
      }
      if(!flag2) {
        if (element.inefence == 1) {
          exception += "越界"
          flag2=true
        }
      }*/
      sumSpeed+=element.speed
      count=index+1
      var point=new BMap.Point(element.lng/100000,element.lat/100000)
      points.push(point)
    })
    averSpeed=sumSpeed/count;
    $("#averSpeed").html(Math.round(averSpeed*100)/100+"km/h");
/*
    $("#exception").html(exception)
*/
    var index=0;
    time1=setInterval(function(){
      if(index>=points.length){
        window.clearInterval(time1)
        return
      }
      if(vehiclePos[index+1]!=undefined) {
          var driving = new BMap.DrivingRoute(map,{policy: 'BMAP_DRIVING_POLICY_LEAST_DISTANCE'});    //创建驾车实例
          driving.search(points[index],points[index+1])
          driving.setSearchCompleteCallback(function(){
              console.log(driving.getStatus())
              if(driving.getStatus() == 0){
                  var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
                  polyline = new BMap.Polyline(pts,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});
                  map.addOverlay(polyline);
              }
          })
       /* var polyLine;
        if(vehiclePos[index].overSpeed==1&&vehiclePos[index+1].overSpeed==1)
          polyLine=new BMap.Polyline([points[index],points[index+1]],{strokeColor:"red", strokeWeight:2, strokeOpacity:0.5});
        else
          polyLine=new BMap.Polyline([points[index],points[index+1]],{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});*/
        myCar.setPosition(points[index + 1])
        myCar.setRotation(vehiclePos[index + 1].direction)
        var label = new BMap.Label(getLocalTime(vehiclePos[index + 1].GPSTime));
        myCar.setLabel(label)
       /* map.addOverlay(polyLine)*/
      }
      index++;
    }, 10000/playSpeed);
  }
  function getLocalTime(now) {
    var   year=now.year+1900;
    var   month=now.month+1;
    var   date=now.date;
    var   hour=now.hours<10?"0"+now.hours:now.hours;
    var   minute=now.minutes<10?"0"+now.minutes:now.minutes;
    var   second=now.seconds<10?"0"+now.seconds:now.seconds;
    return   year+"-"+month+"-"+date+"   "+hour+":"+minute+":"+second;
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




  /**/
  function panTo(lng,lat){
    var point= new BMap.Point(lng, lat);
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
