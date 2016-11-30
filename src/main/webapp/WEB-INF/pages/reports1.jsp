<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/4
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">   <meta http-equiv="Pragma" content="no-cache">   <meta http-equiv="cache-control" content="no-cache">   <meta http-equiv="expires" content="-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
</head>

<body>

<div id="wrapper">
    <input type="hidden" id="curoffset" value="${report1Datas.offset}">
    <input type="hidden" id="total" value="${report1Datas.total}">
    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageFather" value="report"></jsp:param>
        <jsp:param name="pageName" value="reports1"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 报表查询</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 牵引车辆位置报表</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <div class="row">
            <div class="col-lg-12 text-right search-row">
                <c:choose>
                    <c:when test="${sessionScope.company eq '养护中心'}">
                        <select id="company" style="width:235px;">
                            <option value="上海成基市政建设发展有限公司" <c:if test="${company eq '上海成基市政建设发展有限公司'}">selected="selected"</c:if>>上海成基市政建设发展有限公司</option>
                            <option value="上海高架养护管理有限公司" <c:if test="${company eq '上海高架养护管理有限公司'}">selected="selected"</c:if>>上海高架养护管理有限公司</option>
                        </select>
                    </c:when>
                    <c:when test="${sessionScope.company ne '养护中心'}" >
                        <select  id="company" disabled="disabled" style="width:235px;">
                            <option value="上海成基市政建设发展有限公司" <c:if test="${company eq '上海成基市政建设发展有限公司'}">selected="selected"</c:if>>上海成基市政建设发展有限公司</option>
                            <option value="上海高架养护管理有限公司" <c:if test="${company eq '上海高架养护管理有限公司'}">selected="selected"</c:if>>上海高架养护管理有限公司</option>
                        </select>
                    </c:when>
                </c:choose>

                <input type="text" id="date" placeholder="选择日期" value="${date}"/>
                <input type="text" id="time" value="${time}" placeholder="选择时间"/>
                <%--<select id="time">
                    <option value="" <c:if test="${time eq ''}">selected="selected"</c:if> >选择时间</option>
                    <option value="上午" <c:if test="${time eq '上午'}">selected="selected"</c:if> >上午</option>
                    <option value="下午" <c:if test="${time eq '下午'}">selected="selected"</c:if> >下午</option>
                </select>--%>
                <button class="btn btn-default" type="button" onclick="search('${sessionScope.company}')">搜索</button>
                <button class="btn btn-default" type="button" onclick="download('${sessionScope.company}')">导出</button>

            </div>
            <div class="col-lg-12 text-center table-title">
                牵引车辆位置信息报表
            </div>
            <div class="col-lg-12 text-right time-row">
                时间：${date}&nbsp;${time}
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 text-center">
                <table class="table">
                    <thead>
                    <tr>
                        <th>责任段</th>
                        <th>车牌号</th>
                        <th>计划待命位置</th>
                        <th>实际待命位置</th>
                        <th>到达时间</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${report1Datas.datas}" var="rp" varStatus="v">
                        <tr>
                            <td>${v.index+1}</td>
                            <td>${rp.vehicleLicense}</td>
                            <td>${rp.planPosition}</td>
                            <td>${rp.realPosition}</td>
                            <td>${rp.arriveTime}</td>
                            <td class="<c:if test="${rp.state eq '待命'}">await</c:if><c:if test="${rp.state eq '出动'}">going</c:if>">
                                    ${rp.state}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row text-right">
            <jsp:include page="pagerR1.jsp">
                <jsp:param value="Reports1" name="url"/>
                <jsp:param value="${report1Datas.total }" name="item"/>
                <jsp:param value="method,company,date,time" name="param"/>
            </jsp:include>
        </div>
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
    $(function(){
        $("#reports").dropdown('toggle');
    });

    $('#date').datetimepicker({
        lang: 'ch',
        timepicker: false,
        format: "Y-m-d",
        yearStart: 2016,
        yearEnd: 2050
    });
    $('#time').datetimepicker({
        datepicker: false,
        format: 'H:i',
        step: 1
    });

    function search(company){
        //选中日期
        var date = $("#date").val();
        var time = $("#time").val();
        //选中公司
        if(company == "养护中心"){
            var selector = document.getElementById("company");
            var index = selector.selectedIndex;
            company = selector.options[index].value;
        }

        //选中时间
       /* var selector1 = document.getElementById("time");
        var index1 = selector1.selectedIndex;
        var time = selector1.options[index1].value;*/

        var goPath = "?company="+company+"&date="+date+"&time="+time;
       /* if(typeof(time) != "undefined" && time!=null && time!=""){
            goPath+="&time="+time;
        }*/
        location.href=goPath;
    }

    function download(company){
        var date = $("#date").val();
        var time = $("#time").val();
        //选中公司
        if(company == "养护中心"){
            var selector = document.getElementById("company");
            var index = selector.selectedIndex;
            company = selector.options[index].value;
        }
      /*  //选中时间
        var selector1 = document.getElementById("time");
        var index1 = selector1.selectedIndex;
        var time = selector1.options[index1].value;*/

        var goPath = "<%=request.getContextPath()%>/download/reports1?company="+company+"&date="+date+"&time="+time;
       /* if(typeof(time) != "undefined" && time!=null && time!=""){
            goPath+="&time="+time;
        }*/

        location.href=goPath;
    }



</script>
</body>
</html>
