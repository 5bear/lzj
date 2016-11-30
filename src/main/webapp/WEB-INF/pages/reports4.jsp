<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/5/4
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
  <input type="hidden" id="curoffset" value="${report4Datas.offset}">
  <input type="hidden" id="total" value="${report4Datas.total}">
  <!-- Sidebar -->
  <jsp:include page="public.jsp" flush="true">
     <jsp:param name="pageFather" value="report"></jsp:param>
     <jsp:param name="pageName" value="reports4"></jsp:param>
  </jsp:include>

  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href="index.html"><i class="icon-dashboard"></i> 报表查询</a></li>
          <li class="active"><i class="icon-file-alt"></i> 养护车辆超速</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-12 text-right search-row">
        <c:choose>
          <c:when test="${sessionScope.company eq '养护中心'}">
            <select  id="company" style="width:235px;">
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
        <input type="text" id="date" value="${date}" placeholder="选择日期"/>
        <input type="text" id="startTime" value="${startTime}" placeholder="选择起始时间"/>
        <input type="text" id="endTime" value="${endTime}" placeholder="选择结束时间"/>
        <button class="btn btn-default" type="button" onclick="search('${sessionScope.company}')">搜索</button>
        <button class="btn btn-default" type="button" onclick="download('${sessionScope.company}')">导出</button>
      </div>
      <div class="col-lg-12 text-center table-title">
        养护车辆超速
      </div>
      <div class="col-lg-12 text-right time-row">
        时间：${date}&nbsp;<c:if test="${startTime ne ''}">从${startTime}</c:if><c:if
              test="${endTime ne ''}">到${endTime}</c:if>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12 text-center">
        <table class="table">
          <thead>
          <tr>
            <th>公司名称</th>
            <th>车辆牌照</th>
            <th>车辆类型</th>
            <th>车辆使用人</th>
            <th>启始时间</th>
            <th>结束时间</th>
            <th>超速时间(分)</th>
            <th>超速里程(千米)</th>
            <th>最大速度</th>
            <th>最小速度</th>
            <th>原因</th>
            <th>反馈</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${report4Datas.datas}" var="rp" varStatus="v">
            <tr>
              <td>${v.index+1}</td>
              <td>${rp.vehicleLicense}</td>
              <td>${rp.vehicleType}</td>
              <td>${rp.vehicleUser}</td>
              <td>${rp.startTime}</td>
              <td>${rp.endTime}</td>
              <td>${rp.overspeedTime}</td>
              <td><fmt:formatNumber type="number" value="${rp.overspeedMile/1000.00} " maxFractionDigits="2"/></td>
              <td>${rp.maxSpeed}</td>
              <td>${rp.minSpeed}</td>
              <td>${rp.reason}</td>
              <td>${rp.feedback}</td>
            </tr>
          </c:forEach>

          </tbody>
        </table>
      </div>
    </div>
    <div class="row text-right">
      <jsp:include page="pagerR3.jsp">
        <jsp:param value="Reports4" name="url"/>
        <jsp:param value="${report4Datas.total }" name="item"/>
        <jsp:param value="method,company,date,startTime,endTime" name="param"/>
      </jsp:include>
    </div>
  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
  $(function(){
    $("#reports").dropdown('toggle');
  });

  $('#date').datetimepicker({
    lang:'ch',
    timepicker:false,
    format:"Y-m-d",
    yearStart: 2016,
    yearEnd: 2050
  });

  $('#startTime').datetimepicker({
    datepicker: false,
    format: 'H:i',
    step: 10
  });

  $('#endTime').datetimepicker({
    datepicker: false,
    format: 'H:i',
    step: 10
  });

  function search(company){
    //选中日期
    var date = $("#date").val();
    //选中公司
    if(company == "养护中心"){
      var selector = document.getElementById("company");
      var index = selector.selectedIndex;
      company = selector.options[index].value;
    }
    //开始时间
    var startTime = $("#startTime").val();
    //结束时间
    var endTime = $("#endTime").val();

    if((startTime!=null && startTime!="")&&(endTime!=null && endTime!="")&&(startTime>endTime)){
      alert("结束时间必须大于等于开始时间！")
    }else{
      var goPath = "?company="+company+"&date="+date;
      if(typeof(startTime) != "undefined" && startTime!=null && startTime!=""){
        goPath+="&startTime="+startTime;
      }
      if(typeof(endTime) != "undefined" && endTime!=null && endTime!=""){
        goPath+="&endTime="+endTime;
      }
      location.href=goPath;
    }
  }

  function download(company){
    var date = $("#date").val();
    //选中公司
    if(company == "养护中心"){
      var selector = document.getElementById("company");
      var index = selector.selectedIndex;
      company = selector.options[index].value;
    }
    //开始时间
    var startTime = $("#startTime").val();
    //结束时间
    var endTime = $("#endTime").val();
    if((startTime!=null && startTime!="")&&(endTime!=null && endTime!="")&&(startTime>endTime)){
      alert("结束时间必须大于等于开始时间！")
    }else {

      var goPath = "<%=request.getContextPath()%>/download/reports4?company=" + company + "&date=" + date;
      if (typeof(startTime) != "undefined" && startTime != null && startTime != "") {
        goPath += "&startTime=" + startTime;
      }
      if (typeof(endTime) != "undefined" && endTime != null && endTime != "") {
        goPath += "&endTime=" + endTime;
      }
      location.href = goPath;
    }
  }


</script>
</body>
</html>