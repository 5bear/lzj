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
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
  <meta name="description" content="">
  <meta name="author" content="">

  <title>电子围栏管理</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <link rel="stylesheet" href="css/style.css"/>
  <script type="text/javascript" src="js/highcharts.js"></script>
  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->







  <style>
   #index { width:100%; height:100%;min-width:960px; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
     #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
     #in-mid { width:57%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;} 
     #in-right { height:600px; margin:0px; padding:0px; float:left; background-color:transparent;}
   .bt1{
     height: 23px;
       width: 5%;
     position: absolute;
     border:0;
     background-size:100% 100%;
   }
   
   .button{
    border-radius:5px;
    border:none;
    background-color: #00608B;
    color: white;
    font-size: 12px;
    padding: 5px;
     margin-top: 10px;
     margin-left: 7px;}
  
  .bt{border:0;}
   .p
   {
     position: absolute;
     font-size:15px;
   }
  #container{width: 56%;
    height: 566px;
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
          <li><a href="">基础数据</a></li>
          <li><a href="">电子围栏管理</a></li>
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
                <a href="#" data-toggle="droplist">按照名称查看</a>
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
                      <c:forEach items="${cjList}" var="eFence">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="showeFence('${eFence.id}','${eFence.lng}','${eFence.lat}')" data-toggle="dropdown">${eFence.eFence}</a>
                          <div class="arrow-section arrow-section3">
                          </div>
                        </li>
                      </c:forEach>
                    </ul>
                  </li>
                  <li class="dropdown dropdown2">
                    <a href="#" data-toggle="droplist">上海高架养护管理有限公司</a>
                    <div class="arrow-section arrow-section2">
                      <div class="arrow-down arrow-down2"></div>
                    </div>
                    <ul class="dropdown-menu panel-menu">
                      <c:forEach items="${gjyhList}" var="eFence">
                        <li class="dropdown dropdown3">
                          <a href="" onclick="showeFence('${eFence.id}','${eFence.lng}','${eFence.lat}')" data-toggle="dropdown">${eFence.eFence}</a>
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
          <!--<input class="bt1" type="button"  id="begin"  style="top: 2%;left: 2%; width:11%; background:
                 url(images/begin.png); background-size: 100% 100% " />
          <input class="bt1" type="button" id="reset" style="top: 2%;left: 15%;width:11%; background:  url(images/reset.png);background-size: 100% 100% " />
         <input class="bt1" type="button" id="chexiao" value="撤销全部"style="width:11%;top: 2%;left: 28%; background-color: #00608B;color: white; font-size: 90%; padding: 2px 8px;"/>

          <input class="bt1" type="button" id="complete" style="top: 2%;left: 41%; width:9%;background:url(images/complete.png);  background-size: 100% 100% " />
          -->

          <div>
              <img src="images/search_icon.png" style="width: 32px; height: 20px;"/>
              <input type="text" id="search" style="width: 200px;"/>
              <button class="button" style="top:15px;left:30%;width:70px;" onclick="">搜索</button>
          </div>
          <div>
              <button class="button" style="width:70px;" onclick="newDraw()">开始</button>
              <button class="button" style="width:70px;" onclick="choosePoint()">开始绘制</button>
              <button class="button" style="width:70px;" onclick="undo()">撤销一次</button>
              <button class="button" style="width:70px;" onclick="undoAll()">撤销全部</button>
              <button class="button" style="width:70px;" onclick="drawLine()">完成</button>
          </div>

          <div style="position: relative;">
            <div id="container" style="height: 610px; width:99%;"></div>
            <div class="map-search">
              <input type="text" id="localSearch"/>
              <button onclick="localSearch()"></button>
            </div>
          </div>

        </div><!--in-mid-->


        <div id="in-right" style="position: relative; float: left; left:0; top: 0;width:249px">
          <!-- <img src="images/d.png" width="100%"/> -->
          <div class="panel panel-primary panel-right">
            <div class="panel-heading text-center" style="letter-spacing:3px">电子围栏编辑区域</div>
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
                <label>电子围栏信息：</label>
              </div>
              <div class="row">
                <label>名称：</label>
                <input type="text" id="eFence"/>
              </div>
              <div class="row">
                <label>所属公司：</label>
                <select id="company">
                  <option value="上海成基市政建设发展有限公司">上海成基市政建设发展有限公司</option>
                  <option value="上海高架养护管理有限公司">上海高架养护管理有限公司</option>
                </select>
              </div>
              <div class="row">
                <label>录入人：</label>
                <p id="inputMan"></p>
              </div>
              <div class="row">
                <label>相关车辆：</label>
                <p id="vehicles"></p>
              </div>
              <div class="row text-center">
                <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="addClick(0)">增加/修改</button>
                <button class="btn btn-default" data-toggle="modal" data-target="#success" onclick="addClick(1)">删除</button>
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

  <!-- JavaScript -->
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/bootstrap.js"></script>
  <script>

    $('a[data-toggle="droplist"]').click(function(e) {
    e.preventDefault();
    $(this).nextAll().toggle();
  });

  </script>

  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>
  <script type="text/javascript">
    var currentLng,currentLat;
    var polygon=null;//多边形
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
    /*   * 显示已存在的电子围栏
     **/
    $(document).ready(function(){
      /*添加比例尺*/
      var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
      var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
      map.addControl(top_left_control);
      map.addControl(top_left_navigation);
      $.ajax({
        url:"eFence/list",
        type:"post",
        data:{},
        dataType:"json",
        success:function(data){
          $(data).each(function(index){
            points=eval(data[index].coords);
            drawLine();
          })
          polygon=null;
          points=new Array();//清空
        }
      })
    })
    //绘制新的电子围栏
    function newDraw(){
      idForEdit=0;
      for(var index in markers){
        map.removeOverlay(markers[index]);
      }
      removeAll();
      points=new Array();
    }
    /*添加电子围栏*/
    function addeFence(){
      var coords=pointsTojson(points)
      var eFence=$("#eFence").val();
      var company=$("#company").val();
      var inputMan=$("#inputMan").val();
      if(eFence==""){
        alert("电子围栏名不能为空");
        return true;
      }
      if(idForEdit==0) {
        $.ajax({
          url: "eFence/add",
          type: "post",
          async :false,
          data: {lng:points[0].lng,lat:points[0].lat,coords: coords, eFenceName: eFence, company: company/*, inputMan: inputMan*/},
          success: function (data) {
            if(data=="duplicated"){
              alert("电子围栏名称重复");
              return false;
            }
            location.reload(true);
          }
        })
      }else{
        $.ajax({
          url:"eFence/edit",
          type:"post",
          async :false,
          data:{id:idForEdit,lng:points[0].lng,lat:points[0].lat,coords:coords,eFenceName:eFence,company:company/*,inputMan:inputMan*/},
          success:function(data){
            if(data=="duplicated") {
              alert("电子围栏名称重复");
              return true;
            }
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
        success:function(data){
          if(data=="success")
          location.reload(true);
          else {
            alert("无法删除!")
            return true
          }

        }
      })
    }
    /*选点*/
    function choosePoint(){
      map.removeEventListener("click",addMarker)
      /*map.clearOverlays();*/
      //地图点击事件
      map.addEventListener("click", addMarker);
    }
    function addMarker(e){
      currentLng= e.point.lng;
      currentLat= e.point.lat;
      $("#lng").html(Math.round(e.point.lng*100)/100)
      $("#lat").html(Math.round(e.point.lat*100)/100)
      var point = new BMap.Point(e.point.lng, e.point.lat);
      points.push(point)
      var info=document.getElementById("info");
      var geoc = new BMap.Geocoder();
      geoc.getLocation(point, function(rs){
        var addComp = rs.addressComponents;
        $("#info").html(addComp.district + addComp.street +addComp.streetNumber);
        if(!confirm('是否增加定位?'))
          return true;
        var marker = new BMap.Marker(point);// 创建标注
        markers.push(marker)
        map.addOverlay(marker);             // 将标注添加到地图中
        marker.disableDragging();           // 不可拖拽
      });
    }
    /*撤销一次*/
    function undo(){
      points.pop();
      console.log(points)
      map.removeOverlay(markers.pop())
      map.removeOverlay(polygon)
    }
    /*撤销全部*/
    function undoAll(){
      map.removeOverlay(polygon);
      for(var index in markers){
        map.removeOverlay(markers[index]);
      }
      points=new Array();
    }
    /*划线*/
    function drawLine(){
      map.removeEventListener("click",addMarker)
      polygon = new BMap.Polygon(points, {strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});   //创建折线
      polygon.enableMassClear();
      polygon.addEventListener("click",function(e){
        /*if(polygon!=null)
            return false;*/
        var target= e.target;
        if(polygon!=target){
          for(var index in markers){
            map.removeOverlay(markers[index]);
          }
        }else{
          return true
        }
        polygon=target;
        points=target.ro;
        var coords=pointsTojson(target.ro);
        $.ajax({
          url:"eFence/getByCoords",
          type:"post",
          data:{coords:coords},
          dataType:"json",
          success:function(data){
            /* map.removeEventListener("click",addMarker)
             map.addEventListener("click", addMarker);*/
            idForEdit=data.id;
            points=jsonToPoints(data.coords)
            for(var i=0;i<points.length;i++){
              var point = new BMap.Point(points[i].lng, points[i].lat);
              var marker = new BMap.Marker(point);// 创建标注
              markers.push(marker)
              map.addOverlay(marker);             // 将标注添加到地图中
              marker.disableDragging();           // 不可拖拽
            }
            $("#eFence").val(data.eFence);
            $("#company").find("option[value="+data.company+"]").attr("selected",true);
            $("#inputMan").html(data.inputMan);
            $("#vehicles").html(data.vehicles);
          }
        })
        console.log(target.ia)//得到线的对象
      })
      /*map.addEventListener("click", function(e){
       var point=new BMap.Point(e.point.lng, e.point.lat);
       *//* if(BMapLib.GeoUtils.isPointInPolygon(point, polygon))
       console.log(BMapLib.GeoUtils.getPolygonArea(polygon));
       else
       console.log("我不在范围内")*//*
       })*/
      /*map.clearOverlays();*/
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
    function showeFence(id,lng,lat){
      idForEdit=id;
      $.ajax({
        url:"eFence/get",
        type:"post",
        data:{id:id},
        dataType:"json",
        success:function(data){
          $("#eFence").val(data.eFence);
          $("#company").find("option[value="+data.company+"]").attr("selected",true);
          $("#inputMan").html(data.inputMan);
          $("#vehicles").html(data.vehicles);
        }
      })
      panTo(lng,lat)
    }
    function panTo(lng,lat){
      var point=new BMap.Point(lng, lat);
      map.panTo(point);
      map.setZoom(12);
    }
    function removeAll(){
      $("#eFence").val("");
      $("#inputMan").html("");
      $("#vehicles").html("");
    }
  </script>

</div></body>
</html>
