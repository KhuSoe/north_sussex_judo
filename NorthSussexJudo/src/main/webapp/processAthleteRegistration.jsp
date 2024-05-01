<%@page import="com.khusoe.dao.AthleteManage"%>
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
	

		String name = request.getParameter("name");
		int plan_idPlan = 1;
		int weight = Integer.parseInt(request.getParameter("weight"));
		int coachingHour = Integer.parseInt(request.getParameter("coachingHour"));

		try {
			try (java.sql.Connection connection = com.khusoe.dao.DbManager.getConnection();
			java.sql.PreparedStatement statement = connection
			.prepareStatement("SELECT idPlan FROM plan where planName = ?")) {

		String chosenPlan = request.getParameter("plan");
		statement.setString(1, chosenPlan);

		try (java.sql.ResultSet resultSet = statement.executeQuery()) {
			if (resultSet.next()) {
		// Setting plan value
		plan_idPlan = resultSet.getInt("idPlan");
			}
		}

			} // Resources are automatically closed here

		} catch (java.sql.SQLException e) {
			e.printStackTrace(); // Handle SQLException appropriately in your application
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // Handle ClassNotFoundException appropriately in your application
		}

		int idAthlete = AthleteManage.addAthlete(name, plan_idPlan, weight, coachingHour);
		if (-1 != idAthlete && (!(request.getParameter("plan").equals("Beginner")))) {
			// Forward to tournamentRegistration page
			request.setAttribute("idAthlete", idAthlete);
			request.getRequestDispatcher("tournamentRegistration.jsp").forward(request, response);
		} else {
			// Redirect to error page
			response.sendRedirect("home.jsp");
		}
	%>
</body>
</html>