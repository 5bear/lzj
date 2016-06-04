<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/19
  Time: 20:42
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

    <title>养护进度监控</title>

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

    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <!--  <script type="text/javascript" src="js/exporting.js"></script>-->



    <style>
        #index { width:100%; height:100%; min-width:960px;margin-left:16px; padding:0px; background-color:transparent; position:relative;}
        #in-left { width:17%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
        #in-mid { width:640px; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;}
        #in-right { width:258px; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;position:relative;min-width:249px;}
        #index-checkbox
        {
            position:absolute;
            top: 620px;
            left: 200px;
        }

        .progressbar_1{

            background-color:rgb(255,255,255);
            height:18px;
            border:2px solid rgb(179,179,179);
            width: 40%;
            margin-left: 15%;
            float: left;

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
        <jsp:param name="pageName" value="progress1"></jsp:param>
        <jsp:param name="pageFather" value="progress"></jsp:param>
    </jsp:include>


    <div id="page-wrapper">

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
                <div id="in-left" style="width:25%; float:left">
                    <div class="panel panel-primary">
                        <div class="panel-heading text-center">作业进度查看列表</div>
                        <div class="panel-body">
                            <li class="dropdown dropdown1">
                                <a href="#" data-toggle="droplist">上海市</a>
                                <div class="arrow-section arrow-section1">
                                    <div class="arrow-down arrow-down1"></div>
                                </div>
                                <ul class="dropdown-menu panel-menu">
                                    <li class="dropdown dropdown2">
                                        <a href="#" onclick="AllCompany2()">所有公司</a>
                                    </li>
                                    <li class="dropdown dropdown2">
                                        <a href="#" data-toggle="droplist">上海成基市政建设发展有限公司</a>
                                        <div class="arrow-section arrow-section2">
                                            <div class="arrow-down arrow-down2"></div>
                                        </div>
                                        <ul class="dropdown-menu panel-menu">
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="dropdown" onclick="CJgetRoad('AllPackage','xxx')">所有包件</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>
                                        </ul>
                                        <c:forEach items="${chengjiCompany}" var="item">
                                        <ul class="dropdown-menu panel-menu">
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="droplist">${item.packageName}</a>
                                                <div class="arrow-section arrow-section3">
                                                    <div class="arrow-down arrow-down3"></div>
                                                </div>

                                                <ul class="dropdown-menu panel-menu">
                                                    <script>
                                                        var roads='${item.roads}';
                                                        var road = roads.split(',');
                                                        var a="AllRoads";
                                                        var packageName1='${item.packageName}';
                                                        document.write("<li ><a href='#'onclick='CJgetRoad("+packageName1+","+a+")'>所有路段</a></li>");
                                                        for(var i=0;i<road.length;i++){
                                                            document.write("<li><a href='#' onclick='CJgetRoad("+packageName1+","+road[i]+")'>"+road[i]+"</a></li>");
                                                        }
                                                    </script>
                                                </ul>
                                            </li>
                                        </ul>
                                        </c:forEach>

                                    <li class="dropdown dropdown2">
                                        <a href="#" data-toggle="droplist">上海高架养护管理有限公司</a>
                                        <div class="arrow-section arrow-section2">
                                            <div class="arrow-down arrow-down2"></div>
                                        </div>
                                        <ul class="dropdown-menu panel-menu">
                                            <li class="dropdown dropdown3">
                                                <a href="#" data-toggle="dropdown" onclick="GJgetRoad('AllPackage','xxx')">所有包件</a>
                                                <div class="arrow-section arrow-section3">
                                                </div>
                                            </li>
                                        </ul>
                                        <c:forEach items="${gaojiaCompany}" var="item">
                                            <ul class="dropdown-menu panel-menu">
                                                <li class="dropdown dropdown3">
                                                    <a href="#" data-toggle="droplist">${item.packageName}</a>
                                                    <div class="arrow-section arrow-section3">
                                                        <div class="arrow-down arrow-down3"></div>
                                                    </div>
                                                    <ul class="dropdown-menu panel-menu">
                                                        <script>
                                                            var roads='${item.roads}';
                                                            var road = roads.split(',');
                                                            var a="AllRoads";
                                                            var packageName1='${item.packageName}';
                                                            document.write("<li><a href='#' onclick='GJgetRoad("+packageName1+","+a+")'>所有路段</a></li>");
                                                            for(var i=0;i<road.length;i++){
                                                                document.write("<li><a href='#' onclick='GJgetRoad("+packageName1+","+road[i]+")'>"+road[i]+"</a></li>");
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



                <div id="in-mid" style="width:70%;margin-left: 1%">

                    <div class="panel panel-primary panel-right panel-index">
                        <div class="panel-heading text-center" style="height: 40px;"></div>
                        <div class="panel-body">
                            <div class="text-center">
                                上海市全包件工作情况
                                <select class="table-input" id="select-time">

                                    <option value="month">本月</option>
                                    <option value="year">本年</option>
                                    <option value="day" selected="selected">本日</option>
                                </select>
                            </div>
                            <div class="panel-row-left text-center">
                                <h5 style="margin-bottom: 40px;">作业进度与时间进度表</h5>
                                <div class="progressbar_1" >
                                    <div class="bar" style="width: 50%;"></div>
                                </div>
                                <span style="margin-left: 20px;">50%</span>
                                <span>247km</span>
                            </div>
                            <div class="panel-row-left">
                                <div class="panel-section-left">
                                    <div id="container" style="width:25%;height:36%;position: absolute;left:49%"></div>
                                </div>
                                <div class="panel-section-left">
                                    <div id="container1" style="width:25%;height:36%;position: absolute;left:74%"></div>
                                </div>
                                <div class="clearboth"></div>
                            </div>
                        </div>
                    </div>
                </div><!--in-mid-->



            </div><!--index-->


        </div><!-- /.row -->

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->


<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script>

    $('a[data-toggle="droplist"]').click(function(e) {
        e.preventDefault();
        $(this).nextAll().toggle();
    });
$("#select-time").change(function(){

    var obj = $("#select-time").val();
    var myDate = new Date();
    var year1 = myDate.getFullYear();    //获取完整的年份(4位,1970-????)
    var month1 = myDate.getMonth();       //获取当前月份(0-11,0代表1月)
    var day1 = myDate.getDate();        //获取当前日(1-31)
    if(obj == "day"){
        window.location.href="progress1-day?year="+year1+"&month="+month1+"&day="+day1+"&company=" + company + "&packageName=" + packagename + "&Roads=" + roads;
    }
    else if(obj == "month"){
        window.location.href="Progress1?year="+year1+"&month="+month1+"&company=" + company + "&packageName=" + packagename + "&Roads=" + roads;}
    else {window.location.href="progress1-year?year="+year1+"&company=" + company + "&packageName=" + packagename + "&Roads=" + roads;}
});
var packagename,roads;
var company;
    $(function(){
        $("#progress").dropdown('toggle');
    });
    $(document).ready(function () {
        setChart();
    });
    function setChart(){
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
                    fontSize:"12px"
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
                    ['有效作业率',   45.0],
                    ['无效作业率',       55.0],

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
                    fontSize:"12px"
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
</script>

</body>
</html>