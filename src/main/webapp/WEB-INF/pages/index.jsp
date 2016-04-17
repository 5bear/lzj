<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/14
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>上海市快速路养护监管系统</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="css/panel-dropdown.css"/>

  <script type="text/javascript" src="js/BMaplib.js"></script>
  <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
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
            style:{fontSize:"13px",}
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
              ['有效作业率',   45.0],
              ['无效作业率',       55.0],

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
            style:{fontSize:"13px",}
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
    #container{width: 55%;
      height: 600px;
      float: left;
      margin-left: 5px;
      margin-right: 5px;}

    #index { width:100%; height:100%; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:50%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-right { width:24%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #index-checkbox
    {
      position:absolute;
      top: 620px;
      left: 200px;
    }
    #_select
    {
      position: absolute;
      top: 8%;
      left: 10%;
      width: 80%;
      height:4%;
    }

    .progressbar_1{

      background-color:rgb(255,255,255);
      height:3%;
      border:2px solid rgb(179,179,179);
      position:absolute;top: 23%; left: 9%; width: 47%;


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
    <jsp:param name="pageName" value="index"></jsp:param>
    <jsp:param name="pageFather" value="index"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i>首页</a></li>
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
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">中环路</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">中环路立交</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">上中路隧道</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">军工路隧道交</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">外滩隧道</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>
                    </ul>
                  </li>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="dropdown">上海高架养护公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">内环高架路路</a>
                        <div class="arrow-section arrow-section3">
                        </div>
                      </li>

                    </ul>
                  </li>
                </ul>
              </li><!--dropdown1-->



              <li class="dropdown dropdown1">
                <a href="#" data-toggle="dropdown">按照车辆查看</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="dropdown">上海高架养护公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">清扫车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <li>
                            <a href="#">沪BD4802</a>
                          </li>
                          <li><a href="#">沪BD4802</a></li>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="dropdown">牵引车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <li>
                            <a href="#">沪BD4802</a>
                          </li>
                          <li><a href="#">沪BD4802</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>

                </ul>
              </li><!--dropdown1-->



            </div>
          </div>
        </div><!--in-left-->

        <!-- <div id="in-mid">--><!--<img src="images/map1.png" width="100%"/>-->
        <!-- <div id="container" style="height: 601px; width: 638px; top: 123px;left:447px; float:left">-->
        <div id="container"></div>



        <form id="index-checkbox">
          <input type="checkbox" name="speed" id="speed" />
          显示车速
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
          <input type="checkbox" name="chepai" id="chepai"/>
          显示车牌
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
          <input type="checkbox" name="path" id="path" />
          显示路径
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp
        </form>


        <div id="in-right"><img src="images/in-right1.png" width="100%"/>
          <select id="_select">
            <option value="SH">上海</option>
          </select>
          <div id="container2" style="width:49%;height:31%;position: absolute;top: 35%;left:1%"></div>
          <div id="container1" style="width:47%;height:31%;position: absolute;top: 35%;left:52%"></div>
          <div class="progressbar_1" >
            <div class="bar" style="width: 50%;"></div>
          </div>
          <p style="font-size:10px; color:rgb(2,96,142);position: absolute;top: 23%;left: 61%;">50% &nbsp;&nbsp;&nbsp;247km</p>
        </div>

      </div>


    </div><!-- /.row -->

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script>

  $('a[data-toggle="dropdown"]').click(function() {
    $(this).nextAll().toggle();
  });
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>
<script>
  var currentLng,currentLat;
  var polyline;//折线对象
  var marker;
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
    var remark=$("#remark").val();
    console.log(BMapLib.GeoUtils.getPolylineDistance(polyline))
    var realDistance=BMapLib.GeoUtils.getPolylineDistance(polyline);
    /* var inputMan=$("#inputMan").val();*/
    if(id==0) {
      console.log(id)
      $.ajax({
        url: "line/add",
        async :false,
        type: "post",
        data: {lng:polyline.getPath()[0].lng,lat:polyline.getPath()[0].lat,startCoord:startCoords,endCoord:endCoords,coords: coords, lineName: lineName, company: company, realDistance: realDistance,direction:direction,directionType:directionType},
        success: function (data) {
          location.reload(true);
        }
      })
    }else{
      $.ajax({
        url:"line/edit",
        async :false,
        type:"post",
        data:{id:id,/*startCoord:startCoords,endCoord:endCoords,coords: coords,*/ lineName: lineName, company: company, realDistance: realDistance,direction:direction,directionType:directionType},
        success:function(data){
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
      $("#realDistance").html(BMapLib.GeoUtils.getPolylineDistance(polyline));
    })
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
</script>
</body>
</html>