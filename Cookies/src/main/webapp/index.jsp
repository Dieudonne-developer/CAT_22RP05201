<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Username or Email</title>
</head>
<body bgcolour="blue">
<center>
    <h2>Enter your Username or Email</h2>
    <form action="saveUser" method="post">
        <label for="userInput">Username or Email:</label>
        <input type="text" id="userInput" name="userInput" 
               value="${cookie.userInfo != null ? cookie.userInfo.value : ''}"><br><br>
               <center>
        <input type="submit" value="Submit">
        </center>
    </form>
    </center>
</body>
</html>
