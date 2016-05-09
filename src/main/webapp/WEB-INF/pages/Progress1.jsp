<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/18
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <jsp:param name="pageName" value="Progress1"></jsp:param>
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
    <option value="month" selected="selected">本月</option>
    <option value="year">本年</option>
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
    <td>日期</td>
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
    <td>13</td>
    <td>14</td>
    <td>15</td>
    <td>16</td>
    </tr>
    <tbody id="work1">
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
        <td></td>
        <td></td>
        <td></td>
    </tr>
    </tbody>
    <tr>
    <td>日期</td>
    <td>17</td>
    <td>18</td>
    <td>19</td>
    <td>20</td>
    <td>21</td>
    <td>22</td>
    <td>23</td>
    <td>24</td>
    <td>25</td>
    <td>26</td>
    <td>27</td>
    <td>28</td>
    <td>29</td>
    <td>30</td>
    <td>31</td>
    <td>合计</td>
    </tr>
    <tbody id="work2">
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

    $('#date1').datetimepicker({
    lang:'ch',
    timepicker:false,
    format:"Y-m-d",
    yearStart: 2016,
    yearEnd: 2050
    });

    $('#date2').datetimepicker({
    lang:'ch',
    timepicker:false,
    format:"Y-m-d",
    yearStart: 2016,
    yearEnd: 2050
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
    var packagename= request.getParameter("packagename");
    var roads =request.getParameter("roads");
    var company=request.getParameter("company");
    var year= request.getParameter("year");
    var month = request.getParameter("month");
    var work1 = "";
    var zadao1 = "";
    var work2 = "";
    var zadao2 = "";
    $(document).ready(function() {
        getTable();
    })

    function CJgetRoad(packageName,Roads){
        company="上海高架公司";
        packagename=packageName;
        roads=Roads;
        if(Roads=="AllRoads")
            roads='';
        getTable();
    }
    function GJgetRoad(packageName,Roads){
        company="上海成基公司";
        packagename=packageName;
        roads=Roads;
        if(Roads=="AllRoads")
            roads='';
        getTable();
    }
    function getTable(){
        $.ajax({
            url:"progress1/getDayByMonth",
            type:"post",
            dataType: "json",
            data:{
                year:year,
                month:month,
                company:company,
                packageName:packagename,
                roads:roads
            },success:function(data) {
                work1="<tr><td>有效作业率<br/>(单位：%)</td>";
                zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
                work2="<tr><td>有效作业率<br/>(单位：%)</td>";
                zadao2="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
                var Distance=[];
                for(var i= 0;i<31;i++) {
                    Distance[i] = 0;
                }
                $(data).each(function (index) {
                    Distance.push(data[index].distance);
                })
                getdata(Distance,zadao);                                       //作业+匝道
                work2+= "<td>total</td></tr>"
                zadao2 += "<td>total</td></tr>"
                $("#work1").html(work1 + zadao1);
                $("#work2").html(work2 + zadao2);
            }
        })
    }
    function getdata(distance,coverage){
        for(var a= 0;a<31;a++)
        {
            EffectiveDistance = distance[a] / 2;
            EffectiveCoverage = coverage;
            setTable(a+1);
        }
    }
    function setTable(day) {
        if(day<=16) {
            if (EffectiveDistance >= 1 && EffectiveDistance <= 59)
                colour = "red";
            else if (EffectiveDistance >= 60 && EffectiveDistance <= 79)
                colour = "yellow";
            else if (EffectiveDistance >= 80 && EffectiveDistance <= 100)
                colour = "green";
            if (EffectiveDistance == 0) {
                work1 += "<td >N</td>";

                zadao1 += " <td></td>";
            }
            else {
                work1 += "<td class=" + colour + "><a href='progress1-day?year=" + year + "&month=" + month + "&day=" + day + "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads + "'>" + EffectiveDistance + "</a></td>";

                zadao1 += " <td>" + EffectiveCoverage + "</td>";
            }
        }
        else{
            if (EffectiveDistance >= 1 && EffectiveDistance <= 59)
                colour = "red";
            else if (EffectiveDistance >= 60 && EffectiveDistance <= 79)
                colour = "yellow";
            else if (EffectiveDistance >= 80 && EffectiveDistance <= 100)
                colour = "green";
            if (EffectiveDistance == 0) {
                work1 += "<td >N</td>";
                zadao1 += " <td></td>";
            }
            else {
                work2 += "<td class=" + colour + "><a href='progress1-day?year=" + year + "&month=" + month + "&day=" + day + "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads + "'>" + EffectiveDistance + "</a></td>";

                zadao2 += " <td>" + EffectiveCoverage + "</td>";
            }
        }
    }

    </script>
    </body>
    </html>
