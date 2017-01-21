<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
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
        #in-left { width:100%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;}ding:0px; float:left; background-color:transparent;margin-left:5px}

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
        .year{
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
</head>

<body onload="init1()">

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
                    <li>历史数据</li>
                    <li><a href="history2">历史视频查询</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>





            <div id="index">
                <!--<img src="images/index.jpg" width="100%"/>-->
                <div id="in-left" style="width:50%; position: relative; right: 10px;float: left" >
                    <!--<input type="text" class="tt" id="hour" style="position: absolute;left: 21px;width: 82px;"/>-->




                    <div style="width:100%;margin-top:0; height:500px; z-index:-1;;margin: auto" >
                        <OBJECT class="object" classid="clsid:DAB63197-3FF9-4236-924C-F8641094DDFD"  codebase = "setup.exe#version=6,0,0,3"
                                width="100%" height="100%" id = "gViewer" name="gViewer">
                        </OBJECT>
                            <%--<video width="320" height="240" controls autoplay>--%>
                                <%--<source src="./video/H20160510-130653P1N1P0.mp4" type="video/mp4">--%>
                            <%--</video>--%>
                    </div>





                </div><!--in-left-->


                <div class="row" style="float: left;width:50%;">
                    <div class="row text-right" style="margin-bottom: 30px; padding-right: 30px;">
                        <%--<select>--%>
                        <%--<option value="SH">2016</option>--%>
                        <%--<option value="SH">2015</option>--%>
                        <%--</select>--%>
                        <a href="<%=request.getContextPath()%>/download/Setup.rar">点击下载控件</a>
                        <input type="text" id="year" placeholder="年份" class="year"  style="width: 100px; margin-right: 5px;"/>
                        <input type="text" id="startTime" placeholder="开始时间" class="hour"  style="width: 70px; margin-right: 5px;"/>
                        <input type="text" id="endTime" placeholder="结束时间" class="hour" style="width: 70px;"/>
                        <input type="text" id="vehicleLicense"  class="tt"  list="lista" placeholder="输入车牌" style="width: 90px;"/>
                        <datalist id="lista">
                            <c:forEach items="${vehicleLicense}" var="item">
                                <option value="${item.vehicleLicense}">${item.vehicleLicense}</option>
                            </c:forEach>
                        </datalist>
                        <button class="btn btn-default" style="padding-top: 2px; padding-bottom: 2px;" onclick="StartFile()" >确认</button>
                        <span style="clear:both"></span>
                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>时间</th>
                                <th>终端设备</th>
                                <th>通道</th>
                                <th>位置</th>
                                <th>文件</th>
                                <th>播放</th>
                            </tr>
                            </thead>
                            <tbody id="table">
                            <tr>

                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div><!--index-->


        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>



<script>
    $(function(){
        $("#history2").dropdown('toggle');
    });

    $('.year').datetimepicker({
        lang:'ch',
        timepicker:false,
        format:"Y-m-d",
        yearStart: 2015,
        yearEnd: 2050
    });

    $('.hour').datetimepicker({
        datepicker:false,
        format:'H:i',
        step:10
    });


    var view = document.getElementById("gViewer");
    var row="";
    var veLicense;
    function init1()
    {
        view.Layout = 1;
        view.PaneType=0;
        view.ServerIP="180.168.194.3";
        view.ServerPort="6605";
        year="${year}";
        start="${start}";
        end="${end}";
        id="${id}";
        veLicense="${veLicense}";
        company = "${company}";
        if(year!=""&&start!=""&&end!=""&&veLicense!=""){
            getFile();
            setTable();
        }
    }
    function Start(FileName,StartTime,channel){
        var file="D:/ftp/RECORD_FILE/"+id+"("+id+")/"+year+"/"+ FileName;
        var newStart = [];
        for(var i = 0; i<StartTime.length;i++){

            if(StartTime[i] == "-")
                newStart+="/";
            else
                newStart+=StartTime[i];
        }
        var t=new Date(newStart);//你已知的时间
        var t_s = t.getTime();//转化为时间戳毫秒数
        var nt = new Date();//定义一个新时间
        nt.setTime(t_s+1000*60*15+1000*58);//设置新时间比旧时间多一分钟
        var EndTime = nt.getFullYear()+"-"+ (parseInt(nt.getMonth())+1)+"-"+nt.getDate()+" "+nt.getHours()+":"+nt.getMinutes()+":"+nt.getSeconds();
//        if(company == "CJcompany")
//            view.StartPlaybackRec(file,StartTime,EndTime,id,channel,"0",2,2,33,StartTime,EndTime,0);//设备ID 通道号 文件长度 文件类型（1 图片 2 录像）文件存储位置（1 设备 2 服务器）服务器ID
//        else
         view.StartPlaybackRec(file,StartTime,EndTime,id,channel,"0",2,2,37,StartTime,EndTime,0);//设备ID 通道号 文件长度 文件类型（1 图片 2 录像）文件存储位置（1 设备 2 服务器）服务器ID
//        //alert(view.StartPlaybackRec(file,StartTime,EndTime,id,channel,"0",2,2,26,StartTime,EndTime,0));
    }

    var company;
    var id;
    var isFile=true;
    function StartFile(){
        Search();
        if($("#year").val()=="") {
            alert("请输入日期");
            return 0;
        }
        else
            year=$("#year").val();
        if($("#startTime").val()=="")
            start="00:00";
        else
            start=$("#startTime").val();
        if($("#endTime").val()=="")
            end="23:59";
        else
            end=$("#endTime").val();
        if(start>=end){
            alert("起始时间错误");
            return 1;
        }

        if(isFile==true) {
            window.location="history2?id="+id+"&company="+company+"&year="+year+"&start="+start+"&end="+end+"&veLicense="+vehicleLicense;
        }

    }
    var vehicleLicense;
    function Search(){
        if($("#vehicleLicense").val()=="") {
            alert("请输入车牌");
            isFile=false;
            return 0;
        }
        vehicleLicense=$("#vehicleLicense").val();
        $.ajax({
            url: "history2/search",
            type: "get",
            dataType: "json",
            async : false,                   //设置同步
            data: {
                vehicleLicense:vehicleLicense,
            },
            success: function (data) {
                if (data.length == 0) {
                    alert("没有该车牌");
                    isFile = false;
                } else {
                    isFile=true;
                    $(data).each(function (index) {
                        if(data[index].company=="上海成基市政建设发展有限公司")
                            company="CJcompany";
                        else if(data[index].company=="上海高架养护管理有限公司")
                            company="GJcompany";
                        id = data[index].OBUId;
                    })
                }
            }
        });

    }
    var channel=[];
    var filename="";
    var FileName=[];
    var time=[];
    var a;               //a为文件个数
    function getFile() {
        var FileList = '${FileList}';
        var i= 1;
        a=0;
        time=[];
        channel=[];
        filename="";
        FileName=[];
        while(i<FileList.length-1){
            if(FileList[i]!=','&& FileList[i]!=' ') {
                filename += FileList[i];
            }
            else if(FileList[i]==' ') {
                time[a] =""+ filename.substr(1, 4)+"-"+filename.substr(5, 2)+"-"+filename.substr(7, 2)+" "+filename.substr(10, 2)+":"+filename.substr(12, 2)+":"+filename.substr(14, 2);
                channel[a] = filename.substr(19, 1);
                FileName[a]=filename;
                a++;
                filename="";
            }
            if(i==FileList.length-2){
                time[a] =""+ filename.substr(1, 4)+"-"+filename.substr(5, 2)+"-"+filename.substr(7, 2)+" "+filename.substr(10, 2)+":"+filename.substr(12, 2)+":"+filename.substr(14, 2);
                channel[a] = filename.substr(19, 1);
                FileName[a]=filename;
                a++;
                filename="";
            }
            i++;
        }
    }
    var year,start,end;
    function setTable() {
        var startTime=year+" "+start;
        var endTime=year+" "+end;
        row="";
        var table=0;
        for(var i=0;i<a;i++){
            if(time[i]>=startTime && time[i]<=endTime){
                row += "<tr> <td id='time"+i+"'>" + time[i] + "</td> <td>" + veLicense + "</td> <td id='channel"+i+"'>" + channel[i] + "</td> <td>终端设备</td> <td id='FileName"+i+"'>" + FileName[i] +
                        "</td><td align=center><button id='video"+i+"'class='btn btn-default' onclick='startVideo("+i+")'>播放</button></td> </tr>";
                table++;
            }
        }

        if(table==0)
            alert("没有文件");
        $("#table").html(row);
    }

    function startVideo(num){
        Start(FileName[num],time[num],channel[num]);
    }
</script>

</body>
</html>