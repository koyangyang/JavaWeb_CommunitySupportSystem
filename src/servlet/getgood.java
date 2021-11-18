package servlet;

import daoimp.EventDaoImp;
import entity.event;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/getgood")
public class getgood extends HttpServlet {
    ArrayList<event> glist=new ArrayList<>();

    @Override
    public void init() throws ServletException {
        EventDaoImp gdi=new EventDaoImp();
        glist=gdi.getAllGoods();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        session.setAttribute("glist",glist);
        resp.sendRedirect("admin.jsp");
    }
}
