<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<form method="post">
<label>Name:</label>
<input type="text" name="name"><br><br>
<label>Username:</label>
<input type="email" name="username"><br><br>
<label>Password:</label>
<input type="password" name="password"><br><br>
<button name="submit">sign up</button>

<% 
if(request.getParameter("submit") !=null){
    String	name_22RP05201 =request.getParameter("name");
    String  username_22RP05201  =request.getParameter("username");
    String  password_22RP05201   =request.getParameter("password");
    String url ="jdbc:mysql://localhost:3306/emp22RP05201";
    String user="root";
    String pass="";
    Connection conn = null;
    PreparedStatement stp =null;
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection(url,user,pass);
    	String sql ="INSERT INTO users (name,username,password) VALUES(?,?,?)";
    	stp =conn.prepareStatement(sql);
    	stp.setString(1,name_22RP05201 );
    	stp.setString(2,username_22RP05201 );
    	stp.setString(3, password_22RP05201);
    	out.println("User inserted!");
    	response.sendRedirect("login.jsp");
    	
    }catch(Exception e){
    	out.println("<h3>Error:"+e.getMessage()+"</h3>");
    }finally{
    	if(stp !=null)try {stp.close();}catch(SQLException e){}
    	if(conn !=null)try {conn.close();}catch(SQLException e){}
    	
    }
    
}



%>
</form>
</fieldset>
</body>
</html>