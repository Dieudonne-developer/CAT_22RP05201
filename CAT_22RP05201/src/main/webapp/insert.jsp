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
<form method="post">
<label>Name:</label>
<input type="text" name="name"><br><br>
<label>task:</label>
<input type="text" name="task"><br><br>
<label>location:</label>
<input type="text" name="location"><br><br>
<button name="submit">insert </button>
</form>
<% 
if(request.getParameter("submit") !=null){
    String	name_22RP05201 =request.getParameter("name");
    String  task_22RP05201  =request.getParameter("task");
    String  loc_22RP05201   =request.getParameter("location");
    String url ="jdbc:mysql://localhost:3306/emp22RP05201";
    String user="root";
    String pass="";
    Connection conn = null;
    PreparedStatement stp =null;
    try{
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection(url,user,pass);
    	String sql ="INSERT INTO employee (names,task,location) VALUES(?,?,?)";
    	stp =conn.prepareStatement(sql);
    	stp.setString(1,name_22RP05201 );
    	stp.setString(2,task_22RP05201 );
    	stp.setString(3, loc_22RP05201);
    	out.println("<h3>Employee inserted!</h3>");
    	response.sendRedirect("employeemana.jsp");
    	
    }catch(Exception e){
    	out.println("<h3>Error:"+e.getMessage()+"</h3>");
    }finally{
    	if(stp !=null)try {stp.close();}catch(SQLException e){}
    	if(conn !=null)try {conn.close();}catch(SQLException e){}
    	
    }
    
}



%>
</body>
</html>