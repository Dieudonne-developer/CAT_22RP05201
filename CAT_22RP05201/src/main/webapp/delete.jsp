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
<%
String url ="jdbc:mysql://localhost:3306/emp22RP05201";
String user="root";
String pass="";
Connection conn = null;
PreparedStatement stp =null;
String employeeid =request.getParameter("employeeid");
String message ="";
if(employeeid !=null){
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,user,pass);
	String sql ="DELETE FROM employee WHERE employeeid=?";
	stp =conn.prepareStatement(sql);
	stp.setString(1, employeeid);
	int rowActected=stp.executeUpdate();
	if(rowActected >0 ){
		message ="employee deleted";
	}else{
		message ="employee not deleted";
	}
	}

catch(Exception e){
	message = e.getMessage();
}
}
%>
<div><h1><%=message %></h1></div>
</body>
</html>