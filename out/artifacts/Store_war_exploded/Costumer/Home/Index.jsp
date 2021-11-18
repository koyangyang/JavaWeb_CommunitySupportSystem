<%@ page import="daoimp.EventDaoImp" %>
<%@ page import="entity.event" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: codeyang
  Date: 2021/6/22
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head lang="en">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="../bootstrap-3.3.4/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../Flat-UI-master/dist/css/flat-ui.min.css"/>
    <script src="../bootstrap-3.3.4/dist/js/jquery-1.11.3.min.js"></script>
    <script src="../bootstrap-3.3.4/dist/js/bootstrap.min.js"></script>
    <script src="../Flat-UI-master/dist/js/flat-ui.min.js"></script>
    <title></title>
    <style>
        .row{
            margin-top: 20px;;
        }
        .center{
            text-align: center;
        }
        .pagination{
            background: #cccccc;
        }
        .jumbotron{
            background-image: url("../images/index.jpg");
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
<!--content-->
<div class="container">
    <div class="jumbotron">
        <h1>社区互助系统</h1>
        <p>...</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">了解更多</a></p>
    </div>
    <%
        EventDaoImp gdi=new EventDaoImp();
        ArrayList<event> glist=gdi.getAllGoods();
        for(event g:glist){
            out.print("<div class=\"col-sm-4 col-md-3\">\n" +
                    "            <div class=\"thumbnail\" >\n" +
                    "                <a href=\"BookInfo.jsp?id="+g.getId()+"\">\n" +
                    "                    <img style=\"width: 100%; height: 200px; display: block;\" alt=\"100%x200\" src=\"../images/"+g.getUser()+".png\" data-src=\"../images/"+g.getId()+".png\" data-holder-rendered=\"true\">\n" +
                    "                </a>\n" +
                    "                <div class=\"caption center\">\n" +
                    "                    <h3>"+g.getName()+"</h3>\n" +
                    "                    <p><span>报酬:</span><span>"+g.getPrice()+"</span></p>\n" +
                    "                    <p><a class=\"btn btn-primary btn-block\" role=\"button\" href=\"BookInfo.jsp?id="+g.getId()+"\">查看详情</a></p>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "        </div>");
        }
    %>

    <nav class="center">
        <ul class="pagination  pagination-lg">
            <li>
                <a href="#" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">末页</span>
                </a>
            </li>
        </ul>
    </nav>

</div>

<!--footer-->
<!-- <div class="navbar navbar-default navbar-static-bottom">
版权声明区
</div> -->
</body>
</html>
