<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/5/9
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>实时监控</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/panel-dropdown.css"/>
    <link rel="stylesheet" href="css/style.css"/>

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>

    <script src="js/bootstrap.js"></script>
    <!--  <script type="text/javascript" src="js/exporting.js"></script>-->




    <style>
        #index { width:100%; height:100%;min-width:960px; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
        #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent; position:relative;}
        #in-mid { width:57%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent; position:relative;}
        #in-right { width:23.5%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent; position:relative;}
        .bt{
            height: 20px;
            width: 50px;
            position: absolute;
            border:0;
        }

        .button{
            position:absolute;
            border-radius:5px;
            border:none;
            background-color: #00608B;
            color: white;
            font-size: 12px;
            padding: 0;}

        .map_bt
        {
            border: 0;
            width: 28px;
            position:absolute;
        }



        #triangle
        {
            width: 0;
            height: 0;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-top: 10px solid rgb(247,147,30);
            position: absolute;
            top:70px;
            left:50px;

        }

        .txt
        {
            position: absolute;
            top: 10px;
            font-size: 9px;
            left: 8px;
            color:#FFF;

        }

        .txt p{margin:2px}

        #container{width: 57%;
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
        <jsp:param name="pageName" value="progress2"></jsp:param>
        <jsp:param name="pageFather" value="progress"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="progress2">进度管理</a></li>
                    <li>实时监控</li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>





            <div id="index">
                <!--<img src="images/index.jpg" width="100%"/>-->
                <div id="in-left" style="width:17%; float:left">

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
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">中环路</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">中环路立交</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">上中路隧道</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">军工路隧道交</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">外滩隧道</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="dropdown dropdown2">
                                        <a href="#" data-toggle="droplist">上海高架养护公司</a>
                                        <div class="arrow-section arrow-section2">
                                            <div class="arrow-down arrow-down2"></div>
                                        </div>
                                        <ul class="dropdown-menu panel-menu">
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">内环高架路路</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>

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
                                        <a href="#" data-toggle="droplist">上海高架养护公司</a>
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
                                                    <li>
                                                        <a href="#">沪BD4802</a>
                                                    </li>
                                                    <li><a href="#">沪BD4802</a></li>
                                                </ul>
                                            </li>
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">牵引车</a>
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

                <div id="in-mid" style="width:79%; height:635px;"><!--<img src="images/mid5.png" width="100%"/>-->


                    <a href="progress2-1.html">
                        <input type="button" class="bt" style="background:url(images/xun.png); background-size: 100% 100%;top: 68%;left: 51%;width: 5%;height: 5%;z-index: 1;"/>
                    </a>

                    <button class="btn btn-default" style="margin-left: 10px;margin-top: 10px;">设为常用位</button>
                    <div id="container" style="width:100%; margin-top: 15px;"></div>

                    <!--
                     <input type="button" class="bt" style="background:url(images/changy.png); background-size: 100% 100%; top:95%;
                            left:1%; width:8%;height:3.5%"/>  -->

                </div><!--in-mid-->



            </div><!--index-->


        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script>

    $('a[data-toggle="droplist"]').click(function() {
        $(this).nextAll().toggle();
    });

    $(function(){
        $("#progress").dropdown('toggle');
    });
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>
<script>
    // 百度地图API功能
    var mp = new BMap.Map("container");
    mp.centerAndZoom(new BMap.Point(116.3964,39.9093), 15);
    mp.enableScrollWheelZoom();
    //添加车辆
    function ComplexCustomOverlay(point, images){
        this._point = point;
        this._images = images;
    }
    ComplexCustomOverlay.prototype = new BMap.Overlay();
    ComplexCustomOverlay.prototype.initialize = function(map){
        this._map = map;
        var div = this._div = document.createElement("div");
        div.style.position = "absolute";
        /* div.style.zIndex = BMap.Overlay.getZIndex(this._point.lat);*/
        div.style.background = "url("+this._images+") no-repeat";
        div.style.backgroundSize="100% 100%";
        div.style.width="64px";
        div.style.height="32px";
        div.onmouseover = function(){
            /* this.style.backgroundColor = "#6BADCA";
             this.style.borderColor = "#0000ff";
             this.getElementsByTagName("span")[0].innerHTML = that._overText;
             arrow.style.backgroundPosition = "0px -20px";*/
        }

        div.onmouseout = function(){
            /* this.style.backgroundColor = "#EE5D5B";
             this.style.borderColor = "#BC3B3A";
             this.getElementsByTagName("span")[0].innerHTML = that._text;
             arrow.style.backgroundPosition = "0px 0px";*/
        }

        mp.getPanes().labelPane.appendChild(div);
        return div;
    }
    ComplexCustomOverlay.prototype.draw = function(){
        var map = this._map;
        var pixel = map.pointToOverlayPixel(this._point);
        this._div.style.top  = pixel.y - 30 + "px";
    }
    var myCompOverlay = new ComplexCustomOverlay(new BMap.Point(116.407845,39.914101), "images/xun.png");
    /*qian.png  sao.png*/
    mp.addOverlay(myCompOverlay);
</script>

</body>
</html>
