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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>上海市快速路养护监管系统</title>

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
                <a href="#" data-toggle="droplist">按照区域查</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海成基公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">

                      <c:forEach items="${cjList}" var="item">
                        <li class="dropdown dropdown3">
                          <a href="#" onclick="showLine('${item.id}','${item.lng}',${item.lat})" data-toggle="droplist">${item.line}</a>
                          <div class="arrow-section arrow-section3">
                          </div>
                        </li>
                      </c:forEach>
                    </ul>
                  </li>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                     <c:forEach items="${gjyhList}" var="item">
                       <li class="dropdown dropdown3">
                         <a href="#" onclick="showLine('${item.id}','${item.lng}',${item.lat})" data-toggle="droplist">${item.line}</a>
                         <div class="arrow-section arrow-section3">
                         </div>
                       </li>
                     </c:forEach>
                    </ul>
                  </li>
                </ul>
              </li><!--dropdown1-->



              <li class="dropdown dropdown1">
                <a href="#" data-toggle="droplist">按照车辆查看</a>
                <div class="arrow-section arrow-section1">
                  <div class="arrow-down arrow-down1"></div>
                </div>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海成基公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">养护车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${cyList}" var="item">
                            <li>
                              <a href="#">${item.vehicleLicence}</a>
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
                              <a href="#">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">巡查车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${cxList}" var="item">
                            <li>
                              <a href="#">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                    </ul>
                  </li>
                </ul>
                <ul class="dropdown-menu panel-menu">
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">养护车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${gyList}" var="item">
                            <li>
                              <a href="#">${item.vehicleLicence}</a>
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
                              <a href="#">${item.vehicleLicence}</a>
                            </li>
                          </c:forEach>
                        </ul>
                      </li>
                      <li class="dropdown dropdown3">
                        <a href="#" data-toggle="droplist">巡查车</a>
                        <div class="arrow-section arrow-section3">
                          <div class="arrow-down arrow-down3"></div>
                        </div>
                        <ul class="dropdown-menu panel-menu">
                          <c:forEach items="${gxList}" var="item">
                            <li>
                              <a href="#">${item.vehicleLicence}</a>
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

          <div id="container" style=" height: 610px; width:99%"></div>




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
                  <option value="">上海成基公司</option>
                  <option value="">上海高架养护公司</option>
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
  $('a[data-toggle="droplist"]').click(function() {
    $(this).nextAll().toggle();
  });
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>
<script>
  var currentLng,currentLat;
  var polyline;//折线对象
  var linePoints=new Array();
  var myCar;
  var qian,sao,xun;
  var polylines=new Array();//多条折线
  var lineMap=new Map();
  var markers=new Array();
  var idForEdit=0;
  var points=new Array();//创建点的数组
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺

  map.enableScrollWheelZoom();//允许放大缩放
  map.addControl(top_left_control);

  //每两秒车辆位置变化
  var z=1;
  setTimeout(function(){
    console.log(polylines)
    for(i=0;i<polylines.length;i++){
      console.log(polylines[i])
      var v=polylines[i].ia;
      for(var j=0;j< v.length;j++){
        linePoints.push(v[j])
      }
    }
    setInterval(function(){
      panTo(linePoints[1].lng,linePoints[1].lat)
      var ps=new Array()
      ps.push(linePoints[z-1])
      ps.push(linePoints[z])
      var p = new BMap.Polyline(ps,{strokeColor:"red", strokeWeight:2, strokeOpacity:0.5});   //创建折线
      map.addOverlay(p);   //增加折线
      map.removeOverlay(xun)
      xun = new ComplexCustomOverlay(linePoints[z], "images/xun.png");
      map.addOverlay(xun);
      z+=1;
    },"1000");
  },"2000")


 /* map.addEventListener('click',mapClick)*/

  function mapClick(e){
    var point = new BMap.Point(e.point.lng, e.point.lat);
    console.log(point)
    addVehicle(1,point);
  }
  function addVehicle(vehicle,Point){
    switch(vehicle){
      case 1:
        myCar = new ComplexCustomOverlay(Point, "images/xun.png");
        break
      case 2:
        myCar = new ComplexCustomOverlay(Point, "images/qian.png");
        break
      case 3:
        myCar = new ComplexCustomOverlay(Point, "images/sao.png");
        break
    }
    map.addOverlay(myCar);

  }
  // 复杂的自定义覆盖物
  function ComplexCustomOverlay(point, images){
    this._point = point;
    this._images = images;
  }
  ComplexCustomOverlay.prototype = new BMap.Overlay();
  ComplexCustomOverlay.prototype.initialize = function(map){
    this._map = map;
    var div = this._div = document.createElement("div");
    div.style.position = "absolute";
    div.style.border="0px"
    /*div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);*/
    /* div.style.backgroundColor = "#EE5D5B";
     div.style.border = "1px solid #BC3B3A";
     div.style.color = "white";
     div.style.height = "18px";
     div.style.padding = "2px";
     div.style.lineHeight = "18px";
     div.style.whiteSpace = "nowrap";
     div.style.MozUserSelect = "none";
     div.style.fontSize = "12px"*/
   /* var input = this._input = document.createElement("input");
    input.type="button";
    input.class="bt";
    input.style.background="url("+this._images+")";
    input.style.backgroundSize="100% 100%";
    input.style.width="32px";
    input.style.height="16px";
    div.appendChild(input);*/
    var that = this;

    var arrow = this._arrow = document.createElement("div");
    arrow.style.background = "url("+this._images+") no-repeat";
    arrow.style.backgroundSize="100% 100%";
    arrow.style.position = "absolute";
    arrow.style.width = "32px";
    arrow.style.height = "16px";
    arrow.style.top = "22px";
    arrow.style.left = "10px";
    arrow.style.overflow = "hidden";
    div.appendChild(arrow);
    arrow.onclick=function(){
      location.href="progress2-1"
    }
    /*   div.onmouseover = function(){
     this.style.backgroundColor = "#6BADCA";
     this.style.borderColor = "#0000ff";
     this.getElementsByTagName("span")[0].innerHTML = that._overText;
     arrow.style.backgroundPosition = "0px -20px";
     }

     div.onmouseout = function(){
     this.style.backgroundColor = "#EE5D5B";
     this.style.borderColor = "#BC3B3A";
     this.getElementsByTagName("span")[0].innerHTML = that._text;
     arrow.style.backgroundPosition = "0px 0px";
     }*/

    map.getPanes().labelPane.appendChild(div);

    return div;
  }
  ComplexCustomOverlay.prototype.draw = function(){
    var map = this._map;
    var pixel = map.pointToOverlayPixel(this._point);
    this._div.style.left = pixel.x - parseInt(this._arrow.style.left) + "px";
    this._div.style.top  = pixel.y - 30 + "px";
  }
 /* xun = new ComplexCustomOverlay(new BMap.Point(121.503231,31.204382), "images/xun.png");
  map.addOverlay(xun);
  qian = new ComplexCustomOverlay(new BMap.Point(121.529964,39.917657), "images/qian.png");
  map.addOverlay(qian);
  sao = new ComplexCustomOverlay(new BMap.Point(121.478797,39.917657), "images/sao.png");
  map.addOverlay(sao);*/
  function getLine(pos){
    console.log(pos)
    var driving = new BMap.DrivingRoute(map);    //创建驾车实例
    for (var i = 0; i < pos.length - 1; i++) {
      driving.search(pos[i], pos[i + 1])
      /* console.log(driving)*/
    }
    driving.setSearchCompleteCallback(function () {
      /* console.log(driving.getResults())*/
      var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
      polyline = new BMap.Polyline(pts);
      polylines.push(polyline);
    })
  }
  // 初始化地图，设置中心点坐标和地图级别 设置为上海
  $(document).ready(function(){
    $("button.navbar-aside").click(function(){
      if ($("#wrapper").is(".left-wrapper")== true) {
        $(".side-nav").removeClass("left-nav");
        $("#wrapper").removeClass("left-wrapper");
      } else {
        $(".side-nav").addClass("left-nav");
        $("#wrapper").addClass("left-wrapper");
      }
    });

    $.ajax({
      url:"line/get",
      type:"post",
      data:{id:1},
      dataType:"json",
      success:function(data){
        var ps=jsonToPoints(data.coords)
        console.log(ps)
        for(var i=0;i<ps.length;i++){
          var p=new BMap.Point(ps[i].lng,ps[i].lat);
          linePoints.push(p)
        }
        console.log(linePoints)
        getLine(linePoints)
        linePoints=new Array()
      }
    })

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

/*    $("button.navbar-aside").click(function( ){
      if ($("#wrapper").is(".left-wrapper")== true) {
        $(".side-nav").removeClass("left-nav");
        $("#wrapper").removeClass("left-wrapper");
      } else {
        $(".side-nav").addClass("left-nav");
        $("#wrapper").addClass("left-wrapper");
      }
    });*/
  });
  function addArea(){
    var center=pointsTojson(map.getCenter());
    var zoom=map.getZoom();
    $.ajax({
      url:"addArea",
      type:"post",
      data:{center:center,zoom:zoom},
      success:function(data){
        if(data=="fail")
        alert("请先登录")
        else{
          $("#setBtn").click();
        }
        /*
        do nothing
        */
      }
    })
  }


  /*划线*/
  function drawLine() {
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
    for (var i = 0; i < points.length - 1; i++) {
      driving.search(points[i], points[i + 1])
      /* console.log(driving)*/
    }
    driving.setSearchCompleteCallback(function () {
      /* console.log(driving.getResults())*/
      var pts = driving.getResults().getPlan(0).getRoute(0).getPath();    //通过驾车实例，获得一系列点的数组
      polyline = new BMap.Polyline(pts);
      polylines.push(polyline);
      polyline.addEventListener("click", function (e) {
        var target = e.currentTarget;
        polyline = target;
        points = target.getPath();
        $.ajax({
          url: "line/get",
          type: "post",
          data: {id: idForEdit},
          dataType: "json",
          success: function (data) {
            map.removeEventListener("click", addMarker)
            map.addEventListener("click", addMarker);
            points = jsonToPoints(data.coords)
            for (var i = 0; i < points.length; i++) {
              var point = new BMap.Point(points[i].lng, points[i].lat);
              var marker = new BMap.Marker(point);// 创建标注
              markers.push(marker)
              map.addOverlay(marker);             // 将标注添加到地图中
              marker.disableDragging();           // 不可拖拽
            }
          }
        })
      })
      map.addOverlay(polyline);
    })
  }
  /**/
  function panTo(lng,lat){
    var point=new BMap.Point(lng, lat);
    map.panTo(point);
  }
  function showLine(id,lng,lat){
    map.clearOverlays();
    panTo(lng,lat)
    $.ajax({
      url:"line/get",
      type:"post",
      data:{id:id},
      dataType:"json",
      success:function(data){
        idForEdit=data.id;
        var point=jsonToPoints(data.coords)
        for(var i=0;i<point.length;i++){
          var p=new BMap.Point(point[i].lng,point[i].lat);
          points.push(p);
        }
        drawLine()
        /*$("#inputMan").val(data.inputMan);*/
      }
    })
    points=new Array();
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
