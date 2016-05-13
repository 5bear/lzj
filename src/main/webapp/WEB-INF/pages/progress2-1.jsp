<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/5/9
  Time: 20:22
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
    <link href="css/style.css" rel="stylesheet">
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/panel-dropdown.css"/>

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>

    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <!--  <script type="text/javascript" src="js/exporting.js"></script>-->

    <script language="javascript">

        $(document).ready(function(){//页面加载完之后，自动执行该方法
            setTimeout(function(){$("#alert").show();},60000);//1分后执行该方法
        });
    </script>


    <style>
        #index { width:100%; height:100%; min-width:960px; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
        #top {background-color:transparent;height:47%;width:44%;float:left; margin-top:30px;position:relative;}
        #middle {background-color:transparent;height:47%;width:44%;float:left;margin-top:30px; margin-left:20px;position:relative;}
        #bottom{ top: 10px;  width: 44%;background-color:transparent;position:relative;}
        #bottom1{ top: 55%; left:44%; width: 42%; height:47%;background-color:transparent; margin-left:20px;position:absolute;}
        .bt{
            height: 22px;
            width: 50px;
            position: absolute;
            left:10px;
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

        .alert
        {
            width: 400px;
            background-color: #FF9335;
            color: black;
            position: fixed;
            bottom: 0px;
            right: 20px;
        }

    </style>
    <script>
        $(function(){ $(".xuanfu1").hide(); //默认隐藏
            $("#qian").on("click",function(){ $(".xuanfu1").toggle();//显示隐藏切换
            }) })

        $(function(){ $(".xuanfu2").hide(); //默认隐藏
            $("#sao").on("click",function(){ $(".xuanfu2").toggle();//显示隐藏切换
            }) })

        $(function(){ $("#alert").hide();}) //默认隐藏
    </script>


    <script type="text/javascript" >
        var view;
        var id = "0200001";
        //window.setTimeout("init()", 500) ;
        function init()
        {
            viewFront = document.getElementById("gViewerFront");
            viewFront.Layout = 1;
            viewFront.PaneType=0;
            viewFront.ServerIP = "120.24.79.63";//"221.130.62.222";//"180.166.29.154";
            viewFront.ServerPort = "6603";
            viewBack = document.getElementById("gViewerBack");
            viewBack.Layout = 1;
            viewBack.PaneType=0;
            viewBack.ServerIP = "120.24.79.63";//"221.130.62.222";//"180.166.29.154";
            viewBack.ServerPort = "6603";
            viewCloud = document.getElementById("gViewerCloud");
            viewCloud.Layout = 1;
            viewCloud.PaneType=0;
            viewCloud.ServerIP = "120.24.79.63";//"221.130.62.222";//"180.166.29.154";
            viewCloud.ServerPort = "6603";
        }
        function startVideoFront()
        {
            viewFront.StartVideo(id, 0, 0);
            viewFront.SetViewTitle(0,id+" 前置摄像头"); //1通道 1窗口
        }
        function stopVideoFront()
        {
            //alert(view);
            viewFront.StopVideo(0);
            viewFront.SetViewTitle(0,"");
        }
        function startVideoBack()
        {
            viewBack.StartVideo(id, 1, 0);
            viewBack.SetViewTitle(0,id+" 后置摄像头"); //2通道 1窗口
        }
        function stopVideoBack()
        {
            //alert(view);
            viewBack.StopVideo(0);
            viewBack.SetViewTitle(0,"");
        }
        function startVideoCloud()
        {
            viewCloud.StartVideo(id, 0, 0);
            viewCloud.SetViewTitle(0,id+" 云台摄像头"); //1通道 1窗口
        }
        function stopVideoCloud()
        {
            //alert(view);
            viewCloud.StopVideo(0);
            viewCloud.SetViewTitle(0,"");
        }
        function videoFront(){
            viewFront.FullScreen();
        }
        function videoBack(){
            viewBack.FullScreen();
        }
        function videoCloud(){
            viewCloud.FullScreen();
        }
        function goPTZ(type)
        {

            var result = viewCloud.PtzControl(0,type,100,0);
        }
        function stopPTZ()
        {

            viewCloud.PtzControl(0,19,100,0);
        }
        function getParam( paramName )
        {
            var oRegex = new RegExp( '[\?&]' + paramName + '=([^&]+)', 'i' ) ;
            var oMatch = oRegex.exec( window.location.search ) ;
            if ( oMatch && oMatch.length > 1 )
                return oMatch[1] ;
            else
                return '' ;
        }
    </script>
</head>

<body onLoad="init()">

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="progress2-1"></jsp:param>
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
                <div class="row"><a href="javascript:history.back();" class="operation"><< 返回</a></div>
                <div id="top" style="height:47%">
                    <p>前置摄像头</p>
                    <button class="button" style="width:15%;height:8%;top:0;left:45%" onClick="startVideoFront()">获取视频</button>
                    <button class="button" style="width:15%;height :8%;top:0;left:62%" onClick="stopVideoFront()">暂停</button>
                    <button class="button" style="width:15%;height:8%;top:0;left:79%" onClick="videoFront()">全屏</button>

                    <div style="width:95%;margin-top:0; height:226px; z-index:-1" >
                        <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                                width="100%" height="100%" id = "gViewerFront" name="gViewerFront" >
                        </OBJECT>
                    </div>
                </div><!--top-->

                <div id="middle">
                    <p>后置摄像头</p>

                    <button class="button" style="width:15%;height:8%;top:0;left:45%"onclick="startVideoBack()">获取视频</button>
                    <button class="button" style="width:15%;height :8%;top:0;left:62%"onclick="stopVideoBack()">暂停</button>
                    <button class="button" style="width:15%;height:8%;top:0;left:79%"onclick="videoBack()">全屏</button>
                    <!--
                     <video id="video1" width="95%" style="margin-top:0px;">
                  <source src="/example/html5/mov_bbb.mp4" type="video/mp4" />
                  <source src="/example/html5/mov_bbb.ogg" type="video/ogg" />
                    Your browser does not support HTML5 video.
              </video>-->

                    <div style="width:95%;margin-top:0; height:226px; z-index:-1" >
                        <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                                width="100%" height="100%" id = "gViewerBack" name="gViewerBack" >
                        </OBJECT>
                    </div>
                </div><!--middle-->


                <div id="bottom">
                    <p>云台摄像头</p>
                    <button class="button" style="width:15%;height:4%;top:53%;left:45%"onclick="startVideoCloud()">获取视频</button>
                    <button class="button" style="width:15%;height :4%;top:53%;left:62%" onClick="stopVideoCloud()">暂停</button>
                    <button class="button" style="width:15%;height:4%;top:53%;left:79%"onclick="videoCloud()">全屏</button>

                    <div style="width:95%;margin-top:0; height:226px; z-index:-1" >
                        <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                                width="100%" height="100%" id = "gViewerCloud" name="gViewerCloud">
                        </OBJECT>
                    </div>
                </div><!--bottom-->

                <!--<div id="bottom1">
                    <p>云台控制</p>
                    <button class="button" style="width:15%;top:22%;left:15%;height:8%">获取视频</button>
                    <button class="button" style="width:15%;top:22%;left:34%;height:8%">获取控制</button>
                    <button class="button" style="width:15%;top:22%;left:53%;height:8%">停止控制</button>
                    <button class="button" style="width:15%;top:22%;left:72%;height:8%">预置点</button>-->

                    <div id="map">
                        <a id="top-map"onmousedown="goPTZ(2)" onmouseup="stopPTZ()"></a>
                        <a id="bottom-map"onmousedown="goPTZ(3)" onmouseup="stopPTZ()"></a>
                        <a id="left-map"onmousedown="goPTZ(0)" onmouseup="stopPTZ()"></a>
                        <a id="right-map"onmousedown="goPTZ(1)" onmouseup="stopPTZ()"></a>

                    </div>
                  <!--  <img src="images/yuntai.png" width="95%"/>-->
                </div><!--bottom1-->

            </div><!--index-->


        </div><!-- /.row -->


        <div class="alert" id="alert" style="width:30%;height:30%; bottom:0; right:0; border:1px solid rgb(2,96,142); background-color:white; z-index:10">
            <p class="alert-title text-center" style="margin-top:10%">是否返回实时监控</p>

            <div class="row text-center" style="margin-top:15%;">
                <a href="progress2.html">
                    <button style="color: #FFF;background-color: rgb(2,96,142);  border: 0;width: 15%;">是</button>
                </a>
                <button style="color: #FFF;background-color: rgb(2,96,142);  border: 0;width: 15%;">否</button>
            </div>
        </div>


    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>




<script type="text/javascript"  for="testen" event="OnRecSearchEvent(strFile, nStartTime,nEndTime,nFileLen,nFileType,nSvrID,nLocation,nChannel)" >
    alert(strFile);

</script>

</body>
</html>
