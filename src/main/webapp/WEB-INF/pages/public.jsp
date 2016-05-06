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
/*  System.out.print(pageName+pageFather);*/
%>
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="index">上海市快速路养护监管系统</a>
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
      <li <%if(pageName.equals("index")) {%>class="active"<%}%>><a href="index"><i class="fa fa-dashboard"></i> 首页</a></li>
      <li <%if(pageFather.equals("base")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="base"><i class="fa fa-bar-chart-o"></i> 基础数据 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <%if(pageName.equals("base1")) {%>class="active"<%}%>><a href="Park">停车场管理</a></li>
          <li <%if(pageName.equals("base2")) {%>class="active"<%}%>><a href="Vehicle">车辆管理</a></li>
          <li <%if(pageName.equals("base3")) {%>class="active"<%}%>><a href="RFID">RFID监测点管理</a></li>
          <li <%if(pageName.equals("base4")) {%>class="active"<%}%>><a href="Package">包件信息管理</a></li>
          <li <%if(pageName.equals("base5")) {%>class="active"<%}%>><a href="eFence">电子围栏管理</a></li>
          <li <%if(pageName.equals("base6")) {%>class="active"<%}%>><a href="Rules">监管规则管理</a></li>
        </ul>
      </li>

      <li <%if(pageFather.equals("plan")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="plan"><i class="fa fa-table"></i> 计划管理 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <%if(pageName.equals("plan1")) {%>class="active"<%}%>><a href="plan1">养护作业计划</a></li>
          <li <%if(pageName.equals("plan2")) {%>class="active"<%}%>><a href="line">作业线路管理</a></li>
          <li <%if(pageName.equals("plan3")) {%>class="active"<%}%>><a href="plan3">布点计划</a></li>
          <li <%if(pageName.equals("plan4")) {%>class="active"<%}%>><a href="Driver">驾驶员计划</a></li>
        </ul>
      </li>

      <li <%if(pageFather.equals("progress")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="progress"><i class="fa fa-edit"></i> 进度管理 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <%if(pageName.equals("progress1")) {%>class="active"<%}%>><a href="Progress1">养护进度监控</a></li>
          <li <%if(pageName.equals("progress2")) {%>class="active"<%}%>><a href="progress2.html">实时监控</a></li>
          <li <%if(pageName.equals("progress3")) {%>class="active"<%}%>><a href="MaintainLog">养护日志管理</a></li>
        </ul>
      </li>

      <li <%if(pageFather.equals("history")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a  href="#" class="dropdown-toggle"  data-toggle="dropdown" id="history"><i class="fa fa-font"></i> 历史数据 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <%if(pageName.equals("history1")) {%>class="active"<%}%>><a href="history1">历史轨迹查询</a></li>
          <li <%if(pageName.equals("history2")) {%>class="active"<%}%>><a href="history2.html">历史视频查询</a></li>
          <li <%if(pageName.equals("history3")) {%>class="active"<%}%>><a href="history3.html">异常查询</a></li>
        </ul>
      </li>

      <li <%if(pageFather.equals("reports")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="reports"><i class="fa fa-desktop"></i> 报表查询 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <%if(pageName.equals("reports1")) {%>class="active"<%}%>><a href="reports1">牵引车辆位置报表</a></li>
          <li <%if(pageName.equals("reports2")) {%>class="active"<%}%>><a href="reports2">养护车辆作业区域</a></li>
          <li <%if(pageName.equals("reports3")) {%>class="active"<%}%>><a href="reports3">养护车辆作业情况</a></li>
          <li <%if(pageName.equals("reports4")) {%>class="active"<%}%>><a href="reports4">养护车辆超速</a></li>
        </ul>
      </li>

      <li <%if(pageFather.equals("management")) {%>class="dropdown open"<%}else{%>class="dropdown"<%}%>>
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="management"><i class="fa fa-wrench"></i>系统管理 <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li <%if(pageName.equals("management1")) {%>class="active"<%}%>><a href="UserManage">用户管理</a></li>
          <li <%if(pageName.equals("management2")) {%>class="active"<%}%>><a href="Power">权限管理</a></li>
          <li <%if(pageName.equals("management3")) {%>class="active"<%}%>><a href="management3.html">网络状态</a></li>
        </ul>
      </li>

    </ul>

    <ul class="nav navbar-nav navbar-right navbar-user">
      <li class="dropdown user-dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎， <%=username%> <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="PersonalInfo"><i class="fa fa-user"></i> 个人信息</a></li>
          <li class="divider"></li>
          <li><a href="logout"><i class="fa fa-power-off"></i> 安全退出</a></li>
        </ul>
      </li>
    </ul>

  </div><!-- /.navbar-collapse -->
</nav>
<script src="js/jquery-1.10.2.js"></script>
<script>

  $('a[data-toggle="droplist"]').click(function() {
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

