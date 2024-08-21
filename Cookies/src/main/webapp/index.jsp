<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Username or Email</title>
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        h2 {
            margin: 0 0 20px;
            font-size: 24px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            color: #fff;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .message {
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body bgcolour="blue">
<center>
<div class="container">
    <h2>Enter your Username or Email</h2>
    <form action="saveUser" method="get">
        <label for="userInput">Username or Email:</label>
        <input type="text" id="userInput" name="userInput" 
               value="${cookie.user != null ? cookie.user.value : ''}"><br><br>
               <center>
        <input type="submit" value="Submit">
        </center>
    </form>
    </center>
    </div>
</body>
</html>
