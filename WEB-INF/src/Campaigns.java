package database;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.Properties;

public class Campaigns extends HttpServlet {
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
                PreparedStatement st = connection.prepareStatement("INSERT INTO campaigns(userid,category,title,yturl,imgurl,story,bio,amount,end_date) VALUES (?,?,?,?,?,?,?,?,?)");
                st.setInt(1, Integer.parseInt(req.getParameter("userid")));
                st.setString(2, req.getParameter("category"));
                st.setString(3, req.getParameter("title"));
                st.setString(4, req.getParameter("yturl"));
                st.setString(5, req.getParameter("imgurl"));
                st.setString(6, req.getParameter("story"));
                st.setString(7, req.getParameter("bio"));
                st.setFloat(8, Float.parseFloat(req.getParameter("amount")));
                st.setDate(9, java.sql.Date.valueOf(req.getParameter("end")));
                st.executeUpdate();
                st.close();
                res.sendRedirect("./dashboard");
            } catch (SQLException e) {
                p.println(e);
                System.out.println(e);
            }

        } catch (SQLException | ClassNotFoundException e) {
            p.println(e);
            System.out.println(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    p.println(e);
                    System.out.println(e);
                }
            }
        }
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        doGet(req, res);
    }
}
