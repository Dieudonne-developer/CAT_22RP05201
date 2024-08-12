package a22RP05201;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Form
 */
public class Form extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        response.setContentType("text/html");
	        PrintWriter out=response.getWriter();
	    	String unme = request.getParameter("username");
	        String pass = request.getParameter("password");

	        if (unme.equals("rp") &&pass.equals("huye")) {
	           RequestDispatcher rd=request.getRequestDispatcher("servlet3");
	           
	           rd.forward(request, response);
	        } else {
	            out.print("errorMessage");
	           out.print("<a href='loginform.html'>GO</a>");
	        }
	    }
	}