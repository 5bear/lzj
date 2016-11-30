<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/19
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String Company= (String) session.getAttribute("company");
%>
<html lang="en">
<head>
    <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="IE=edge"><%--最高兼容模式兼容IE--%>
    <meta name="description" content="">
    <meta name="author" content="">

    <title>上海市快速路养护作业监管设施完善工程</title>

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

<div id="page-wrapper" class="panel-wrapper">

<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb">
            <li><a href="index.html"><i class="icon-dashboard"></i> 进度管理</a></li>
            <li class="active"><i class="icon-file-alt"></i> 养护进度监控</li>
        </ol>
    </div>
</div><!-- /.row -->

<div class="row">
<div class="col-sm-3">
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
    </div>

    <div class="col-sm-9">

    <div class="row">
    <div class="col-sm-12 text-right search-row">
    <select name="" id="select-time">
    <option value="day">本日</option>
    <option value="month" >本月</option>
    <option value="year" selected="selected">本年</option>
    </select>
    </div>
    <div class="col-sm-12 text-center table-title time-row" id="title">
    工作情况
    </div>
    </div>

    <div class="row">
    <div class="col-sm-12 text-center">
        <table class="table vertical-table progress-table">
            <tbody>
            <tr class="blue-tr">
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
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
            </tr>
            <tr>
                <td>匝道覆盖率<br/>(单位：%)</td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>
                <td ></td>

            </tr>
        </tbody>
            </tbody>
        </table>
    </div>
    <div class="col-sm-12">注：未清扫则为N，为白色；1-59之间为红色，60-79之间为黄色，80-100之间为绿色。点击跳转详情。</div>
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
    var colour="";
    var packagename;

    var EffectiveDistance;
    var EffectiveCoverage;
    var year;
    var work1 = "";
    var zadao1 = "";
    var company= '${company}';
    var packageName= '${packageName}';
    var Roads='${Roads}';
    $(document).ready(function () {
        roads.length=0;
        if(Roads==0){
            AllCompany(company);
        }
        else if(company != 0 && packageName!=0 &&Roads!=0) {
            packagename=packageName;
            if(packagename.substr(packagename.length-4,4)=="所有路段")
                document.getElementById("title").innerHTML=company+" "+packagename+"工作情况";
            else if(packagename=="AllPackage")
                document.getElementById("title").innerHTML=company+" "+"所有包件工作情况";
            else if(packagename=="Allcompany") {
                document.getElementById("title").innerHTML = "上海市全公司全包件工作情况";
                AllCompany(company);
            }
            else
                document.getElementById("title").innerHTML=company+" "+packagename+" "+Roads+"工作情况";
            roads = Roads.split(',');
            getYear();
            work1="<tr><td>有效作业率<br/>(单位：%)</td>";
            zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
            getTable(roads);
            getdata();
        }
    });
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
            dataType: "json",
            async : false,                   //设置同步
            data:{
                company:company,
            },
            success: function (data) {
                var lineName="";
                $(data).each(function (index) {
                    lineName=data[index].line;
                    roads.push(lineName);
                })
            }
        });
        getYear();
        work1="<tr><td>有效作业率<br/>(单位：%)</td>";
        zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
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
        getYear();
        work1="<tr><td>有效作业率<br/>(单位：%)</td>";
        zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";

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
        getYear();
        work1="<tr><td>有效作业率<br/>(单位：%)</td>";
        zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";

        getTable(roads);

        getdata();
    }

    function getYear(){
        var myDate = new Date();
        year = myDate.getFullYear();
    }
    var roads=new Array();
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
            url:"progress1-year/getMonthByYear",
            type:"get",
            data:{
                year:year,
                Roads:roads
            },
            traditional: true,
            dataType: "json",
            async : false,                   //设置同步
            success:function(data) {
                getTotal(data);                                       //作业+匝道                                       //作业+匝道

            }
        });
    }
    var totalDistance=[0,0,0,0,0,0,0,0,0,0,0,0];
    var totalCoverage=[0,0,0,0,0,0,0,0,0,0,0,0];
    function getTotal(distance){

        for(var a= 0;a<12;a++)
        {
            totalDistance[a]+=distance[a];
        }
        for(var b= 12;b<24;b++)
        {
            totalCoverage[b-12]+=distance[b];
        }
        toDistance=distance[24];
        toCoverage=distance[25];
        if(toDistance>100)
            toDistance=100;
        if(toCoverage>100)
            toCoverage=100;
    }


    var toDistance = 0;  //合计
    var toCoverage = 0;  //合计
    function getdata(){
        for(var a= 0;a<12;a++) {
            EffectiveDistance = (totalDistance[a]).toFixed(2);
            EffectiveCoverage=(totalCoverage[a]).toFixed(2);
            if(EffectiveDistance>100) {
                EffectiveDistance = "100.00";
            }

            if(EffectiveCoverage>100) {
                EffectiveCoverage = "100.00";
            }
            setTable(a + 1);
        }

        work1+= "<td>"+(toDistance).toFixed(2)+"%</td></tr>"
        zadao1 += "<td>"+(toCoverage).toFixed(2)+"%</td></tr>"
        $("#work").html(work1 + zadao1);
        toDistance=0;
        toCoverage=0;
        totalDistance=[0,0,0,0,0,0,0,0,0,0,0,0];
        totalCoverage=[0,0,0,0,0,0,0,0,0,0,0,0];
    }

    function setTable(month) {
        var Month="";
        if(month<10)
            Month="0"+month;
        else
            Month=month;
        if (EffectiveDistance >=0 && EffectiveDistance <= 59)
            colour = "red";
        else if (EffectiveDistance >=60 && EffectiveDistance <= 79)
            colour = "yellow";
        else if (EffectiveDistance >=80 )
            colour = "green";
        if (EffectiveDistance == 0) {
            work1 += "<td >N</td>";

            zadao1 += " <td></td>";
        }
        else {
            work1 += "<td class=" + colour + "><a href='Progress1?year=" + year +"&month=" + Month + "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads + "'>" + EffectiveDistance +"%"+ "</a></td>";

            zadao1 += " <td>" + EffectiveCoverage +"%"+ "</td>";
        }
    }

</script>
    </body>
    </html>
