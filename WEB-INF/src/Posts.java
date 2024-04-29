package database;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Properties;
import java.util.*;
import database.Campaign;
import database.User;
public class Posts extends HttpServlet{
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
    public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException{
        PrintWriter out = res.getWriter();
        Connection conn = null;
        List<Campaign> campaigns = new ArrayList<>();
        List<User> users = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(DB,USER,PASSWORD);
            PreparedStatement st = null;
            ResultSet rs = null;
            try{
                st = conn.prepareStatement("SELECT * from campaigns");
                rs = st.executeQuery();
                while(rs.next()){
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
                rs.close();
                st.close();

                st = conn.prepareStatement("SELECT * from users");
                rs = st.executeQuery();
                while(rs.next()){
                    User u = new User(rs.getInt("id"),rs.getString("username"),rs.getString("name"),rs.getString("imgurl"),rs.getString("bio"),rs.getString("locations"));
                    users.add(u);
                    }
                rs.close();
                st.close();
                req.setAttribute("campaigns",campaigns);
                req.setAttribute("cid",Integer.parseInt(req.getParameter("id")));
                req.setAttribute("users",users);

                if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.println(e);
                    System.out.println(e);
                }
            }
                req.getRequestDispatcher("./individual.jsp").forward(req,res);
            }catch (SQLException e){
                out.println(e);
            }
        }catch (SQLException | ClassNotFoundException e) {
            out.println(e);
        }
    }
    public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
        doGet(req,res);
    }
}