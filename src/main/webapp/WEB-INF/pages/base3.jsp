﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/9
  Time: 22:17

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
  <meta http-equiv="X-UA-Compatible"content="IE=edge"><%--最高兼容模式兼容IE--%>
  <meta name="description" content="">
  <meta name="author" content="">
  <title>RFID监测点管理</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <link rel="stylesheet" href="css/style.css"/>
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/bootstrap.js"></script>
  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->



  <style>

    .button{
      position:absolute;
      border-radius:5px;
      border:none;
      background-color: #00608B;
      color: white;
      font-size: 12px;
      padding: 0;}

    .bt{
      width: 11%;
      top: 2%;
      left: 28%;
      background-color: #00608B;
      color: white;
      font-size: 90%;
      padding: 2px 8px;
      border:0;
    }
    #container{width: 57%;
      height: 600px;
      float: left;
      margin-left: 5px;
      margin-right: 5px;}
    #index { width:100%; height:100%; min-width:960px; min-height:600px; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:57%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}

    .bt{
      height: 22px;
      width: 60px;
      position: absolute;
      border:0;
    }
    #search
    {
      position: absolute;
      left: 7%;
      border: none;
      background-color: #F2F2F2;
      border-radius: 5px;
      padding: 3px 6px;
      margin-right: 10px;
      width: 20%;

    }
    .r_text
    {
      position: absolute;
      height: 25px;
      width: 140px;
    }
    .r_text1
    {
      position:absolute;
      height:25px;
      width:105px;
    }
    .p
    {
      position: absolute;
      font-family:sans-serif;
      font-size:15px;
    }

    .xuanfu3
    {
      position: absolute;

      left: 310px;
      top: 200px;
      width: 120px;
      height: 80px;
    }

    .xuanfu3 p
    {
      font-size:16px;
    }



  </style>
  <script >
    $(function(){ $(".xuanfu3").hide(); //默认隐藏
      $("#cute").on("click",function(){ $(".xuanfu3").toggle();//显示隐藏切换
      }) })
  </script>
</head>

<body style="overflow:scroll">

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageFather" value="base"></jsp:param>
    <jsp:param name="pageName" value="base3"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="">基础数据</a></li>
          <li><a href="">RFID监测点管理</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>





      <div id="index">
        <!--<img src="images/index.jpg" width="100%"/>-->
        <div id="in-left" style="float:left">

          <div class="panel panel-primary">
            <div class="panel-heading text-center" style=" letter-spacing:3px">选择查看区域</div>
            <div class="panel-body">
              <li class="dropdown dropdown1">
                <a href="#" data-toggle="droplist">按照区域查</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <%
                    if(company.equals("养护中心")||company.equals("上海成基市政建设发展有限公司")){
                  %>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海成基市政建设发展有限公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <c:forEach items="${cjList}" var="line">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="getListByRoad('${line.id}','${line.line}')" data-toggle="dropdown">${line.line}</a>
                          <div class="arrow-section arrow-section3">
                          </div>
                        </li>
                      </c:forEach>
                    </ul>
                  </li>
                  <%
                    } if(company.equals("养护中心")||company.equals("上海高架养护管理有限公司")){
                  %>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护管理有限公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <c:forEach items="${gjygList}" var="line">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="getListByRoad('${line.id}','${line.line}')" data-toggle="dropdown">${line.line}</a>
                          <div class="arrow-section arrow-section3">
                          </div>
                        </li>
                      </c:forEach>

                    </ul>
                  </li>
                  <%
                    }
                  %>
                </ul>
              </li><!--dropdown1-->
            </div>
          </div>

        </div><!--in-left-->

        <div id="in-mid" style="float:left"><!--<img src="images/mid2.png" width="100%"/>-->
          <!--<input class="button" type="button"  value="搜索" style=" position: absolute;top: 15px;left: 30%; width:9%;"/>-->


          <div> 
            <img src="images/search_icon.png" style="width: 32px; height: 20px;"/>
            <input type="text" style="width: auto;" placeholder="请输入RFID序列号" id="search"/>
            <button class="button" style="padding: 5px;left:30%;width:70px;" onclick="query()">搜索</button>
          </div>
          <div style="width: 99%; top: 22px; overflow: hidden; position: relative; z-index: 0; color: rgb(0, 0, 0); text-align: left; background-color: rgb(243, 241, 236);">
            <div id="container" style="height: 610px; width:99%;"></div>
            <div class="map-search">
              <input type="text" id="localSearch" onchange="localSearch()"/>
              <button onchange="localSearch()"></button>
            </div>
          </div>
        </div>


        <div id="in-right" style="position: relative;float: left;  left:0; top: 0; width:249px; height:600px;">
          <div class="panel panel-primary panel-right">
            <div class="panel-heading text-center" style=" letter-spacing:3px">RFID编辑区</div>
            <div class="panel-body">
              <div class="row">
                <label>选择点的坐标</label>
                <p id="info"></p>
              </div>
              <div class="row">
                <label>经度：</label>
                <p id="lng"></p>
              </div>
              <div class="row">
                <label>纬度：</label>
                <p id="lat"></p>
              </div>
              <div class="row">
                <label>RFID信息：</label>
              </div>
              <div class="row">
                <label>序列号：</label>
                <input type="text" id="serialNumber"/>
              </div>
              <div class="row">
                <label>所属路段：</label>
                <select id="roadId">
                  <c:forEach items="${lineList}" var="line">
                    <option value="${line.id}">${line.line}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="row">
                <label>布设匝道：</label>
                <select id="zhadao">
                  <option value="入口">入口</option>
                  <option value="出口">出口</option>
                </select>
              </div>
              <div class="row">
                <label>方向：</label>
                <select id="direction">
                  <option value="内圈">内圈</option>
                  <option value="外圈">外圈</option>
                  <option value="东侧">东侧</option>
                  <option value="西侧">西侧</option>
                  <option value="南侧">南侧</option>
                  <option value="北侧">北侧</option>
                </select>
              </div>
              <div class="row">
                <label>设备编号：</label>
                <input type="text" id="equipNum"/>
              </div>
              <div class="row">
                <label>设置安装位置：</label>
                <input type="text" id="installPos"/>
              </div>
              <div class="row text-center">
                <button class="btn btn-default" onclick="addClick(0)" data-toggle="modal" data-target="#success">保存</button>
                <button class="btn btn-default" onclick="addClick(1)" data-toggle="modal" data-target="#success">删除</button>
              </div>
            </div>
          </div>

        </div>

      </div><!--/.index-->


    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<div class="modal fade" id="success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">

      </div>
      <div class="modal-body text-center">
        <p>是否确认此次更改</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn_type">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>

  $('a[data-toggle="droplist"]').click(function(e) {
    e.preventDefault();
    $(this).nextAll().toggle();
  });
