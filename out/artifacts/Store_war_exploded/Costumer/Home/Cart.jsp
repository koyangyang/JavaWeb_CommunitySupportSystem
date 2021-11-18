<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.event" %><%--
  Created by IntelliJ IDEA.
  User: codeyang
  Date: 2021/6/25
  Time: 21:16
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
        .line-center{
            line-height:50px;
            text-align: center;
        }
        .row input{
            width: 50px;
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
    <div class="row thumbnail center">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">待接委托</h1>
        </div>
        <div class=" list-group">

            <div class="col-sm-12 thumbnail">
                <div class="col-sm-4 line-center">委托名称</div>
                <div class="col-sm-1 line-center">报酬</div>
                <div class="col-sm-4 line-center">委托人</div>
                <div class="col-sm-2 line-center">委托时间</div>
                <div class="col-sm-1 line-center">操作</div>
            </div>
            <%
                ArrayList<event> elist= (ArrayList<event>) session.getAttribute("elist");
                if(elist!=null){
                    for(event e:elist){
                        out.print("<div class=\"col-sm-12  list-group-item\">\n" +
                                "                <div class=\"col-sm-1 line-center\" style=\"width: 50px;height: 50px;\">\n" +
                                "\n" +
                                "                    <img src=\"../Flat-UI-master/dist/img/icons/png/Book.png\" style=\"height: 100%;\" alt=\"\"/>\n" +
                                "                </div>\n" +
                                "                <div class=\"col-sm-3 line-center\">"+e.getName()+"</div>\n" +
                                "                <div class=\"col-sm-1 line-center\">"+e.getPrice()+"</div>\n" +
                                "                <div class=\"col-sm-4 line-center\">\n" +
                                "                    "+e.getUser()+"</div>\n" +
                                "                <div class=\"col-sm-2 line-center\">"+e.getDate()+"</div>\n" +
                                "                <div class=\"col-sm-1 line-center\"><button class=\"btn btn-danger\">删除</button></div>\n" +
                                "            </div>");
                    }
                }

            %>

        </div>
        <div class="col-sm-offset-7 col-sm-5" style="padding: 30px;">
            <div class="col-sm-6 btn btn-success btn-block"><a href="Index.jsp">继续浏览</a></div>
            <div class="col-sm-6  btn btn-success btn-block"><a  href="/dosum">接受任务</a></div>
        </div>
    </div>
</div>

<!--footer-->
<!-- <div class="navbar navbar-default navbar-static-bottom">
    版权声明区
</div> -->
</body>
</html>
