<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/4/16
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form >
    <div>
        <input type="hidden" name="id" value="${user.id}"/>
    </div>
    <div>
        <label>姓名：</label>
        <input type="text" name="name" value="${user.name}"/>
    </div>
    <div>
        <label>年龄：</label>
        <input type="text" name="age" value="${user.age}"/>
    </div>
    <div>
        <label>地址：</label>
        <input type="text" name="address" value="${user.address}"/>
    </div>
    <div>
        <button type="button" onclick="updateUser()">确认</button>
    </div>
</form>

<script src="/js/jquery-3.0.0.js"></script>

<script>
    function updateUser() {
        var id=$("input[name='id']").val();
        var name=$("input[name='name']").val();
        var age=$("input[name='age']").val();
        var address=$("input[name='address']").val();
        console.log(name);

        var user={
            "id":id,
            "name":name,
            "age":age,
            "address":address
        };

        $.ajax({
            type:"post",
            url:"/updateUser",
            data:user,
            dataType:"json",
            success:function (jsonResult) {
                alert(jsonResult.msg);
                location.href="/getAllUsers";
            }
        })
    }

</script>

</body>
</html>