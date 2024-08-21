<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
div{box-shadow:"black 5px";
border:"2";}
</style>
</head>

<body>
<center>
<div class="a">
<fieldset>
<form method="post">
<input type="email" name="username" placeholder="Enter Username"><br><br>
<input type="password" name="password" placeholder="Enter password"><br><br>
<input type= "checkbox" name="check"><br>
<button name="login">Login</button>
<br>
sing up <a href="signup.jsp">here</a>
<% 
if(request.getParameter("login") !=null){
    
    String  username_22RP05201  =request.getParameter("username");
    String  password_22RP05201   =request.getParameter("password");
    String url ="jdbc:mysql://localhost:3306/emp22RP05201";
    String user="root";
    String pass="";
    Connection conn = null;
    PreparedStatement stp =null;
    ResultSet rs =null;
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection(url,user,pass);
    	String sql ="SELECT * FROM users WHERE username=? AND password =? ";
    	stp =conn.prepareStatement(sql);
    	
    	stp.setString(1,username_22RP05201 );
    	stp.setString(2, password_22RP05201);
    	rs =stp.executeQuery();
		if(rs.next()){
			out.println("<h3>Login successfull </h3>");
			out.println("<p>Welcome,"+username_22RP05201+"!</h3>");
			response.sendRedirect("employeemana.jsp");
			}else{
				out.println("Invalid Username or Password");
			}
		
	}catch(Exception e){
		out.println("<h3>Error:"+e.getMessage());
	} finally{
		if(rs != null) try{rs.close();} catch(SQLException e){}
		if(stp != null) try{stp.close();} catch(SQLException e){}
		if(conn != null) try{conn.close();} catch(SQLException e){}
	}
}
	%>
</form>
</fieldset>
</div>
</center>
</body>
</html>