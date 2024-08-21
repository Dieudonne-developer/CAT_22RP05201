package cookies;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveUser")
public class SaveUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String userInput = request.getParameter("userInput");
        
        // Create a cookie to store the username or email
        Cookie e = new Cookie("user", userInput);
        e .setMaxAge(60*60*24*7); // Set cookie to expire in one week
        response.addCookie(e);
        
        // Redirect back to the index.jsp page
        response.sendRedirect("cookies.html");
    }
}
