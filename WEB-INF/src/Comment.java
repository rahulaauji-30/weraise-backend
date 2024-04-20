package com.database;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.*;
import java.io.InputStream;
import java.util.Properties;
import java.io.IOException;

public class Comment extends HttpServlet{
    private static String DB;
    private static String USER;
    private static String PASSWORD;

    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{
            loadDatabasePropertise();
        }catch (IOException e){
            throw new ServletException("Failed to load database properties",e);
        }
    }
    private void loadDatabasePropertise() throws IOException{
        String configFile = "/config.properties";
        System.out.println("Trying to load config file: " + configFile);
        Properties properties = new Properties();
        try(InputStream inputStream = getClass().getClassLoader().getResourceAsStream(configFile)){
            if (inputStream == null) {
            throw new FileNotFoundException("Database properties file not found: " + configFile);
        }
        properties.load(inputStream);
        System.out.println("Properties loaded successfully.");
        }
        DB=properties.getProperty("db.url");
        USER = properties.getProperty("db.user");
        PASSWORD = properties.getProperty("db.password");
    }

    public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
        Connection connection = null;
        PrintWriter p = res.getWriter();
        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(DB,USER,PASSWORD);
            try{
                Statement st = connection.createStatement();
                PreparedStatement st = connection.prepareStatement("INSERT INTO users(username,password,name) values (?)");
                st.setObject(req.getParameter("username"),req.getParameter("password"),req.getParameter("fname"));
                st.executeUpdate();
                st.close();
            }catch (SQLException|ClassNotFoundException e){
                p.println(e);
                System.out.println(e);
            }
        }catch (SQLException|ClassNotFoundException e){
            p.println(e);
            System.out.println(e);
        }finally {
            if(connection != null){
                try{
                    connection.close();
                    p.println("connection Closed");
                }catch (SQLException e){
                    p.println(e);
                    System.out.println(e);
                }
            }
            p.println("<h1>Database Connected Succsessfully</h1>"+PASSWORD+" "+USER+" "+DB);
        }
    }
    public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException{
        doGet(req, res);
    }
}