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
                <span class="sr-only">???????????????</span>
            </button>
            <a class="navbar-brand" href="Index.jsp">?????????</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="Index.jsp">??????</a></li>
                <li><a href="Order.jsp">????????????</a></li>
                <li><a href="UserInfo.jsp">????????????</a></li>

            </ul>
            <ul class="nav navbar-nav navbar-right hidden-sm">
                <li><a href="Login.jsp">??????</a></li>
                <li><a href="Register.jsp">??????</a></li>
                <li><a href="../../login.jsp">Dashboard</a></li>
                <li>
                    <a href="Cart.jsp"><span class="glyphicon glyphicon-shopping-cart">????????????</span></a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>
<!--content-->
<div class="container">
    <div class="row thumbnail center col-sm-12">
        <div class="col-sm-12">
            <h1 class="text-center" style="margin-bottom: 30px">????????????</h1>
        </div>

        <ul class="nav nav-tabs nav-justified" id="myTabs">
            <li class="active"><a href="#userHome" >????????????</a></li>
            <li ><a href="#editpic" >????????????</a></li>
            <li><a href="#editInfo">????????????</a></li>
            <li><a href="#editPassword">????????????</a></li>
            <li><a href="#orderManager">????????????</a></li>
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
                    <label>?????????:</label>${user.name} <br>
                    <label>??????:</label><b>******</b><br>
                    <label>????????????:</label>${user.phone} <br>
            </div>
            <div role="tabpanel" class="tab-pane" id="editpic">
                <form method="post" action="/CommonUpload" enctype="multipart/form-data">
                    ??????????????????:
                    <input type="file" name="Upload" style="width: 300px;"/>
                    <input type="submit" value="??????" />
                </form>
            </div>
            <div role="tabpanel" class="tab-pane" id="editInfo">
                <form action="/douserinfo">
                    <label>?????????:</label><input type="text" name="name" style="width: 100px;"><br>
                    <label>??? ???:</label><input type="text" name="pwd" style="width: 100px;"><br>
                    <label>?????????:</label><input type="text" name="phone" style="width: 100px;"><br>
                    <button type="submit" class="btn btn-success btn-block">??????</button>
                </form>
            </div>
            <div role="tabpanel" class="tab-pane" id="editPassword">
                <form action="/doupdatepwd">
                    <label>?????????:</label><input type="text" name="pwd" style="width: 100px;"><br>
                    <label>?????????:</label><input type="text" name="npwd" style="width: 100px;"><br>
                    <button type="submit" class="btn btn-success btn-block">??????</button>
                </form>
            </div>
            <div role="tabpanel" class="tab-pane" id="orderManager">
                <ul>
                    <%
                        HisDaoImp hdi=new HisDaoImp();
                        ArrayList<his> hlist=hdi.gethisbyuser(name);
                        for(his h:hlist){
                            out.print("<li>????????????:"+h.getId()+" ??????:"+h.getContent()+" ??????:"+h.getDate()+"</li>");
                        }
                    %>
                </ul>

            </div>
        </div>
    </div>
</div>

<!--footer-->
<!-- <div class="navbar navbar-default navbar-static-bottom">
    ???????????????
</div> -->
</body>
</html>
