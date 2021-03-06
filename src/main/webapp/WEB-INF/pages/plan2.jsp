<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/13
  Time: 21:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String company= (String) session.getAttribute("company");
%>
<html>
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
<%
  request.setCharacterEncoding("utf-8");
  int totalPage= (Integer) request.getAttribute("totalPage");
  int currentPage= (Integer) request.getAttribute("currentPage");
  String searchCompany=  request.getAttribute("company")==null?"":(String) request.getAttribute("company");
  String searchLinename= request.getAttribute("lineName")==null?"":(String) request.getAttribute("lineName");
  String url="line?company="+searchCompany+"&lineName="+searchLinename+"&";
%>
<div id="wrapper">
<jsp:include page="public.jsp" flush="true">
  <jsp:param name="pageFather" value="plan"></jsp:param>
  <jsp:param name="pageName" value="plan2"></jsp:param>
</jsp:include>
  <div id="page-wrapper">

    <div class="row">
      <div class="col-lg-12">
        <ol class="breadcrumb">
          <li><a href=""><i class="icon-dashboard"></i> 计划管理</a></li>
          <li class="active"><i class="icon-file-alt"></i> 作业线路管理</li>
        </ol>
      </div>
    </div><!-- /.row -->

    <div class="row">
      <div class="col-lg-12">
        <div class="row">
          <div class="col-lg-12 time-row text-right">
            <select name="" id="company">
              <%
                if(company.equals("养护中心")){
              %>
              <option value="" ></option>
              <option value="上海成基市政建设发展有限公司" >上海成基市政建设发展有限公司</option>
              <option value="上海高架养护管理有限公司">上海高架养护管理有限公司</option>
              <%
              }
                else{
              %>
              <option value="<%=company%>" ><%=company%></option>
              <%
                }
              %>
            </select>
            <div class="search-div">
              <img src="images/search1.png" alt="搜索"/>
              <input type="text" id="query" placeholder="请输入线路名称"/>
            </div>
            <button class="btn btn-default" onclick="query()">搜索</button>
          </div>
          <div class="col-lg-12 time-row">
            <a href="drawLine" class="add-operation"><img src="images/add1.png" alt="增加"/>新增作业路线</a>
          </div>
          <div class="col-lg-12 text-center">
            <table class="table">
              <thead>
              <tr>
                <th>所属养护公司</th>
                <th>所属包件</th>
                <th>线路名称</th>
                <th>开始坐标</th>
                <th>结束坐标</th>
                <th>方向类型</th>
                <th>方向</th>
                <th>录入人</th>
                <th>备注</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody id="lineList">
              <c:forEach items="${lineList}" var="line">
                <tr>
                  <td>${line.company}</td>
                  <td>${line.packgeName}</td>
                  <td>${line.line}</td>
                  <td>${line.startCoord}</td>
                  <td>${line.endCoord}</td>
                  <td>${line.directionType}</td>
                  <td>${line.direction}</td>
                  <td>${line.inputMan}</td>
                  <td>${line.remark}</td>
                  <td><a href="drawLine?id=${line.id}" class="operation"><img src="images/edit.png" alt="编辑"/>编辑</a>
                    <a class="operation" onclick="setId('${line.id}')" data-toggle="modal" data-target="#delete"><img src="images/delete1.png" alt="删除"/>删除</a>
                  </td>
                </tr>
              </c:forEach>
              <%--<tr>
                <td>上海成基市政建设发展有限公司</td>
                <td>中环路</td>
                <td>(x,y)</td>
                <td></td>
                <td>东西侧</td>
                <td></td>
                <td>XXX</td>
                <td></td>
                <td><a href="plan2-add.html" class="operation"><img src="images/edit.png" alt="编辑"/>编辑</a>
                  <a class="operation" data-toggle="modal" data-target="#delete"><img src="images/delete1.png" alt="删除"/>删除</a>
                </td>
              </tr>--%>
              </tbody>
            </table>
          </div>
          <jsp:include page="page.jsp" flush="true" >
            <jsp:param name="currentPage" value="<%=currentPage%>"></jsp:param>
            <jsp:param name="totalPage" value="<%=totalPage%>"></jsp:param>
            <jsp:param name="url" value="<%=url%>"></jsp:param>
          </jsp:include>
        </div>
      </div>
    </div>

  </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">删除提示</h4>
      </div>
      <div class="modal-body text-center">
        <p>你确定要删除吗？</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"  onclick="deleteLine()">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
  var id;
  $(document).ready(function () {
    $("#company").find("option[value='<%=searchCompany%>']").attr("selected",true);
  })
  function setId(i){
   id=i;
  }
  function deleteLine(){
    $.ajax({
      url:"line/delete",
      type:"post",
      data:{id:id},
      success:function(data){
        if(data=="fail"){
          alert("路线存在RFID点，无法删除")
          return false
        }else if(data=="NoPower"){
          alert("没有操作权限")
          return false
        }
          location.reload(true);
      }
    })
  }
  function query(){
    var name=$("#query").val();
    var company=$("#company").val();
    location.href="line?company="+company+"&lineName="+name;
  }
  function showLine(lineName,company){
    $.ajax({
      url:"line/getByName",
      type:"get",
      data:{lineName:lineName},
      dataType:"json",
      success:function(data){
        var info="";
        $(data).each(function (index) {
          if(company=="")
              info+=" <tr><td>"+data[index].company+"</td><td>"+data[index].packgeName+"</td><td>"+data[index].line+"</td><td>"+data[index].startCoord+"</td><td>"+data[index].endCoord+"</td><td>"+data[index].directionType+"</td><td>"+data[index].direction+"</td> <td>"+data[index].inputMan+"</td> <td>"+data[index].remark+"</td> <td><a href='drawLine?id="+data[index].id+"' class='operation'><img src='images/edit.png' alt='编辑'/>编辑</a> <a class='operation' onclick='setId('"+data[index].id+"')' data-toggle='modal' data-target='#delete'><img src='images/delete1.png' alt='删除'/>删除</a> </td> </tr>"
          else{
            if(data[index].company==company)
              info+=" <tr><td>"+data[index].company+"</td><td>"+data[index].packgeName+"</td><td>"+data[index].line+"</td><td>"+data[index].startCoord+"</td><td>"+data[index].endCoord+"</td><td>"+data[index].directionType+"</td><td>"+data[index].direction+"</td> <td>"+data[index].inputMan+"</td> <td>"+data[index].remark+"</td> <td><a href='drawLine?id="+data[index].id+"' class='operation'><img src='images/edit.png' alt='编辑'/>编辑</a> <a class='operation' onclick='setId('"+data[index].id+"')' data-toggle='modal' data-target='#delete'><img src='images/delete1.png' alt='删除'/>删除</a> </td> </tr>"
          }
        })
        $("#lineList").html(info);
      }
    })
  }
</script>
</body>
</html>
