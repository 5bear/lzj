<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/5/9
  Time: 下午8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
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
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/panel-dropdown.css"/>

    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>

    <script src="js/bootstrap.js"></script>

    <style>
        #index { width:100%;height:100%; min-width:1000px;background-color:transparent; position:relative;}
        #in-left { width:100%; height:90%; margin:0px; padding:0px; float:left; background-color:transparent;}ding:0px; float:left; background-color:transparent;margin-left:5px}

        .bt{
            height: 22px;
            width: 52px;
            position: absolute;
            border:0;
        }
        .map_bt
        {
            border: 0;
            width: 22px;
            position:absolute;
        }


        #triangle
        {
            width: 0;
            height: 0;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-top: 10px solid rgb(247,147,30);
            position: absolute;
            top:70px;
            left:50px;

        }




        .txt
        {
            position: absolute;
            top: 10px;
            font-size: 11px;
            left: 8px;
            color:#FFF;

        }

        .txt p{margin:2px}
        #in-mid img{ height:91%}
        #in-mid video
        {	width: 12%;
            height: 73px;
            position: absolute;
            left: 513px;
        }
        .hour{
            border: none;
            background-color: #F2F2F2;
            border-radius: 5px;
            padding: 3px 6px;
            margin-right: 10px;
            width: 150px;
            color: rgb(62,133,167);
        }
        .year{
            border: none;
            background-color: #F2F2F2;
            border-radius: 5px;
            padding: 3px 6px;
            margin-right: 10px;
            width: 150px;
            color: rgb(62,133,167);
        }
        .tt{
            border: none;
            background-color: #F2F2F2;
            border-radius: 5px;
            padding: 3px 6px;
            margin-right: 10px;
            width: 150px;
            color: rgb(62,133,167);
        }
        #xuanze{
            border: none;
            background-color: #F2F2F2;
            border-radius: 5px;
            padding: 3px 6px;
            margin-right: 10px;
            width: 150px;
            color: rgb(62,133,167);
        }
        .bofangtxt
        {
            position: absolute;
            font-size:9px;
            width: 30px;
            top: 17px;
            height: 17px;
        }

        ul.lanren{width:300px;margin:100px auto;}
        .scale_panel{color:#999;width:200px;position:absolute;line-height:18px;left:-127px;top:-95px;}

        .scale span{width:16px;height:16px;position:absolute;left:1px;top:-3px;cursor:pointer;
            background:url(images/scroll.gif)   no-repeat;}
        .scale{ background-repeat: repeat-x; background-position: 0 100%; background-color: rgb(230,230,230); border-left: 1px
        rgb(41,171,226);solid;  width: 460px; height: 7px; position: relative; font-size: 0px; border-radius: 5px; }

        .scale div{ background-repeat: repeat-x; background-color: #3BE3FF; width: 0px; position: absolute; height: 3px; width: 0; 		           left: 0; bottom: 0; }

        .lanren li{font-size:12px;line-height:50px;position:relative;height:50px;list-style:none;}


        #container{width: 56%;
            height: 600px;
            float: left;
            margin-left: 5px;
            margin-right: 5px;}
    </style>
</head>

<body onload="init('${vType}')">

<div id="wrapper">
    <input type="hidden" id="curoffset" value="${excepDatas.offset}">
    <input type="hidden" id="total" value="${excepDatas.total}">
    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="history3"></jsp:param>
        <jsp:param name="pageFather" value="history"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="html/index.html"><i class="icon-dashboard"></i> 历史数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 异常查询</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12 text-left search-row">
                <input type="text" id="date" value="${date}" placeholder="选择日期"/>
               <%-- <label><input name="vType" type="checkbox" value="清扫车"/>清扫车</label>
                <label><input name="vType" type="checkbox" value="巡视车"/>巡视车</label>
                <label><input name="vType" type="checkbox" value="牵引车"/>牵引车</label>--%>
                <c:choose>
                    <c:when test="${sessionScope.company eq '养护中心'}">
                        <select class="table-input" id="company" onchange="changeCompany()" style="width:235px;"  >
                            <option value="养护中心" <c:if test="${company eq '养护中心'}">selected="selected"</c:if>>选择公司</option>
                            <option value="上海成基市政建设发展有限公司" <c:if test="${company eq '上海成基市政建设发展有限公司'}">selected="selected"</c:if>>上海成基市政建设发展有限公司</option>
                            <option value="上海高架养护管理有限公司" <c:if test="${company eq '上海高架养护管理有限公司'}">selected="selected"</c:if>>上海高架养护管理有限公司</option>
                        </select>
                    </c:when>
                    <c:when test="${sessionScope.company ne '养护中心'}">
                        ${company}
                    </c:when>
                </c:choose>

                <select class="table-input" id="vehicleType" onchange="changeType('${company}')" style="width:235px;">
                    <option value="">选择车辆类型</option>
                    <option value="清扫车" <c:if test="${vtype eq '清扫车'}">selected="selected"</c:if>>清扫车</option>
                    <option value="牵引车" <c:if test="${vtype eq '牵引车'}">selected="selected"</c:if>>牵引车</option>
                    <option value="巡视车" <c:if test="${vtype eq '巡视车'}">selected="selected"</c:if>>巡视车</option>
                </select>

                <input type="text" id="vehicleLicense"  class="tt"  list="lista" placeholder="输入车牌" value="${conV}" style="width: 90px;"/>
                <datalist id="lista">
                    <c:forEach items="${vehicleLicense}" var="item">
                        <option value="${item.vehicleLicense}">${item.vehicleLicense}</option>
                    </c:forEach>
                </datalist>
                <button type="button" class="btn btn-default" onclick="searchExcep()">确认</button>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 text-center">
                <table class="table">
                    <thead>
                    <tr>
                        <th>异常车辆类型</th>
                        <th>车辆牌照</th>
                        <th>异常类型</th>
                        <th>发生日期</th>
                        <th>发生时间段</th>
                        <th>发生路段</th>
                       <%-- <th>操作</th>--%>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${excepDatas.datas}" var="excep">
                        <tr>
                            <td>${excep.vehicleType}</td>
                            <td>${excep.vehicleLicense}</td>
                            <td>${excep.type}</td>
                            <td>${excep.eventDate}</td>
                            <td>${excep.eventTime}</td>
                            <td>${excep.eventRoad}</td>
                           <%-- <td><a onclick="toException(${excep.id})" class="operation"><label><img src="images/eye.png" alt="查看"/>查看详情</label></a>
                            </td>--%>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row text-right">
            <jsp:include page="pagerH3.jsp">
                <jsp:param value="History3" name="url"/>
                <jsp:param value="${excepDatas.total }" name="item"/>
                <jsp:param value="method,date,vType[]" name="param"/>
            </jsp:include>
        </div>

       <%-- <div class="alert" id="exception" style="display: none">
            <p class="alert-title text-center">异常提示</p>
            <div id="excp_content" style="height:150px; overflow-y: auto">
            </div>
            <div class="row text-center">
                <button class="btn btn-default" type="button" onclick="confirmExcp()">确认</button>
            </div>
        </div>--%>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
   /* function init(vType){
        if(vType!=""){
            var vTypes = new Array();
            vTypes = vType.split(",");
            $(vTypes).each(function (i,val){
                $(":checkbox[value='"+val+"']").prop("checked",true);
            });

        }

    }*/
    function toException(id){
        location.href="history3-check/"+id;
    }

    function searchExcep(){
        var date = $("#date").val();
        var selector = document.getElementById("company");
        var index = selector.selectedIndex;
        var company = selector.options[index].value;

        var selector1 = document.getElementById("vehicleType");
        var index1 = selector1.selectedIndex;
        var type = selector1.options[index1].value;

        var vehicleLicense = $("#vehicleLicense").val();

        var gopath="History3?date="+date;
        gopath+="&company="+company+"&vtype="+type+"&conV="+vehicleLicense;


        location.href=gopath;

    }
</script>

<script>

    function changeCompany() {
        var selector = document.getElementById("company");
        var index = selector.selectedIndex;
        var company = selector.options[index].value;

        var selector1 = document.getElementById("vehicleType");
        var index1 = selector1.selectedIndex;
        var type = selector1.options[index1].value;

        $.ajax({
            url: "<%=request.getContextPath()%>/getVehicleByType",
            type: "post",
            data: {
                company: company,
                type: type
            },
            success: function (data) {

                var r = $.parseJSON(data);
                if (r.result == 0) {
                    var list = r.obj;
                    $("#lista").empty();
                    if (list != null && list.length > 0) {
                        $(list).each(function (index, element) {
                            var node = "<option value='"+element.vehicleLicense+"'>" + element.vehicleLicense + "</option>";
                            $("#lista").append(node);
                        });

                    }

                } else {
                    alert(r.msg);
                }
            }
        });


    }


    function changeType(company) {
        var selector = document.getElementById("vehicleType");
        var index = selector.selectedIndex;
        var type = selector.options[index].value;

        if (company == "养护中心") {
            var selector1 = document.getElementById("company");
            var index1 = selector1.selectedIndex;
            var company = selector1.options[index1].value;
        }

        $.ajax({
            url: "<%=request.getContextPath()%>/getVehicleByType",
            type: "post",
            data: {
                company: company,
                type: type
            },
            success: function (data) {

                var r = $.parseJSON(data);
                if (r.result == 0) {
                    var list = r.obj;
                    $("#lista").empty();
                    if (list != null && list.length > 0) {
                        $(list).each(function (index, element) {
                            var node = "<option  value='"+element.vehicleLicense+"'>" + element.vehicleLicense + "</option>";
                            $("#lista").append(node);
                        });

                    }

                } else {
                    alert(r.msg);
                }
            }
        })


    }



    $('#date').datetimepicker({
        lang:'ch',
        timepicker:false,
        format:"Y-m-d",
        yearStart: 2016,
        yearEnd: 2050
    });

</script>
</body>
</html>
