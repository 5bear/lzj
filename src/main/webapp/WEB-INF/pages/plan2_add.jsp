<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/13
  Time: 21:59
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

  <title>作业路线管理</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <script type="text/javascript" src="js/BMaplib.js"></script>
  <script type="text/javascript" src="js/highcharts.js"></script>
  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->



  <style>
    #index { width:100%; height:100%; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:57%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-right { width:23.5%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent; position:relative}


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
      left: 49%;
      font-family: Microsoft YaHei,STHeiti;
    }

    .p1
    {
      position: absolute;
      left:36%;
      font-family: Microsoft YaHei,STHeiti;
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
    <jsp:param name="pageFather" value="plan"></jsp:param>
    <jsp:param name="pageName" value="plan2"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="plan2-add.html">计划管理</a></li>
          <li><a href="plan2-add.html">作业路线管理</a></li>
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
                <a href="#" data-toggle="dropdown">按照区域查</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="dropdown">上海成基公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <c:forEach items="${cjList}" var="item">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="panTo('${item.lng}','${item.lat}')" data-toggle="dropdown">${item.line}</a>
                          <div class="arrow-section arrow-section3">
                          </div>
                        </li>
                      </c:forEach>
                    </ul>
                  </li>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="dropdown">上海高架养护公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <c:forEach items="${gjyhList}" var="item">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="panTo('${item.lng}','${item.lat}')" data-toggle="dropdown">${item.line}</a>
                          <div class="arrow-section arrow-section3">
                          </div>
                        </li>
                      </c:forEach>

                    </ul>
                  </li>
                </ul>
              </li><!--dropdown1-->







            </div>
          </div>
        </div><!--in-left-->

        <div id="in-mid"><!--<img src="images/mid2.png" width="100%"/>-->
          <input class="bt1" type="button"  id="begin"  style="top: 2%;left: 2%; width:11%; background:
                     url(images/begin.png); background-size: 100% 100% " onclick="choosePoint()" />
          <input class="bt1" type="button" id="reset" onclick="undo()" style="top: 2%;left: 15%;width:11%; background:  url(images/reset.png);background-size: 100% 100% " />
          <input class="bt1" type="button" id="chexiao" onclick="drawLine()" style="top: 2%;left: 28%; background:url(images/complete.png);   background-size: 100% 100% " />
          <a class="bt1" href="line" id="complete" style="top: 2%;left: 41%; width:9%;background:url(images/back.png);  background-size: 100% 100% " ></a>

          <div id="container" style="width:98%;top:52px"></div>

        </div><!--in-mid-->

        <div id="in-right"><img src="images/in.png" width="100%"/>
          <p class="p" style="top:10%" id="info">(X,Y)</p>

          <input type="text" style="position: absolute; top: 22%; left: 25%; width: 52%;" id="lineName">
          <select style="position: absolute; top: 28%;left: 35%; width: 32%;" id="company">
            <option value="上海成基公司">上海成基公司</option>
            <option value="上海高架养护公司">上海高架养护公司</option>

          </select>

          <select style="position: absolute; top: 33.5%;left: 35%; width: 32%;" id="package">
           <c:forEach items="${packages}" var="item">
             <option value="${item.id}">${item.packageName}</option>
           </c:forEach>

          </select>

          <select style="position: absolute; top: 39.5%;left: 25%; width: 40%;" id="direction">
            <option value="北">北</option>
            <option value="南">南</option>
            <option value="东">东</option>
            <option value="西">西</option>
          </select>
          <select style="position: absolute; top: 45.5%; left:33%; width: 32%;" id="directionType">
            <option value="外圈">外圈</option>
            <option value="内圈">内圈</option>
            <option value="南侧">南侧</option>
            <option value="北侧">北侧</option>
            <option value="东侧">东侧</option>
            <option value="西侧">西侧</option>
          </select>
          <p class="p1" style="top:52.5%;" id="startCoord"></p>
          <p class="p1" style="top:58%;" id="endCoord"></p>
          <p class="p1" style="top:65%;" id="realDistance"></p>
          <input class="bt1" data-toggle="modal" data-target="#success" type="button" onclick="addClick(0)"  style=" top:72%;left: 18%;width:24%;
                      background:url(images/add.png); background-size:100% 100%" />
          <input class="bt1" type="button"   data-toggle="modal" data-target="#success" onclick="addClick(1)" style=" top:72%;left:60%;width:24%;
                      background:url(images/delete.png); background-size:100% 100%" />
        </div><!--in-right-->

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
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>

<script>
  var currentLng,currentLat;
  var polyline;//折线对象
  var marker;
  var distance=0;
  var points=new Array();//创建点的数组
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  map.enableScrollWheelZoom();//允许放大缩放

  map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海
  //地图点击事件 显示RFID添加div
  map.addEventListener("click", function(e){
    currentLng= e.point.lng;
    currentLat= e.point.lat;
    var info=document.getElementById("info");
    info.innerHTML=("("+e.point.lng+","+ e.point.lat+")");
    var point = new BMap.Point(e.point.lng, e.point.lat);
    map.panTo(point)
    marker = new BMap.Marker(point);// 创建标注
    map.addOverlay(marker);             // 将标注添加到地图中
    marker.disableDragging();           // 不可拖拽
  });
  /*
   * 显示已存在的线路
   * */
  $(document).ready(function(){
    /*添加比例尺*/
    map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));
    $.ajax({
      url:"/line/list",
      type:"post",
      data:{},
      dataType:"json",
      success:function(data){
        $(data).each(function(index){
          var point=eval(data[index].coords);
          for(var i=0;i<point.length;i++){
            var p=new BMap.Point(point[i].lng,point[i].lat);
            points.push(p);
          }
          drawLine();
          points=new Array();//清空
        })

      }
    })
  })
  /*添加电子围栏*/
  function addeLine(){
    var coords=pointsTojson(points);
    var startCoords=pointsTojson(polyline.getPath()[0]);
    var endCoords=pointsTojson(polyline.getPath()[polyline.getPath().length-1]);
    var id=0;
    $.ajax({
      url:"line/getIdByCoords",
      type:"post",
      async :false,
      data:{startCoord:startCoords,endCoord:endCoords},
      success:function(data){
        console.log(data)
        if(data!="error") {
          id = data;
          console.log(id)
        }
      }
    })
    var lineName=$("#lineName").val();
    var company=$("#company").val();
    var direction=$("#direction").val();
    var directionType=$("#directionType").val();
    var packageId=$("#package").val();
    var packageName=$("#package").find("option:selected").text();
    var remark=$("#remark").val();
    console.log(BMapLib.GeoUtils.getPolylineDistance(polyline))
    var realDistance=parseInt(distance);
    /*BMapLib.GeoUtils.getPolylineDistance(polyline);*/
    /* var inputMan=$("#inputMan").val();*/
    if(id==0) {
      console.log(id)
      $.ajax({
        url: "line/add",
        async :false,
        type: "post",
        data: {packageId:packageId,packageName:packageName,lng:polyline.getPath()[0].lng,lat:polyline.getPath()[0].lat,startCoord:startCoords,endCoord:endCoords,coords: coords, lineName: lineName, company: company, realDistance: realDistance,direction:direction,directionType:directionType},
        success: function (data) {
          if(data=="duplicated")
            alert("作业线路名称重复");
          location.reload(true);
        }
      })
    }else{
      $.ajax({
        url:"line/edit",
        async :false,
        type:"post",
        data:{packageId:packageId,packageName:packageName,id:id,/*startCoord:startCoords,endCoord:endCoords,coords: coords,*/ lineName: lineName, company: company, realDistance: realDistance,direction:direction,directionType:directionType},
        success:function(data){
          if(data=="duplicated")
            alert("作业线路名称重复");
          location.reload(true);
        }
      })
    }
  }
  /*删除电子围栏*/
  function deleteLine(){
    var startCoords=pointsTojson(polyline.getPath()[0]);
    var endCoords=pointsTojson(polyline.getPath()[polyline.getPath().length]);
    $.ajax({
      url:"line/deleteByCoords",
      type:"post",
      data:{startCoord:startCoords,endCoord:endCoords},
      dataType:"json",
      success:function(data){
        location.reload(true);
      }
    })
  }
  /*选点*/
  function choosePoint(){
    //地图点击事件,选择点
    points=new Array();
    map.addEventListener("click", function(e){
      var point=new BMap.Point(e.point.lng, e.point.lat);
      points.push(point)
      $("#startCoord").html("("+points[0].lng+","+points[0].lat+")")
      $("#endCoord").html("("+points[points.length-1].lng+","+points[points.length-1].lat+")")
    });
  }
  /*撤销一次*/
  function undo(){
    map.removeOverlay(marker);
    points.pop();
  }
  /*撤销全部*/
  function undoAll(){
    map.clearOverlays();
    points=new Array();
  }
  /*划线*/
  function drawLine(){
    /*
     var startX=document.getElementById("startX").value;
     var startY=document.getElementById("startY").value;
     var endX=document.getElementById("endX").value;
     var endY=document.getElementById("endY").value;

     var polyline = new BMap.Polyline(points, {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});   //创建折线
     polyline.addEventListener("click",function(e){
     var target= e.target;
     console.log(target.ia)//得到线的对象
     })
     map.addOverlay(polyline);   //增加折线
     */
    /* console.log(points)*/
    var driving = new BMap.DrivingRoute(map);    //创建驾车实例
    for(var i=0;i<points.length-1;i++) {
      driving.search(points[i], points[i + 1])
      /* console.log(driving)*/
    }
    driving.setSearchCompleteCallback(function(){
      /* console.log(driving.getResults())*/
      var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
      polyline = new BMap.Polyline(pts);
      polyline.addEventListener("click",function(e){
        var target= e.currentTarget;
        polyline=target;
        points=target.getPath();
        $.ajax({
          url:"line/getByCoords",
          type:"post",
          data:{startCoord:pointsTojson(e.target.getPath()[0]),endCoord:pointsTojson(e.target.getPath()[e.target.getPath().length-1])},
          dataType:"json",
          success:function(data){
            var startCoord=jsonToPoints("["+data.startCoord+"]")[0]
            var endCoord=jsonToPoints("["+data.endCoord+"]")[0]
            console.log(startCoord)
            $("#lineName").val(data.line);
            $("#company").find("option[value="+data.company+"]").attr("selected",true);
            $("#direction").find("option[value="+data.direction+"]").attr("selected",true);
            $("#directionType").find("option[value="+data.directionType+"]").attr("selected",true);
            $("#startCoord").html("("+startCoord.lng+","+startCoord.lat+")")
            $("#endCoord").html("("+endCoord.lng+","+endCoord.lat+")");
            $("#realDistance").html(data.realDistance+"km");
            /*$("#inputMan").val(data.inputMan);*/
          }
        })
      })
      map.addOverlay(polyline);
      console.log(BMapLib.GeoUtils.getPolylineDistance(polyline))
      distance+=BMapLib.GeoUtils.getPolylineDistance(polyline);
      console.log("d"+distance)
      $("#realDistance").html(parseInt(distance));
    })
    console.log("distance"+distance)
  }
  /*点数组转json*/
  function pointsTojson(points){
    return JSON.stringify(points);
  }
  /*json数据转成点数组*/
  function jsonToPoints(jsonData){
    return eval(jsonData);
  }
  /*
   * 添加点击事件
   * */
  function addClick(type){
    if(type==0)
      $("#btn_type").click(addeLine);
    else if(type==1)
      $("#btn_type").click(deleteLine);
  }
  /**/
  function panTo(lng,lat){
    var point=new BMap.Point(lng, lat);
    map.panTo(point);
  }
  $('a[data-toggle="dropdown"]').click(function() {
    $(this).nextAll().toggle();
  });
</script>

</body>
</html>
