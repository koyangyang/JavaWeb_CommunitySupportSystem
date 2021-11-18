<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
    <link rel="stylesheet" href="/static/css/login.css" />
    <title>登录界面</title>
    <script src="/static/css/jquery-3.4.1.js"></script>
    <script>
        $(document).ready(function (){
            $("#pwd").blur(function (){
                var reg1=/^[A-Za-z]+$/;
                var name=$("#name").val();
                if (!reg1.test(name)&&!name==""){
                    alert("name不符合要求");
                    $("#name").val("");
                }
                var reg2=/^\d{6}$/;
                var pwd=$("#pwd").val();
                if (!reg2.test(pwd)&&!pwd==""){
                    alert("pwd不符合要求");
                    $("#pwd").val("");
                }
            })
        });
    </script>
</head>
<body>
<div id="bigBox">
    <form action="/user">
        <div class="container">
            <div class="main-title">欢迎登录</div>

            <div class="main">
                <div class="in-con">
                    <input type="text" name="name" id="name" placeholder="请输入用户名" autofocus>
                    <i>U</i>
                </div>

                <div class="in-con">
                    <input type="password" name="pwd" id="pwd" placeholder="密码">
                    <i class="key">P</i>
                </div>

                <div class="in-con">
                    <input type="submit"  id="btn-login" class="btn-login" value="登 录">
                </div>

            </div>
        </div>

    </form>
</div>
</body>
</html>
