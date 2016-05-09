<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/19
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>上海市快速路养护监管系统</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/panel-dropdown.css"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="progress1-year"></jsp:param>
        <jsp:param name="pageFather" value="progress"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 进度管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 养护进度监控</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-3">
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
            </div>

            <div class="col-lg-9">

                <div class="row">
                    <div class="col-lg-12 text-right search-row">
                        <select name="" id="select-time">
                            <option value="day">本日</option>
                            <option value="month">本月</option>
                            <option value="year" selected="selected">本年</option>
                        </select>
                    </div>
                    <div class="col-lg-12 text-center table-title time-row">
                        上海市全包件工作情况
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 text-center">
                        <table class="table vertical-table progress-table">
                            <tbody>
                            <tr>
                                <td>月份</td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>合计</td>
                            </tr>
                            <tbody id="work">
                            <tr>
                                <td>有效作业率<br/>(单位：%)</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>匝道覆盖率<br/>(单位：%)</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-12">注：未清扫则为N，为白色；1-59之间为红色，60-79之间为黄色，80-100之间为绿色。点击跳转详情。</div>
                </div>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#progress").dropdown('toggle');
    });

    $('a[data-toggle="dropdown"]').click(function() {
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
    var colour="";
    var packagename,roads;
    var company;
    var EffectiveDistance;
    var EffectiveCoverage;
    var year;
    var work1 = "";
    var zadao1 = "";
    function CJgetRoad(packageName,Roads){
        company="上海成基公司";
        packagename=packageName;
        roads=Roads;
        if(Roads=="AllRoads")
            roads='';
        getYear();
        getTable();
    }
    function GJgetRoad(packageName,Roads){
        company="上海高架公司";
        packagename=packageName;
        roads=Roads;
        if(Roads=="AllRoads")
            roads='';
        getYear();
        getTable();
    }
    function getYear(){
        var myDate = new Date();
        year = myDate.getFullYear();
    }
    function getTable(){
        $.ajax({
            url:"progress1-year/getMonthByYear",
            type:"post",
            dataType: "json",
            data:{
                year:year,
                company:company,
                packageName:packagename,
                roads:roads
            },
            success:function(data) {
                work1="<tr><td>有效作业率<br/>(单位：%)</td>";
                zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
                var Distance=[0,0,0,0,0,0,0,0,0,0,0,0];
                $(data).each(function (index) {
                    if(data[index].time.substr(5,2)=="01"){                  //////////在某年所有时间里找相同月份
                        Distance[0]+=data[index].distance;               ///建立string数组存储匝道覆盖，未清扫为N的情况
                    }else if(data[index].time.substr(5,2)=="02"){
                        Distance[1]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="03"){
                        Distance[2]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="04"){
                        Distance[3]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="05"){
                        Distance[4]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="06"){
                        Distance[5]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="07"){
                        Distance[6]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="08"){
                        Distance[7]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="09"){
                        Distance[8]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="10"){
                        Distance[9]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="11"){
                        Distance[10]+=data[index].distance;
                    }else if(data[index].time.substr(5,2)=="12"){
                        Distance[11]+=data[index].distance;
                    }
                })
                getdata(Distance,zadao);                                       //作业+匝道
                work1+= "<td>total</td></tr>"
                zadao1 += "<td>total</td></tr>"
                $("#work").html(work1 + zadao1);
            }
        });
    }
    function getdata(distance,coverage){
        for(var a= 0;a<12;a++)
        {
            EffectiveDistance = distance[a] / 2;
            EffectiveCoverage = coverage;
            setTable(a+1);
        }
    }
    function setTable(month) {
            if (EffectiveDistance >=1 && EffectiveDistance <= 59)
                colour = "red";
            else if (EffectiveDistance >=60 && EffectiveDistance <= 79)
                colour = "yellow";
            else if (EffectiveDistance >=80 && EffectiveDistance <= 100)
                colour = "green";
            if (EffectiveDistance == 0) {
                work1 += "<td >N</td>";

                zadao1 += " <td></td>";
            }
            else {
                work1 += "<td class=" + colour + "><a href='Progress1?year=" + year +"&month=" + month + "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads + "'>" + EffectiveDistance + "</a></td>";

                zadao1 += " <td>" + EffectiveCoverage + "</td>";
            }
    }

</script>
</body>
</html>
