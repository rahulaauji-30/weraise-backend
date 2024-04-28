import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Properties;
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
        String pid = req.getPathInfo().substring(1);
        PrintWriter out = res.getWriter();
        Connection conn = null;
        try{
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(DB,USER,PASSWORD);
            PreparedStatement st = null;
            try{
                st = conn.prepareStatement("SELECT * from campaigns where id = ?");
                st.setInt(1,Integer.parseInt(pid));
                ResultSet rs = st.executeQuery();
                while(rs.next()){
                    out.println("Id: "+pid);
                    out.println("Id: "+rs.getInt("id"));
                    out.println("User Id: "+rs.getInt("userid"));
                    out.println("Title: "+rs.getString("title"));
                    }
                rs.close();
                st.close();
                res.sendRedirect("./individual page.html");
            }catch (SQLException e){
                out.println(e);
            }
        }catch (SQLException | ClassNotFoundException e) {
            out.println(e);
        }finally {
            out.println("Hello "+pid);
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.println(e);
                    System.out.println(e);
                }
            }
        }
    }
}