package com.database;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.Properties;

public class Register extends HttpServlet {
    private static String DB;
    private static String USER;
    private static String PASSWORD;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            loadDatabaseProperties();
        } catch (IOException e) {
            throw new ServletException("Failed to load database properties", e);
        }
    }

    private void loadDatabaseProperties() throws IOException {
        String configFile = "/config.properties";
        System.out.println("Trying to load config file: " + configFile);
        Properties properties = new Properties();
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream(configFile)) {
            if (inputStream == null) {
                throw new FileNotFoundException("Database properties file not found: " + configFile);
            }
            properties.load(inputStream);
            System.out.println("Properties loaded successfully.");
        }
        DB = properties.getProperty("db.url");
        USER = properties.getProperty("db.user");
        PASSWORD = properties.getProperty("db.password");
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        Connection connection = null;
        PrintWriter p = res.getWriter();
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(DB, USER, PASSWORD);
            try {
                PreparedStatement st = connection.prepareStatement("INSERT INTO users(username, password, name) VALUES (?, ?, ?)");
                st.setString(1, req.getParameter("username"));
                st.setString(2, req.getParameter("password"));
                st.setString(3, req.getParameter("fname"));
                st.executeUpdate();
                st.close();
            } catch (SQLException e) {
                p.println(e);
                p.println(req.getParameter("fname"));
                System.out.println(e);
            }
        } catch (SQLException | ClassNotFoundException e) {
            p.println(e);
            System.out.println(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                    p.println("Connection Closed");
                } catch (SQLException e) {
                    p.println(e);
                    System.out.println(e);
                }
            }
            p.println("<h1>Database Connected Successfully</h1>" + PASSWORD + " " + USER + " " + DB);
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }
}
