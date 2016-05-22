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
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>实时监控</title>

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
        <jsp:param name="pageFather" value="progress"></jsp:param>
        <jsp:param name="pageName" value="progress2"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="#">进度管理</a></li>
                    <li><a href="#">实时监控</a></li>
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
                                        <a href="#" data-toggle="droplist">上海成基市政建设发展有限公司</a>
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
                                        <a href="#" data-toggle="droplist">上海高架养护管理有限公司</a>
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
                                                            <a href="#" onclick="setVehicle('${item.vehicleLicence}','${item.vehicleType}','${item.OBUId}')">${item.vehicleLicence}</a>
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
                                                            <a href="#" onclick="setVehicle('${item.vehicleLicence}','${item.vehicleType}','${item.OBUId}')">${item.vehicleLicence}</a>
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
                                                            <a href="#" onclick="setVehicle('${item.vehicleLicence}','${item.vehicleType}','${item.OBUId}')">${item.vehicleLicence}</a>
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
                                                            <a href="#" onclick="setVehicle('${item.vehicleLicence}','${item.vehicleType}','${item.OBUId}')">${item.vehicleLicence}</a>
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
                                                            <a href="#" onclick="setVehicle('${item.vehicleLicence}','${item.vehicleType}','${item.OBUId}')">${item.vehicleLicence}</a>
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
                                                            <a href="#" onclick="setVehicle('${item.vehicleLicence}','${item.vehicleType}','${item.OBUId}')">${item.vehicleLicence}</a>
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
<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
<script>
    var currentLng,currentLat;
    var polyline;//折线对象
    var linePoints=new Array();
    var myCar;//汽车图标
    var label;
    var vehicleLicence//牌照
    var vehicle//车辆类型
    var devIDNO//车载设备
    /* var qian,sao,xun;//汽车图标*/
    var polylines=new Array();//多条折线
    var lineMap=new Map();
    var markers=new Array();
    var idForEdit=0;
    var points=new Array();//创建点的数组
    var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺

    map.enableScrollWheelZoom();//允许放大缩放
    map.addControl(top_left_control);
    /*车辆gps显示*/

    function setVehicle(vl,v,d){
        if(d!=devIDNO){
            map.clearOverlays();
            linePoints=new Array()
        }

        vehicleLicence=vl;
        vehicle=v;
        devIDNO=d;
        showVehiclePos(vl,v,d)
    }
    function showVehiclePos(vehicleLicence,vehicle,devIDNO){
        $.ajax({
            url:"getGPS",
            type:"get",
            data:{devIDNO:devIDNO},
            dataType:"json",
            success:function(data){
                if(data.isDriver==0||data.devIDNO==dev)
                    map.removeOverlay(myCar);
                var gpspoint=new BMap.Point(data.lng /1000000,data.lat /1000000)
                addVehicle(vehicleLicence,vehicle,devIDNO,data.lng /1000000,data.lat /1000000,data.speed/10,data.isDriver,data.HDD,gpspoint,data.direction)
            }
        })
    }
    /*5s*/
    setInterval(function(){
        showVehiclePos(vehicleLicence,vehicle,devIDNO);
    },"5000");

    /* map.addEventListener('click',mapClick)*/

    function mapClick(e){
        var point = new BMap.Point(e.point.lng, e.point.lat);
        console.log(point)
        addVehicle(1,point);
    }
    function addVehicle(vehicleLicence,vehicle,devIDNO,lng,lat,speed,isDriver,HDD,point,direction){

        //坐标转换完之后的回调函数
        translateCallback = function (point){
            linePoints.push(point)
            if(linePoints.length>1){
                var ps=new Array()
                ps.push(linePoints[linePoints.length-1])
                ps.push(linePoints[linePoints.length-2])
                var p = new BMap.Polyline(ps,{strokeColor:"blue", strokeWeight:2, strokeOpacity:0.5});   //创建折线
                map.addOverlay(p);   //增加折线
            }

            if(HDD=="00")
                HDD="硬盘不存在"
            else if(HDD=="01")
                HDD="硬盘存在";
            else
                HDD="断电"
            if(isDriver==0)
                isDriver="正在作业"
            else
                isDriver="静止"
            if(vehicle=="巡视车")
                myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/xun.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)})});
            else if(vehicle=="牵引车")
                myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/qian.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)})});
            else
                myCar =  new BMap.Marker(point, {icon: new BMap.Icon("images/sao.png", new BMap.Size(48, 48), {imageOffset: new BMap.Size(0, 0)})});
            var opts = {
                width : 100,     // 信息窗口宽度
                height: 200,     // 信息窗口高度
                title : "车辆信息" , // 信息窗口标题
                enableMessage:true,//设置允许信息窗发送短息
                message:""
            }

            var infoWindow = new BMap.InfoWindow("车辆牌照:" + vehicleLicence +"<br>车辆类型:" + vehicle +"<br>车载设备编号:" + devIDNO +"<br>经度:" + lng + "<br>纬度:" + lat+"<br>速度:" + speed+"km/h"+"<br>方向:" +direction+"<br>车辆状态:"+isDriver+"<br>硬盘状态:"+HDD, opts);  // 创建信息窗口对象
            myCar.addEventListener('click',function(){
                if(vehicle=="巡视车")
                    location.href="progress2-2?id="+devIDNO
                else
                    location.href="progress2-1?id="+devIDNO
            });
            myCar.addEventListener("mouseover",function(e){
                map.openInfoWindow(infoWindow,point);
            });
            myCar.addEventListener("mouseout",function(e){
                map.closeInfoWindow(infoWindow,point);
            });
            map.addOverlay(myCar);
        }

        setTimeout(function(){
            BMap.Convertor.translate(point,0,translateCallback);     //真实经纬度转成百度坐标
        }, 2000);

    }
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
