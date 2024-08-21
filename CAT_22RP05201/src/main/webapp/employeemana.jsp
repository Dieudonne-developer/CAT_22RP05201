<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<button><a href="insert.jsp">Add User</a></button>
<center>
<table border="2">
<th>Employee ID</th>
<th>Employee name</th>
<th>task</th>
<th>Location</th>
<th colspan="2">Action</th>

<% 
String url ="jdbc:mysql://localhost:3306/emp22RP05201";
String user="root";
String pass="";
Connection conn = null;
Statement stp =null;
ResultSet rs =null;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	stp =conn.createStatement();
	String sql ="SELECT *FROM employee";
	rs = stp.executeQuery(sql);
	while(rs.next()){
		int id =rs.getInt("employeeid");
		String name =rs.getString("names");
		String task =rs.getString("task");
		String loc =rs.getString("location");
		%>
		<tr>
		<td><%= id%></td>
		<td><%=name %></td>
		<td><%= task%></td>
		<td><%=loc %></td>
		<td><button><a href="updete.jsp?employeeid=<%=id  %>">update</a></button></td>
		<td><button><a href="delete.jsp?employeeid=<%=id  %>">delete</a></button></td>
		<% 
	}
	
	
	
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	try{
    		if(rs !=null) rs.close();
    		if(stp !=null) stp.close();
    		if(conn !=null) conn.close();
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    }
%>
</table>
</center>
</body>
</html>