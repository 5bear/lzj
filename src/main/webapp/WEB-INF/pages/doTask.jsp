<%--
  Created by IntelliJ IDEA.
  User: 11369
  Date: 2016/6/15
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>doTask</title>
</head>
<body>
<p id="out"></p>
<input type="button" value="doTask" onclick="doTask()">
</body>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script>
  function doTask(){
    $.ajax({
      url:"dodoTask",
      type:"post",
      data:{},
      success: function (data) {
        $("#out").html(data)
      }
    })
  }
</script>
</html>
