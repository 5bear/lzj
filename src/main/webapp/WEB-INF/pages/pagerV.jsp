<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springapp.classes.model.SystemContext" %>
<%
    int ps = SystemContext.getPageSize();
%>
<div class="page">
<pg:pager items="${param.item }" maxPageItems="10" export="curPage=pageNumber" url="${param.url }">
    <%--               一共${param.item }条记录.
    <pg:last>
                      一共${pageNumber }页。
    </pg:last> --%>
    <c:forEach var="p" items="${param.param }">
        <pg:param name="${p }"/>
    </c:forEach>

    <%--<pg:param name="name" value=""/>--%>
    <%-- <pg:first>
        <a href="${pageUrl }">首页</a>
     </pg:first>--%>
   <%-- <pg:last>
        <span class="page-show">${curPage }/${pageNumber }</span>
    </pg:last>--%>


    <span style="cursor: pointer"  onclick="prevpage()"><</span>
    <pg:pages>
     <c:if test="${curPage eq pageNumber }">
      &nbsp;[${pageNumber }]
     </c:if>
     <c:if test="${curPage ne pageNumber }">
      <a style="cursor: pointer" onclick="go(${pageNumber })">&nbsp;${pageNumber }</a>
     </c:if>
     </pg:pages>
    <span style="cursor: pointer"   onclick="nextPage()">></span>

   <%-- <pg:page>
        <input id="num" class="page-input" onkeypress="if(event.keyCode==13) {goo.click();return false;}">
        <button id="goo" name="goo" type="button" onclick="go()" class="page-btn" value="">跳转</button>
    </pg:page>--%>
    <%-- <pg:last>
       <a href="${pageUrl }" >尾页</a>
     </pg:last>--%>
    <%-- <div class="page">
         <span class="page-show">1/5</span>
         <input type="submit" value="" class="next-btn">
         <input class="page-input">
         <button type="submit" class="page-btn">跳转</button>
     </div>--%>
    <%-- <pg:last>
     &nbsp; 当前：${curPage }/${pageNumber }
     </pg:last>--%>
</pg:pager>
    </div>
<script type="text/javascript">
    function go(num){
        var selector = document.getElementById("type");
        var index = selector.selectedIndex;
        var type = selector.options[index].value;
        var name = $("#search").val();
        var total = $("#total").val();
        var offset = (num-1)*<%=ps%>;

        var curoffset = $("#curoffset").val();
        if(offset==curoffset){
            return;
        }
        if(offset<0){
            return;
        } else if(offset<total){
            var goPath = "<%=request.getContextPath()%>/Vehicle/list?pager.offset="+offset;
            if(typeof(type) != "undefined" && type!=null && type!="0"){
                goPath+="&type="+type;
            }
            if(typeof(name) != "undefined" && name!=null && name!=""){
                goPath+="&name="+name;
            }
            window.location=goPath;
        }else {
            return;
        }

    }

    function nextPage(){
        var selector = document.getElementById("type");
        var index = selector.selectedIndex;
        var type = selector.options[index].value;
        var name = $("#search").val();
        var total = $("#total").val();
        var curoffset = $("#curoffset").val();
        var offset = parseInt(curoffset)+parseInt(<%=ps%>);
        if(offset==curoffset){
            return;
        }
        if(offset<0){
            return;
        } else if(offset<total){
            var goPath = "<%=request.getContextPath()%>/Vehicle/list?pager.offset="+offset;
            if(typeof(type) != "undefined" && type!=null && type!="0"){
                goPath+="&type="+type;
            }
            if(typeof(name) != "undefined" && name!=null && name!=""){
                goPath+="&name="+name;
            }
            window.location=goPath;
        }else {
            return;
        }

    }
    function prevpage(){
        var selector = document.getElementById("type");
        var index = selector.selectedIndex;
        var type = selector.options[index].value;
        var name = $("#search").val();
        var total = $("#total").val();
        var curoffset = $("#curoffset").val();
        var offset = parseInt(curoffset)-parseInt(<%=ps%>);
        if(offset==curoffset){
            return;
        }
        if(offset<0){
            return;
        } else if(offset<total){
            var goPath = "<%=request.getContextPath()%>/Vehicle/list?pager.offset="+offset;
            if(typeof(type) != "undefined" && type!=null && type!="0"){
                goPath+="&type="+type;
            }
            if(typeof(name) != "undefined" && name!=null && name!=""){
                goPath+="&name="+name;
            }
            window.location=goPath;
        }else {
            return;
        }
    }

</script>