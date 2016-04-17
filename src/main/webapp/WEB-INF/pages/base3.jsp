<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/9
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>RFID监测点管理</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Add custom CSS here -->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
  <link rel="stylesheet" href="css/panel-dropdown.css"/>
  <script type="text/javascript" src="js/BMaplib.js"></script>

  <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>

  <!--  <script type="text/javascript" src="js/exporting.js"></script>-->



  <style>
    #container{width: 57%;
      height: 600px;
      float: left;
      margin-left: 5px;
      margin-right: 5px;}
    #index { width:100%; height:100%; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
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
      top: 13px;
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
</head>
<body>
<div id="wrapper">
<jsp:include page="public.jsp" flush="true">
  <jsp:param name="pageFather" value="base"></jsp:param>
  <jsp:param name="pageName" value="base3"></jsp:param>
</jsp:include>
<div id="page-wrapper">

  <div class="row">
    <div class="col-lg-12">
      <ol class="breadcrumb">
        <li><a href="index">基础数据</a></li>
        <li><a href="RFID">RFID监测点管理</a></li>
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
                  <c:forEach items="${cjList}" var="line">
                    <li class="dropdown dropdown3">
                      <a href="" onclick="getListByRoad('${line.line}')" data-toggle="dropdown">${line.line}</a>
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
                    <c:forEach items="${gjygList}" var="line">
                      <li class="dropdown dropdown3">
                        <a href="" onclick="getListByRoad('${line.line}')" data-toggle="dropdown">${line.line}</a>
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

      <div id="in-mid" style="float:left"><!--<img src="images/mid2.png" width="100%"/>-->
        <input class="bt" type="button" onclick="query()"  style=" position: absolute;top: 15px;left: 30%; width:9%;
                     background:url(images/search.png); background-size:100% 100%" />


        <div style="width:4%;height: 20px; position: absolute; top: 15px; left: 2%;">
          <img src="images/search_icon.png" style="width:100%" />
        </div>


        <div id="container" style="width:99%;top:52px"></div>



        <input type="text" id="search"/>
      </div>


      <div id="in-right" style="position: relative; float: left; width: 23%; left:0; top: 1%;">
        <img src="images/in-right2.png" width="100%"/>
        <div  class="p" style=" top: 10%; left:38%;"><p id="info"></p></div>

        <input id="serialNumber" class="r_text" id="" type="text" style="top: 16.5%;left: 40%; width:50%" placeholder="序列号"/>
        <select style="position: absolute;top:23%;width: 40%; left:40%;" id="roadId">
          <c:forEach items="${lineList}" var="line">
            <option value="${line.id}">${line.line}</option>
          </c:forEach>
        </select>
        <select style="position: absolute;top: 30%;width: 40%; left: 40%;" id="zhadao">
          <option value="入口">入口</option>
          <option value="出口">出口</option>
        </select>

        <select style="position: absolute;top: 37%;width: 40%; left:40%;" id="direction">
          <option value="内圈">内圈</option>
          <option value="外圈">外圈</option>
          <option value="东侧">东侧</option>
          <option value="西侧">西侧</option>
          <option value="南侧">南侧</option>
          <option value="北侧">北侧</option>
        </select>

        <input class="r_text" id="equipNum" type="text" style="top: 42.5%;left: 40%; width:50%"/>
        <input class="r_text1" id="installPos1" type="text" style="top: 49.5%;left: 48%; width:42%"/>
        <input class="r_text1" id="installPos2" type="text" style="top: 56%;left:48%; width:42%"/>

        <input class="bt" onclick="addClick(0)" data-toggle="modal" data-target="#success" type="button"  style=" top:66%;left: 18%;
                      background:url(images/add.png); background-size:100% 100%" />
        <input class="bt" onclick="addClick(1)" type="button"   data-toggle="modal" data-target="#success" style=" top: 66%;left:63%;
                      background:url(images/delete.png); background-size:100% 100%" />
      </div>

    </div><!--/.index-->


  </div><!-- /.row -->

</div><!-- /#page-wrapper -->
</div>
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
</body>
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script>
  $(function(){ $(".xuanfu3").hide(); //默认隐藏
    $("#cute").on("click",function(){ $(".xuanfu3").toggle();//显示隐藏切换
    }) })
  $('a[data-toggle="dropdown"]').click(function() {
    $(this).nextAll().toggle();
  });
  $(function(){
    $("#base").dropdown('toggle');
  });
  var currentLng,currentLat;
  var marker;
  var markerMap=new Map();
  var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
  map.enableScrollWheelZoom();//允许放大缩放

  map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海
  //地图点击事件 显示RFID添加div
  map.addEventListener("click", function(e){
    currentLng= e.point.lng;
    currentLat= e.point.lat;
    var info=document.getElementById("info");
    info.innerHTML=("("+e.point.lng+","+ e.point.lat+")");
   /* var obj=document.getElementById("editArea");
    obj.style.display="";*/
    if(e.overlay==null) {
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
          type: "post",
          data: {id: id},
          dataType: "json",
          success: function (data) {
            $("#roadId").find("option[value="+data.roadId+"]").attr("selected",true);
            $("#direction").find("option[value="+data.direction+"]").attr("selected",true);
            $("#zhadao").find("option[value="+data.zhadao+"]").attr("selected",true);
            $("#equipNum").val(data.equipNum);
            $("#serialNumber").val(data.serialNumber);
            $("#installPos1").val(data.installPos1);
            $("#installPos2").val(data.installPos1);
          }
        })
      }
    }
  });
