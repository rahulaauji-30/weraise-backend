package database;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.Properties;
import java.security.NoSuchAlgorithmException;
import database.Campaign;
import java.util.*;

public class GetCampaign extends HttpServlet {
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
        List<Campaign> campaigns = new ArrayList<>();
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(DB, USER, PASSWORD);

            try {
                PreparedStatement st = connection.prepareStatement("SELECT * from campaigns");
                ResultSet rs = st.executeQuery();
                while (rs.next()){
                    Campaign cm = new Campaign();
                    cm.setId(rs.getInt("id"));
                    cm.setUserId(rs.getInt("userid"));
                    cm.setCategory(rs.getString("category"));
                    cm.setTitle(rs.getString("title"));
                    cm.setYturl(rs.getString("yturl"));
                    cm.setImgurl(rs.getString("imgurl"));
                    cm.setStory(rs.getString("story"));
                    cm.setBio(rs.getString("bio"));
                    cm.setAmount(rs.getInt("amount"));
                    cm.setAmountRaised(rs.getInt("amountraised"));
                    cm.setStartDate(rs.getDate("start_date"));
                    cm.setEndDate(rs.getDate("end_date"));
                    campaigns.add(cm);
                }
                st.close();
                System.out.println(campaigns);
                req.setAttribute("campaigns",campaigns);
                req.getRequestDispatcher("/index.jsp").forward(req,res);
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
}
