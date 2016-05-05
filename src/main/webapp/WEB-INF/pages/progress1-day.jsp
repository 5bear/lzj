<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/19
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>养护进度监控</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/panel-dropdown.css"/>

    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>

    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <!--  <script type="text/javascript" src="js/exporting.js"></script>-->

    <style>
        #index { width:100%; height:100%; margin-left:16px; padding:0px; background-color:transparent; position:relative;}
        #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
        #in-mid { width:640px; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
        #in-right { width:258px; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
        #index-checkbox
        {
            position:absolute;
            top: 620px;
            left: 200px;
        }

        #select-time
        {
            position: absolute;
            top: 54px;
            left: 843px;
            width: 213px;
            height:25px;
        }

        .progressbar_1{

            background-color:rgb(255,255,255);
            height:18px;
            border:2px solid rgb(179,179,179);
            position:absolute;top: 162px; left: 843px; width: 120px;


        }
        .progressbar_1 .bar {
            background-color:rgb(2,96,142);
            height:12px;
            width:0;
            margin:1px;
        }
    </style>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="progress1-day"></jsp:param>
        <jsp:param name="pageFather" value="progress"></jsp:param>
    </jsp:include>


    <div id="page-wrapper"
            >

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="progress1.html">进度管理</a></li>
                    <li><a href="progress1.html">养护进度监控</a></li>
                    <!--   <li class="active"><i class="icon-file-alt"></i> Blank Page</li> -->
                </ol>
            </div>

            <div id="index">
                <!--<img src="images/index.jpg" width="100%"/>-->
                <div id="in-left" style="width:21%; float:left">

                    <div class="panel panel-primary">
                        <div class="panel-heading text-center">作业进度查看列表</div>
                        <div class="panel-body">
                            <li class="dropdown dropdown1">
                                <a href="#" data-toggle="dropdown">上海市</a>
                                <div class="arrow-section arrow-section1">
                                    <div class="arrow-down arrow-down1"></div>
                                </div>
                                <ul class="dropdown-menu panel-menu">


                                    <li class="dropdown dropdown2">
                                        <a href="#" data-toggle="dropdown">上海成基公司</a>
                                        <div class="arrow-section arrow-section2">
                                            <div class="arrow-down arrow-down2"></div>
                                        </div>
                                        <c:forEach items="${chengjiCompany}" var="item">
                                            <ul class="dropdown-menu panel-menu">
                                                <li class="dropdown dropdown3">
                                                    <a href="#" data-toggle="dropdown">${item.packageName}</a>
                                                    <div class="arrow-section arrow-section3">
                                                        <div class="arrow-down arrow-down3"></div>
                                                    </div>
                                                    <ul class="dropdown-menu panel-menu">
                                                        <script>
                                                            var roads='${item.roads}';
                                                            var road = roads.split(',');
                                                            var a="AllRoads";
                                                            var packageName1='${item.packageName}';
                                                            document.write("<li onclick='CJgetRoad(packageName1,a)'>所有路段</li>");
                                                            for(var i=0;i<road.length;i++){
                                                                document.write("<li onclick=CJgetRoad(packageName1,roads[i])>"+road[i]+"</li>");
                                                            }
                                                        </script>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </c:forEach>
                                    </li>
                                    <li class="dropdown dropdown2">
                                        <a href="#" data-toggle="dropdown">上海高架公司</a>
                                        <div class="arrow-section arrow-section2">
                                            <div class="arrow-down arrow-down2"></div>
                                        </div>
                                        <c:forEach items="${gaojiaCompany}" var="item">
                                            <ul class="dropdown-menu panel-menu">
                                                <li class="dropdown dropdown3">
                                                    <a href="#" data-toggle="dropdown">${item.packageName}</a>
                                                    <div class="arrow-section arrow-section3">
                                                        <div class="arrow-down arrow-down3"></div>
                                                    </div>
                                                    <ul class="dropdown-menu panel-menu">
                                                        <script>
                                                            var roads='${item.roads}';
                                                            var road = roads.split(',');
                                                            var a="AllRoads";
                                                            var packageName1='${item.packageName}';
                                                            document.write("<li onclick='GJgetRoad(packageName1,a)'>所有路段</li>");
                                                            for(var i=0;i<road.length;i++){
                                                                document.write("<li onclick=GJgetRoad(packageName1,roads[i])>"+road[i]+"</li>");
                                                            }
                                                        </script>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </c:forEach>
                                    </li>
                                </ul>
                            </li>
                        </div>
                    </div>

                </div><!--in-left-->

                <div id="in-mid" style="width:76%;"><img src="images/mid4.png" width="100%"/>

                    <select id="select-time" style="left: 61%; width: 9%; height: 4%;">
                        <option value="today">本日</option>
                        <option value="month">本月</option>
                        <option value="year">本年</option>
                    </select>

                    <div id="container" style="width:25%;height:36%;position: absolute;top:20%;left:49%"></div>
                    <div id="container1" style="width:19%;height:36%;position: absolute;top: 20%;left:74%"></div>
                    <div class="progressbar_1" style="top: 30%; left:16%;  width: 15%" id="progress1">
                    </div>
                    <p style="font-size:10px; color:rgb(2,96,142);position: absolute;top: 30%;left:35%;" id="progress2"></p>
                </div><!--in-mid-->
            </div><!--index-->
        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script>
    var packagename= request.getParameter("packagename");
    var roads =request.getParameter("roads");
    var company=request.getParameter("company");
    var year= request.getParameter("year");
    var month = request.getParameter("month");
    var day= request.getParameter("day");

        $(document).ready(function () {
            setChart();
        });
    function setChart(){
        $.ajax({
            url:"progress1-day/getDay",
            type:"post",
            dataType: "json",
            data:{
                year:year,
                month:month,
                day:day,
                company:company,
                packageName:packagename,
                roads:roads
            },
            success:function(data) {
                var EffectiveDistance;
                var EffectiveCoverage;
                $(data).each(function (index) {
                    EffectiveDistance=data[index].distance/2;
                    EffectiveCoverage=data[index].coverage;
                })
            }
        });
            var chart;
                // Build the chart
                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'container',
                        backgroundColor: 'rgb(242, 242, 242)',
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false

                    },



                    title: {
                        text: '有效作业率',
                        style: {                      // 文字内容相关样式
                            fontSize:"12px",
                        }
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
                            ['有效作业率',EffectiveDistance],
                            ['无效作业率',100-EffectiveDistance],

                        ]
                    }]
                });

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
                        style: {                      // 文字内容相关样式
                            fontSize:"12px",
                        }
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

    }
    $('a[data-toggle="dropdown"]').click(function() {
        $(this).nextAll().toggle();
    });

    $("#select-time").change(function(){
        var obj = $("#select-time").val();
        if(obj == "day"){ window.location.href="progress1-day.html";}
        else if(obj == "month"){ window.location.href="progress1.html";}
        else {window.location.href="progress1-year.html";}
    });

    $(function(){
        $("#progress").dropdown('toggle');
    });
</script>

</body>
</html>
