<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/5/11
  Time: 16:45
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
        #top {background-color:transparent;height:400px;width:44%;float:left; margin-top:30px;position:relative;margin-left: 20px;}
        #middle {background-color:transparent;height:400px;width:44%;float:left;margin-top:30px; margin-left:20px;position:relative;}	#bottom{ top: 10px;  width: 44%; height:47%;background-color:transparent;position:relative;}
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
</head>

<body onLoad="init()">

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="progress2-2"></jsp:param>
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

            <div class="col-lg-12">
                <a href="javascript:history.back();" class="operation"><< 返回</a>
            </div>

            <div id="top">
                <p>云台摄像头</p>
                <button class="button" style="width:15%;height:8%;top:0;left:45%"onclick="startVideoCloud()">获取视频</button>
                <button class="button" style="width:15%;height :8%;top:0;left:62%" onClick="stopVideoCloud()">暂停</button>
                <button class="button" style="width:15%;top:0;left:79%" data-toggle="modal" data-target="#full-screen" data-backdrop="static">全屏</button>
                <div style="width:95%;margin-top:0; height:95%; z-index:-1" >
                    <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                            width="100%" height="100%" id = "gViewerCloud" name="gViewerCloud">
                    </OBJECT>
                </div>
            </div><!--bottom-->

            <div id="middle">
                <p>云台控制</p>
                <!--<input type="button" class="bt" style="background:url(images/get.png); background-size: 100% 100%;width:15%;
                       top:22%;left:15%; position:absolute"/>
                <input type="button" class="bt" style="background:url(images/getc.png); background-size: 100% 100%;width:15%;
                       top:22%;left:34%; position:absolute"/>
                <input type="button" class="bt" style="background:url(images/stopc.png); background-size: 100% 100%;width:15%;
                       top:22%;left:53%; position:absolute"/>
                <input type="button" class="bt" style="background:url(images/pre.png); background-size: 100% 100%;width:15%;
                       top:22%;left:72%; position:absolute"/>-->

                <%--<button class="button" style="width:15%;top:0;left:15%;">获取视频</button>--%>
                <%--<button class="button" style="width:15%;top:0;left:34%;">获取控制</button>--%>
                <%--<button class="button" style="width:15%;top:0;left:53%;">停止控制</button>--%>
                <%--<button class="button" style="width:15%;top:0;left:72%;">预置点</button>--%>

                <div id="map">
                    <a id="top-map"onmousedown="goPTZ(2)" onmouseup="stopPTZ()"></a>
                    <a id="bottom-map"onmousedown="goPTZ(3)" onmouseup="stopPTZ()"></a>
                    <a id="left-map"onmousedown="goPTZ(1)" onmouseup="stopPTZ()"></a>
                    <a id="right-map"onmousedown="goPTZ(0)" onmouseup="stopPTZ()"></a>

                </div>

            </div><!--bottom1-->

        </div><!--index-->


    </div><!-- /.row -->


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

    <div class="modal fade" id="full-screen" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" style="width: 100%; height: 100%;">
            <div class="modal-content" style="width: 100%; height: 100%;">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>

                    <div style="width:100%;margin-top:0; height:100%; z-index:-1" >
                        <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                                width="100%" height="100%" id = "gViewerCloudFull" name="gViewerFrontFull" >
                        </OBJECT>
                    </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


</div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


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
    var viewCloud;
   var id ='${id}';
    var ServerIP="120.24.79.63";
    var ServerPort="6603";
    //window.setTimeout("init()", 500) ;
    function init()
    {
        viewCloud = document.getElementById("gViewerCloud");
        viewCloud.Layout = 1;
        viewCloud.PaneType=0;
        viewCloud.ServerIP = ServerIP;//"221.130.62.222";//"180.166.29.154";
        viewCloud.ServerPort = ServerPort;
        viewCloud.PaneType=0;
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

    function goPTZ(type)
    {

        var result = viewCloud.PtzControl(0,type,100,0);
    }
    function stopPTZ()
    {

        viewCloud.PtzControl(0,19,100,0);
    }
    $(function () { $('#full-screen').on('shown.bs.modal', function () {
        viewBackFull = document.getElementById("gViewerCloudFull");
        viewBackFull.Layout = 1;
        viewBackFull.PaneType=0;
        viewBackFull.ServerIP = ServerIP;//"221.130.62.222";//"180.166.29.154";
        viewBackFull.ServerPort = ServerPort;
        viewBackFull.StartVideo(id, 0, 0);
        viewBackFull.SetViewTitle(0,id+" 云台摄像头"); //1通道 1窗口
    })
    });

</script>




</body>
</html>