/*
* 显示已存在的RFID点
* */
  $(document).ready(function(){
    /*添加比例尺*/
    map.addControl(new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT}));
    $.ajax({
      url:"RFID/list",
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
/*
* 通过序列号查询
* */
  function query(){
    var searchCondition=$("#search").val();
    var markers=map.getOverlays();
    for(var m in markers){
      if(markers[m].getTitle()==searchCondition){

          map.panTo(markers[m].getPosition());
        return false;
      }
    }
  }
  /*
   * 添加/修改RFID点
   * */
  function addRFID(){
    var equipNum=$("#equipNum").val();
    var lng=currentLng;
    var lat=currentLat;
    var serialNumber=$("#serialNumber").val();
    var roadId=$("#roadId").val();
    var zhadao=$("#zhadao").val();
    var direction=$("#direction").val();
    var installPos1=$("#installPos1").val();
    var installPos2=$("#installPos2").val();
    var id =marker.getLabel();
    if(id==undefined){
    $.ajax({
      url:"RFID/add",
      type:"post",
      data:{equipNum:equipNum,lng:lng,lat:lat,serialNumber:serialNumber,roadId:roadId,zhadao:zhadao,direction:direction,installPos1:installPos1,installPos2:installPos2},
      success:function(data){
        location.reload(true);
      }
    })
    }else{
      $.ajax({
        url:"RFID/edit",
        type:"post",
        data:{id:id,equipNum:equipNum,lng:lng,lat:lat,serialNumber:serialNumber,roadId:roadId,zhadao:zhadao,direction:direction,installPos1:installPos1,installPos2:installPos2},
        success:function(data){
          location.reload(true);
        }
      })
    }

  }
  /*
   * 删除RFID点
   * */
  function deleteRFID(){
    var id=marker.getLabel();
    deletemarker()
    $.ajax({
      url:"RFID/delete",
      type:"post",
      data:{id:id},
      success:function(data){

        location.reload(true);
      }
    })
  }
  /*
   * 添加标记
   * */
  function addMarker(point,serialNumber,road,company,id){
    var opts = {
      width : 100,     // 信息窗口宽度
      height: 100,     // 信息窗口高度
      title : "RFID信息" , // 信息窗口标题
      enableMessage:true,//设置允许信息窗发送短息
      message:""
    }
    var infoWindow = new BMap.InfoWindow("<p>序列号:"+serialNumber+"<br/>路段:"+road+"<br/>所属公司:"+company+"</p>", opts);  // 创建信息窗口对象


     /*var pt = new BMap.Point(116.417, 39.909);
     var myIcon = new BMap.Icon("http://developer.baidu.com/map/jsdemo/img/fox.gif", new BMap.Size(300,157));
     var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注*/

    marker = new BMap.Marker(point);// 创建标注
    /*marker.setLabel(id);*/
    marker.setTitle(serialNumber)
    marker.addEventListener("mouseover",function(e){
      map.openInfoWindow(infoWindow,point);
    });
    marker.addEventListener("mouseout",function(e){
      map.closeInfoWindow(infoWindow,point);
    });
    markerMap.put(marker,id);
    map.addOverlay(marker);             // 将标注添加到地图中
    marker.disableDragging();           // 不可拖拽
  }
  /*
  显示某条路上的RFID*/
  function getListByRoad(road){
    $.ajax({
      url:"RFID/getListByRoad",
      type:"post",
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
   if(type==0)
       $("#btn_type").click(addRFID);
    else if(type==1)
      $("#btn_type").click(deleteRFID);
  }
  /*
   * 清空输入
   * */
  function removeAll(){
    $("#equipNum").val("");
    $("#serialNumber").val("");
    $("#installPos1").val("");
    $("#installPos2").val("");
  }
  /*js map*/
  function Map(){
    this.container = new Object();
  }


  Map.prototype.put = function(key, value){
    this.container[key] = value;
  }


  Map.prototype.get = function(key){
    return this.container[key];
  }


  Map.prototype.keySet = function() {
    var keyset = new Array();
    var count = 0;
    for (var key in this.container) {
// 跳过object的extend函数
      if (key == 'extend') {
        continue;
      }
      keyset[count] = key;
      count++;
    }
    return keyset;
  }


  Map.prototype.size = function() {
    var count = 0;
    for (var key in this.container) {
// 跳过object的extend函数
      if (key == 'extend'){
        continue;
      }
      count++;
    }
    return count;
  }


  Map.prototype.remove = function(key) {
    delete this.container[key];
  }


  Map.prototype.toString = function(){
    var str = "";
    for (var i = 0, keys = this.keySet(), len = keys.length; i < len; i++) {
      str = str + keys[i] + "=" + this.container[keys[i]] + ";\n";
    }
    return str;
  }
</script>
</html>
