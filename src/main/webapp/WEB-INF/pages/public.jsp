<%@ page import="java.util.Map" %>
<%@ page import="com.springapp.entity.Account" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/9
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String pageFather=request.getParameter("pageFather");
  String pageName=request.getParameter("pageName");
  session=request.getSession();
  String username= (String) session.getAttribute("username");
    Account account=(Account)session.getAttribute("user");
  Map powerMap= (Map) session.getAttribute("powerMap");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/font-awesome/css/font-awesome.min.css">

<body onload="myTimer()"></body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index">上海市快速路养护作业监管设施完善工程</a>
  </div>
  <!-- /.row -->
  <div class="alert" id="exception" style="display: none">
    <img onclick="turnOff()" style="position: absolute; top: 15px; width: 10px; height: 10px; cursor: pointer; z-index: 10000; left: 370px;" src="http://api0.map.bdimg.com/images/iw_close1d3.gif">

    <p class="alert-title text-center">异常提示</p>
    <div class="allselect" style="padding: 5px">
      <input type="checkbox" name="checkedAll" id="checkedAll"  onclick="if(this.checked==true) { checkAll('excp_checkBox'); } else { clearAll('excp_checkBox'); }">
      <p style="display: inline-block">全选</p>
    </div>
    <div id="excp_content" style="height:150px; overflow-y: auto">
    </div>
    <div class="row text-center">
      <button class="btn btn-default" type="button" onclick="confirmExcp()">确认</button>
    </div>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
      <li class="text-right aside-li">
        <button type="button" class="navbar-aside" title="收起/展开菜单">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </li>
      <li <%if(pageName.equals("index")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li <%if(pageFather.equals("base")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="base"><i class="fa fa-bar-chart-o"></i> 基础数据 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <%
            if(powerMap.get("Park").equals("yes")){
          %>
          <li <%if(pageName.equals("base1")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/Park/list">停车场管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("Vehicle").equals("yes")){
          %>
          <li <%if(pageName.equals("base2")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/Vehicle/list">车辆管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("RFID").equals("yes")){
          %>
          <li <%if(pageName.equals("base3")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/RFID">RFID监测点管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("Package").equals("yes")){
          %>
          <li  <%if(pageName.equals("base4")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/Package/list">包件信息管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("eFence").equals("yes")){
          %>
          <li <%if(pageName.equals("base5")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/eFence">电子围栏管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("Rules").equals("yes")){
          %>
          <li <%if(pageName.equals("base6")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/Rules">监管规则管理</a></li>
          <%
            }
          %>
        </ul>
      </li>

      <li <%if(pageFather.equals("plan")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="plan"><i class="fa fa-table"></i> 计划管理 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <%
            if(powerMap.get("plan1").equals("yes")){
          %>
          <li  <%if(pageName.equals("Plan1")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/plan1">养护作业计划</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("line").equals("yes")){
          %>
          <li <%if(pageName.equals("plan2")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/line">作业线路管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("plan3").equals("yes")){
          %>
          <li <%if(pageName.equals("plan3")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/plan3">布点计划</a></li>
          <%
            }
          %>
          <%--<li <%if(pageName.equals("plan4")) {%>class="active"<%}%>><a href="Driver">驾驶员计划</a></li>--%>
        </ul>
      </li>

      <li <%if(pageFather.equals("progress")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="progress"><i class="fa fa-edit"></i> 进度管理 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <%
            if(powerMap.get("progress1-year").equals("yes")){
          %>
          <li  <%if(pageName.equals("progress1-year") || pageName.equals("Progress1")||pageName.equals("progress1-day")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/progress1-year">养护进度监控</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("progress2").equals("yes")){
          %>
          <li <%if(pageName.equals("progress2")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/progress2">实时监控</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("MaintainLog").equals("yes")){
          %>
          <li <%if(pageName.equals("progress3")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/MaintainLog/list">养护日志管理</a></li>
          <%
            }
          %>
        </ul>
      </li>

      <li <%if(pageFather.equals("history")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a  href="#" class="dropdown-toggle"  data-toggle="dropdown" id="history"><i class="fa fa-font"></i> 历史数据 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <%
            if(powerMap.get("history1").equals("yes")){
          %>
          <li <%if(pageName.equals("history1")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/history1">历史轨迹查询</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("history2").equals("yes")){
          %>
          <li <%if(pageName.equals("history2")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/history2">历史视频查询</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("History3").equals("yes")){
          %>
          <li <%if(pageName.equals("history3")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/History3">异常查询</a></li>
          <%
            }
          %>
        </ul>
      </li>

      <%
        if(powerMap.get("reports").equals("yes")){
      %>
      <li <%if(pageFather.equals("reports")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="reports"><i class="fa fa-desktop"></i> 报表查询 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <%if(pageName.equals("reports1")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/reports1">牵引车辆位置报表</a></li>
          <li <%if(pageName.equals("reports2")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/reports2">养护车辆作业区域</a></li>
          <li <%if(pageName.equals("reports3")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/reports3">养护车辆作业情况</a></li>
          <li <%if(pageName.equals("reports4")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/reports4">养护车辆超速</a></li>
        </ul>
      </li>
      <%
        }
      %>
      <li <%if(pageFather.equals("management")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="management"><i class="fa fa-wrench"></i>系统管理 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <%
            if(powerMap.get("UserManage").equals("yes")){
          %>
          <li <%if(pageName.equals("management1")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/UserManage">用户管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("Power").equals("yes")){
          %>
          <li <%if(pageName.equals("management2")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/Power">权限管理</a></li>
          <%
            }
          %>
          <%
            if(powerMap.get("Management3").equals("yes")){
          %>
          <li <%if(pageName.equals("management3")) {%>class="active"<%}%>><a href="<%=request.getContextPath()%>/Management3">网络状态</a></li>
          <%
            }
          %>
        </ul>
      </li>

    </ul>

    <ul class="nav navbar-nav navbar-right navbar-user">
      <li class="dropdown user-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎， <%=username%> <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="<%=request.getContextPath()%>/PersonalInfo"><i class="fa fa-user"></i> 个人信息</a></li>
          <li class="divider"></li>
          <li><a href="javascript:;" onclick="excepSwitch()"><i class="fa fa-warning"></i> 异常提醒(<%=account.getViewExcpt()==0?"开":"关"%>)</a></li>
          <li class="divider"></li>
          <li><a href="<%=request.getContextPath()%>/logout"><i class="fa fa-power-off"></i> 安全退出</a></li>
        </ul>
      </li>
    </ul>

  </div><!-- /.navbar-collapse -->
</nav>
<script src="<%=request.getContextPath()%>/js/jquery-1.10.2.js"></script>
<script>

  $('a[data-toggle="dropdown"]').click(function() {
    $(this).nextAll().toggle();
  });

</script>
<script>

  $(document).ready(function(){
    $("button.navbar-aside").click(function(){
      if ($("#wrapper").is(".left-wrapper")== true) {
        $(".side-nav").removeClass("left-nav");
        $("#wrapper").removeClass("left-wrapper");
      } else {
        $(".side-nav").addClass("left-nav");
        $("#wrapper").addClass("left-wrapper");
      }
    });
  });
</script>
<script type="text/javascript">
  function checkAll(name) {
    var el = document.getElementsByName(name);
    var len = el.length;
    for(var i=0; i<len; i++) {
      if((el[i].type=="checkbox") && (el[i].name==name)) {
        el[i].checked = true;
      }
    }
  }
  function clearAll(name) {
    var el = document.getElementsByName(name);
    var len = el.length;
    for(var i=0; i<len; i++) {
      if((el[i].type=="checkbox") && (el[i].name==name)) {
        el[i].checked = false;
      }
    }
  }

  function turnOff(){
    $("#exception").css("display","none");
  }
</script>

<script type="text/javascript">
  var idd = 0;
  var t;
  var f=0;
  var timeout = <%=account.getViewExcpt()%>
  function myTimer() {
    if(timeout) return ;
    start(idd);
    t = window.setTimeout("myTimer()", 6000);//设置循环时间
   // alert(t);
  }

  function excepSwitch(){
      $.ajax({
          url: "<%=request.getContextPath()%>/noException",
          type: "post",
          data: {
              id:'<%=account.getId()%>'
          },
          success: function (data) {
              location.reload(true)
          }
      });


  }
  function start(id) {
    // alert(id);
    $.ajax({
      url: "<%=request.getContextPath()%>/getException",
      type: "post",
      data: {
        id: id
      },
      success: function (data) {
        var r = $.parseJSON(data);
        if (r.result == 0) {
          var list = r.obj;
          if (list != null && list.length > 0) {

            var old = $("#exception").css("display");

            $("#exception").css("display","block");


            if(old=="none"){
              clearAll("checkedAll");
              clearAll("excp_checkBox");
            }

            $(list).each(function(index,element){
              var node = "<p style='color: #d82824'><input type='checkbox' name='excp_checkBox' value='"+element.id+"'/><a onclick='toException("+element.id+")'   class='operation'>"+element.vehicleLicense+", "+element.vehicleType+"，"+element.eventTime+"，"+element.type+"</a></p>";
              $("#excp_content").append(node);
              if(index==list.length-1){
                idd =  element.id;
              }
            });

          }
        }
      }
    })
  }



  function toException(id){
    var ids = new Array();
    ids.push(id);
    $.ajax({
      url: "<%=request.getContextPath()%>/confirmException",
      type: "post",
      data: {
        "ids[]":ids
      },
      success: function (data) {
        var r = $.parseJSON(data);
        if(r.result!=0){
          alert(r.msg);
        }
      }
    });
    location.href="<%=request.getContextPath()%>/history3-check/"+id;
  }

  function confirmExcp(){
    var ids = new Array();
    $("input:checkbox[name='excp_checkBox']:checked").each(function(){
      ids.push($(this).val());
      $(this).parent().remove();
    });

    var size = $("#excp_content").children("p").length;
    if(size==0){
      $("#exception").css("display","none");
    }

    if(ids==null || ids.length==0){
      alert("请先勾选异常信息");
    }else{
      $.ajax({
        url: "<%=request.getContextPath()%>/confirmException",
        type: "post",
        data: {
          "ids[]":ids
        },
        success: function (data) {
          var r = $.parseJSON(data);
          if(r.result!=0){
            alert(r.msg);
          }
        }
      });
    }

  }

</script>
