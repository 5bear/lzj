<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/5
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>布点计划</title>


  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->



  <style>
    #index { width:100%; height:100%; margin-left:16px;min-width:940px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:73%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-right { width:250px; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;min-width:249px;}

    .button{
      position:absolute;
      border-radius:5px;
      border:none;
      background-color: #00608B;
      color: white;
      font-size: 12px;
      padding: 0;}

    #container{width: 56%;
      height: 600px;
      float: left;
      margin-left: 5px;
      margin-right: 5px;}

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
      left: 45%;
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
      position: absolute; left:95px; width: 125px;
    }
    .xuanfu4
    {
      position: absolute;
      top: 240px;
      left: 501px;
      width: 120px;
      height: 80px;
    }
    .map_bt
    {
      border: 0;
      width: 22px;
      position:absolute;
    }

    .bt{
      height: 4%;
      width: 25%;
      position: absolute;
      border:0;
    }

    .tt
    { position: absolute;
      top: 13px;
      left: 215px;
      border: none;
      background-color: #F2F2F2;
      border-radius: 5px;
      padding: 3px 6px;
      margin-right: 10px;
      width: 20%;
      color:rgb(62,133,167);
    }


    .hour{
      position: absolute;
      top: 13px;
      left: 215px;
      border: none;
      background-color: #F2F2F2;
      border-radius: 5px;
      padding: 3px 6px;
      margin-right: 10px;
      width: 20%;
      color:rgb(62,133,167);
    }

    .date
    { position: absolute;
      top: 13px;
      left: 215px;
      border: none;
      background-color: #F2F2F2;
      border-radius: 5px;
      padding: 3px 6px;
      margin-right: 10px;
      width: 20%;
      color:rgb(62,133,167);
    }

    .panel-right button.close{
      margin: 0;
      padding: 0;
      width: 20px;
      display: none;
    }

    #startHour, #endHour {
      width: 45px;
      background-color: white;
      border-radius: 0;
    }

    .add-car {
      border: 1px solid #5a5a5a;
      display: none;
      margin-top: 20px;
    }

    .edit-car {
      margin-bottom: 20px;
    }

  </style>
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageFather" value="plan"></jsp:param>
    <jsp:param name="pageName" value="plan3"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="#">计划管理</a></li>
          <li><a href="#">布点计划</a></li>
          <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
        </ol>
      </div>





      <div id="index">
        <!--<img src="images/index.jpg" width="100%"/>-->
        <%--<div id="in-left">
          <div class="panel panel-primary">
            <div class="panel-heading text-center" style=" letter-spacing:3px">选择查看</div>
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
                              <a href="#" onclick="getListByVehicle(${item.id})">${item.vehicleLicense}</a>
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
                              <a href="#" onclick="getListByVehicle(${item.id})">${item.vehicleLicense}</a>
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
                              <a href="#" onclick="getListByVehicle(${item.id})">${item.vehicleLicense}</a>
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
                              <a href="#" onclick="getListByVehicle(${item.id})">${item.vehicleLicense}</a>
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
                              <a href="#" onclick="getListByVehicle(${item.id})">${item.vehicleLicense}</a>
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
                              <a href="#" onclick="getListByVehicle(${item.id})">${item.vehicleLicense}</a>
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
        </div>--%><!--in-left-->

        <div id="in-mid"><!--<img src="images/mid2.png" width="100%"/>-->
          <!-- <input class="bt" type="button"  style=" position: absolute;top: 2%;left: 49%;
                 background:url(images/queren.png); background-size:100% 100%; width:10%" /> -->



          <div style="position: relative;">
            <div id="container" style="height: 610px; width:99%;"></div>
            <div class="map-search">
              <input type="text" id="localSearch" onchange="localSearch()"/>
              <button onclick="localSearch()"></button>
            </div>
          </div>

        </div><!--in-mid-->

        <div id="in-right">
          <div class="panel panel-primary panel-right">
            <div class="panel-heading text-center" style="letter-spacing:3px;">布点计划</div>
            <div class="panel-body" style="height: 610px; overflow-y: auto;">
              <div class="row">
                <label>选择点的地址：</label>
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
                <label>已有布点车辆</label>
              </div>
              <div id="positions">
                </div>
              <div class="add-car">
                <div class="row">
                  <label>车牌：</label>
                  <input type="text" id="licence" list="lista">
                  <datalist id="lista">
                    <c:forEach items="${list}" var="item">
                      <option value="${item.vehicleLicense}">${item.vehicleLicense}</option>
                    </c:forEach>
                  </datalist>
                </div>
                <div class="row">
                  <label>布点时间：</label>
                  <p><input type="text" id="startHour">-<input type="text" id="endHour"></p>
                </div>
                <div class="row text-center">
                  <button type="button" class="btn btn-default" id="add">新增</button>
                </div>
              </div>
              <div class="row text-center">
                <button class="btn btn-default" id="edit">编辑</button>
                <button class="btn btn-default" onclick="deleteRFID()">删除</button>
              </div>
            </div>
          </div>
        </div>


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
          <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->

  <!-- JavaScript -->
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jquery.datetimepicker.js"></script>
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
          $("#positions").html("")
          if(!confirm('是否增加定位?'))
            return true;
          var point = new BMap.Point(e.point.lng, e.point.lat);
          marker = new BMap.Marker(point);// 创建标注
          map.addOverlay(marker);             // 将标注添加到地图中
          marker.disableDragging();           // 不可拖拽
        }else{
          marker= e.overlay;
          var coords=markerMap.get(marker);
          currentLng= JSON.parse(coords).lng
          currentLat= JSON.parse(coords).lat
          if(coords!=undefined) {
            $.ajax({
              url: "plan3/get",
              type: "get",
              data: {coords: coords},
              dataType: "json",
              success: function (data) {
                var positions="";
                $(data).each(function(index,element){
                  positions+="<div class='edit-section' id='"+element.id+"'> " +
                  "<div class='edit-car'> " +
                  "<div class='row text-right'> " +
                  "<button class='close' onclick=deleteById("+'\''+element.id+"')"+">&times;</button> </div> <div class='row'> " +
                  "<label>车牌：</label> " +
                  "<p class='licence'>"+element.vehicle+"</p></div> " +
                  "<div class='row'> " +
                  "<label>布点时间：</label> " +
                  "<p>"+element.beginTime+"-"+element.stopTime+"</p> </div> </div> </div>"
                })
                $("#positions").html(positions)
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
      /*添加比例尺*/
      var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
      var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
      map.addControl(top_left_control);
      map.addControl(top_left_navigation);
      $.ajax({
        url:"plan3/list",
        type:"get",
        data:{},
        dataType:"json",
        success:function(data){
          $(data).each(function(index){
            var point=new BMap.Point(data[index].lng, data[index].lat);
            addMarker(point,data[index].coords)
          })
        }
      })
    })
    /*
     * 删除点
     * */
    function deleteRFID(){
      if(marker==null){
        alert("请先在地图上选择点");
        return false;
      }
      var coords=markerMap.get(marker)
      $.ajax({
        url:"plan3/delete",
        type:"post",
        data:{coords:coords},
        success:function(data){
          if(data=="NoPower"){
            alert("没有操作权限")
            return false
          }
          location.reload(true);
        }
      })
    }
    function deleteById(pid){
      $("#"+pid).hide()
      $.ajax({
        url:"plan3/deleteByID",
        type:"post",
        data:{id:pid},
        success:function(data){
          if(data=="NoPower"){
            alert("没有操作权限")
            return false
          }
        }
      })
    }
    /*
     * 添加标记
     * */
    function addMarker(point,coords){
      var marker1 = new BMap.Marker(point);// 创建标注
      /*var opts = {
        width : 100,     // 信息窗口宽度
        height: 100,     // 信息窗口高度
        title : "布点信息" , // 信息窗口标题
        enableMessage:true,//设置允许信息窗发送短息
        message:""
      }
      var infoWindow = new BMap.InfoWindow("<p>车牌:"+vehicle+"<br/>布点时间:"+beginTime+"-"+stopTime+"</p>", opts);  // 创建信息窗口对象
      marker1.addEventListener("click",function(e){
        map.openInfoWindow(infoWindow,point);
      });*/
      markerMap.put(marker1,coords);
      map.addOverlay(marker1);             // 将标注添加到地图中
      marker1.disableDragging();           // 不可拖拽
    }
    /*
     显示某条路上的布点*/
    function getListByVehicle(vehicle){
      $.ajax({
        url:"plan3/getListByVehicle",
        type:"get",
        data:{vehicle:vehicle},
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
            addMarker(point,data[index].id,data[index].vehicle,data[index].beginTime,data[index].stopTime)
          })
        }
      })
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

    $('#startHour, #endHour').datetimepicker({
      datepicker:false,
      format:'H:i',
      step:10
    });

    $("#edit").on("click", function(){
      var text = $(this).text();
      if (text == "编辑") {
        $(".add-car").show();
        $(this).text("取消");
        $(".close").show();
       /* $(".edit-car").css("border", "1px solid black");
        $(".edit-car").find(".licence").each(function(){
          var obj = $(this);
          var val = obj.text();
          obj.replaceWith("<input value=" + val + ">");
        });*/
      } else {
        $(".add-car").hide();
        $(".edit-car").css("border", "none");
        $(this).text("编辑");
        $(".close").hide();
      /*  $(".edit-car").find("input").each(function(){
          var obj = $(this);
          var val = obj.val();
          obj.replaceWith("<p class='licence'>" + val + "</p>");
        });*/
      }
    });

    $(".close").click(function(){
      var obj = $(this)
      var pid=obj.attr("id")
      deleteById(pid)
    })

    function deleteCar(obj) {
      console.log(obj)
      obj.parent().parent().hide();
    };

    $("#add").on("click", function(){
      var text1 = $("#licence").val(),
              text2 = $("#startHour").val(),
              text3 = $("#endHour").val(),
              temp = "";
      if ( text1 == "" || text2 == "" || text3 == "" || text2 >= text3) {
        alert("请正确填入信息");
      } else {
        var lng=currentLng;
        var lat=currentLat;
        if(marker==null){
          alert("请先在地图上选择");
          return false;
        }
        $.ajax({
          url:"plan3/add",
          type:"post",
          data:{vehicle:text1,beginTime:text2,stopTime:text3,lng:lng,lat:lat},
          success:function(data){
            if(data=="fail"){
              alert("不存在该车牌")
              return false
            }else if(data=="duplicated"){
              alert("布点时间有冲突")
              return false
            }else if(data=="success"){
              alert("非牵引车不能添加")
              return false
            }else if(data=="NoPower"){
              alert("没有操作权限")
              return false
            }
            location.reload(true)
          }
        })
      }
    });


  </script>

</body>
</html>
