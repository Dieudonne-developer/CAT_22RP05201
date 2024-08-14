import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Update these constants with your XAMPP MySQL settings
    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database_name";
    private static final String DB_USER = "root"; // Default XAMPP MySQL username
    private static final String DB_PASSWORD = ""; // Default XAMPP MySQL password, leave empty if not set

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String newUsername = request.getParameter("username");
        String newPassword = request.getParameter("password");

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "INSERT INTO login_register (username, password) VALUES (?, ?) ON DUPLICATE KEY UPDATE password = VALUES(password)";
            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, newUsername);
                statement.setString(2, newPassword);
                int rowsAffected = statement.executeUpdate();
                if (rowsAffected > 0) {
                    response.sendRedirect("success.html?message=Credentials%20updated%20successfully");
                } else {
                    response.sendRedirect("error.html?message=An%20error%20occurred");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.html?message=An%20error%20occurred");
        }
    }
}
