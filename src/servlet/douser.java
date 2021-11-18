package servlet;

/**
 * @Classname douser
 * @Description TODO
 * @Date 2021/6/3 13:54
 * @Created by codeyang
 * @Describ:
 */
import daoimp.UserDaoImp;
import entity.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/user")
public class douser extends HttpServlet {
    String name=null;
    String pwd=null;
    UserDaoImp udi=new UserDaoImp();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        name=req.getParameter("name");
        pwd=req.getParameter("pwd");
        user user=udi.getAllUser(name,pwd);
        if (user.getStatus()==1){
            session.setAttribute("status",user.getStatus());
            resp.sendRedirect("admin.jsp");
        }else {
                session.setAttribute("status",user.getStatus());
                resp.sendRedirect("Costumer/Home/Index.jsp");
        }

    }
}
