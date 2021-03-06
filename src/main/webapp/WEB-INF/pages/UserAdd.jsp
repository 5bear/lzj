<%--
  Created by IntelliJ IDEA.
  User: ZhanShaoxiong
  Date: 2016/4/17
  Time: 13:38
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
    <link rel="stylesheet" href="css/panel-dropdown.css"/>
</head>

<body>

<div id="wrapper">

    <!-- Sidebar -->
    <jsp:include page="public.jsp" flush="true">
        <jsp:param name="pageName" value="management-edit"></jsp:param>
        <jsp:param name="pageFather" value="management"></jsp:param>
    </jsp:include>
    <div id="page-wrapper">

        <div class="row">
            <div class="col-lg-12">
                <ol class="breadcrumb">
                    <li><a href="html/index.html"><i class="icon-dashboard"></i> 系统管理</a></li>
                    <li class="active"><i class="icon-file-alt"></i> 用户管理</li>
                </ol>
            </div>
        </div><!-- /.row -->

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 time-row">
                <a href="UserManage" class="operation"><< 返回</a>
            </div>
            <div class="col-lg-6 col-lg-offset-3 text-center time-row">
                用户管理信息录入/修改
            </div>
            <div class="col-lg-6 col-lg-offset-3">
                <table class="table vertical-table">
                    <tbody>
                    <tr>
                        <td>账号</td>
                        <td><input type="text" class="table-input" id="account"/></td>
                    </tr>
                    <tr>
                        <td>用户名</td>
                        <td><input type="text" class="table-input" id="username"/></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input type="password" class="table-input" id="password"/></td>
                    </tr>
                    <tr>
                        <td>用户权限</td>
                        <td><select  class="table-input" id="power">
                            <option value="系统管理员">系统管理员</option>
                            <option value="领导">领导</option>
                            <option value="监理">监理</option>
                            <option value="养护公司管理">养护公司管理</option>
                            <option value="普通用户">普通用户</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>所属部门</td>
                        <td><select class="table-input" id="company">
                            <option value="养护中心">养护中心</option>
                            <option value="上海成基市政建设发展有限公司">上海成基市政建设发展有限公司</option>
                            <option value="上海高架养护管理有限公司">上海高架养护管理有限公司</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>联系电话</td>
                        <td><input type="text" class="table-input" id="phoneNum"/></td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td><input type="text" class="table-input" id="remark"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4 col-lg-offset-5 col-md-4 col-md-offset-5 col-sm-4 col-sm-offset-4">
                <button class="btn btn-default" onclick="addUser()">提交</button>
            </div>
        </div>
        <div class="modal fade" id="passwordchange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">更改密码</h4>
                    </div>
                    <div class="modal-body text-center">
                        <div class="row password-row">
                            <table class="table vertical-table">
                                <tbody>
                                <tr>
                                    <td>新密码</td>
                                    <td><input type="password" class="table-input" id="newPwd"/></td>
                                </tr>
                                <tr>
                                    <td>请确认新密码</td>
                                    <td><input type="password" class="table-input" id="renewPwd"/></td>
                                </tr>
                                </tbody>
                            </table>
                            <p class="red-alert text-center" hidden="hidden" id="error">两次密码不正确！请重新输入。</p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-default"  onclick="changePwd()">确定</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!

    </div><!-- /#page-wrapper -->

</div><!-- /#wrapper -->

<!-- JavaScript -->
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
    function addUser(){
        var account=$("#account").val();
        var username=$("#username").val();
        var password=$("#password").val();
        var power=$("#power").val();
        var company=$("#company").val();
        var phoneNum=$("#phoneNum").val();
        var remark=$("#remark").val();
        if(account==""){
            alert("账号不能为空")
            return true;
        }
        if(username==""){
            alert("用户名不能为空")
            return true;
        }
        if(password==""){
            alert("密码不能为空")
            return true;
        }
        $.ajax({
            url:"User/add",
            type:"post",
            data:{account:account,username:username,password:password,power:power,company:company,phoneNum:phoneNum,remark:remark},
            success:function(data){
                if(data=="duplicated"){
                    alert("账号或用户名重复")
                    return false;
                }else if(data=="NoPower"){
                    alert("没有操作权限")
                    return false
                }
                location.href="UserManage";
            }
        })
    }


</script>
</body>
</html>
