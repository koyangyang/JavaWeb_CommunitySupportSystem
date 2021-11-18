package servlet;

import daoimp.EventDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "docinsert", value = "/docinsert")
public class docinsert extends HttpServlet {
    EventDaoImp gdi=new EventDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        double price= Double.parseDouble(request.getParameter("price"));
        String content=request.getParameter("content");
        String user=request.getParameter("user");
        gdi.insertgood(name, price, content, user);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
