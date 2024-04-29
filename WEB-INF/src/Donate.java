package database;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.Properties;
import java.security.NoSuchAlgorithmException;

public class Donate extends HttpServlet {
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
                float amount = Float.parseFloat(req.getParameter("amount"));
                PreparedStatement st = connection.prepareStatement("SELECT amountraised from campaigns where id = ?");
                st.setInt(1,Integer.parseInt(req.getParameter("id")));
                ResultSet rs = st.executeQuery();
                if(rs.next()){
                    amount += rs.getFloat("amountraised");
                }
                st.close();

                st = connection.prepareStatement("UPDATE campaigns SET amountraised = ? where id = ?");
                st.setFloat(1,amount);
                st.setInt(2,Integer.parseInt(req.getParameter("id")));
                st.executeUpdate();
                st.close();
                req.getRequestDispatcher("./post").forward(req,res);
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
        doGet(req,res);
    }
}
