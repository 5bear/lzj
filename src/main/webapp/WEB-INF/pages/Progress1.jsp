<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/18
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <div class="col-lg-9">

    <div class="row">
    <div class="col-lg-12 text-right search-row">
    <select name="" id="select-time">
        <option value="day">本日</option>
        <option value="year">本年</option>
        <option value="month" selected="selected">本月</option>
    </select>
    </div>
    <div class="col-lg-12 text-center table-title time-row" id="title">
    工作情况
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
        <td ></td>
        <td ></td>
        <td ></td>
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
        <td ></td>
        <td ></td>
        <td ></td>
    </tr>
    </tbody>
    </tbody>
    </table>
    </div>
    <div class="col-lg-12">注：未清扫则为N，为白色；1-59之间为红色，60-79之间为黄色，80-100之间为绿色。点击跳转详情。</div>
        <div style="width:388px">
            <button class="btn btn-default" id="remark_button">添加备注 </button>
            <button class="btn btn-default" id="search_button">查看备注 </button>
        </div>
    </div>
    </div>
    </div>

    </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->
<div class="modal fade" id="Remark" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">添加备注</h4>
            </div>
            <div class="modal-body text-left">
                作业时间：<input type="text" id="year" placeholder="日期" class="year" style="width: 100px; margin-right: 5px;"/>
            </div>
            <div class="modal-body text-left">
                实际有效作业率：<input id="RealDistance" readOnly="true"/>%
                调整有效作业率：<input id="TheoryDistance" />%
            </div>
            <div class="modal-body text-left">
                实际匝道覆盖率：<input id="RealCorvage" readOnly="true"/>%
                调整匝道覆盖率：<input id="TheoryCorvage" />%
            </div>
            <div class="modal-body text-left">
                备注信息：<textarea id="input_remark" cols="5" rows="2" style="width: 500px;"></textarea>
            </div>
            <div>
                调整数据不填即默认为实际数据
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="save_remark()">保存</button>
                <button type="button" class="btn btn-default" onclick="hide()">取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.datetimepicker.js"></script>
    <script>
        function hide(){
                $("#Remark").modal('hide');
                $('#Remark').html('<div class="modal-dialog"> <div class="modal-content"> ' +
                        '<div class="modal-header"> <h4 class="modal-title">添加备注</h4> </div> ' +
                        '<div class="modal-body text-left">' +
                        '作业时间：<input type="text" id="year" placeholder="日期" class="year" style="width: 100px; margin-right: 5px;"/> </div> <div class="modal-body text-left">' +
                        '实际有效作业率：<input id="RealDistance" readOnly="true"/>%' +
                        '调整有效作业率：<input id="TheoryDistance" />% </div> <div class="modal-body text-left">' +
                        '实际匝道覆盖率：<input id="RealCorvage" readOnly="true"/>%' +
                        '调整匝道覆盖率：<input id="TheoryCorvage" />% ' +
                        '</div> <div class="modal-body text-left">' +
                        '备注信息：<textarea id="input_remark" cols="5" rows="2" style="width: 500px;"></textarea> ' +
                        '<div>调整数据不填即默认为实际数据</div>'+
                        '</div> <div class="modal-footer"> ' +
                        '<button type="button" class="btn btn-default" onclick="save_remark()">保存</button> ' +
                        '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> ' +
                        '</div> ' +
                        '</div><!-- /.modal-content --> ' +
                        '</div><!-- /.modal-dialog -->')
                $('#year').datetimepicker({
                    lang:'ch',
                    timepicker:false,
                    format:"Y-m-d",
                    yearStart: 2015,
                    yearEnd: 2050
                });
                $("#year").blur(function(){
                    var time = document.getElementById("year").value;
                    $.ajax({
                        url:"progress1-day/getDay",
                        type:"get",
                        data:{
                            year:time.substr(0,4),
                            month:time.substr(5,2),
                            day:time.substr(8,2),
                            Roads:roads
                        },
                        dataType: "json",
                        traditional: true,
                        async : false,                   //设置同步
                        success:function(data) {
                            document.getElementById("RealDistance").value = data[0];
                            document.getElementById("RealCorvage").value = data[2];
                        }
                    });
                });
        }
        $('a[data-toggle="droplist"]').click(function(e) {
        e.preventDefault();
        $(this).nextAll().toggle();
    });
        $('#year').datetimepicker({
            lang:'ch',
            timepicker:false,
            format:"Y-m-d",
            yearStart: 2015,
            yearEnd: 2050
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
    var year= '${year}';
    var month = '${month}';
        var company= '${company}';
        var packageName= '${packageName}';
        var Roads='${Roads}';

        var roads=new Array();
    var packagename;
    var EffectiveDistance;
    var EffectiveCoverage;
    var work1 = "";
    var zadao1 = "";
        $(document).ready(function () {
            roads.length=0;
            if(company != 0 && packageName!=0 &&Roads!=0) {
                packagename = packageName;
                if (packagename.substr(packagename.length - 4, 4) == "所有路段")
                    document.getElementById("title").innerHTML = company + " " + packagename + "工作情况";
                else if (packagename == "AllPackage")
                    document.getElementById("title").innerHTML = company + " " + "所有包件工作情况";
                else if (packagename == "Allcompany") {
                    AllCompany(company);
                }
                else
                    document.getElementById("title").innerHTML = company + " " + packagename + " " + Roads + "工作情况";
                roads = Roads.split(',');
            }
                work1 = "<tr><td>有效作业率<br/>(单位：%)</td>";
                zadao1 = "<tr><td>匝道覆盖率<br/>(单位：%)</td>";
                work2 = "<tr><td>有效作业率<br/>(单位：%)</td>";
                zadao2 = "<tr><td>匝道覆盖率<br/>(单位：%)</td>";
                getTable(roads);
                getdata();
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
                data:{
                    company:company,
                },
                async : false,                   //设置同步
                success: function (data) {
                    var lineName="";
                    $(data).each(function (index) {
                        lineName=data[index].line;
                        roads.push(lineName);
                    })
                }
            });

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
            work1="<tr><td>有效作业率<br/>(单位：%)</td>";
            zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
            work2="<tr><td>有效作业率<br/>(单位：%)</td>";
            zadao2="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
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
            work1="<tr><td>有效作业率<br/>(单位：%)</td>";
            zadao1="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
            work2="<tr><td>有效作业率<br/>(单位：%)</td>";
            zadao2="<tr><td>匝道覆盖率<br/>(单位：%)</td>";
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
                url:"progress1/getDayByMonth",
                type:"get",
                data:{
                    year:year,
                    month:month,
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
        function getTime(month){
            var day=0;
            var totaldays=0;
            time = year;
            if((time%4==0 && time%100!=0) ||time%400==0)
                totaldays = 366;
            else
                totaldays = 365;
            if(month ==2 ) {
                //alert(time);
                if (totaldays == 366)
                    day = 29;
                else {
                    day = 28;
                }
            }
            else{
                if(month==1||month==3||month==5||month==7||month==8||month==10||month==12)
                    day=31;
                else
                    day=30;
            }

            return day;
        };
        var totalDistance=[];
        var totalCoverage=[];
        for(var i=0;i<getTime(month);i++){
            totalDistance.push(0);
            totalCoverage.push(0);
        }
        function getTotal(distance){
            for(var a= 0;a<getTime(month);a++)
            {
                totalDistance[a]+=distance[a];
            }
            for(var b= getTime(month);b<getTime(month)*2;b++)
            {
                totalCoverage[b-getTime(month)]+=distance[b];
            }
            toDistance=distance[getTime(month)*2];
            toCoverage=distance[getTime(month)*2+1];
            if(toDistance>100)
                toDistance=100;
            if(toCoverage>100)
                toCoverage=100;
        }

        var toDistance = 0;  //合计
        var toCoverage = 0;  //合计
        function getdata(){
            for(var a= 0;a<getTime(month);a++) {
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
            for(var i=getTime(month);i<31;i++){
                work2+= "<td></td>"
                zadao2 += "<td></td>"
            }
            work2+= "<td>"+(toDistance)+"%</td></tr>"
            zadao2 += "<td>"+(toCoverage)+"%</td></tr>"
            $("#work1").html(work1 + zadao1);
            $("#work2").html(work2 + zadao2);


            toDistance=0;
            toCoverage=0;
            totalDistance.length=0;
            totalCoverage.length=0;
            for(var i=0;i<getTime(month);i++){
                totalDistance.push(0);
                totalCoverage.push(0);
            }
        }


    function setTable(day) {
        var day1="";
        if(day<=16) {
            if(day<10)
                day1="0"+day;
            else
                day1=day;
            if (EffectiveDistance >= 0 && EffectiveDistance <= 59)
                colour = "red";
            else if (EffectiveDistance >= 60 && EffectiveDistance <= 79)
                colour = "yellow";
            else if (EffectiveDistance >= 80)
                colour = "green";
            if (EffectiveDistance == 0) {
                work1 += "<td >N</td>";

                zadao1 += " <td></td>";
            }
            else {
                work1 += "<td class=" + colour + "><a href='progress1-day?year=" + year + "&month=" + month + "&day=" + day1 + "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads + "'>" + EffectiveDistance+"%" + "</a></td>";

                zadao1 += " <td>" + EffectiveCoverage + "%</td>";
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
                work2 += "<td >N</td>";
                zadao2 += " <td></td>";
            }
            else {
                work2 += "<td class=" + colour + "><a href='progress1-day?year=" + year + "&month=" + month + "&day=" + day + "&company=" + company + "&packageName=" + packagename + "&Roads=" + roads +  "'>" + EffectiveDistance+"%" + "</a></td>";

                zadao2 += " <td>" + EffectiveCoverage + "%</td>";
            }
        }
    }
        $("#remark_button").click(function() {
            $.ajax({
                url:"Rules/getPower",
                type:"get",
                data:{
                    account:"<%=session.getAttribute("account")%>",
                },
                async : false,
                success:function(data){
                    power=data;
                }
            })
            if(power=="noPower"){
                alert("没有操作权限");
                return;
            }
            $("#Remark").modal('show');
            <%--location.href="<%=request.getContextPath()%>/Progress1-remark";//?company="+company+"&date="+date+"&time="+time;--%>
        })
        $("#year").blur(function(){
            var time = document.getElementById("year").value;
            $.ajax({
                url:"progress1-day/getDay",
                type:"get",
                data:{
                    year:time.substr(0,4),
                    month:time.substr(5,2),
                    day:time.substr(8,2),
                    Roads:roads
                },
                dataType: "json",
                traditional: true,
                async : false,                   //设置同步
                success:function(data) {
                    document.getElementById("RealDistance").value = data[0];
                    document.getElementById("RealCorvage").value = data[2];
                }
            });
        });
        function save_remark(){
            var year = document.getElementById("year").value;
            var RealDistance = document.getElementById("RealDistance").value;
            var RealCorvage = document.getElementById("RealCorvage").value;
            var TheoryDistance = document.getElementById("TheoryDistance").value;
            var TheoryCorvage = document.getElementById("TheoryCorvage").value;
            var Remark = document.getElementById("input_remark").value;
            if(year=="") {
                alert("请选择时间");
                return;
            }
            if(TheoryDistance == "")
                TheoryDistance = RealDistance;
            if(TheoryCorvage == "")
                TheoryCorvage = RealCorvage;
            if(isNaN(TheoryDistance) || isNaN(TheoryCorvage)){
                alert("调整数据不是数字")
                return;
            }
            if(TheoryDistance>100 || TheoryCorvage>100){
                alert("调整数据超过100%")
                return;
            }
            $.ajax({
                url: "progress1/setRemark",
                type: "post",
                data: {
                    year: year,
                    Roads: roads,
                    RealDistance: RealDistance,
                    RealCorvage: RealCorvage,
                    TheoryDistance:TheoryDistance,
                    TheoryCorvage:TheoryCorvage,
                    Company:company,
                    Remark: Remark
                },
                traditional: true,
                async: false,                   //设置同步
                success: function (data) {
                    if(data == 'success'){
                        $("#Remark").modal('hide');
                        alert("添加成功");
                        parent.location.reload();
                        $('#Remark').html('<div class="modal-dialog"> <div class="modal-content"> ' +
                                '<div class="modal-header"> <h4 class="modal-title">添加备注</h4> </div> ' +
                                '<div class="modal-body text-left">' +
                                '作业时间：<input type="text" id="year" placeholder="日期" class="year" style="width: 100px; margin-right: 5px;"/> </div> <div class="modal-body text-left">' +
                                '实际有效作业率：<input id="RealDistance" readOnly="true"/>%' +
                                '调整有效作业率：<input id="TheoryDistance" />% </div> <div class="modal-body text-left">' +
                                '实际匝道覆盖率：<input id="RealCorvage" readOnly="true"/>%' +
                                '调整匝道覆盖率：<input id="TheoryCorvage" />% ' +
                                '</div> <div class="modal-body text-left">' +
                                '备注信息：<textarea id="input_remark" cols="5" rows="2" style="width: 500px;"></textarea> ' +
                                '<div>调整数据不填即默认为实际数据</div>'+
                                '</div> <div class="modal-footer"> ' +
                                '<button type="button" class="btn btn-default" onclick="save_remark()">保存</button> ' +
                                '<button type="button" class="btn btn-default" data-dismiss="modal">取消</button> ' +
                                '</div> ' +
                                '</div><!-- /.modal-content --> ' +
                                '</div><!-- /.modal-dialog -->')
                        $('#year').datetimepicker({
                            lang:'ch',
                            timepicker:false,
                            format:"Y-m-d",
                            yearStart: 2015,
                            yearEnd: 2050
                        });
                        $("#year").blur(function(){
                            var time = document.getElementById("year").value;
                            $.ajax({
                                url:"progress1-day/getDay",
                                type:"get",
                                data:{
                                    year:time.substr(0,4),
                                    month:time.substr(5,2),
                                    day:time.substr(8,2),
                                    Roads:roads
                                },
                                dataType: "json",
                                traditional: true,
                                async : false,                   //设置同步
                                success:function(data) {
                                    document.getElementById("RealDistance").value = data[0];
                                    document.getElementById("RealCorvage").value = data[2];
                                }
                            });
                        });
                    }
                }
            })
        }
        $("#search_button").click(function() {
            var Roads = roads[0];
            for (var i = 1; i < roads.length - 1; i++) {
                Roads += roads[i];
            }
            if (roads.length > 1) {
                Roads += roads[roads.length - 1];
            }
            location.href="<%=request.getContextPath()%>/Progress1-remark?company="+company+"&time="+year+"-"+month+"&roads="+Roads;
        })
    </script>
    </body>
    </html>
