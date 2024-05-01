<%@page import="com.khusoe.dao.LoginManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	if (LoginManager.isValidUser(email, password)) {
        // If user is valid, forward to home.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    } else {
        // If user is invalid, forward back to login.jsp
        response.sendRedirect("login.jsp");
    }
	
	%>
</body>
</html>