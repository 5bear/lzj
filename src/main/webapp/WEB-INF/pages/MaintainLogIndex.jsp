<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/4/19
  Time: 下午10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>上海市快速路养护作业监管设施完善工程</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/sb-admin.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/panel-dropdown.css"/>
</head>

<body onload="init('${vehicleLicence}','${type}','${company}')">

<div id="wrapper">
    <input type="hidden" id="curoffset" value="${MaintainLogList.offset}">
    <input type="hidden" id="total" value="${MaintainLogList.total}">
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="progress3"></jsp:param>
        <jsp:param name="pageFather" value="progress"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 进度管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 养护日志管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3">
                <div class="panel panel-primary">
                    <div class="panel-heading text-center">选择车辆</div>
                    <div class="panel-body">
                        <li class="dropdown dropdown1">
                            <a href="#" data-toggle="droplist" id="main">按照车辆查看</a>
                            <div class="arrow-section arrow-section1">
                                <div class="arrow-down arrow-down1"></div>
                            </div>
                            <ul class="dropdown-menu panel-menu">

                                <li class="dropdown dropdown2">
                                    <a href="#" data-toggle="droplist" id="上海高架养护管理有限公司">上海高架养护公司</a>
                                    <div class="arrow-section arrow-section2">
                                        <div class="arrow-down arrow-down2"></div>
                                    </div>
                                    <ul class="dropdown-menu panel-menu">
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="droplist" id="清扫车g">清扫车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu" id="u1">
                                                <c:forEach items="${GyList}" var="Gy">
                                                    <li style="cursor: pointer" id="${Gy.vehicleLicence}" onclick="search('${Gy.vehicleLicence}')">${Gy.vehicleLicence}</li>
                                                </c:forEach>
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="droplist" id="牵引车g">牵引车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu" id="u2">
                                                <c:forEach items="${GqList}" var="Gq">
                                                    <li style="cursor: pointer" id="${Gq.vehicleLicence}" onclick="search('${Gq.vehicleLicence}')">${Gq.vehicleLicence}</li>
                                                </c:forEach>
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="droplist" id="巡视车g">巡视车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu" id="u3">
                                                <c:forEach items="${GxList}" var="Gx">
                                                    <li style="cursor: pointer" id="${Gx.vehicleLicence}" onclick="search('${Gx.vehicleLicence}')">${Gx.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown dropdown2">
                                    <a href="#" data-toggle="droplist" id="上海成基市政建设发展有限公司">上海成基市政建设发展有限公司</a>
                                    <div class="arrow-section arrow-section2">
                                        <div class="arrow-down arrow-down2"></div>
                                    </div>
                                    <ul class="dropdown-menu panel-menu">
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="droplist" id="清扫车c">清扫车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu" id="u4">
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                                <c:forEach items="${CyList}" var="Cy">
                                                    <li style="cursor: pointer" id="${Cy.vehicleLicence}" onclick="search('${Cy.vehicleLicence}')">${Cy.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="droplist" id="牵引车c">牵引车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu" id="u5">
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                                <c:forEach items="${CqList}" var="Cq">
                                                    <li style="cursor: pointer" id="${Cq.vehicleLicence}" onclick="search('${Cq.vehicleLicence}')">${Cq.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                        <li class="dropdown dropdown3">
                                            <a href="#" data-toggle="droplist" id="巡视车c">巡视车</a>
                                            <div class="arrow-section arrow-section3">
                                                <div class="arrow-down arrow-down3"></div>
                                            </div>
                                            <ul class="dropdown-menu panel-menu" id="u6">
                                                <!--<li>
                                                    <a href="#">沪BD4802</a>
                                                </li>
                                                <li><a href="#">沪BD4802</a></li>-->
                                                <c:forEach items="${CxList}" var="Cx">
                                                    <li style="cursor: pointer" id="${Cx.vehicleLicence}" onclick="search('${Cx.vehicleLicence}')">${Cx.vehicleLicence}</li>
                                                </c:forEach>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </div>
                </div>
            </div>

            <div class="col-lg-9 col-md-9 col-sm-9">
                <div class="row">
                    <div class="col-lg-12 text-left search-row">
                        <p>选择查看日志时间</p>
                        从<input type="text" id="date1" placeholder="选择开始日期" value="${startDate}"/>到
                        <input type="text" id="date2" placeholder="选择结束日期" value="${endDate}"/>
                        <button type="button" class="btn btn-default" onclick="searchByTime(${vehicleLicence})">确认</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 time-row">
                        <a href="MaintainLogAdd0" class="add-operation"><img src="images/add1.png" alt="增加"/>新增养护纪录</a>
                    </div>
                    <div class="col-lg-12 text-center">
                        <table class="table">
                            <thead>
                            <tr>
                                <!--<th>编号</th>-->
                                <th>车辆牌照</th>
                                <th>负责人</th>
                                <th>路段信息</th>
                                <th>事件类型</th>
                                <th>日期</th>
                                <th>时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${MaintainLogList.datas}" var="maintainLog">
                                <tr>
                                    <!--<td>${maintainLog.id}</td>-->
                                    <td>${maintainLog.vehicleLicence}</td>
                                    <td>${maintainLog.principal}</td>
                                    <td>${maintainLog.road}</td>
                                    <td>${maintainLog.eventType}</td>
                                    <td>${maintainLog.dayTime}</td>
                                    <td>${maintainLog.time}</td>
                                    <td>
                                        <a onclick="MaintainLog_detail('${maintainLog.id}')"  class="operation"><label><img src="images/eye.png" alt="详细">详细</label></a>
                                        <a data-toggle="modal" data-target="#delete" onclick="getId('${maintainLog.id}')"  class="operation"><label><img src="images/delete1.png" alt="删除">删除</label></a>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row text-right">
                    <jsp:include page="pagerML.jsp">
                        <jsp:param value="MaintainLog" name="url"/>
                        <jsp:param value="${MaintainLogList.total }" name="item"/>
                        <jsp:param value="method,vehicleLicence,startDate,endDate" name="param"/>
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
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteMaintainLog()">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script>
    $('a[data-toggle="droplist"]').click(function(e) {
        e.preventDefault();
        $(this).nextAll().toggle();
    });
</script>
<script type="text/javascript" src="js/moment/moment.min.js"></script>
<script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#date1').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_4",
            format:'YYYY-MM-DD',
            minDate:'2016',
            maxDate:'2050'
        });
        $('#date2').daterangepicker({
            singleDatePicker: true,
            calender_style: "picker_4",
            format:'YYYY-MM-DD',
            minDate:'2016',
            maxDate:'2050'
        });
    });
