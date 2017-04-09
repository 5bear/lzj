<%--
  Created by IntelliJ IDEA.
  User: as
  Date: 2016/4/21
  Time: 14:17
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
    <%--<style>--%>
        <%--td.green {--%>
            <%--background-color: #A6CE94;--%>
        <%--}--%>
        <%--td.yellow{--%>
            <%--background-color: #FFD971;--%>
        <%--}--%>
    <%--</style>--%>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="Plan1"></jsp:param>
        <jsp:param name="pageFather" value="plan"></jsp:param>
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
                <select name="" style="width:250px" id="company" onchange="javascript:setYear()">
                    <%
                        if(Company.equals("养护中心")||Company.equals("上海成基市政建设发展有限公司")){
                    %>
                    <option value="上海成基市政建设发展有限公司"  selected="selected" >上海成基市政建设发展有限公司</option>
                    <%
                        }
                        if(Company.equals("养护中心")||Company.equals("上海高架养护管理有限公司")){
                    %>
                    <option value="上海高架养护管理有限公司"  >上海高架养护管理有限公司</option>
                    <%
                        }
                    %>
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
                                <th colspan="2" style="width: 15%;">包件</th>
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

    var newYear;
    var yearArray = [];
    var row1='';
    var row2='';
    var row3='';
    var row4='';
    var row5='';
    var row6='';
    var row = '';
    var totaldays=0;
    var BJcounts=0;
    var totalmileage=0;
    var company=0;
    var year=0;
    $(document).ready(function() {
        getCompany();
        $.ajax({
            url: "plan1/getYear",
            type: "get",
            dataType: "json",
            async : false,                   //设置同步
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
                yearArray.sort(des);
                for(var i=0;i<yearArray.length;i++){
                    row6+="<option value='"+yearArray[i]+"' selected='selected'>"+yearArray[i]+"年</option>"
                }
                year=yearArray[yearArray.length-1];
                $("#year").html(row6);
            }
        })
        $.ajax({
            url: "plan1/search",
            type: "get",
            dataType: "json",
            async : false,
            data: {
                company:company,
                year:year
            },
            success: function (data) {
                BJcounts=data.length;
                var BJ=1;
                var totalmileage=[];
                var totaltime=[];
                $(data).each(function (index) {
                        totalmileage.push(data[index].distance);
                        totaltime.push(data[index].time);
                        row1 = "<tr><td rowspan='2'id=" + "Mileage" + BJ+ ">" + BJ+". " + data[index].packageName + "</a></td>";
                        row2 = "<td class='table-th'>里程数(单位：km)</td>";
                        for (var i = 1; i <= 12; i++) {
                            row2 += "<td id=" + "Mileage" + BJ + i + "></td>";
                        }
                        row2 += "<td class='green' id=" + "Mileage" + BJ + 13 + "></td>";
                        row2 += "</tr>";
                        row3 = "<tr> <td>次数</td> ";
                        for (var i = 1; i <= 12; i++) {
                            row3 += "<td id=" + "Time" + BJ + i + "></td> ";
                        }
                        row3 += "<td class='yellow' id=" + "Time" + BJ + 13 + "></td> ";
                        row3 += "</tr>";
                        row += row1 + row2 + row3;
                        $("#context").html(row);

                    BJ++;
                })
                getTime(1);  //赋值totaldays
                var a=0;
                for (var Bj = 1; Bj <=BJcounts; Bj++) {    //包件
                    var x=Number(totaltime[Bj-1]) % Number(totaldays);
                    var y=0;
                    for (var i = 1; i <= 12; i++) {       //月份
                        //alert("包件"+Bj+j);
                        y=0;
                        if(x>=Number(getTime(i))){
                            x=x-Number(getTime(i));
                            y=Number(getTime(i));
                        }
                        else {
                            y = x;
                            x=0;
                        }
                        document.getElementById('Time'+Bj+i).innerHTML = parseInt(Number(totaltime[Bj-1]) / Number(totaldays)) * Number(getTime(i))+y;
                    }
                    document.getElementById('Time'+Bj+'13').innerHTML = totaltime[Bj-1];
                }
                for(var BJ=1;BJ<=totalmileage.length;BJ++) {
                    var x=Number(totaltime[BJ-1]) % Number(totaldays);
                    var y=0;
                    for (var i = 1; i <= 12; i++) {       //月份
                        y=0;
                        if(x>=Number(getTime(i))){
                            x=x-Number(getTime(i));
                            y=Number(getTime(i));
                        }
                        else {
                            y = x;
                            x=0;
                        }
                        var m=parseInt(Number(totaltime[BJ-1]) / Number(totaldays)) * Number(getTime(i))+y;

                       document.getElementById('Mileage' + BJ + i).innerHTML =(Math.round((Number(totalmileage[BJ-1]))*m)/1000);  //取整数
                    }
                    document.getElementById('Mileage' + BJ + '13').style.backgroundColor = "#A6CE94";
                    document.getElementById('Mileage' + BJ + '13').innerHTML = (totalmileage[BJ-1] * totaltime[BJ-1]/1000);
                }
                row4 = "<tr> <td rowspan='2'>合计</td> <td class='table-th'>里程数(单位：km)</td>";
                for(var i=1;i<=12;i++) {
                    row4 += "<td class='green' id="+"totalMileage"+ i +"></td>";
                }
                row4 +="<td rowspan='2' id='total'></td> </tr>";
                row5 ="<tr><td>次数</td>"
                for(var i=1;i<=12;i++) {
                    row5 += "<td class='yellow' id="+"totalTime"+i+"></td>";
                }
                row5+="</tr>";
                $("#total").html(row4+row5);


                setTotalMileage();
                setTotalTime();
            }
        })
        select1()
    })

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
            type: "get",
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
        var day=0;
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



    var tolMileage;
    function setTotalMileage(){
        for (var i = 1; i <= 12; i++) {       //月份
            tolMileage=0;
            for (var Bj = 1; Bj <= BJcounts; Bj++) {    //包件
                tolMileage += Number(document.getElementById("Mileage"+Bj+i).innerHTML);
            }
            document.getElementById('totalMileage'+ i).innerHTML = tolMileage.toFixed(2);
        }
    }
    var tolTime;
    function setTotalTime(){
        for (var i = 1; i <= 12; i++) {       //月份
            tolTime=0;
            for (var Bj = 1; Bj <= BJcounts; Bj++) {    //包件
                tolTime += Number(document.getElementById('Time'+Bj+i).innerHTML);
            }
            document.getElementById('totalTime'+ i).innerHTML = tolTime;
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
            type: "get",
            async : false,
            dataType: "json",
            data: {
                company:company,
                year:year
            },
            success: function (data) {
                BJcounts=data.length;
                var BJ=1;
                var totalmileage=[];
                var totaltime=[];
                $(data).each(function (index) {
                    totalmileage.push(data[index].distance);
                    totaltime.push(data[index].time);
                    row1= "<tr><td rowspan='2'id=" + "Mileage" + BJ+ ">" + BJ+". " + data[index].packageName + "</a></td>";
                    row2 = "<td class='table-th'>里程数(单位：km)</td>";
                    for (var i = 1; i <= 12; i++) {
                        row2 += "<td  id=" + "Mileage" + BJ + i + "></td>";
                    }
                    row2 += "<td class='green' id=" + "Mileage" + BJ + 13 + "></td>";
                    row2 += "</tr>";
                    row3 = "<tr> <td>次数</td> ";
                    for (var i = 1; i <= 12; i++) {
                        row3 += "<td id=" + "Time" + BJ + i + "></td> ";
                    }
                    row3 += "<td class='yellow' id=" + "Time" + BJ + 13 + "></td>";
                    row3 += "</tr>";
                    row += row1 + row2 + row3;
                    $("#context").html(row);

                    BJ++;
                })
                $("#Mileage"  + "113").css("background", "blue");
                var a=0;
                var total = totaldays;
                for (var Bj = 1; Bj <=BJcounts; Bj++) {    //包件
                    var x=Number(totaltime[Bj-1]) % Number(totaldays);
                    var y=0;
                    for (var i = 1; i <= 12; i++) {       //月份
                        //alert("包件"+Bj+j);
                        y=0;
                        if(x>=Number(getTime(i))){
                            x=x-Number(getTime(i));
                            y=Number(getTime(i));
                        }
                        else {
                            y = x;
                            x=0;
                        }
                        document.getElementById('Time'+Bj+i).innerHTML = parseInt(Number(totaltime[Bj-1]) / Number(total)) * Number(getTime(i))+y;
                    }
                    document.getElementById('Time'+Bj+'13').innerHTML = totaltime[Bj-1];
                }
                for(var BJ=1;BJ<=totalmileage.length;BJ++) {
                    var x=Number(totaltime[BJ-1]) % Number(totaldays);
                    var y=0;
                    for (var i = 1; i <= 12; i++) {       //月份
                        y=0;
                        if(x>=Number(getTime(i))){
                            x=x-Number(getTime(i));
                            y=Number(getTime(i));
                        }
                        else {
                            y = x;
                            x=0;
                        }
                        var m=parseInt(Number(totaltime[BJ-1]) / Number(total)) * Number(getTime(i))+y;

                        document.getElementById('Mileage' + BJ + i).innerHTML =(Math.round((Number(totalmileage[BJ-1]))*m)/1000);  //取整数
                    }
                    document.getElementById('Mileage' + BJ + '13').style.backgroundColor = "#A6CE94";

                    document.getElementById('Mileage' + BJ + '13').innerHTML = (totalmileage[BJ-1] * totaltime[BJ-1]/1000);
                }
                row4 = "<tr> <td rowspan='2'>合计</td> <td class='table-th'>里程数(单位：km)</td>";
                for(var i=1;i<=12;i++) {
                    row4 += "<td class='green'  id="+"totalMileage"+ i +"></td>";
                }
                row4 +="<td rowspan='2' id='total'></td> </tr>";
                row5 ="<tr><td>次数</td>"
                for(var i=1;i<=12;i++) {
                    row5 += "<td class='yellow' id="+"totalTime"+i+"></td>";
                }
                row5+="</tr>";
                $("#total").html(row4+row5);
                setTotalMileage();
                setTotalTime();
            }
        })
    }

</script>
</body>
</html>
