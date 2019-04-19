<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/15
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/css/bootstrap-3.3.4.css"
          rel="stylesheet">
</head>
<body>

    <a href="/jump">新增用户</a>

    <table cellpadding="0" border="1" id="myTab">
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>地址</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="user">
            <tr id="${user.id}">
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>
                    <input  type=button  value="删除" onclick="deleteUser(${user.id})"/>
                    <input type=button  value="修改" onclick="updateUser(${user.id})"/>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div>
        <ul class="pagination">

        </ul>
    </div>
<script src="/js/jquery-3.0.0.js"></script>
<script src="/js/jquery.tmpl.js"></script>
<script src="/js/bootstrap-3.3.4.js"></script>
<script src="/js/jqPaginator.js"></script>

<script>

    $(function() {

        var if_fistime = true;
        $(".pagination").jqPaginator({
            totalPages: ${pageInfo.pages},
            //可见的页数（前段页面可写死）
            visiblePages: 5,
            currentPage: ${pageInfo.pageNum},
            first: '<li class="first"><a href="javascript:void(0);">第一页</a></li>',
            prev: '<li class="prev"><a href="javascript:void(0);">上一页</a></li>',
            next: '<li class="next"><a href="javascript:void(0);">下一页</a></li>',
            last: '<li class="last"><a href="javascript:void(0);">最后一页</a></li>',
            page: '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
            onPageChange: function(num) {
                if(if_fistime) {
                    if_fistime = false;
                } else {
                    changePage(num);
                }
            }
        });
    });
    function changePage(num) {
        window.location.href = "/getAllUsers?pageNum=" + num;
    }

    function deleteUser(id) {
        $.ajax({
            type:"post",
            url:"/deleteUser?userId="+id,
            data:{},
            dataType:"json",
            success:function (jsonResult) {
                alert(jsonResult.msg);
                $("#"+id).remove();
            }
        })
    }

    function updateUser(id) {
        location.href="/back?id="+id;

    }




</script>


</body>
</html>