</script>
<script>

    function init(licence,type,company){
      if(licence!=""){
          $("#main").nextAll().show();
           if(company!=""){
               $("#"+company).nextAll().show();
               if(type!=""){
                   if(company=="上海高架养护管理有限公司"){
                       type+="g";
                   }else if(company=="上海成基市政建设发展有限公司"){
                       type+="c";
                   }
                   $("#"+type).nextAll().show();
                   $("#"+licence).addClass("active");
               }
           }
       }
    }


    /*$('#date1').datetimepicker({
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
    });*/
</script>

<script type="text/javascript">

    var id;

    function getId(Id) {
        id=Id;
    }

    function MaintainLog_detail(id)
    {
        location.href="MaintainLogDetail?id="+id;


    }
    function deleteMaintainLog()
    {

        $.ajax({
            url:"MaintainLogDelete",
            type:"post",
            data:{id:id},
            success:function(data){

                if(data=="success"){
                    location.reload();
                }else {
                    alert("error");
                }
            }
        })
    }

    function searchByTime(vehicleLicence)
    {
        var startDate=$("#date1").val();
        var endDate=$("#date2").val();
        if((startDate!=null && startDate!="")&&(endDate!=null && endDate!="")){
            if(startDate>endDate){
                alert("结束时间必须大于等于开始时间！")
            }else{
                if(typeof(vehicleLicence) == "undefined" || vehicleLicence==null || vehicleLicence==""){
                    location.href="?startDate="+startDate+"&endDate="+endDate;
                }else{
                    location.href="?vehicleLicence="+vehicleLicence+"&startDate="+startDate+"&endDate="+endDate;
                }

            }
        }else if(startDate!=null && startDate!=""){

            if(typeof(vehicleLicence) == "undefined" || vehicleLicence==null || vehicleLicence==""){
                location.href="?startDate="+startDate;
            }else{
                location.href="?vehicleLicence="+vehicleLicence+"&startDate="+startDate;
            }
        }else if(endDate!=null && endDate!=""){
            if(typeof(vehicleLicence) == "undefined" || vehicleLicence==null || vehicleLicence==""){
                location.href="?endDate="+endDate;
            }else{
                location.href="?vehicleLicence="+vehicleLicence+"&endDate="+endDate;
            }
        }
         /*$.ajax({
            url:"MaintainLog/search",
            type:"post",
            data:{date1:date1,
                  date2:date2},
            success:function(){

                if(data=="success"){
                    location.reload();
                }else {
                    alert("error");
                }
            }
        })*/

    }

    function search(vehicleLicence)
    {
        location.href="?vehicleLicence="+vehicleLicence;
    }

</script>

</body>
</html>
