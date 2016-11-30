<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/6/15
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>task1</title>
</head>
<body>

</body>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script>
  /*存储GPS信息*/
  var time1=  setInterval(function(){
    doTask()
  }, 10000);
  function doTask(){
    $.ajax({
      url:"doTask",
      type:"post",
      data:{},
      success: function (data) {
        $("#out").html(data)
      }
    })
  }
</script>
</html>
