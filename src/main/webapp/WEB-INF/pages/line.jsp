<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/3/5
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>作业线路</title>
  <style type="text/css">

    button{font-size: 15px;font-family: 微软雅黑;}
    ul{text-align: center}
    li{list-style-type: none; float: left;margin-left: 100px;color: white;margin-top: 5px}
    li:hover{
      color: #ab1e1e;cursor: hand;
    }
    html{height:100%}
    body{height:100%;margin:0px;padding:0px;font-family: 微软雅黑}
    .nagv{width: 100%;height: 10%}
    .firt-nagv{width:100%;height:50%;background-color: #000040
    }
    .search{margin-left: 200px}
    #container{width: 50%;height: 500px;float: left;margin-left: 200px}
    #content{
      height:500px;width:100%;}
  </style>

  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA">
    //v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=您的密钥"
    //v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
  </script>
</head>

<body>
<div class="nagv">
  <div class="firt-nagv">
    <ul>
      <li>首页</li>
      <li>基础数据</li>
      <li>实时监控</li>
      <li>历史数据</li>
      <li>数据报表</li>
      <li>系统管理</li>
    </ul>
  </div>
</div>

<div id="content">
  <div class="search" >
    <select>
      <option>按序列号</option>
    </select>
    <input type="text" id="search">
    <button onclick="query()" style="width:60px;height: 20px;text-align: center">查询</button>
  </div>
  <div id="container">

  </div>
  <div class="editArea" id="editArea" style="display: none;float:right;">
    <div class="title">
      <div class="title1">
        <p >作业线路编辑区</p>
      </div>
      <div class="title2">
        <p id="info">选择点的坐标（x,y）</p>
      </div>
    </div>
    <div class="content">
      <div class="title">
        <p >作业线路信息</p>
      </div>
      <div class="content">
        <div class="col">
          <label>名称</label>
          <input type="text">
        </div>
        <div class="col">
          <label>开始坐标：</label><br>
          <label>x：</label> <input type="text" id="startX">
          <label>y：</label><input type="text" id="startY">
        </div>
        <div class="col">
          <label>结束坐标：</label><br>
          <label>x：</label> <input type="text" id="endX">
          <label>y：</label><input type="text" id="endY">
        </div>
        <div class="col">
          <label>所属包件：</label> <input type="text">
          <label>备注：</label><input type="text">
        </div>
      </div>
    </div>
    <div class="foot">
      <button onclick="addLine()" >添加/更改</button>
      <button onclick="deletemarker()">删除</button>
    </div>
  </div>
</div>
<script type="text/javascript">
  var currentLng,currentLat;
  var marker;
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  map.enableScrollWheelZoom();//允许放大缩放

  map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海

  //地图点击事件 显示RFID添加div
  map.addEventListener("click", function(e){
    if(e.overlay==null) {
      var point = new BMap.Point(e.point.lng, e.point.lat);
      map.panTo(point)
      var opts = {
        width : 100,     // 信息窗口宽度
        height: 100,     // 信息窗口高度
        title : "" , // 信息窗口标题
        enableMessage:true,//设置允许信息窗发送短息
        message:""
      }
      console.log("<p>序列号:xxxxx<br/>路段:中山西路<br/>录入人:xxx</p>")
      var infoWindow = new BMap.InfoWindow("<p>点坐标:<br/>x:"+ e.point.lng+"<br/>y:"+ e.point.lat+"</p>", opts);  // 创建信息窗口对象
      /*
       创建新图标
       //创建小狐狸
       var pt = new BMap.Point(116.417, 39.909);
       var myIcon = new BMap.Icon("http://developer.baidu.com/map/jsdemo/img/fox.gif", new BMap.Size(300,157));
       var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
       */
      marker = new BMap.Marker(point);// 创建标注
      marker.setTitle("serialNumber");
      marker.addEventListener("mouseover",function(e){
        map.openInfoWindow(infoWindow,point);
      });
      marker.addEventListener("mouseout",function(e){
        map.closeInfoWindow(infoWindow,point);
      });
      map.addOverlay(marker);             // 将标注添加到地图中
      marker.disableDragging();           // 不可拖拽
    }else
      marker= e.overlay;
    var info=document.getElementById("info");

    info.innerHTML=("选择点的坐标（"+ e.point.lng+","+ e.point.lat+")");
    var obj=document.getElementById("editArea");
    obj.style.display="";
  });
  function addLine(){
    var startX=document.getElementById("startX").value;
    var startY=document.getElementById("startY").value;
    var endX=document.getElementById("endX").value;
    var endY=document.getElementById("endY").value;
    var polyline = new BMap.Polyline([
      new BMap.Point(startX,startY),
      new BMap.Point(endX, endY),
    ], {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});   //创建折线
    map.addOverlay(polyline);   //增加折线
  }
  function query(){
    var searchCondition=document.getElementById("search");
    var markers=map.getOverlays();
    for(var m in markers){
      console.log(m)
      if(markers[m].getTitle()==searchCondition.value){
        console.log(markers[m].getPosition());
        map.panTo(markers[m].getPosition());
        break
      }

    }

  }
  function deletemarker(){
    map.removeOverlay(marker);
  }
</script>
</body>
</html>
