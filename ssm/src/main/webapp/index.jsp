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
</head>
<body>
<a href="/WEB-INF/jsp/create.jsp">新增用户</a>

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

    </tbody>
</table>
<script src="/js/jquery-3.0.0.js"></script>
<script src="/js/jquery.tmpl.js"></script>

<script type="text/x-jquery-tmpl" id="d1">
    {{each(i,e) result}}
    <tr id=\${e.id}>
        <td>\${e.id}</td>
        <td>\${e.name}</td>
        <td>\${e.age}</td>
        <td>\${e.address}</td>
        <td>
            <input type=submit  value="删除" onclick="deleteUser(\${e.id})"/>
            <input type=submit  value="修改" onclick="updateUser(\${e.id})"/>
        </td>
    </tr>
    {{/each}}

</script>

<script>
    $(function () {
         $.ajax({
             type:"post",
             url:"/getAllUsers",
             data:{},
             dataType:"json",
             success:function (jsonResult) {

                 $("#d1").tmpl(jsonResult).appendTo("tbody");
             }
         })

    })

    function deleteUser(id) {
        $.ajax({
            type:"post",
            url:"/deleteUser?userId="+id,
            data:{},
            dataType:"json",
            success:function (jsonResult) {
                $("#id").remove();
            }
        })
    }

    function updateUser(id) {
        window.location.href="/backUser?userId="+id;
    }


</script>


</body>
</html>

