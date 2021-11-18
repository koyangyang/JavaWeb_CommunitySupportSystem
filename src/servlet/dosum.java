package servlet;

import daoimp.HisDaoImp;
import entity.event;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "dosum", value = "/dosum")
public class dosum extends HttpServlet {
    HisDaoImp hdi=new HisDaoImp();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String str="";
        double count=0.0;
        String user= (String) session.getAttribute("name");
        ArrayList<event> elist= (ArrayList<event>) session.getAttribute("elist");
        if(elist!=null){
            for (event e:elist){
                str=str+"接取了: "+e.getName()+" 委托，详细内容是: "+e.getContent()+" ,完成报酬是: "+e.getPrice();
                count=count+e.getPrice();
            }
            str=str+" 一共总计为:"+count+"元";
        }
        if(!str.equals("")){
            hdi.inserthis(user,str);
            session.removeAttribute("elist");
        }
        response.sendRedirect("Costumer/Home/Index.jsp");
    }
}
