package servlet;

import daoimp.UserDaoImp;
import entity.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "docuser", value = "/docuser")
public class docuser extends HttpServlet {
    String name=null;
    String pwd=null;
    UserDaoImp udi=new UserDaoImp();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        name=req.getParameter("name");
        pwd=req.getParameter("pwd");
        user user= udi.getAllUser(name,pwd);
        if(user.getName()!=null){
                session.setAttribute("name",name);
                resp.sendRedirect("Costumer/Home/UserInfo.jsp");
        }else {
            resp.sendRedirect("Costumer/Home/Register.jsp");
        }
    }
}
