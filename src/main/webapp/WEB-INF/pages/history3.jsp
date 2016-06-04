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
</head>

<body onload="myTimer()">

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="history3"></jsp:param>
        <jsp:param name="pageFather" value="history"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="index.html"><i class="icon-dashboard"></i> 历史数据</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 异常查询</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12 text-left search-row">
                <input type="text" id="date" placeholder="选择日期"/>
                <label><input type="checkbox"/>养护车</label>
                <label><input type="checkbox"/>巡视车</label>
                <button class="btn btn-default">确认</button>
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
                        <th>发生时间段</th>
                        <th>发生路段</th>
                        <th>备注</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>养护车</td>
                        <td>沪A86574</td>
                        <td>超速</td>
                        <td>13:00-14:00</td>
                        <td>中山北路外侧</td>
                        <td></td>
                        <td><a href="history3-check" class="operation"><label><img src="images/eye.png" alt="查看"/>查看详情</label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>养护车</td>
                        <td>沪A86574</td>
                        <td>超速</td>
                        <td>13:00-14:00</td>
                        <td>中山北路外侧</td>
                        <td></td>
                        <td><a href="history3-check" class="operation"><label><img src="images/eye.png" alt="查看"/>查看详情</label></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="alert" id="exception" style="display: none">
            <p class="alert-title text-center">异常提示</p>
            <div id="excp_content" style="height:150px; overflow-y: auto">
                <%-- <p><input type="checkbox"/>1、<a href="history3-check.html">沪A3213, 清扫车，12：00-14：00，超速</a></p>
                 <p><input type="checkbox"/>2、<a href="history3-check.html">沪A3213, 清扫车，12：00-14：00，超速</a></p>
                 <p><input type="checkbox"/>3、<a href="history3-check.html">沪A3213, 清扫车，12：00-14：00，超速</a></p>
                 <p><input type="checkbox"/>4、<a href="history3-check.html">沪A3213, 清扫车，12：00-14：00，超速</a></p>
                 <p><input type="checkbox"/>5、<a href="history3-check.html">沪A3213, 清扫车，12：00-14：00，超速</a></p>
                 <p><input type="checkbox"/>6、<a href="history3-check.html">沪A3213, 清扫车，12：00-14：00，超速</a></p>--%>
            </div>
            <div class="row text-center">
                <button class="btn btn-default" type="button" onclick="confirmExcp()">确认</button>
            </div>
        </div>

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<%--<script language="JavaScript">
    window.attachEvent("onload", myTimer); //绑定到onload事件
    function myTimer() {
        start();
        window.setTimeout("myTimer()",6000);//设置循环时间
    }
</script>--%>
<script type="text/javascript">
    var idd = 0;

    function myTimer() {
        /*if(idd==0){
            $("#exception").css("display","none");
        }*/
        start(idd);
        window.setTimeout("myTimer()", 6000);//设置循环时间
    }

    function start(id) {
       // alert(id);
        $.ajax({
            url: "getException",
            type: "post",
            data: {
                id: id
            },
            success: function (data) {
                var r = $.parseJSON(data);
                if (r.result == 0) {
                    var list = r.obj;
                    if (list != null && list.length > 0) {

                       $("#exception").css("display","block");
                        $(list).each(function(index,element){
                            var node = "<p><input type='checkbox' name='excp_checkBox' value='"+element.id+"'/><a onclick='toException(element.id)'>"+element.vehicleLicence+", "+element.vehicleType+"，"+element.eventTime+"，"+element.type+"</a></p>";
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
        location.href="history3-check/"+id;
    }

    function confirmExcp(){
        var ids = new Array();
        $("input:checkbox[name='excp_checkBox']:checked").each(function(){
            alert($(this).val());
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
                url: "confirmException",
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

<script>


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
