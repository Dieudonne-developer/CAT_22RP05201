import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/responseCode")
public class ResponseCodeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("notFound".equals(action)) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "404 Not Found: The requested resource was not found.");
        } else if ("serverError".equals(action)) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "500 Internal Server Error: An unexpected error occurred.");
        } else {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().println("Request was successful.");
        }
    }
}
