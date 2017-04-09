<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yanglin
  Date: 16/5/9
  Time: 下午8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="management3"></jsp:param>
        <jsp:param name="pageFather" value="management"></jsp:param>
    </jsp:include>

    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="html/index.html"><i class="icon-dashboard"></i> 系统管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 网络状态</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-12 text-center" id="main2" style="width: 2500px;height:600px;overflow-x: auto;">

            </div>
        </div>
    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="echarts/echarts.js"></script>
<script type="text/javascript">

        // 路径配置
        require.config({
            paths: {
                echarts: './echarts'
            }
        });
        require(
                [
                    'echarts',
                    'echarts/theme/roma',
                    'echarts/chart/tree' // 使用柱状图就加载bar模块，按需加载
                ],
                function (ec, theme) {



                    // 基于准备好的dom，初始化echarts图表
                    var myChart = ec.init(document.getElementById('main2'), theme);
                    myChart.showLoading({
                        text : "正在进行网络连接测试..."
                    });
                    $.ajax({
                        url: "getTreeDatas",
                        type: "get",
                        data: {

                        },
                        success: function (data) {

                            var r = $.parseJSON(data);
                            if(r.result==0){
                                var option = {
                                    title: {
                                        text: '网络状态图',
                                        subtext: ''
                                    },
                                    tooltip: {
                                        trigger: 'item',
                                        formatter: function (params, ticket, callback) {

                                            var res = '<span class="tooltip-content"><span class="tips"><strong>设备名称: </strong>' + params.name + '<br/>';
                                            res += '<strong>服务器IP: </strong>' + params.value + '<br/>';
                                            res += '<strong>联系电话: </strong><a href="">' + params.data.rank + '</a></span></span>'
                                            setTimeout(function () {
                                                // 仅为了模拟异步回调
                                                callback(ticket, res);//回调函数，这里可以做异步请求加载的一些代码
                                            }, 1000)
                                            return 'loading';
                                        }
                                    },
                                    toolbox: {
                                        show: false,
                                        feature: {
                                            mark: {show: true},
                                            dataView: {show: true, readOnly: false},
                                            restore: {show: true},
                                            saveAsImage: {show: true}
                                        }
                                    },
                                    calculable: false,

                                    series: [
                                        {
                                            name: '树图',
                                            type: 'tree',
                                            orient: 'vertical',  // vertical horizontal
                                            rootLocation: {x: 'center', y: 100}, // 根节点位置  {x: 100, y: 'center'}
                                            nodePadding: 50,
                                            itemStyle: {
                                                normal: {
                                                    label: {
                                                        show: true,
                                                        position: 'bottom',
                                                        textStyle: {
                                                            color: '#000'
                                                        }
                                                    },
                                                    lineStyle: {
                                                        color: '#005c95',
                                                        shadowColor: '#ccc',
                                                        shadowBlur: 3,
                                                        shadowOffsetX: 3,
                                                        shadowOffsetY: 5,
                                                        type: 'broken' // 'curve'|'broken'|'solid'|'dotted'|'dashed'

                                                    }
                                                },
                                                emphasis: {
                                                    label: {
                                                        show: true

                                                    },

                                                    borderColor: 'rgba(23,144,207,0.5)',
                                                    borderWidth: 10
                                                }
                                            },

                                            data: [r.obj]
                                        }
                                    ]
                                };

                                // 为echarts对象加载数据
                                myChart.setOption(option);
                                myChart.hideLoading();
                            }else{
                                alert("11");
                            }

                        }
                    });

                }
        );


</script>
<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
    $(function () {
        $("#management").dropdown('toggle');
    });
</script>
</body>
</html>
