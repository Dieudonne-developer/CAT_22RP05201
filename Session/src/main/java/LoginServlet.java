import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String VALID_USERNAME = "GROUP1";
    private static final String VALID_PASSWORD = "123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean rememberMe = "on".equals(request.getParameter("rememberMe"));

        if (!VALID_USERNAME.equals(username)) {
            response.sendRedirect("error.html?message=Username%20incorrect");
        } else if (!VALID_PASSWORD.equals(password)) {
            response.sendRedirect("error.html?message=Password%20incorrect");
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username);

            if (rememberMe) {
                // Set cookies with username and password
                Cookie usernameCookie = new Cookie("username", URLEncoder.encode(username, StandardCharsets.UTF_8.name()));
                Cookie passwordCookie = new Cookie("password", URLEncoder.encode(password, StandardCharsets.UTF_8.name()));

                // Set cookies to expire in 30 days
                usernameCookie.setMaxAge(30 * 24 * 60 * 60);
                passwordCookie.setMaxAge(30 * 24 * 60 * 60);

                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            } else {
                // Clear cookies if "Remember Me" is not selected
                Cookie usernameCookie = new Cookie("username", "");
                Cookie passwordCookie = new Cookie("password", "");

                usernameCookie.setMaxAge(0);
                passwordCookie.setMaxAge(0);

                response.addCookie(usernameCookie);
                response.addCookie(passwordCookie);
            }

            response.sendRedirect("welcome.html");
        }
    }
}
