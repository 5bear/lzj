<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/13
  Time: 21:59
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

  <title>作业路线管理</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <link rel="stylesheet" href="css/style.css"/>
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/bootstrap.js"></script>
  <script type="text/javascript" src="js/BMaplib.js"></script>
  <script type="text/javascript" src="js/highcharts.js"></script>
  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->



  <style>
    #index { width:100%; height:100%; min-width:960px; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:57%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-right { width:23.5%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent; position:relative; min-width:246px;}


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
      left: 102px;
      font-family: Microsoft YaHei,STHeiti;
    }

    .p1
    {
      position: absolute;
      left:36%;
      font-family: Microsoft YaHei,STHeiti;
    }


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
  </style>
</head>

<body>

<div id="wrapper">

  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
    <jsp:param name="pageFather" value="plan"></jsp:param>
    <jsp:param name="pageName" value="plan2"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="">计划管理</a></li>
          <li><a href="">作业路线管理</a></li>
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
                  <%
                    if(company.equals("养护中心")||company.equals("上海成基市政建设发展有限公司")){
                  %>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海成基市政建设发展有限公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <c:forEach items="${cjList}" var="item">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="showLine('${item.id}')" data-toggle="dropdown">${item.line}</a>
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
                      <c:forEach items="${gjyhList}" var="item">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="showLine('${item.id}')" data-toggle="dropdown">${item.line}</a>
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

        <div id="in-mid"><!--<img src="images/mid2.png" width="100%"/>-->
          <!--<input class="bt1" type="button"  id="begin"  style="top: 2%;left: 2%; width:11%; background:
                  url(images/begin.png); background-size: 100% 100% " />
           <input class="bt1" type="button" id="reset" style="top: 2%;left: 15%;width:11%; background:  url(images/reset.png);background-size: 100% 100% " />
           <input class="bt1" type="button" id="chexiao" style="top: 2%;left: 28%; background:url(images/complete.png);   background-size: 100% 100% " />
           <input class="bt1" type="button" id="complete" style="top: 2%;left: 41%; width:9%;background:url(images/back.png);  background-size: 100% 100% " />
           -->
          <button class="button" style="top:2%;left:2%;width:12%;height:5%" onclick="choosePoint()">开始绘制</button>
          <button class="button" style="top:2%;left:15%;width:12%;height:5%" onclick="undo()">撤销一次</button>
          <button class="button" style="top:2%;left:28%;width:12%;height:5%" onclick="complete()">完成</button>
          <button class="button" style="top:2%;left:41%;width:12%;height:5%" onclick="javascipt:location.href='line'">返回</button>
          <div style="width: 98%; top: 52px; overflow: hidden; position: relative; z-index: 0; color: rgb(0, 0, 0); text-align: left;">
            <div id="container" style="height: 600px; width:99%;"></div>
            <div class="map-search">
              <input type="text" id="localSearch"/>
              <button onclick="localSearch()"></button>
            </div>
          </div>

        </div><!--in-mid-->

        <div id="in-right" style="width:249px;">

          <div class="right-main" style="background-color:rgb(242,242,242);width:249px;height:599px;position:absolute;top:51px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;">
            <p style="position:absolute;top:13px;left:16px; font-weight:bold">选择点的坐标</p>
            <p style="position:absolute;top:58px;left:16px; font-weight:bold">经度：</p>
            <p style="position:absolute;top:96px;left:16px; font-weight:bold">纬度：</p>
            <p style="position:absolute;top:142px;left:16px;font-weight:bold">作业线路信息：</p>
            <p style="position:absolute;top:182px;left:16px;font-weight:bold">名称：</p>
            <p style="position:absolute;top:223px;left:16px;font-weight:bold">养护公司：</p>
            <p style="position:absolute;top:262px;left:16px;font-weight:bold">所属包件：</p>
            <p style="position:absolute;top:307px;left:16px;font-weight:bold">方向类型：</p>
            <p style="position:absolute;top:352px;left:16px;font-weight:bold">方向：</p>
            <p style="position:absolute;top:397px;left:16px;font-weight:bold">开始坐标：</p>
            <p style="position:absolute;top:442px;left:16px;font-weight:bold">结束坐标：</p>
            <p style="position:absolute;top:487px;left:16px;font-weight:bold">里程数(km)：</p>

          </div>

          <div class="right-top" style="background-color:rgb(2,96,142);width:249px; height:100px;border-top-left-radius: 5px;border-top-right-radius: 5px;">
            <p style="position:absolute;top:16px; left:65px; color:white;font-weight:bold;font-size:16px; letter-spacing:2px;">作业路线编辑区</p>
          </div>


          <p class="p" style="top:63px" id="info"></p>
          <p style="position:absolute;top:110px;left:100px;" id="lng"></p>
          <p style="position:absolute;top:148px;left:100px;" id="lat"></p>

          <input type="text" style="position: absolute; top:232px; left: 70px; width:125px;" id="lineName">
          <select style="position: absolute; top: 272px;left:85px; width: 108px;" id="company" onchange="changePackage()">
            <%
              if(company.equals("养护中心")){
            %>
            <option value="上海成基市政建设发展有限公司">上海成基市政建设发展有限公司</option>
            <option value="上海高架养护管理有限公司">上海高架养护管理有限公司</option>
            <%
            }else{
            %>
            <option value="<%=company%>"><%=company%></option>
            <%
              }
            %>
          </select>

          <select style="position: absolute; top: 313px;left: 85px; width: 108px;" id="package">
            <c:forEach items="${packages}" var="item">
              <option value="${item.id}" class="${item.company=="上海高架养护管理有限公司"?"gaojia":"chengji"}">${item.packageName}</option>
            </c:forEach>
          </select>
          <select style="position: absolute; top: 356px; left:90px; width: 80px;" id="directionType" onchange="changeDirection()">
            <option value="内外圈" >内外圈</option>
            <option value="南北侧" >南北侧</option>
            <option value="东西侧" >东西侧</option>
          </select>
          <select style="position: absolute; top: 402px;left: 70px; width: 100px;" id="direction">
            <option value="内圈">内圈</option>
            <option value="外圈">外圈</option>
          </select>
          <p class="p1" style="top:442px;" id="startCoord"></p>
          <p class="p1" style="top:498px;" id="endCoord"></p>
          <p class="p1" style="top:538px;" id="realDistance"></p>
          <!-- <input class="bt1" data-toggle="modal" data-target="#success" type="button"  style=" top:72%;left: 18%;width:24%;
                  background:url(images/add.png); background-size:100% 100%" />
           <input class="bt1" type="button"   data-toggle="modal" data-target="#success" style=" top:72%;left:60%;width:24%;
                  background:url(images/delete.png); background-size:100% 100%" />-->
          <button class="button"  style="top:580px;left:50px;width:70px;height:28px" onclick="addClick(0)">保存</button>
          <button class="button" style="top:580px;left:148px;width:70px;height:28px" onclick="addClick(1)">删除</button>
          <button  data-toggle="modal" data-target="#success" id="showModal" style="display: none">show</button>
        </div><!--in-right-->

        <%--<input type="text" value="经度" id="jingdu">
        <input type="text" value="纬度" id="weidu">
        <input type="button" value="画点" onclick="miaodian()">--%>
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
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btn_type">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->

<script>
  $('a[data-toggle="droplist"]').click(function(e) {
    e.preventDefault();
    $(this).nextAll().toggle();
  });
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>

<script>
  var currentLng,currentLat;
  var polyline;//折线对象
  var realDistance=0;
  var lastDistance=0;
  var polylines=new Array();//多条折线
  var markers=new Array();
  var idForEdit=0;
  var points=new Array();//创建点的数组
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  map.enableScrollWheelZoom();//允许放大缩放
  map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海
  var local = new BMap.LocalSearch(map, {
    renderOptions:{map: map}
  });//用于搜索
  function localSearch(){
    var localSearch=$("#localSearch").val();
    local.search(localSearch);
  }
  $(document).ready(function(){
    /*添加比例尺*/
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    map.addControl(top_left_control);
    map.addControl(top_left_navigation);
    changePackage()
  })
  /*添加marker*/
  function addMarker(e){
    currentLng= e.point.lng;
    currentLat= e.point.lat;
    $("#lng").html(Math.round(e.point.lng*100)/100)
    $("#lat").html(Math.round(e.point.lat*100)/100)
    var point = new BMap.Point(e.point.lng, e.point.lat);
    points.push(point)
    var marker = new BMap.Marker(point,{icon: new BMap.Icon("images/fancy-marker3.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)})});// 创建标注
    markers.push(marker)
    map.addOverlay(marker);             // 将标注添加到地图中
    marker.disableDragging();           // 不可拖拽
    var info=document.getElementById("info");
    var geoc = new BMap.Geocoder();
    geoc.getLocation(point, function(rs){
      var addComp = rs.addressComponents;
      $("#info").html(addComp.district + addComp.street +addComp.streetNumber);
     /* if(!confirm('是否增加定位?'))
        return true;*/
      drawLine()
    });
  }
  function remindClick(){
    alert("请点击开始绘制")
  }
  /*添加电子围栏*/
  function addeLine(){
    $("#btn_type").unbind("click")
    var coords=pointsTojson(points);
    var startCoords=$("#startCoord").html();
    var endCoords=$("#endCoord").html();
    var id=idForEdit
    var lineName=$("#lineName").val();
    var company=$("#company").val();
    var direction=$("#direction").val();
    var directionType=$("#directionType").val();
    var packageId=$("#package").val();
    var packageName=$("#package").find("option:selected").text();
    var remark=$("#remark").val();
    var realDistance=$("#realDistance").html();
    if(realDistance==NaN)
    {
      alert("无效的里程数,请重新选择");
      return false;
    }
    var pointList="";
    $(polylines).each(function (index,data) {
      $(data.getPath()).each(function (index1,element) {
        if(index1==0){
          pointList+=element.lng*1000000+","+element.lat*1000000;
        }else{
          pointList+=";"+element.lng*1000000+","+element.lat*1000000;
        }
      })
    })
    /*BMapLib.GeoUtils.getPolylineDistance(polyline);*/
    /* var inputMan=$("#inputMan").val();*/
    if(id==0) {
      $.ajax({
        url: "line/add",
        async :false,
        type: "post",
        data: {pointString:pointList,packageId:packageId,packageName:packageName,startCoord:startCoords,endCoord:endCoords,coords: coords, lineName: lineName, company: company, realDistance: realDistance*1000,direction:direction,directionType:directionType},
        success: function (data) {
          if(data=="duplicated"){
            alert("作业线路名称重复");
            return false
          }else if(data=="NoPower"){
            alert("没有操作权限")
            return false
          }else{
              alert("添加成功")
          }
        }
      })
    }else{
      $.ajax({
        url:"line/edit",
        async :false,
        type:"post",
        data: {pointString:pointList,id:id,packageId:packageId,packageName:packageName,startCoord:startCoords,endCoord:endCoords,coords: coords, lineName: lineName, company: company, realDistance: realDistance*1000,direction:direction,directionType:directionType},
        success:function(data){
          if(data=="duplicated"){
            alert("作业线路名称重复");
            return false
          }else if(data=="NoPower"){
            alert("没有操作权限")
            return false
          }
          location.reload(true);
        }
      })
    }
  }
  /*删除电子围栏*/
  function deleteLine(){
    $("#btn_type").unbind("click")
    $.ajax({
      url:"line/delete",
      type:"post",
      data:{id:idForEdit},
      success:function(data){
        if(data=="NoPower"){
          alert("没有操作权限")
          return false
        }
        location.reload(true);
      }
    })
  }
  setTimeout(function(){
    map.addEventListener("click",remindClick);
    if('${line.id}'!="")
    showLine('${line.id}')
  },1000)
  /*选点*/
  function choosePoint(){
    idForEdit=0;
    map.removeEventListener("click",remindClick)
    map.removeEventListener("click",addMarker)
    //地图点击事件
    map.addEventListener("click",addMarker);
    removeAll()
    points=new Array();
    polylines=new Array();
  }
  /*撤销一次*/
  function undo(){
    //地图点击事件
/*
    map.addEventListener("click",addMarker);
*/
    map.removeOverlay(markers.pop());
    map.removeOverlay(polylines.pop())
    realDistance-=lastDistance;
    if(realDistance<0)
      realDistance=0
    $("#realDistance").html(realDistance)
    points.pop();
  }
  /*完成*/
  function complete(){
    map.removeEventListener("click",addMarker);
    map.removeEventListener("click",remindClick)
    map.addEventListener("click",remindClick)
  }
  /*划线*/
  function drawLine(){
    var distance=0;
    var driving = new BMap.DrivingRoute(map);    //创建驾车实例
    var length=points.length;
    if(length>=2) {
      driving.search(points[length - 2], points[length - 1])
      /*for(var i=0;i<points.length-1;i++) {
      driving.search(points[i], points[i + 1])
    }*/
      driving.setSearchCompleteCallback(function(){
        /* console.log(driving.getResults())*/
      var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
        polyline = new BMap.Polyline(pts);
        distance+=Math.abs(BMapLib.GeoUtils.getPolylineDistance(polyline))
        polylines.push(polyline);
        polyline.addEventListener("click", function(e){
          var point1 = new BMap.Point(e.point.lng, e.point.lat);
          map.panTo(point1)
          map.setZoom(10)
          var target= e.currentTarget;
          polyline=target;
        points= target.getPath();
        $.ajax({
          url:"line/get",
          type: "get",
          data:{id:idForEdit},
          dataType: "json", success:function(data){
            map.addEventListener("click",addMarker);
            points= jsonToPoints(data.coords)
            for(var i =0;i<points.length;i++){
              var point = new BMap.Point(points[i].lng, points[i].lat);
              var marker = new BMap.Marker(point,{icon: new BMap.Icon("images/fancy-marker3.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)})});// 创建标注
              markers.push(marker)
              map.addOverlay(marker);             // 将标注添加到地图中
              marker.disableDragging();           // 不可拖拽
            }
            $("#lineName").val(data.line);
            $("#company").find("option[value="+data.company+"]").attr("selected",true);
            $("#direction").find("option[value=" +data.direction +"]").attr("selected",true);
            $("#directionType").find("option[value=" +data.directionType +"]").attr("selected",true);
            $("#package").find("option[value=" +data.packgeId +"]").attr("selected",true);
            $("#startCoord").html(data.startCoord)
            $("#endCoord").html(data.endCoord);
            $("#realDistance").html(data.realDistance);
            /*$("#inputMan").val(data.inputMan);*/
          }
        })
      })
      map.addOverlay(polyline);
        if(isNaN(distance)){
          undo()
          alert("无效的里程")
          return
        }
        realDistance+= Math.abs(parseInt(distance))
        lastDistance=Math.abs(parseInt(distance))
      $("#realDistance").html(realDistance/1000);
    })

    var geoc = new BMap.Geocoder();
    geoc.getLocation(points[0], function(rs) {
      var addComp = rs.addressComponents;
      $("#startCoord").html(addComp.district + addComp.street + addComp.streetNumber);
    });
      geoc.getLocation(points[points.length - 1], function (rs) {
        var addComp = rs.addressComponents;
        $("#endCoord").html(addComp.district + addComp.street + addComp.streetNumber);
      });
    }
  }

  function drawAllLine(){
    var distance=0;
    var driving = new BMap.DrivingRoute(map);    //创建驾车实例
      for(var i=0;i<points.length-1;i++) {
       driving.search(points[i], points[i + 1])
       }
      driving.setSearchCompleteCallback(function(){
        /* console.log(driving.getResults())*/
        var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
        polyline = new BMap.Polyline(pts);
        polylines.push(polyline);
        polyline.addEventListener("click", function(e){
          var target= e.currentTarget;
          polyline=target;
          points= target.getPath();
          console.log(points)
          map.panTo(points[0])
          $.ajax({
            url:"line/get",
            type: "get",
            data:{id:idForEdit},
            dataType: "json", success:function(data){
              map.addEventListener("click",addMarker);
              points= jsonToPoints(data.coords)
              for(var i =0;i<points.length;i++){
                var point = new BMap.Point(points[i].lng, points[i].lat);
                var marker = new BMap.Marker(point,{icon: new BMap.Icon("images/fancy-marker3.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)})});// 创建标注
                markers.push(marker)
                map.addOverlay(marker);             // 将标注添加到地图中
                marker.disableDragging();           // 不可拖拽
              }
              $("#lineName").val(data.line);
              $("#company").find("option[value="+data.company+"]").attr("selected",true);
              $("#direction").find("option[value=" +data.direction +"]").attr("selected",true);
              $("#directionType").find("option[value=" +data.directionType +"]").attr("selected",true);
              $("#package").find("option[value=" +data.packgeId +"]").attr("selected",true);
              $("#startCoord").html(data.startCoord)
              $("#endCoord").html(data.endCoord);
              $("#realDistance").html(data.realDistance/1000);
              /*$("#inputMan").val(data.inputMan);*/
            }
          })
        })
        map.addOverlay(polyline);
        if(isNaN(distance)){
          undo()
          alert("无效的里程")
          return
        }
      })

      var geoc = new BMap.Geocoder();
      geoc.getLocation(points[0], function(rs) {
        var addComp = rs.addressComponents;
        $("#startCoord").html(addComp.district + addComp.street + addComp.streetNumber);
      });
      geoc.getLocation(points[points.length - 1], function (rs) {
        var addComp = rs.addressComponents;
        $("#endCoord").html(addComp.district + addComp.street + addComp.streetNumber);
      });
  }
  /*点数组转json*/
  function pointsTojson(points){
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
   * 添加点击事件
   * */
  function addClick(type){
    if(polylines.length<1){
      alert("请先绘制路线")
      return false
    }
    var lineName=$("#lineName").val();
    if(lineName=="")
    {
      alert("路线名不能为空");
      return false;
    }
    $("#showModal").click()
    if(type==0)
      $("#btn_type").click(addeLine);
    else if(type==1)
      $("#btn_type").click(deleteLine);
  }

  /*方向*/
  function changeDirection(){
    var dType=$("#directionType").val();
   if(dType=="内外圈")
            $("#direction").html(" <option value='内圈'>内圈</option><option value='外圈'>外圈</option>");
    else if(dType=="南北侧")
        $("#direction").html(" <option value='南侧'>南侧</option><option value='北侧'>北侧</option>");
    else
        $("#direction").html(" <option value='东侧'>东侧</option><option value='西侧'>西侧</option>");
  }
  /**
   * 改变所属包件
  /**/
  function changePackage(){
    var company=$("#company").val();
    var gaojia=document.getElementsByClassName("gaojia")
    var chengji=document.getElementsByClassName("chengji")
    if(company=="上海成基市政建设发展有限公司"){
      $.each(gaojia,function (index,element) {
        element.style.display="none"
      })
      $.each(chengji,function (index,element) {
        element.style.display=""
      })
    }else{
      $.each(chengji,function (index,element) {
        element.style.display="none"
      })
      $.each(gaojia,function (index,element) {
        element.style.display=""
      })
    }
  }
  function panTo(coords){
    map.panTo(coords[0]);
  }
  function showLine(id){
    map.removeEventListener("click",addMarker)
    map.removeEventListener("click", remindClick);
    idForEdit=id
    map.clearOverlays();
    $.ajax({
      url:"line/get",
      type:"get",
      data:{id:id},
      dataType:"json",
      success:function(data){
        idForEdit=data.id;
        var point=jsonToPoints(data.coords)
        panTo(data.coords)
        for(var i=0;i<point.length;i++){
          var p=new BMap.Point(point[i].lng,point[i].lat);
          points.push(p);
        }
        drawAllLine()
        $("#lineName").val(data.line);
        $("#company").find("option[value="+data.company+"]").attr("selected",true);
        if(data.directionType=="内外圈")
          $("#direction").html(" <option value='内圈'>内圈</option><option value='外圈'>外圈</option>");
        else if(data.directionType=="南北侧")
          $("#direction").html(" <option value='南侧'>南侧</option><option value='北侧'>北侧</option>");
        else
          $("#direction").html(" <option value='东侧'>东侧</option><option value='西侧'>西侧</option>");
        $("#direction").find("option[value="+data.direction+"]").attr("selected",true);
        $("#directionType").find("option[value="+data.directionType+"]").attr("selected",true);
        $("#package").find("option[value="+data.packgeId+"]").attr("selected",true);
        $("#startCoord").html(data.startCoord)
        $("#endCoord").html(data.endCoord);
        $("#realDistance").html(data.realDistance/1000);
        /*$("#inputMan").val(data.inputMan);*/
      }
    })
    points=new Array();
  }
  function removeAll(){
    map.clearOverlays()
    $("#lineName").val("");
    $("#startCoord").html("")
    $("#endCoord").html("");
    $("#realDistance").html("");
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
