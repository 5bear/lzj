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
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
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
    <link rel="stylesheet" href="css/style.css">

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>

    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <!--  <script type="text/javascript" src="js/exporting.js"></script>-->

    <script language="javascript">

        $(document).ready(function(){//页面加载完之后，自动执行该方法
            setTimeout(function(){$("#alert").modal('show');},60000);//1分后执行该方法
        });
    </script>


    <style>
        #index { width:100%; height:100%; min-width:960px; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
        #top {background-color:transparent;height:400px;width:44%;float:left; margin-top:30px;position:relative;}
        #middle {background-color:transparent;height:400px;width:44%;float:left;margin-top:30px; margin-left:20px;position:relative;}
        #bottom{ top: 10px;  width: 44%; height:47%;background-color:transparent;position:relative;}
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
            padding: 5px;}

        .alert
        {
            width: 400px;
            height: 200px;
            border:1px solid rgb(2,96,142);
            position: fixed;
            top: 50%;
            left: 50%;
            margin-left: -200px;
            margin-top: -100px;
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
</head>

<body  onLoad="init()">

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
                    <li><a href="progress2.html">进度管理</a></li>
                    <li><a href="progress2.html">实时监控</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>


            <div id="index">
                <!--<img src="images/index.jpg" width="100%"/>-->
                <div class="col-lg-12">
                    <a href="javascript:history.back();" class="operation"><< 返回</a>
                </div>
                <div id="top">
                    <p>前置摄像头</p>
                    <button class="button" style="width:15%;height:8%;top:0;left:45%" onClick="startVideoFront()">获取视频</button>
                    <button class="button" style="width:15%;height :8%;top:0;left:62%" onClick="stopVideoFront()">暂停</button>
                    <button class="button" style="width:15%;top:0;left:79%" data-toggle="modal" data-target="#front-full-screen" data-backdrop="static">全屏</button>
                    <!--<img src="images/videoo.png" width="95%"/>-->
                    <div style="width:95%;margin-top:0; height:95%; z-index:-1" >
                        <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                                width="100%" height="100%" id = "gViewerFront" name="gViewerFront" >
                        </OBJECT>
                    </div>
                </div><!--top-->

                <div id="middle">
                    <p>后置摄像头</p>

                    <button class="button" style="width:15%;height:8%;top:0;left:45%"onclick="startVideoBack()">获取视频</button>
                    <button class="button" style="width:15%;height :8%;top:0;left:62%"onclick="stopVideoBack()">暂停</button>
                    <button class="button" style="width:15%;top:0;left:79%" data-toggle="modal" data-target="#back-full-screen" data-backdrop="static">全屏</button>
                    <div style="width:95%;margin-top:0; height:95%; z-index:-1" >
                        <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                                width="100%" height="100%" id = "gViewerBack" name="gViewerFront" >
                        </OBJECT>
                    </div>
                </div><!--middle-->


            </div><!--index-->


        </div><!-- /.row -->


    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<div class="modal fade" id="alert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <p class="alert-title text-center" style="margin-top: 20px">是否返回实时监控</p>
            <div class="row text-center" style="margin: 40px;">
                <a href="progress2.html" class="btn btn-deafult" style="color: #FFF;background-color: rgb(2,96,142);  border: 0;width: 15%;">是</a>
                <a href="" class="btn btn-deafult" style="color: #FFF;background-color: rgb(2,96,142);  border: 0;width: 15%;">否</a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="front-full-screen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width: 100%; height: 100%;" >
        <div class="modal-content" style="width: 100%; height: 100%;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div style="width:100%;margin-top:0; height:95%; z-index:-1" >
                <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                        width="100%" height="100%" id = "gViewerFrontFull" name="gViewerFrontFull" >
                </OBJECT>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<div class="modal fade" id="back-full-screen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" style="width: 100%; height: 100%;">
        <div class="modal-content" style="width: 100%; height: 100%;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div style="width:95%;margin-top:0; height:95%; z-index:-1" >
                <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                        width="100%" height="100%" id = "gViewerBackFull" name="gViewerBackFull" >
                </OBJECT>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>

<script>

   /* $('a[data-toggle="dropdown"]').click(function() {
        $(this).nextAll().toggle();
    });*/

    $(function(){
        $("#progress").dropdown('toggle');
    });

    var viewFront,viewBack,viewFrontFull,viewBackFull;
    var id ='${id}';
    var ServerIP="120.24.79.63";
    var ServerPort="6603";
    //window.setTimeout("init()", 500) ;
    function init()
    {
        viewFront = document.getElementById("gViewerFront");
        viewFront.Layout = 1;
        viewFront.PaneType=0;
        viewFront.ServerIP = ServerIP;//"221.130.62.222";//"180.166.29.154";
        viewFront.ServerPort = ServerPort;
        viewBack = document.getElementById("gViewerBack");
        viewBack.Layout = 1;
        viewBack.PaneType=0;
        viewBack.ServerIP = ServerIP;//"221.130.62.222";//"180.166.29.154";
        viewBack.ServerPort = ServerPort;
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
    function frontVideoFull(){
        viewFront.FullScreen();
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
    $(function () { $('#front-full-screen').on('shown.bs.modal', function () {
        viewFrontFull = document.getElementById("gViewerFrontFull");
        viewFrontFull.Layout = 1;
        viewFrontFull.PaneType=0;
        viewFrontFull.ServerIP = ServerIP;//"221.130.62.222";//"180.166.29.154";
        viewFrontFull.ServerPort = ServerPort;
        viewFrontFull.StartVideo(id, 0, 0);
        viewFrontFull.SetViewTitle(0,id+" 前置摄像头"); //1通道 1窗口
    })
    });
    $(function () { $('#back-full-screen').on('shown.bs.modal', function () {
        viewBackFull = document.getElementById("gViewerBackFull");
        viewBackFull.Layout = 1;
        viewBackFull.PaneType=0;
        viewBackFull.ServerIP = ServerIP;//"221.130.62.222";//"180.166.29.154";
        viewBackFull.ServerPort = ServerPort;
        viewBackFull.StartVideo(id, 1, 0);
        viewBackFull.SetViewTitle(0,id+" 后置摄像头"); //1通道 1窗口
    })
    });



</script>




</body>
</html>
