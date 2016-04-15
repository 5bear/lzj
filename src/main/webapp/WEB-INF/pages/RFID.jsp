<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/3/5
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>上海地图</title>
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
    //v2.0版本的引用方式：src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"
    //v1.4版本及以前版本的引用方式：src="http://api.map.baidu.com/api?v=1.4&key=您的密钥&callback=initialize"
  </script>
  <script type="text/javascript" src="js/jquery-1.10.2.js" ></script>
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
    <button onclick="query()">查询</button>
  </div>
  <div id="container">

  </div>
  <div class="editArea" id="editArea" style="display: none;float:right;margin-right: 100px">
    <div class="title">
      <div class="title1">
        <p >RFID编辑区</p>
      </div>
      <div class="title2">
        <p id="info">选择点的坐标（x,y）</p>
      </div>
    </div>
    <div class="content">
      <div class="title">
        <p >REID信息</p>
      </div>
      <div class="content">
        <div class="col">
          <label>序列号</label>
          <input type="text">
        </div>
        <div class="col">
          <label>路段</label>
          <input type="text">
        </div>
      </div>
    </div>
    <div class="foot">
      <button >添加/更改</button>
      <button onclick="deletemarker()">删除</button>
    </div>
  </div>
</div>
</body>
</html>
<script type="text/javascript">
  var currentLng,currentLat;
  var marker;
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  map.enableScrollWheelZoom();//允许放大缩放

  map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海
  //地图点击事件 显示RFID添加div
  map.addEventListener("click", function(e){
    currentLng= e.point.lng;
    currentLat= e.point.lat;
    var info=document.getElementById("info");
    info.innerHTML=("选择点的坐标（"+ e.point.lng+","+ e.point.lat+")");
    var obj=document.getElementById("editArea");
    obj.style.display="";
    if(e.overlay==null) {
      var point = new BMap.Point(e.point.lng, e.point.lat);
      map.panTo(point)
      marker = new BMap.Marker(point);// 创建标注
      map.addOverlay(marker);             // 将标注添加到地图中
      marker.disableDragging();           // 不可拖拽
    }else{
      marker= e.overlay;
      var id=marker.getLabel();
      $.ajax({
        url:"/RFID/get",
        type:"post",
        data:{id:id},
        dataType:"json",
        success:function(data){

        }
      })
    }
  });

  $(document).ready(function(){
    $.ajax({
      url:"/RFID/list",
      type:"post",
      data:{},
      dataType:"json",
      success:function(data){
        $(data).each(function(index){
          var point=new BMap.Point(data[index].lng, data[index].lat);
          addMarker(point,data[index].serialNumber,data[index].road,data[index].company,data[index].id)
        })
      }
    })
  })

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
  function addRFID(){
    var equipNum=$("#equipNum").val();
    var lng=currentLng;
    var lat=currentLat;
    var serialNumber=$("#serialNumber").val();
    var roadId=$("#road").value;
    var zhadao=$("#zhadao").val();
    var direction=$("#direction").val();
    var installPos1=$("#installPos1").val();
    var installPos2=$("#installPos2").val();
    $.ajax({
      url:"/RFID/add",
      type:"post",
      data:{equipNum:equipNum,lng:lng,lat:lat,serialNumber:serialNumber,roadId:roadId,zhadao:zhadao,direction:direction,installPos1:installPos1,installPos2:installPos2},
      success:function(data){

      }
    })
  }
  function addMarker(point,serialNumber,road,inputMan,id){
    var opts = {
      width : 100,     // 信息窗口宽度
      height: 100,     // 信息窗口高度
      title : "RFID信息" , // 信息窗口标题
      enableMessage:true,//设置允许信息窗发送短息
      message:""
    }
    console.log("<p>序列号:"+serialNumber+"<br/>路段:"+road+"<br/>录入人:"+inputMan+"</p>")
    var infoWindow = new BMap.InfoWindow("<p>序列号:xxxxx<br/>路段:中山西路<br/>所属公司:xxx</p>", opts);  // 创建信息窗口对象
    /*
     创建新图标
     //创建小狐狸
     var pt = new BMap.Point(116.417, 39.909);
     var myIcon = new BMap.Icon("http://developer.baidu.com/map/jsdemo/img/fox.gif", new BMap.Size(300,157));
     var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
     */
    marker = new BMap.Marker(point);// 创建标注
    marker.setLabel(id);
    marker.addEventListener("mouseover",function(e){
      map.openInfoWindow(infoWindow,point);
    });
    marker.addEventListener("mouseout",function(e){
      map.closeInfoWindow(infoWindow,point);
    });
    map.addOverlay(marker);             // 将标注添加到地图中
    marker.disableDragging();           // 不可拖拽
  }
  function deletemarker(){
    map.removeOverlay(marker);
  }
</script>