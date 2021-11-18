package servlet;

import daoimp.UserDaoImp;
import entity.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "adduser", value = "/adduser")
public class adduser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String name=request.getParameter("name");
        String pwd=request.getParameter("pwd");
        String phone=request.getParameter("phone");
        UserDaoImp udi=new UserDaoImp();
        udi.insertuser(name,pwd,phone);
        session.setAttribute("name",name);
        response.sendRedirect("Costumer/Home/UserInfo.jsp");
    }
}
