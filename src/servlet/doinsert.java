package servlet;

import daoimp.EventDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "doinsert", value = "/doinsert")
public class doinsert extends HttpServlet {
    EventDaoImp gdi=new EventDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        double price= Double.parseDouble(request.getParameter("price"));
        String content=request.getParameter("content");
        String user=request.getParameter("user");
        gdi.insertgood(name, price, content, user);
        response.sendRedirect("insert.jsp");
    }
}
