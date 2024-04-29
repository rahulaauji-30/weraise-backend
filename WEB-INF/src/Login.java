package security;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.Properties;
import java.security.NoSuchAlgorithmException;
public class Login extends HttpServlet {
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
                MD md = new MD();
                String password = null;
                try{
                   password = md.MD5(req.getParameter("password"));
                }catch (NoSuchAlgorithmException e){
                    System.err.println("MD5 algorithm not found.");
                }
                PreparedStatement st = connection.prepareStatement("SELECT * FROM users WHERE username = ?");
                st.setString(1,req.getParameter("username"));
                ResultSet rs = st.executeQuery();
                if(rs.next()){
                    if(password.equals(rs.getString("password"))){
                        HttpSession session = req.getSession();
                        session.setAttribute("id",rs.getInt("id"));
                        session.setAttribute("username",req.getParameter("username"));
                        res.sendRedirect("./dashboard");
                    }else{
                        p.println("<h1>Password is wrong</h1>"+req.getParameter("password"));
                    }
                }else{
                    p.println("<h1>No user named "+ req.getParameter("username") +"</h1>");
                }
                st.close();

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
