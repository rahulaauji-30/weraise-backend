package security;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
public class Authentication extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
            HttpSession session = req.getSession(false);
            if(session == null){
                res.sendRedirect("./login.html");
            }else{
                PrintWriter out = res.getWriter();
                out.println(req.getParameter("value"));
                String value = req.getParameter("value");
                if(value!=null){
                    if(value.equals("create")){
                    System.out.println("CRREATE");
                    res.sendRedirect("./create.jsp");
                } else if (value.equals("comments")) {
                    res.sendRedirect("./comments");
                } else if (value.equals("donate")) {
                        res.sendRedirect("./donate.jsp");
                    }
                }else{
                    res.sendRedirect("./");
                }
            }

        }
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
        doGet(req, res);
   }
}