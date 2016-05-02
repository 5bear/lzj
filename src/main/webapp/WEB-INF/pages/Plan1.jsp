<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/21
  Time: 14:17
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
        <jsp:param name="pageName" value="Plan1"></jsp:param>
        <jsp:param name="pageFather" value="Plan"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 计划管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 养护作业计划</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12 text-left search-row">
                <select name="" id="year">

                </select>
                <select name="" id="company" onchange="javascript:setYear()">
                    <option value="上海成基公司"  selected="selected" >上海成基公司</option>
                    <option value="上海高架公司"  >上海高架公司</option>
                </select>
                <!--<button class="btn btn-default"><input onclick = init()>确定</button>-->
                <input type="button" value = 确定 class="btn btn-default" onclick ="select1()"/>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <table class="table vertical-table plan1-table">
                            <thead>
                            <tr>
                                <th colspan="2"></th>
                                <th>一月</th>
                                <th>二月</th>
                                <th>三月</th>
                                <th>四月</th>
                                <th>五月</th>
                                <th>六月</th>
                                <th>七月</th>
                                <th>八月</th>
                                <th>九月</th>
                                <th>十月</th>
                                <th>十一月</th>
                                <th>十二月</th>
                                <th>合计</th>
                            </tr>
                            </thead>
                            <tbody id="context">

                            </tbody>
                            <tbody id="total">

                            </tbody>
                        </table>
                    </div>
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
        $("#plan").dropdown('toggle');
    });
    $(document).ready(function() {
        getCompany();
        $.ajax({
            url: "plan1/getYear",
            type: "post",
            dataType: "json",
            data: {
                company:company
            },
            success: function (data) {
                yearArray=[];
                $(data).each(function (index) {
                    newYear = data[index].runtime;
                        yearArray.push(newYear);
                })
                uniqueArray(yearArray);
                yearArray.sort(des);          //升序排列
                for(var i=0;i<yearArray.length;i++){
                    row6+="<option value='"+yearArray[i]+"' selected='selected'>"+yearArray[i]+"年</option>"
                }
                $("#year").html(row6);
            }
        })


        getYear();
        $.ajax({
            url: "plan1/search",
            type: "post",
            dataType: "json",
            data: {
                company:company,
                year:year
            },
            success: function (data) {
                BJcounts=data.length;
                var BJ=1;
                var totalmileage=[];

                $(data).each(function (index) {
                        totalmileage.push(data[index].distance);
                        row1 = "<tr><td rowspan='2'id=" + "Mileage" + BJ+ ">"  + data[index].packageName + "</a></td>";
                        row2 = "<td class='table-th'>里程数</td>";
                        for (var i = 1; i <= 13; i++) {
                            row2 += "<td id=" + "Mileage" + BJ + i + "></td>";
                        }
                        row2 += "</tr>";
                        row3 = "<tr> <td>次数</td> ";
                        for (var i = 1; i <= 13; i++) {
                            row3 += "<td id=" + "Time" + BJ + i + "></td> ";
                        }
                        row3 += "</tr>";
                        row += row1 + row2 + row3;
                        $("#context").html(row);

                    BJ++;
                })
                getTime(1);
                for(var BJ=1;BJ<=totalmileage.length;BJ++) {
                    for (var i = 1; i <= 12; i++) {       //月份

                        document.getElementById('Mileage' + BJ + i).innerHTML = Math.round((totalmileage[BJ-1] / totaldays) * getTime(i));  //取整数
                    }
                    document.getElementById('Mileage' + BJ + '13').innerHTML = totalmileage[BJ-1];
                }
                row4 = "<tr> <td rowspan='2'>合计</td> <td class='table-th'>里程数</td>";
                for(var i=1;i<=12;i++) {
                    row4 += "<td id="+"totalMileage"+ i +"></td>";
                }
                row4 +="<td rowspan='2' id='total'></td> </tr>";
                row5 ="<tr><td>次数</td>"
                for(var i=1;i<=12;i++) {
                    row5 += "<td id="+"totalTime"+i+"></td>";
                }
                row5+="</tr>";
                $("#total").html(row4+row5);

                setTime();
                setTotalMileage();
                setTotalTime();
            }
        })
    })
    var newYear;
    var yearArray = [];
    var row1='';
    var row2='';
    var row3='';
    var row4='';
    var row5='';
    var row6='';
    var row = '';
    var totaldays;
    var BJcounts;
    var totalmileage;
    var company;
    var year;
    function des(a,b){
        return a-b;
    }
    function uniqueArray(data){
        data = data || [];
        var a = {};
        for (var i=0; i<data.length; i++) {
            var v = data[i];
            if (typeof(a[v]) == 'undefined'){
                a[v] = 1;
            }
        };
        data.length=0;
        for (var i in a){
            data[data.length] = i;
        }
        return data;
    }
    function getYear(){
        year=document.getElementById("year").value;
        return year;
    }
    function setYear(){
        getCompany();

        $.ajax({
            url: "plan1/getYear",
            type: "post",
            dataType: "json",
            data: {
                company:company
            },
            success: function (data) {
                yearArray=[];
                row6='';
                $(data).each(function (index) {
                    newYear = data[index].runtime;
                    yearArray.push(newYear);
                })
                uniqueArray(yearArray);
                yearArray.sort(des);          //升序排列
                for(var i=0;i<yearArray.length;i++){
                    row6+="<option value='"+yearArray[i]+"' selected='selected'>"+yearArray[i]+"年</option>"
                }
                $("#year").html(row6);
            }
        })

    }
    function getTime(month){
        var day;
        time = document.getElementById("year").value;
        if((time%4==0 && time%100!=0) ||time%400==0)
            totaldays = 366;
        else
            totaldays = 365;
        if(month==2 ) {
            //alert(time);
            if (totaldays = 366)
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

    function getCompany(){
        company = document.getElementById("company").value;
        return company;
    }

    function setTime() {
        for (var Bj = 1; Bj <=BJcounts; Bj++) {    //包件
            for (var i = 1; i <= 12; i++) {       //月份
                //alert("包件"+Bj+j);
                document.getElementById('Time'+Bj+i).innerHTML = getTime(i);
            }
            document.getElementById('Time'+Bj+'13').innerHTML = totaldays;
        }
    };

    var tolMileage;
    function setTotalMileage(){
        for (var i = 1; i <= 12; i++) {       //月份
            tolMileage=0;
            for (var Bj = 1; Bj <= BJcounts; Bj++) {    //包件
                tolMileage += Number(document.getElementById("Mileage"+Bj+i).innerHTML);
            }
            document.getElementById('totalMileage'+ i).innerHTML = tolMileage;
        }
    }
    function setTotalTime(){
        for (var i = 1; i <= 12; i++) {       //月份
            document.getElementById('totalTime'+ i).innerHTML = BJcounts*getTime(i);
        }
    }
    function select1(){
        row1='';
        row2='';
        row3='';
        row4='';
        row5='';
        row='';
        getCompany();
        getYear();
        $.ajax({
            url: "plan1/search",
            type: "post",
            dataType: "json",
            data: {
                company:company,
                year:year
            },
            success: function (data) {
                BJcounts=data.length;
                var BJ=1;
                var totalmileage=[];
                $(data).each(function (index) {
                    totalmileage.push(data[index].distance);
                    row1 = "<tr><td rowspan='2'id=" + "Mileage" + BJ+ ">"  + data[index].packageName + "</a></td>";
                    row2 = "<td class='table-th'>里程数</td>";
                    for (var i = 1; i <= 13; i++) {
                        row2 += "<td id=" + "Mileage" + BJ + i + "></td>";
                    }
                    row2 += "</tr>";
                    row3 = "<tr> <td>次数</td> ";
                    for (var i = 1; i <= 13; i++) {
                        row3 += "<td id=" + "Time" + BJ + i + "></td> ";
                    }
                    row3 += "</tr>";
                    row += row1 + row2 + row3;
                    $("#context").html(row);

                    BJ++;
                })
                for(var BJ=1;BJ<=totalmileage.length;BJ++) {
                    for (var i = 1; i <= 12; i++) {       //月份
                        document.getElementById('Mileage' + BJ + i).innerHTML = Math.round((totalmileage[BJ-1] / totaldays) * getTime(i));  //取整数
                    }
                    document.getElementById('Mileage' + BJ + '13').innerHTML = totalmileage[BJ-1];
                }
                row4 = "<tr> <td rowspan='2'>合计</td> <td class='table-th'>里程数</td>";
                for(var i=1;i<=12;i++) {
                    row4 += "<td id="+"totalMileage"+ i +"></td>";
                }
                row4 +="<td rowspan='2' id='total'></td> </tr>";
                row5 ="<tr><td>次数</td>"
                for(var i=1;i<=12;i++) {
                    row5 += "<td id="+"totalTime"+i+"></td>";
                }
                row5+="</tr>";
                $("#total").html(row4+row5);

                setTime();
                setTotalMileage();
                setTotalTime();
            }
        })
    }

</script>
</body>
</html>
