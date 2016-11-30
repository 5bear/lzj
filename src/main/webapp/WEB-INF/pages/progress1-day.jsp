<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/19
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String Company= (String) session.getAttribute("company");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
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
        td
        {
            white-space: nowrap;
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

                                        <%
                                            if(Company.equals("养护中心")){
                                        %>
                                    <li class="dropdown dropdown2">
                                        <a href="#" onclick="AllCompany()">所有公司</a>
                                    </li>
                                        <%
                                            }
                                        %>


                                            <%
                        if(Company.equals("养护中心")||Company.equals("上海成基市政建设发展有限公司")){
                 %>
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
                                        <c:forEach items="${chengjiCompany}" var="item" varStatus="status">
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
                                                        var a="AllRoads1"+'${status.index}';
                                                        var packageName1='${item.packageName}';
                                                        if(roads=="")
                                                            roads = "NoRoads";
                                                        document.write("<li><a href='#' id='AllRoads1"+'${status.index}'+"' value="+roads+" onclick='CJgetRoad("+"\""+packageName1+"\""+","+"\""+a+"\""+")'>所有路段</a></li>");
                                                        if(roads != "NoRoads") {
                                                            for (var i = 0; i < road.length; i++) {
                                                                document.write("<li><a href='#'onclick='CJgetRoad(" + "\"" + packageName1 + "\"" + "," + "\"" + road[i] + "\"" + ")'>" + road[i] + "</a></li>");
                                                            }
                                                        }
                                                    </script>
                                                </ul>
                                            </li>
                                        </ul>
                                        </c:forEach>
                                                    <%
                        }
                        if(Company.equals("养护中心")||Company.equals("上海高架养护管理有限公司")){
                    %>
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
                                        <c:forEach items="${gaojiaCompany}" var="item" varStatus="status">
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
                                                            var a="AllRoads2"+'${status.index}';
                                                            var packageName1='${item.packageName}';
                                                            if(roads=="")
                                                                roads = "NoRoads";
                                                            document.write("<li><a href='#' id='AllRoads2"+'${status.index}'+"' value="+roads+" onclick='GJgetRoad("+"\""+packageName1+"\""+","+"\""+a+"\""+")'>所有路段</a></li>");
                                                            if(roads != "NoRoads") {
                                                                for (var i = 0; i < road.length; i++) {
                                                                    document.write("<li><a href='#'onclick='GJgetRoad(" + "\"" + packageName1 + "\"" + "," + "\"" + road[i] + "\"" + ")'>" + road[i] + "</a></li>");
                                                                }
                                                            }
                                                        </script>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </c:forEach>
                                    </li>
                                    <%
                                        }
                                    %>
                                </ul>
                            </li>
                        </div>
                    </div>

                </div><!--in-left-->



                <div id="in-mid" style="width:70%;margin-left: 1%">

                    <div class="panel panel-primary panel-right panel-index">
                        <div class="panel-heading text-center" style="height: 40px;"></div>
                        <div class="panel-body">
                            <div class="text-center" id="title">
                                工作情况
                            </div>
                                <select class="table-input" id="select-time">

                                    <option value="month">本月</option>
                                    <option value="year">本年</option>
                                    <option value="day" selected="selected">本日</option>
                                </select>




                            <div class="panel-row-left text-center">
                                <h5 style="margin-bottom: 40px;">作业进度与时间进度表</h5>
                                <div class="progressbar_1" >
                                    <div class="bar" id= "progress3" style="width: 0%;"></div>
                                </div>
                                <span id="progress1" style="margin-left: 20px;">0%</span>
                                <span id ="progress2">0km</span>
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
        var month1 = myDate.getMonth()+1;       //获取当前月份(0-11,0代表1月)
        var day1 = myDate.getDate();        //获取当前日(1-31)
        var month2="";
        var day2="";
        if(month1<10)
            month2="0"+month1;
        else
            month2=month1;
        if(day1<10)
            day2="0"+day1;
        else
            day2=day1;
        if(obj == "day"){
            window.location.href="progress1-day?year="+year1+"&month="+month2+"&day="+day2+ "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads;
        }
        else if(obj == "month"){
            window.location.href="Progress1?year="+year1+"&month="+month2+ "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads;}
        else {window.location.href="progress1-year1?company=" + company + "&packageName=" + packagename + "&Roads=" + roads;}
    });


    $(document).ready(function () {
        roads.length=0;
        if(company != 0 && packageName!=0 &&Roads!=0) {
            packagename=packageName;
            if(packagename.substr(packagename.length-4,4)=="所有路段")
                document.getElementById("title").innerHTML=company+" "+packagename+"工作情况";
            else if(packagename=="AllPackage")
                document.getElementById("title").innerHTML=company+" "+"所有包件工作情况";
            else if(packagename=="Allcompany") {
                    AllCompany(company);
            }
            else
                document.getElementById("title").innerHTML=company+" "+packagename+" "+Roads+"工作情况";
            roads = Roads.split(',');
            getTable(roads);
            getdata();
        }

    });

    var year= '${year}';
    var month = '${month}';
    var company= '${company}';
    var packageName= '${packageName}';
    var Roads='${Roads}';
    var day='${day}';
    var roads=new Array();
    var packagename;
    var EffectiveDistance;
    var EffectiveCoverage;
    function AllCompany(company){
        roads.length=0;
        packagename="Allcompany";
        if(company == '养护中心')
            document.getElementById("title").innerHTML="上海市全公司全包件工作情况";
        else if(company == '上海成基市政建设发展有限公司')
            document.getElementById("title").innerHTML="上海成基市政建设发展有限公司全包件工作情况";
        else if(company == '上海高架养护管理有限公司')
            document.getElementById("title").innerHTML="上海高架养护管理有限公司全包件工作情况";
        $.ajax({
            url:"progress1/AllCompany",
            type:"get",
            data:{
                company:company,
            },
            dataType: "json",
            async : false,                   //设置同步
            success: function (data) {
                var lineName="";
                $(data).each(function (index) {
                    lineName=data[index].line;
                    roads.push(lineName);
                })
            }
        });
        getTable(roads);
        getdata();
    }
    function CJgetRoad(packageName,Roads){
        roads.length=0;
        company="上海成基市政建设发展有限公司";
        packagename=packageName;
        if(Roads.substr(0,9)=="AllRoads1") {
            packagename=packagename+" "+"所有路段";
            var b = document.getElementById(Roads).getAttribute("value");
            roads = b.split(',');
            document.getElementById("title").innerHTML=company+" "+packagename+"工作情况";
        }
        else if(packagename=="AllPackage" && Roads=="xxx"){
            getTableAllPackage();
            document.getElementById("title").innerHTML=company+" "+"所有包件工作情况";
        }
        else {
            roads.push(Roads);
            document.getElementById("title").innerHTML=company+" "+packagename+" "+roads[0]+"工作情况";
        }
        getTable(roads);
        getdata();
    }
    function GJgetRoad(packageName,Roads){
        roads.length=0;
        company="上海高架养护管理有限公司";
        packagename=packageName;
        if(Roads.substr(0,9)=="AllRoads2"){
            packagename=packagename+" "+"所有路段";
            var b = document.getElementById(Roads).getAttribute("value");
            roads = b.split(',');
            document.getElementById("title").innerHTML=company+" "+packagename+"工作情况";
        }
        else if(packagename=="AllPackage" && Roads=="xxx"){
            getTableAllPackage();
            document.getElementById("title").innerHTML=company+" "+"所有包件工作情况";
        }
        else {
            roads.push(Roads);
            document.getElementById("title").innerHTML=company+" "+packagename+" "+roads[0]+"工作情况";
        }
        getTable(roads);
        getdata();
    }
    function getTableAllPackage(){
        roads.length=0;
        $.ajax({
            url: "progress1/AllPackage",
            type: "get",
            dataType: "json",
            async : false,                   //设置同步
            data: {
                company: company
            },
            success: function (data) {
                var lineName="";
                $(data).each(function (index) {
                    lineName=data[index].line;
                    roads.push(lineName);
                })

            }
        })
    }
    function getTable(roads){

        $.ajax({
            url:"progress1-day/getDay",
            type:"get",
            data:{
                year:year,
                month:month,
                day:day,
                Roads:roads
            },
            dataType: "json",
            traditional: true,
            async : false,                   //设置同步
            success:function(data) {
                totalDistance+=data[0];                                       //作业+匝道
                toDistance+=data[1];
                totalCoverage+=data[2];
                toCoverage+=data[4];
                toRealCoverage+=data[3];

            }
        });
    }
    var totalCoverage=0;
    var totalDistance=0;
    var toDistance=0;
    var toCoverage=0;
    var toRealCoverage=0;
    function getdata(){
        EffectiveDistance = (totalDistance).toFixed(2);
        EffectiveCoverage=(totalCoverage).toFixed(2);
        if(EffectiveDistance>100){
            EffectiveDistance="100.00";
        }

        if(EffectiveCoverage>100) {
            EffectiveCoverage = "100.00";
        }

        setChart();

        totalDistance=0;
        totalCoverage=0;
        toCoverage=0;
        toRealCoverage=0;
        toDistance=0;
    }
    function setChart(){
        document.getElementById("progress3").style.width=""+EffectiveDistance+"%";
        document.getElementById("progress1").innerHTML=EffectiveDistance+"%";
        document.getElementById("progress2").innerHTML=(toDistance/1000).toFixed(2)+"km";
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
                    ['有效作业率',   Number(EffectiveDistance)],
                    ['无效作业率',   Number(100.0-EffectiveDistance)],

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
                    ["覆盖 "+toRealCoverage+"个",   Number(EffectiveCoverage)],
                    ["未覆盖 "+(toCoverage-toRealCoverage)+"个", Number(100-EffectiveCoverage)],

                ]
            }]
        });

    }



</script>

</body>
</html>