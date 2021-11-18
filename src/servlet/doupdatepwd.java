package servlet;

import daoimp.UserDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "doupdatepwd", value = "/doupdatepwd")
public class doupdatepwd extends HttpServlet {
    UserDaoImp udi=new UserDaoImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String pwd=request.getParameter("pwd");
        String npwd=request.getParameter("npwd");
        String name= (String) session.getAttribute("name");
        udi.updatepwd(name,npwd);
        response.sendRedirect("Costumer/Home/Index.jsp");
    }
}
