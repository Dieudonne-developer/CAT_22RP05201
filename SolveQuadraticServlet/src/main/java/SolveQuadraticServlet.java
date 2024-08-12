
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SolveQuadraticServlet
 */
@WebServlet("/SolveQuadraticServlet")
public class SolveQuadraticServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SolveQuadraticServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the GET request to POST method for simplicity
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Parse coefficients from request
            double a = Double.parseDouble(request.getParameter("a"));
            double b = Double.parseDouble(request.getParameter("b"));
            double c = Double.parseDouble(request.getParameter("c"));

            // Calculate the discriminant
            double discriminant = b * b - 4 * a * c;
            double sqrtDiscriminant = Math.sqrt(Math.abs(discriminant));

            // Prepare results
            String result;
            if (discriminant > 0) {
                // Two real and distinct roots
                double root1 = (-b + sqrtDiscriminant) / (2 * a);
                double root2 = (-b - sqrtDiscriminant) / (2 * a);
                result = "Roots are real and distinct.<br>Root 1: " + root1 + "<br>Root 2: " + root2;
            } else if (discriminant == 0) {
                // One real root
                double root = -b / (2 * a);
                result = "Root is real and repeated.<br>Root: " + root;
            } else {
                // Complex roots
                double realPart = -b / (2 * a);
                double imaginaryPart = sqrtDiscriminant / (2 * a);
                result = "Roots are complex.<br>Root 1: " + realPart + " + " + imaginaryPart + "i<br>Root 2: " + realPart + " - " + imaginaryPart + "i";
            }

            // Display results
            out.println("<html><body>");
            out.println("<h2>Results:</h2>");
            out.println(result);
            out.println("<br><a href='index.html'>Back</a>");
            out.println("</body></html>");
        } catch (NumberFormatException e) {
            out.println("<html><body><h2>Error: Invalid input</h2></body></html>");
        }
    }
}
