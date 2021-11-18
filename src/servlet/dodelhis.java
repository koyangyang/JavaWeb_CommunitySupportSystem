package servlet;

import daoimp.HisDaoImp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "dodelhis", value = "/dodelhis")
public class dodelhis extends HttpServlet {
    HisDaoImp hdi=new HisDaoImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        hdi.delhis(id);;
        response.sendRedirect("history.jsp");
    }
}
