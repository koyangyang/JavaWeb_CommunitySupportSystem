<%@ page import="daoimp.EventDaoImp" %>
<%@ page import="entity.event" %>
<%@ page session="false" %>
<%--
  Created by IntelliJ IDEA.
  User: codeyang
  Date: 2021/6/23
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        .center{
            text-align: center;
        }
    </style>
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
<%
    int id= Integer.parseInt(request.getParameter("id"));
    EventDaoImp edi=new EventDaoImp();
    event ev=edi.geteventbyid(id);
    if(ev!=null){
        pageContext.setAttribute("event",ev);
    }
%>

<!--content-->
<div class="row thumbnail">
    <div class="col-sm-4">
        <img style="width: 100%; height: 500px; display: block;" src="../images/${event.user}.png" data-holder-rendered="true">
        <div class="caption center">
            <h3>${event.name}</h3>
            <p>报酬:${event.price}</p>
            <p>发布时间:${event.date}</p>
            <p><a class="btn btn-primary btn-block" role="button" href="#">立即购买</a> <a class="btn btn-default btn-block" role="button" href="/docart?id=${event.id}&&name=${event.name}&&price=${event.price}&&content=${event.content}&&date=${event.date}&&user=${event.user}">加入待接委托</a></p>
        </div>
    </div>
    <div class="col-sm-8">
        <div class="caption">
            <h3>详细内容</h3>
            <p>${event.content}</p>

        </div>

    </div>

</div>

<!--footer-->
<!-- <div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div> -->
</body>
</html>
