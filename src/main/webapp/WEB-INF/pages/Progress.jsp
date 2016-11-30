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
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">上海市快速路养护监管系统</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li><a href="index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="base"><i class="fa fa-bar-chart-o"></i> 基础数据 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="base1.html">停车场管理</a></li>
                    <li><a href="base2.html">车辆管理</a></li>
                    <li><a href="base3.html">RFID监测点管理</a></li>
                    <li><a href="base4.html">包件信息管理</a></li>
                    <li><a href="base5.html">电子围栏管理</a></li>
                    <li><a href="base6.html">监管规则管理</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="plan"><i class="fa fa-table"></i> 计划管理 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="plan1.html">养护作业计划</a></li>
                    <li><a href="plan2.html">作业线路管理</a></li>
                    <li><a href="plan3.html">布点计划</a></li>
                    <li><a href="plan4.html">驾驶员计划</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="progress"><i class="fa fa-edit"></i> 进度管理 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li class="active"><a href="progress1.html">养护进度监控</a></li>
                    <li><a href="progress2.html">实时监控</a></li>
                    <li><a href="progress3.html">养护日志管理</a></li>
                </ul>
            </li>

            <li class="dropdown ">
                <a  href="#" class="dropdown-toggle"  data-toggle="dropdown" id="history"><i class="fa fa-font"></i> 历史数据 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="history1.html">历史轨迹查询</a></li>
                    <li><a href="history2.html">历史视频查询</a></li>
                    <li><a href="history3.html">异常查询</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="reports"><i class="fa fa-desktop"></i> 报表查询 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="reports1.html">牵引车辆位置报表</a></li>
                    <li><a href="reports2.html">养护车辆作业区域</a></li>
                    <li><a href="reports3.html">养护车辆作业情况</a></li>
                    <li><a href="reports4.html">养护车辆超速</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="management"><i class="fa fa-wrench"></i>系统管理 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="management1.html">用户管理</a></li>
                    <li><a href="management2.html">权限管理</a></li>
                    <li><a href="management3.html">网络状态图</a></li>
                </ul>
            </li>

        </ul>

        <ul class="nav navbar-nav navbar-right navbar-user">
            <li class="dropdown user-dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎， 领导 <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a href="personalManagement.html"><i class="fa fa-user"></i> 个人信息</a></li>
                    <li class="divider"></li>
                    <li><a href="#"><i class="fa fa-power-off"></i> 安全退出</a></li>
                </ul>
            </li>
        </ul>
    </div><!-- /.navbar-collapse -->
</nav>

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

                    <c:forEach items="${Progress}" var="item">
                                <li class="dropdown dropdown2">
                                <a href="#" data-toggle="dropdown">${item.company}</a>
                                    <div class="arrow-section arrow-section2">
                                        <div class="arrow-down arrow-down2"></div>
                                    </div>
                                <ul class="dropdown-menu panel-menu">

                                    <li class="dropdown dropdown3">
                                        <a href="#" data-toggle="dropdown" onclick="getRoad(${item.roads})">${item.packageName}</a>
                                        <div class="arrow-section arrow-section3">
                                            <div class="arrow-down arrow-down3"></div>
                                        </div>
                                        <ul class="dropdown-menu panel-menu" id="Roads">

                                        </ul>
                                    </li>
                                </ul>
                            </li>
                    </c:forEach>
                        <!--<li class="dropdown dropdown2">
                            <a href="#" data-toggle="dropdown">上海高架养护管理有限公司</a>
                                <div class="arrow-section arrow-section2">
                                    <div class="arrow-down arrow-down2"></div>
                                </div>
                            <ul class="dropdown-menu panel-menu">
                            <li class="dropdown dropdown3">
                                <a href="#" data-toggle="dropdown">包件二</a>
                            <div class="arrow-section arrow-section3">
                            <div class="arrow-down arrow-down3"></div>
                            </div>
                            <ul class="dropdown-menu panel-menu">
                                <li>
                                    <a href="#">所有包间</a>
                                </li>
                                <li><a href="#">中环路</a></li>
                            </ul>
                            </li>
                            <li class="dropdown dropdown3">
                            <a href="#" data-toggle="dropdown">牵引车</a>
                            <div class="arrow-section arrow-section3">
                                <div class="arrow-down arrow-down3"></div>
                            </div>
                            <ul class="dropdown-menu panel-menu">
                                <li>
                                        <a href="#">所有包间</a>
                                </li>
                            <li><a href="#">中环路</a></li>
                            </ul>
                            </li>
                            </ul>
                        </li>-->
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
    <tbody id="work">

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
    <tr>
    <td>有效作业率</td>
    <td class="green"><a href="progress1-day.html">80</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="yellow"><a href="progress1-day.html">70</a></td>
    <td class="red"><a href="progress1-day.html">50</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td class="green"><a href="progress1-day.html">100</a></td>
    <td>N</td>
    <td class="green">80</td>
    </tr>
    <tr>
    <td>匝道覆盖率</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td>80</td>
    <td></td>
    <td>80</td>
    </tr>
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

    $('a[data-toggle="droplist"]').click(function(e) {
        e.preventDefault();
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
    for(var i=1;i<=16;i++){
    if(i<=5)
    colour="red";
    else if (i>5 && i<=10)
    colour = "yellow";
    else
    colour = "green";
    //alert(i+colour);
    work1 +="<td class="+colour+"><a href='progress1-day.html'>"+i+"</a></td>" ;

    zadao1 += " <td>" + 80 + "</td>" ;

    }
    work+="</tr>"
    zadao1+="</tr>"
    $("#work").html(work1+zadao1);

    var row="";
    function getRoad(roads){
        var road = roads.split(',');
        for(var i=0;i<road.length();i++){
            row+="<li> <a href='#'>"+road[i]+"</a> </li>"
        }
        $("#Roads").html(row);
    }
    </script>
    </body>
    </html>
