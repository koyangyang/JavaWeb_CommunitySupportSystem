package servlet;

import daoimp.UserDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "douserinfo", value = "/douserinfo")
public class douserinfo extends HttpServlet {
    UserDaoImp udi=new UserDaoImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String pwd=request.getParameter("pwd");
        String phone=request.getParameter("phone");
        udi.updateinfo(name,pwd,phone);
        response.sendRedirect("Costumer/Home/Index.jsp");
    }
}
