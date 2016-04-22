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
                                                        var packageName='${item.packageName}';
                                                        var roads='${item.roads}';
                                                        var road = roads.split(',');
                                                        for(var i=0;i<road.length;i++){
                                                            document.write("<li onclick=CJgetRoad(packageName,roads[i])>"+road[i]+"</li>");
                                                        }
                                                    </script>
                                                </ul>
                                            </li>
                                        </ul>
                                    </c:forEach>
                                </li>
                                <li class="dropdown dropdown2">
                                    <a href="#" data-toggle="dropdown">上海高架养护公司</a>
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
                                                        for(var i=0;i<road.length;i++){
                                                            document.write("<li onclick=GJgetRoad(packageName,roads[i])>"+road[i]+"</li>");
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
                                <td>有效作业率</td>
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
                                <td>匝道覆盖率</td>
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
        if(obj == "day"){ window.location.href="progress1-day.html";}
        else if(obj == "month"){ window.location.href="progress1.html";}
        else {window.location.href="progress1-year.html";}
    });
    var work1="<tr><td>有效作业率</td>";
    var zadao1="<tr><td>匝道覆盖率</td>";
    var colour="";
    var packagename,roads;
    var company;
    var EffectiveDistance;
    var EffectiveCoverage;
    var Distance=[0,0,0,0,0,0,0,0,0,0,0,0];
    function CJgetRoad(packageName,Roads){
        company="上海成基公司";
        packagename=packageName;
        roads=Roads;
        getTable();
    }
    function GJgetRoad(packageName,Roads){
        company="上海高架养护公司";
        packagename=packageName;
        roads=Roads;
        getTable();
    }
    function getTable(){
        $.ajax({
            url:"/progress1-year/getMonthByYear",
            type:"post",
            dataType: "json",
            data:{
                year:year,
                company:company,
                packageName:packageName,
                Roads:roads
            },
            success:function(data) {
                $(data).each(function (index) {
                    var dis=0;
                    if(data[index].time.substr(5,2)=="01"){                  //////////在某年所有时间里找相同月份
                        dis=Distance[0]+data[index].distance;               ///建立string数组存储匝道覆盖，未清扫为N的情况
                        Distance[0].push(dis);
                    }else if(data[index].time.substr(5,2)=="02"){
                        dis=Distance[1]+data[index].distance;
                        Distance[1].push(dis);
                    }else if(data[index].time.substr(5,2)=="03"){
                        dis=Distance[2]+data[index].distance;
                        Distance[2].push(dis);
                    }else if(data[index].time.substr(5,2)=="04"){
                        dis=Distance[3]+data[index].distance;
                        Distance[3].push(dis);
                    }else if(data[index].time.substr(5,2)=="05"){
                        dis=Distance[4]+data[index].distance;
                        Distance[4].push(dis);
                    }else if(data[index].time.substr(5,2)=="06"){
                        dis=Distance[5]+data[index].distance;
                        Distance[5].push(dis);
                    }else if(data[index].time.substr(5,2)=="07"){
                        dis=Distance[6]+data[index].distance;
                        Distance[6].push(dis);
                    }else if(data[index].time.substr(5,2)=="08"){
                        dis=Distance[7]+data[index].distance;
                        Distance[7].push(dis);
                    }else if(data[index].time.substr(5,2)=="09"){
                        dis=Distance[8]+data[index].distance;
                        Distance[8].push(dis);
                    }else if(data[index].time.substr(5,2)=="10"){
                        dis=Distance[9]+data[index].distance;
                        Distance[9].push(dis);
                    }else if(data[index].time.substr(5,2)=="11"){
                        dis=Distance[10]+data[index].distance;
                        Distance[10].push(dis);
                    }else if(data[index].time.substr(5,2)=="12"){
                        dis=Distance[11]+data[index].distance;
                        Distance[11].push(dis);
                    }
                })
                getdata(Distance,data[index].coverage);
                work += "<td>total</td></tr>"
                zadao1 += "<td>total</td></tr>"
                $("#work").html(work1 + zadao1);
            }
        });
    }
    function getdata(distance,coverage){
        for(var a= 0;a<distance.length;a++)
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
                work1 += "<td class=" + colour + "><a href='/progress1-year/month?month='" + month + "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads + ">" + month + "</a></td>";

                zadao1 += " <td>" + EffectiveCoverage + "</td>";
            }
    }

</script>
</body>
</html>