</script>
<!--    <script>

        $('a[data-toggle="droplist"]').click(function() {
            $(this).nextAll().toggle();
        });
    </script>
    <script>
            $(function(){
                $("#base").dropdown('toggle');
            });
        </script>-->

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>

<script>

  var currentLng=0,currentLat=0;
  var marker=null;
  var markerMap=new Map();
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  map.enableScrollWheelZoom();//允许放大缩放

  map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海
  var local = new BMap.LocalSearch(map, {
    renderOptions:{map: map}
  });//用于搜索
  function localSearch(){
    removeAll()
    var localSearch=$("#localSearch").val();
    local.search(localSearch);
  }
  //地图点击事件 显示RFID添加div
  map.addEventListener("click", function(e){
    removeAll()
    currentLng= e.point.lng;
    currentLat= e.point.lat;
    $("#lng").html(Math.round(e.point.lng*100)/100)
    $("#lat").html(Math.round(e.point.lat*100)/100)
    var point1 = new BMap.Point(e.point.lng, e.point.lat);
    var info=document.getElementById("info");
    var geoc = new BMap.Geocoder();
    geoc.getLocation(point1, function(rs){
      var addComp = rs.addressComponents;
      $("#info").html(addComp.district + addComp.street +addComp.streetNumber);
      if(e.overlay==null) {
        if(!confirm('是否增加定位?'))
          return true;
        var point = new BMap.Point(e.point.lng, e.point.lat);
        marker = new BMap.Marker(point);// 创建标注
        map.addOverlay(marker);             // 将标注添加到地图中
        marker.disableDragging();           // 不可拖拽
      }else{
        marker= e.overlay;
        var id=markerMap.get(marker);
        if(id!=undefined) {
          $.ajax({
            url: "RFID/get",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function (data) {
              $("#roadId").val(data.roadId)
              $("#direction").val(data.direction)
              $("#zhadao").val(data.zhadao)
              $("#equipNum").val(data.equipNum);
              $("#serialNumber").val(data.serialNumber);
              $("#installPos").val(data.installPos);
            }
          })
        }
      }
    });
  });
  /*
   * 显示已存在的RFID点
   * */
  $(document).ready(function(){
    marker = new BMap.Marker(point);// 创建标注
    map.addOverlay(marker);             // 将标注添加到地图中
    /*添加比例尺*/
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    $.ajax({
      url:"RFID/list",
      type:"get",
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
  /*
   * 通过序列号查询
   * */
  function query(){
    removeAll()
    var searchCondition=$("#search").val();
    var markers=map.getOverlays();
    for(var m in markers){
      if(markers[m].getTitle()==searchCondition){
        map.panTo(markers[m].getPosition());
        var id=markerMap.get(markers[m]);
        if(id!=undefined) {
          $.ajax({
            url: "RFID/get",
            type: "get",
            data: {id: id},
            dataType: "json",
            success: function (data) {
              $("#roadId").val(data.roadId)
              $("#direction").val(data.direction)
              $("#zhadao").val(data.zhadao)
              $("#equipNum").val(data.equipNum);
              $("#serialNumber").val(data.serialNumber);
              $("#installPos").val(data.installPos);
            }
          })
        }
        return false;
      }
    }
    $.ajax({
      url: "RFID/getByNumber",
      type: "get",
      data: {number: searchCondition},
      dataType: "json",
      success: function (data) {
        var point = new BMap.Point(data.lng, data.lat);
        map.panTo(point)
        marker = new BMap.Marker(point);// 创建标注
        var opts = {
          width : 100,     // 信息窗口宽度
          height: 100,     // 信息窗口高度
          title : "RFID信息" , // 信息窗口标题
          enableMessage:true,//设置允许信息窗发送短息
          message:""
        }
        var infoWindow = new BMap.InfoWindow("<p>序列号:"+data.serialNumber+"<br/>路段:"+data.road+"<br/>所属公司:"+data.company+"</p>", opts);  // 创建信息窗口对象
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
        marker.disableDragging();           // 不可
        markerMap.put(marker,data.id)
        $("#roadId").val(data.roadId)
        $("#direction").val(data.direction)
        $("#zhadao").val(data.zhadao)
        $("#equipNum").val(data.equipNum);
        $("#serialNumber").val(data.serialNumber);
        $("#installPos").val(data.installPos);
      }
    })
  }
  /*
   * 添加/修改RFID点
   * */
  function addRFID(){
    var equipNum=$("#equipNum").val();
    var lng=currentLng;
    var lat=currentLat;
    if(marker==null){
      alert("请先在地图上选择");
      return false;
    }
    var serialNumber=$("#serialNumber").val();
    var roadId=$("#roadId").val();
    var zhadao=$("#zhadao").val();
    var direction=$("#direction").val();
    var installPos=$("#installPos").val();
    var id =markerMap.get(marker)
    if(serialNumber==""){
      alert("序列号不能为空");
      return true;
    }
    if(equipNum==""){
      alert("设备编号不能为空");
      return true;
    }
    if(installPos==""){
      alert("设备安装位置不能为空");
      return true;
    }
    if(id=="-1"){
      $.ajax({
        url:"RFID/add",
        type:"post",
        data:{equipNum:equipNum,lng:lng,lat:lat,serialNumber:serialNumber,roadId:roadId,zhadao:zhadao,direction:direction,installPos:installPos},
        success:function(data){
          if(data=="duplicated"){
            alert("重复的序列号");
            return false
          }
          if(data=="NoPower"){
            alert("没有操作权限");
            return false
          }
          location.reload(true);
        }
      })
    }else{
      $.ajax({
        url:"RFID/edit",
        type:"post",
        data:{id:id,equipNum:equipNum,lng:lng,lat:lat,serialNumber:serialNumber,roadId:roadId,zhadao:zhadao,direction:direction,installPos:installPos},
        dataType:"json",
        success:function(data){
          if(data=="duplicated"){
            alert("重复的序列号");
            return false
          } else if(data=="NoPower"){
            alert("没有操作权限");
            return false
          }else{
            var opts = {
              width : 100,     // 信息窗口宽度
              height: 100,     // 信息窗口高度
              title : "RFID信息" , // 信息窗口标题
              enableMessage:true,//设置允许信息窗发送短息
              message:""
            }
            var infoWindow = new BMap.InfoWindow("<p>序列号:"+data.serialNumber+"<br/>路段:"+data.road+"<br/>所属公司:"+data.company+"</p>", opts);  // 创建信息窗口对象
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
          }
        }
      })
    }

  }
  /*
   * 删除RFID点
   * */
  function deleteRFID(){
    if(marker==null){
      alert("请先在地图上选择");
      return false;
    }
    var id=markerMap.get(marker)
    $.ajax({
      url:"RFID/delete",
      type:"post",
      data:{id:id},
      success:function(data){
        if(data=="NoPower"){
          alert("没有操作权限");
          return false
        }
        deletemarker()
        location.reload(true);
      }
    })
  }
  /*
   * 添加标记
   * */
  function addMarker(point,serialNumber,road,company,id){
    console.log(id)
    var opts = {
      width : 100,     // 信息窗口宽度
      height: 100,     // 信息窗口高度
      title : "RFID信息" , // 信息窗口标题
      enableMessage:true,//设置允许信息窗发送短息
      message:""
    }
    var infoWindow = new BMap.InfoWindow("<p>序列号:"+serialNumber+"<br/>路段:"+road+"<br/>所属公司:"+company+"</p>", opts);  // 创建信息窗口对象
    var marker1 = new BMap.Marker(point);// 创建标注
    /*marker.setLabel(id);*/
    marker1.setTitle(serialNumber)
    marker1.addEventListener("mouseover",function(e){
      map.openInfoWindow(infoWindow,point);
    });
    marker1.addEventListener("mouseout",function(e){
      map.closeInfoWindow(infoWindow,point);
    });
    markerMap.put(marker1,id);
    map.addOverlay(marker1);             // 将标注添加到地图中
    marker1.disableDragging();           // 不可拖拽
  }
  /*
   显示某条路上的RFID*/
  function getListByRoad(roadId,road){
    $("#roadId").val(roadId)
    removeAll()
    $.ajax({
      url:"RFID/getListByRoad",
      type:"get",
      data:{road:road},
      dataType:"json",
      success:function(data){
        /* var markers=map.getOverlays();
         for(var i in markers){
         markers[i].setLabel();
         *//* console.log(markers[i].getLabel())
         map.removeOverlay(markers[i]);*//*
         }
         console.log(markers[0].getLabel())*/
        map.clearOverlays();
        $(data).each(function(index){
          var point=new BMap.Point(data[index].lng, data[index].lat);
          if(index==0)
            map.panTo(point)
          addMarker(point,data[index].serialNumber,data[index].road,data[index].company,data[index].id)
        })
      }
    })
  }
  /*
   * 删除标记
   * */
  function deletemarker(){
    console.log(marker)
    map.removeOverlay(marker);
  }
  /*
   * 添加点击事件
   * */
  function addClick(type){
    if(type==0){
      $("#btn_type").unbind("click");
      $("#btn_type").bind("click",addRFID);
    }

    else if(type==1){
      $("#btn_type").unbind("click");
      $("#btn_type").bind("click",deleteRFID);
    }

  }
  /*
   * 清空输入
   * */
  function removeAll(){
    $("#equipNum").val("");
    $("#serialNumber").val("");
    $("#installPos").val("");
  }
  /*
   * MAP对象，实现MAP功能
   *
   * 接口：
   * size()     获取MAP元素个数
   * isEmpty()    判断MAP是否为空
   * clear()     删除MAP所有元素
   * put(key, value)   向MAP中增加元素（key, value)
   * remove(key)    删除指定KEY的元素，成功返回True，失败返回False
   * get(key)    获取指定KEY的元素值VALUE，失败返回NULL
   * element(index)   获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL
   * containsKey(key)  判断MAP中是否含有指定KEY的元素
   * containsValue(value) 判断MAP中是否含有指定VALUE的元素
   * values()    获取MAP中所有VALUE的数组（ARRAY）
   * keys()     获取MAP中所有KEY的数组（ARRAY）
   *
   * 例子：
   * var map = new Map();
   *
   * map.put("key", "value");
   * var val = map.get("key")
   * ……
   *
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
        key : _key,
        value : _value
      });
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
        return "-1";
      }
      return "-1";
    };

    //获取指定索引的元素（使用element.key，element.value获取KEY和VALUE），失败返回NULL
    this.element = function(_index) {
      if (_index < 0 || _index >= this.elements.length) {
        return null;
      }
      return this.elements[_index];
    };

    //判断MAP中是否含有指定KEY的元素
    this.containsKey = function(_key) {
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
    this.containsValue = function(_value) {
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
    this.containsObj = function(_key,_value) {
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
    this.values = function() {
      var arr = new Array();
      for (i = 0; i < this.elements.length; i++) {
        arr.push(this.elements[i].value);
      }
      return arr;
    };

    //获取MAP中所有VALUE的数组（ARRAY）
    this.valuesByKey = function(_key) {
      var arr = new Array();
      for (i = 0; i < this.elements.length; i++) {
        if (this.elements[i].key == _key) {
          arr.push(this.elements[i].value);
        }
      }
      return arr;
    };

    //获取MAP中所有KEY的数组（ARRAY）
    this.keys = function() {
      var arr = new Array();
      for (i = 0; i < this.elements.length; i++) {
        arr.push(this.elements[i].key);
      }
      return arr;
    };

    //获取key通过value
    this.keysByValue = function(_value) {
      var arr = new Array();
      for (i = 0; i < this.elements.length; i++) {
        if(_value == this.elements[i].value){
          arr.push(this.elements[i].key);
        }
      }
      return arr;
    };

    //获取MAP中所有KEY的数组（ARRAY）
    this.keysRemoveDuplicate = function() {
      var arr = new Array();
      for (i = 0; i < this.elements.length; i++) {
        var flag = true;
        for(var j=0;j<arr.length;j++){
          if(arr[j] == this.elements[i].key){
            flag = false;
            break;
          }
        }
        if(flag){
          arr.push(this.elements[i].key);
        }
      }
      return arr;
    };
  }
</script>
</body>
</html>
