<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/5/9
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>历史视频查询</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/panel-dropdown.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>

    <script src="js/bootstrap.js"></script>
    <!--  <script type="text/javascript" src="js/exporting.js"></script>-->




    <style>
        #index { width:100%;height:100%; min-width:1000px;background-color:transparent; position:relative;}
        #in-left { width:50%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;}
        #in-mid { width:20%; height:652px; margin:0px; padding:0px; float:left; background-color:transparent;}
        #in-right { width:30%; height:600px; margin:0px; padding:0px; float:left; background-color:transparent;margin-left:5px}

        .bt{
            height: 22px;
            width: 52px;
            position: absolute;
            border:0;
        }
        .map_bt
        {
            border: 0;
            width: 22px;
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
            font-size: 11px;
            left: 8px;
            color:#FFF;

        }

        .txt p{margin:2px}
        #in-mid img{ height:91%}
        #in-mid video
        {	width: 12%;
            height: 73px;
            position: absolute;
            left: 513px;
        }
        .hour{
            border: none;
            background-color: #F2F2F2;
            border-radius: 5px;
            padding: 3px 6px;
            margin-right: 10px;
            width: 150px;
            color: rgb(62,133,167);
        }
        .tt{
            border: none;
            background-color: #F2F2F2;
            border-radius: 5px;
            padding: 3px 6px;
            margin-right: 10px;
            width: 150px;
            color: rgb(62,133,167);
        }
        #xuanze{
            border: none;
            background-color: #F2F2F2;
            border-radius: 5px;
            padding: 3px 6px;
            margin-right: 10px;
            width: 150px;
            color: rgb(62,133,167);
        }
        .bofangtxt
        {
            position: absolute;
            font-size:9px;
            width: 30px;
            top: 17px;
            height: 17px;
        }

        ul.lanren{width:300px;margin:100px auto;}
        .scale_panel{color:#999;width:200px;position:absolute;line-height:18px;left:-127px;top:-95px;}

        .scale span{width:16px;height:16px;position:absolute;left:1px;top:-3px;cursor:pointer;
            background:url(images/scroll.gif)   no-repeat;}
        .scale{ background-repeat: repeat-x; background-position: 0 100%; background-color: rgb(230,230,230); border-left: 1px
        rgb(41,171,226);solid;  width: 460px; height: 7px; position: relative; font-size: 0px; border-radius: 5px; }

        .scale div{ background-repeat: repeat-x; background-color: #3BE3FF; width: 0px; position: absolute; height: 3px; width: 0; 		           left: 0; bottom: 0; }

        .lanren li{font-size:12px;line-height:50px;position:relative;height:50px;list-style:none;}


        #container{width: 56%;
            height: 600px;
            float: left;
            margin-left: 5px;
            margin-right: 5px;}
    </style>



    <script>
        var scale = function (btn,bar,title){
            this.btn=document.getElementById(btn);
            this.bar=document.getElementById(bar);
            this.title=document.getElementById(title);
            this.step=this.bar.getElementsByTagName("div")[0];
            this.init();
        };
        scale.prototype={
            init:function (){
                var f=this,g=document,b=window,m=Math;
                f.btn.onmousedown=function (e){
                    var x=(e||b.event).clientX;
                    var l=this.offsetLeft;
                    var max=f.bar.offsetWidth-this.offsetWidth;
                    g.onmousemove=function (e){
                        var thisX=(e||b.event).clientX;
                        var to=m.min(max,m.max(-2,l+(thisX-x)));
                        f.btn.style.left=to+'px';
                        f.ondrag(m.round(m.max(0,to/max)*100),to);
                        b.getSelection ? b.getSelection().removeAllRanges() : g.selection.empty();
                    };
                    g.onmouseup=new Function('this.onmousemove=null');
                };
            },
            ondrag:function (pos,x){
                this.step.style.width=Math.max(0,x)+'px';
                this.title.innerHTML=pos+'%';
            }
        }
        new scale('btn','bar','title');
    </script>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="history2"></jsp:param>
        <jsp:param name="pageFather" value="history"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="history2.html">历史数据</a></li>
                    <li><a href="history2.html">历史视频查询</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>





            <div id="index">
                <!--<img src="images/index.jpg" width="100%"/>-->
                <div id="in-left" style="width:500px; position: relative; right: 10px;" >
                    <!--<input type="text" class="tt" id="hour" style="position: absolute;left: 21px;width: 82px;"/>-->
                    <input type="text" placeholder="开始时间" class="hour"  style="width: 70px; margin-right: 5px;"/>
                    <input type="text" placeholder="结束时间" class="hour" style="width: 70px;"/>

                    <div style="width: 2%;height: 4%; position: absolute;">
                    </div>

                    <!--  <input type="button" id="xuanze" value="选择时间段" style="position: absolute;left: 110px;width:94px;"/>-->
                    <input type="text" class="tt" placeholder="输入车牌" style="width: 80px;"/>

                    <button class="btn btn-default" style="padding-top: 2px; padding-bottom: 2px;">确认</button>
                    <button class="btn btn-default" style="width: 134px; padding: 2px 2px;">牵引车服务视频查询</button>

                    <video id="video1" width="100%" style="margin-top:0px; position:relative; top:62px;">
                        <source src="/example/html5/mov_bbb.mp4" type="video/mp4" />
                        <source src="/example/html5/mov_bbb.ogg" type="video/ogg" />
                        Your browser does not support HTML5 video.
                    </video>

                    <div style=" position: relative; top: 75px; ">
                        <img src="images/bofang.png" style="width:100%" />
                        <input type="text" class="bofangtxt" style="left:79px"/>
                        <input type="text" class="bofangtxt" style="left:136px;width:26px"/>
                        <input type="text" class="bofangtxt" style="left:189px; width:26px"/>

                        <input type="button"  style=" position: absolute;top: 6px;left: 245px; height:34px;width:34px;border:0;
						   background:url(images/1.png); background-size: 100% 100%;" />

                        <input type="button"  style=" position: absolute;top: 78px;left: 144px; height:30px;width:30px;border:0;
						   background:url(images/2.png); background-size: 100% 100%;" />

                        <input type="button"  style=" position: absolute;top: 78px;left: 185px; height:30px;width:30px;border:0;
						   background:url(images/3.png); background-size: 100% 100%;" />

                        <input type="button"  style=" position: absolute;top: 78px;left: 226px; height:30px;width:26px;border:0;
						   background:url(images/4.png); background-size: 100% 100%;" />

                        <input type="button"  style=" position: absolute;top: 78px;left: 268px; height:30px;width:26px;border:0;
						   background:url(images/5.png); background-size: 100% 100%;" />

                        <input type="button"  style=" position: absolute;top: 78px;left: 268px; height:30px;width:26px;border:0;
						   background:url(images/5.png); background-size: 100% 100%;" />

                        <input type="button"  style=" position: absolute;top: 78px;left: 310px; height:30px;width:38px;border:0;
						   background:url(images/6.png); background-size: 100% 100%;" />

                    </div>



                    <ul class="lanren">
                        <li><span id="title"></span>
                            <div class="scale_panel">
                                <span class="r"></span>
                                <div class="scale" id="bar">
                                    <div></div>
                                    <span id="btn"></span>
                                </div>
                            </div>
                        </li>
                    </ul>

                </div><!--in-left-->

                <div id="in-mid" style="width:158px;">
                    <img src="images/bg.png" width="100%"/>
                    <video id="video1" width="15%" style="margin-top:0px; top:10px">
                        <source src="/example/html5/mov_bbb.mp4" type="video/mp4" />
                        <source src="/example/html5/mov_bbb.ogg" type="video/ogg" />
                        Your browser does not support HTML5 video.
                    </video>
                    <video id="video1" width="95%" style="margin-top:0px; top:100px">
                        <source src="/example/html5/mov_bbb.mp4" type="video/mp4" />
                        <source src="/example/html5/mov_bbb.ogg" type="video/ogg" />
                        Your browser does not support HTML5 video.
                    </video>
                    <video id="video1" width="95%" style="margin-top:0px; top:190px">
                        <source src="/example/html5/mov_bbb.mp4" type="video/mp4" />
                        <source src="/example/html5/mov_bbb.ogg" type="video/ogg" />
                        Your browser does not support HTML5 video.
                    </video>
                    <video id="video1" width="95%" style="margin-top:0px; top:280px">
                        <source src="/example/html5/mov_bbb.mp4" type="video/mp4" />
                        <source src="/example/html5/mov_bbb.ogg" type="video/ogg" />
                        Your browser does not support HTML5 video.
                    </video>
                    <video id="video1" width="95%" style="margin-top:0px; top:370px">
                        <source src="/example/html5/mov_bbb.mp4" type="video/mp4" />
                        <source src="/example/html5/mov_bbb.ogg" type="video/ogg" />
                        Your browser does not support HTML5 video.
                    </video>
                </div><!--in-mid-->

                <div id="in-right">

                    <div id="container" style="width:100%"></div>



                </div><!--in-right-->

            </div><!--index-->


        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>

    $('a[data-toggle="droplist"]').click(function() {
        $(this).nextAll().toggle();
    });
</script>


<script>
    $(function(){
        $("#history").dropdown('toggle');
    });

    $('#date').datetimepicker({
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


</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=avs3S28Dq5BjX7fCWUYjP3HA"></script>

<script>
    var map = new BMap.Map("container", {enableMapClick:false});          // 创建地图实例
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    map.enableScrollWheelZoom();//允许放大缩放
    map.addControl(top_left_control);
    map.centerAndZoom("上海");                 // 初始化地图，设置中心点坐标和地图级别 设置为上海
</script>
</body>
</html>