
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.Properties;
import java.util.ArrayList;
import java.util.List;
import com.*;

public class Playground extends HttpServlet {
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
            ArrayList<String> users = new ArrayList<>();
            PreparedStatement st =null;
            try {
                st = connection.prepareStatement("SELECT * FROM users");
                ResultSet rs = st.executeQuery();
                while (rs.next()){
                    int id = rs.getInt("id");
                    String username = rs.getString("username");
                    users.add(new User(id,username));
                }
                req.setAttribute("users",users);
                req.getRequestDispatcher("/sample.jsp").forward(req,res);
            } catch (SQLException e) {
                p.println(e);
                System.out.println(e);
            }finally {
                if (st != null) {
                st.close();
            }
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
