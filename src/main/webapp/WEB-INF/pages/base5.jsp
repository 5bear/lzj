<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/13
  Time: 17:37
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

  <title>电子围栏管理</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
<%--  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>--%>
  <script type="text/javascript" src="js/highcharts.js"></script>
  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->







  <style>
    #index { width:100%; height:100%; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
    #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-mid { width:57%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
    #in-right { width:23.5%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;}
    .bt1{
      height: 23px;
      width: 5%;
      position: absolute;
      border:0;
      background-size:100% 100%;
    }

    .bt{border:0;}
    .p
    {
      position: absolute;
      font-family:
      font-size:15px;
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
    <jsp:param name="pageFather" value="base"></jsp:param>
    <jsp:param name="pageName" value="base5"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="base5.html">基础数据</a></li>
          <li><a href="base5.html">电子围栏管理</a></li>
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
                <a href="#" data-toggle="dropdown">按照名称查看</a>
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
                      <c:forEach items="${cjList}" var="eFence">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="panTo('${eFence.lng}','${eFence.lat}')" data-toggle="dropdown">${eFence.eFence}</a>
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
                      <c:forEach items="${gjyhList}" var="eFence">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="panTo('${eFence.lng}','${eFence.lat}')" data-toggle="dropdown">${eFence.eFence}</a>
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
                     url(images/begin.png); background-size: 100% 100% " />
          <input class="bt1" type="button" id="reset" style="top: 2%;left: 15%;width:11%; background:  url(images/reset.png);background-size: 100% 100% " />
          <input class="bt1" type="button" id="chexiao" value="撤销全部"style="width:11%;top: 2%;left: 28%; background-color: #00608B;color: white; font-size: 90%; padding: 2px 8px;"/>

          <input class="bt1" type="button" id="complete" style="top: 2%;left: 41%; width:9%;background:url(images/complete.png);  background-size: 100% 100% " />


          <div id="container" style="width:99%;top:52px"></div>

        </div><!--in-mid-->


        <div id="in-right" style="position: relative; float: left; width: 23%; left:0; top: 1%;">
          <img src="images/in-right3.png" width="100%"/>
          <div style="position:absolute;top:0;width:100%">
            <img src="images/dianziweilan.png" width="100%"/>
          </div>
          <div  class="p" style=" top: 10%; left: 38%;"><p id="info"></p></div>

          <!-- <input type="text" style="position:absolute;top: 14%; left: 50%; width:40%;height:3.5%"/>-->
          <input type="text" style="position:absolute;top: 19%; left:40%; width:50%;height:3.5%" id="eFence"/>

          <select style="position: absolute;top:23%;width: 50%; left:40%;" id="company">
            <option value="上海成基公司">上海成基公司</option>
            <option value="上海高架养护公司">上海高架养护公司</option>
          </select>
          <div  class="p" style=" top: 28%; left:40%;" id="inputMan"><p>XXX</p></div>
          <div  class="p" style=" top: 32.5%; left:40%;" id="vehicles"><p>沪A5654</p></div>
          <input class="bt1" data-toggle="modal" data-target="#success" type="button"  style=" top:42%;left: 18%;width:24%;
                      background:url(images/add.png); background-size:100% 100%" onclick="addClick(0)"/>
          <input class="bt1" type="button"   data-toggle="modal" data-target="#success" style=" top: 42%;left:60%;width:24%;
                      background:url(images/delete.png); background-size:100% 100%" onclick="addClick(1)" />

        </div><!--in-right-->

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

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script>

  $('a[data-toggle="dropdown"]').click(function() {
    $(this).nextAll().toggle();
  });
</script>
<script>
  $(function(){
    $("#base").dropdown('toggle');
  });
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>
<script type="text/javascript">
  var currentLng,currentLat;
  var polygon;//折线对象
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
    info.innerHTML=(":("+e.point.lng+","+ e.point.lat+")");
    var point = new BMap.Point(e.point.lng, e.point.lat);
    map.panTo(point)
    marker = new BMap.Marker(point);// 创建标注
    map.addOverlay(marker);             // 将标注添加到地图中
    marker.disableDragging();           // 不可拖拽
  });
  /*
   * 显示已存在的电子围栏
   * */
  $(document).ready(function(){
    /*添加比例尺*/
    map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));
    $.ajax({
      url:"/eFence/list",
      type:"post",
      data:{},
      dataType:"json",
      success:function(data){
        $(data).each(function(index){
          points=eval(data[index].coords);
          drawLine();
        })
        points=new Array();//清空
      }
    })
  })
  /*添加电子围栏*/
  function addeFence(){
    var coords=pointsTojson(points);
    var id=0;
    $.ajax({
      url:"eFence/getIdByCoords",
      type:"post",
      async :false,
      data:{coords:coords},
      success:function(data){
        if(data!="error") {
          id = data;
          console.log(id)
        }
      }
    })
    var eFence=$("#eFence").val();
    var company=$("#company").val();
    var inputMan=$("#inputMan").val();
    if(id==0) {
      $.ajax({
        url: "eFence/add",
        type: "post",
        async :false,
        data: {lng:points[0].lng,lat:points[0].lat,coords: coords, eFenceName: eFence, company: company/*, inputMan: inputMan*/},
        success: function (data) {
          location.reload(true);
        }
      })
      console.log("add")
    }else{
      $.ajax({
        url:"eFence/edit",
        type:"post",
        async :false,
        data:{id:id,lng:points[0].lng,lat:points[0].lat,coords:coords,eFenceName:eFence,company:company/*,inputMan:inputMan*/},
        success:function(data){
          location.reload(true);
        }
      })
    }
  }
  /*删除电子围栏*/
  function deleteFence(){
    var coords=pointsTojson(polygon.ro);
    $.ajax({
      url:"eFence/deleteByCoords",
      type:"post",
      data:{coords:coords},
      dataType:"json",
      success:function(data){
        location.reload(true);
      }
    })
  }
  /*选点*/
  function choosePoint(){
    //地图点击事件,选择点
    map.addEventListener("click", function(e){
      var point=new BMap.Point(e.point.lng, e.point.lat);
      points.push(point)
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
    polygon = new BMap.Polygon(points, {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});   //创建折线
    polygon.disableMassClear();
    polygon.addEventListener("click",function(e){
      var target= e.target;
      polygon=target;
      points=target.ro;
      var coords=pointsTojson(target.ro);
      $.ajax({
        url:"eFence/getByCoords",
        type:"post",
        data:{coords:coords},
        dataType:"json",
        success:function(data){
          $("#eFence").val(data.eFence);
          $("#company").find("option[value="+data.company+"]").attr("selected",true);
          $("#inputMan").val(data.inputMan);
        }
      })
      console.log(target.ia)//得到线的对象
    })
    map.addEventListener("click", function(e){
      var point=new BMap.Point(e.point.lng, e.point.lat);
      /* if(BMapLib.GeoUtils.isPointInPolygon(point, polygon))
       console.log(BMapLib.GeoUtils.getPolygonArea(polygon));
       else
       console.log("我不在范围内")*/
    })
    map.clearOverlays();
    map.addOverlay(polygon);   //增加折线
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
      $("#btn_type").click(addeFence);
    else if(type==1)
      $("#btn_type").click(deleteFence);
  }
  /**/
  function panTo(lng,lat){
    var point=new BMap.Point(lng, lat);
    map.panTo(point);
  }
</script>
</body>
</html>
