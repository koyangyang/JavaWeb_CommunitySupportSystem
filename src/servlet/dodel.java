package servlet;

import daoimp.EventDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "dodel", value = "/dodel")
public class dodel extends HttpServlet {
    EventDaoImp gdi=new EventDaoImp();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        gdi.delgood(id);;
        response.sendRedirect("admin.jsp");
    }

}
