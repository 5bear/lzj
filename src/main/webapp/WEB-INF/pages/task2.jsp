<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/6/15
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>task2</title>
</head>
<body>
<div id="container" style="height: 610px; width:99%;"></div>
</body>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>
<script type="text/javascript" src="js/BMaplib.js"></script>
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script>
  var myCar;//汽车图标
  var tempList=new Array()//车辆信息集合
  var vehicleList=new Array()//车辆信息集合
  var vehicle//车辆
  var vehiclePos//车辆轨迹
  var points=new Array();//创建点的数组
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
  map.enableScrollWheelZoom();//允许放大缩放
  map.addControl(top_left_control);
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
    getTrack()
  });
  function getTrack() {
    $.ajax({
      url: "Track/getAllCurrentTrack",
      type: "get",
      data: {},
      dataType: "json",
      success: function (data) {
        console.log(data)
        $(data).each(function (index, element) {
          var map = new Map();
          map.put("vehicle", element.vehicle)
          map.put("eFence",element.eFence)
          map.put("vehiclePos", element.list);
          map.put("gpsTime",element.list[element.list.length-1].GPSTime.time)
          map.put("devgpsId",element.list[element.list.length-1].id)
          var point=new BMap.Point(element.list[element.list.length-1].lng/100000,element.list[element.list.length-1].lat/100000)
          console.log(point.lng)
          map.put("currentPoint",point)
          var car=setCar(element.vehicle.vehicleType,point,element.list[element.list.length-1].direction);
          map.put("car",car)
          vehicleList.push(map)
          showTrack(car,element.vehicle,element.list,point)
        })
        tempList=vehicleList
      }
    })}

  function setVehicle(devIDNO){
    var newList=new Array();
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
  /*是否越界*/
  function inFence(){
    $(tempList).each(function(index,element){
      var point=element.get("currentPoint")
      var eFence=element.get("eFence")
      var vehicle=element.get("vehicle")
      var gpsTime=element.get("gpsTime")
      if(eFence!=undefined){
      var polygon = new BMap.Polygon(jsonToPoints(eFence.coords), {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});   //创建折线
      var exception="";
      if(!BMapLib.GeoUtils.isPointInPolygon(point, polygon))
      {
        exception = "越界"
        $.ajax({
          url: "setException",
          type: "post",
          data: {id: vehicle.id, GpsTime: gpsTime, lng: point.lng, lat: point.lat, exception: exception},
          success: function (data) {
            /**/
          }
        })
      }
      }
    })
  }
  setInterval(function(){
/*
    setLine()
*/
    getLatestPos()
    inFence()
  }, 10000);

  function setLine(){
      $.ajax({
          url:"setLine",
          type:"post",
          data:{},
          success:function(data){
              console.log(data)
          }
      })
  }
  function getLatestPos(){
    $(vehicleList).each(function(index,element){
      $.ajax({
        url:"Track/getLatestPos",
        type:"get",
        data:{DevIDNO:element.get("vehicle").OBUId},
        dataType:"json",
        success:function(data){
          if(data!=null) {
            var point = new BMap.Point(data.lng / 100000, data.lat / 100000);
            var currentPoint=element.get("currentPoint")
            element.removeByKey("currentPoint")
            element.put("currentPoint",point)
            element.removeByKey("gpsTime")
            element.put("gpsTime",data.GPSTime.time)
            element.removeByKey("devgpsId")
            element.put("devgpsId",data.id)
            var polyLine=new BMap.Polyline([currentPoint,point],{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});
            map.addOverlay(polyLine)
            changeInfoWindow(element.get("car"),element.get("vehicle").vehicleLicense,element.get("vehicle").vehicleType, data.devIDNO, data.speed/10, data.isDriver,data.HDD, point, data.direction)
            element.get("car").setPosition(point)
            element.get("car").setRotation(data.direction)
          }
        }
      })
    })
  }


  function showTrack(myCar,vehicle,vehiclePos,currentPoint){

    addVehicle(myCar,vehicle.vehicleLicense,vehicle.vehicleType,vehicle.OBUId,vehiclePos[vehiclePos.length-1].speed,vehiclePos[vehiclePos.length-1].isDrive,vehiclePos[vehiclePos.length-1].HDD,currentPoint,vehiclePos[vehiclePos.length-1].direction)
    var points=new Array();
    $(vehiclePos).each(function(index,element){
      var point=new BMap.Point(element.lng/100000,element.lat/100000)
      points.push(point)
    })
    var polyLine=new BMap.Polyline(points,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});
    map.addOverlay(polyLine)
  }

  /*5s*/
  /* setInterval(function(){
   showVehiclePos(vehicleLicense, vehicle, devIDNO);
   }, "5000");*/

  /* map.addEventListener('click',mapClick)*/

  function changeInfoWindow(myCar,vehicleLicense, vehicle, devIDNO, speed, isDriver,HDD, point, direction)
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

    var infoWindow = new BMap.InfoWindow("车辆牌照:" + vehicleLicense +"<br >车辆类型:" + vehicle +"<br >车载设备编号:" + devIDNO +"<br >经度:" + point.lng + "<br>纬度:" + point.lat+ "<br>速度:" + speed+ "km/h"+"<br > 方向:" + direction+"<br > 车辆状态:"+ isDriver+"<br> 硬盘状态:"+HDD, opts);  // 创建信息窗口对象
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

  function addVehicle(myCar,vehicleLicense, vehicle, devIDNO, speed, isDriver,HDD, point, direction){
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

    var infoWindow = new BMap.InfoWindow("车辆牌照:" + vehicleLicense +"<br >车辆类型:" + vehicle +"<br >车载设备编号:" + devIDNO +"<br >经度:" + point.lng + "<br>纬度:" + point.lat+ "<br>速度:" + speed+ "km/h"+"<br > 方向:" + direction+"<br > 车辆状态:"+ isDriver+"<br> 硬盘状态:"+HDD, opts);  // 创建信息窗口对象
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
</html>
