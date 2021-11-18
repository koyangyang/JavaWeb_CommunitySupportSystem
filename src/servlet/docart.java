package servlet;

import entity.event;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "docart", value = "/docart")
public class docart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        int id= Integer.parseInt(request.getParameter("id"));
        String  name=request.getParameter("name");
        double  price= Double.parseDouble(request.getParameter("price"));
        String  content=request.getParameter("content");
        String  date=request.getParameter("date");
        String  user=request.getParameter("user");
        event event=new event();
        event.setId(id);
        event.setName(name);
        event.setPrice(price);
        event.setContent(content);
        event.setDate(date);
        event.setUser(user);
        ArrayList<event> elist= (ArrayList<event>) session.getAttribute("elist");
        if (elist!=null){
            elist.add(event);
            session.setAttribute("elist",elist);
        }else{
            elist=new ArrayList<>();
            elist.add(event);
            session.setAttribute("elist",elist);
        }
        response.sendRedirect("Costumer/Home/Index.jsp");
    }
}
