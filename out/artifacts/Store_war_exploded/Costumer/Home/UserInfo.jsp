<%@ page import="daoimp.UserDaoImp" %>
<%@ page import="entity.user" %>
<%@ page import="daoimp.HisDaoImp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.his" %>
<%--
  Created by IntelliJ IDEA.
  User: codeyang
  Date: 2021/6/24
  Time: 9:26
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
        .list-group-item:hover{
            background: #27ae60;

        }
        .list-group-item div:first-child:hover{

            cursor: pointer;
        }
        th{
            text-align: right;
            width: 10%;;
            padding: 10px;
        }
        td{
            text-align: left;
            width: 30%;;
            padding: 10px;
        }
        .table th{
            text-align: center;
        }
        .table td{
            text-align: center;
        }
    </style>
    <script>
        function myClick(n){
            location.href = "OrderInfo.jsp";
        }
        function btnClick(){
            alert("btn");
            return false;
        }
        $(function(){

        })
    </script>
    <script>
        $(function(){
            $('#myTabs a').click(function (e) {

                $(this).tab('show')
            });
        })
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
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">个人中心</h1>
        </div>

        <ul class="nav nav-tabs nav-justified" id="myTabs">
            <li class="active"><a href="#userHome" >个人中心</a></li>
            <li ><a href="#editpic" >修改头像</a></li>
            <li><a href="#editInfo">信息修改</a></li>
            <li><a href="#editPassword">密码修改</a></li>
            <li><a href="#orderManager">历史委托</a></li>
        </ul>

        <!-- Tab panes -->
        <%
            UserDaoImp udi=new UserDaoImp();
            String name= (String) session.getAttribute("name");
            user user=udi.getUserbyName(name);
            pageContext.setAttribute("user",user);
        %>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="userHome">
                    <label>用户名:</label>${user.name} <br>
                    <label>密码:</label><b>******</b><br>
                    <label>联系方式:</label>${user.phone} <br>
            </div>
            <div role="tabpanel" class="tab-pane" id="editpic">
                <form method="post" action="/CommonUpload" enctype="multipart/form-data">
                    选择一个文件:
                    <input type="file" name="Upload" style="width: 300px;"/>
                    <input type="submit" value="上传" />
                </form>
            </div>
            <div role="tabpanel" class="tab-pane" id="editInfo">
                <form action="/douserinfo">
                    <label>用户名:</label><input type="text" name="name" style="width: 100px;"><br>
                    <label>密 码:</label><input type="text" name="pwd" style="width: 100px;"><br>
                    <label>手机号:</label><input type="text" name="phone" style="width: 100px;"><br>
                    <button type="submit" class="btn btn-success btn-block">修改</button>
                </form>
            </div>
            <div role="tabpanel" class="tab-pane" id="editPassword">
                <form action="/doupdatepwd">
                    <label>原密码:</label><input type="text" name="pwd" style="width: 100px;"><br>
                    <label>新密码:</label><input type="text" name="npwd" style="width: 100px;"><br>
                    <button type="submit" class="btn btn-success btn-block">修改</button>
                </form>
            </div>
            <div role="tabpanel" class="tab-pane" id="orderManager">
                <ul>
                    <%
                        HisDaoImp hdi=new HisDaoImp();
                        ArrayList<his> hlist=hdi.gethisbyuser(name);
                        for(his h:hlist){
                            out.print("<li>记录编号:"+h.getId()+" 内容:"+h.getContent()+" 时间:"+h.getDate()+"</li>");
                        }
                    %>
                </ul>

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
