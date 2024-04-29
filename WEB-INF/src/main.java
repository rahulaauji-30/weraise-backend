package com;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class main extends HttpServlet{
    public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
        PrintWriter out = res.getWriter();
        out.println("<h1>Hello</h1>");
    }
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException{
        doGet(req, res);
    }
}