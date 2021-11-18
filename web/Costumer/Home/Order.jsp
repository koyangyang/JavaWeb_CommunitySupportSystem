<%--
  Created by IntelliJ IDEA.
  User: codeyang
  Date: 2021/6/25
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="../bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../Flat-UI-master/dist/css/flat-ui.min.css"/>
    <script src="../Flat-UI-master/dist/js/vendor/jquery.min.js"></script>
    <script src="../bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
    <script src="../Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <title></title>
    <style>
        .row{
            margin-left: 20px;
            margin-right: 20px;;
        }
        .line-center{
            line-height:50px;
            text-align: center;
        }
        .row input{
            width: 50px;
        }
        .list-group-item:hover{
            background: #27ae60;

        }
        .list-group-item div:first-child:hover{

            cursor: pointer;
        }
    </style>
    <script type="text/javascript">
        function login() {
            //获取两个文本框中的内容
            var name = document.getElementById("name").value;
            var content = document.getElementById("content").value;
            var price= document.getElementById("price").value;
            var user = document.getElementById("user").value;
            //拼接表单
            var params = "user=" + user + "&content=" + content+"&price="+price+"&name="+name;
            var url = "/docinsert?" + params;
            //获取请求
            var request = new XMLHttpRequest();
            //设置函数监测准备状态码的改变
            request.onreadystatechange = function() {
                console.log("准备状态码:" + request.readyState + "\t" + "响应状态:" + request.status);
                //准备状态码 == 4说明服务器已经返回了请求，响应状态 = 200说明服务器响应正常
                if (request.readyState == 4 && request.status == 200) {
                    //获取响应内容
                    var responseText = request.responseText;
                    //输出到tip中
                    var tipTag = document.getElementById("tip");
                    tipTag.innerHTML = responseText;
                }
            }
            //设置为get请求，异步方式
            request.open("get", url, true);
            //提交请求
            request.send();
            document.getElementById("name").value="";
            document.getElementById("content").value="";
            document.getElementById("price").value="";
            document.getElementById("user").value="";
        }
    </script>
</head>
<body>
<!-- Static navbar -->
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">这什么东西</span>
            </button>
            <a class="navbar-brand" href="Index.jsp">互助吧</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Index.jsp">首页</a></li>
                <li><a href="Order.jsp">发布委托</a></li>
                <li><a href="UserInfo.jsp">个人中心</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="Login.jsp">登录</a></li>
                <li><a href="Register.jsp">注册</a></li>
                <li><a href="../../login.jsp">Dashboard</a></li>
                <li>
                    <a href="Cart.jsp"><span class="glyphicon glyphicon-shopping-cart">待接委托</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<!--content-->
<div class="container">
    <div class="row thumbnail center">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">发布委托</h1>
        </div>
        <div class="col-sm-12 thumbnail">
            <div class="col-sm-3 line-center">委托名称</div>
            <div class="col-sm-2 line-center">详细内容</div>
            <div class="col-sm-2 line-center">报酬 </div>
            <div class="col-sm-2 line-center">委托人</div>
            <div class="col-sm-3 line-center">操作</div>
        </div>
        <div class="list-group">
            <div class="col-sm-12  list-group-item" >
                <form>
                    <div class="col-sm-3 line-center"><input type="text" name="name" id="name" style="width: 200px;"></div>
                    <div class="col-sm-2 line-center"><input type="text" name="content" id="content" style="width: 200px;"></div>
                    <div class="col-sm-2 line-center"><input type="text" name="price" id="price" style="width: 100px;"></div>
                    <div class="col-sm-2 line-center"><input type="text" name="user" id="user" style="width: 150px;"></div>
                    <div class="col-sm-3 line-center">
                        <button type="button" class="btn btn-success" onclick="login()">发布委托</button>
                    </div>
                </form>

            </div>

        </div>
    </div>

</div>
    <!--footer-->
    <!-- <div class="navbar navbar-default navbar-static-bottom">
        版权声明区
    </div> -->
</body>
</html>
