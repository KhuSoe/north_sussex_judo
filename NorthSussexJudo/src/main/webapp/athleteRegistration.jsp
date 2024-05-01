<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h2>Registration Form</h2>
	<form action="processAthleteRegistration.jsp" method="post">
		<label for="name">Name:</label><br> <input type="text" id="name"
			name="name" required><br>
		<br> <label for="weight">Weight:</label><br> <input
			type="number" id="weight" name="weight" required><br>
		<br> <label for="plan">Plan:</label><br> <select
			id="plan" name="plan">
			<!-- Retrieve tournament plans from the database -->
			<%
			

				try {
					java.sql.Connection connection = com.khusoe.dao.DbManager.getConnection();
					java.sql.PreparedStatement statement = connection.prepareStatement("SELECT planName FROM plan");
					java.sql.ResultSet resultSet = statement.executeQuery();
					while (resultSet.next()) {
						String planName = resultSet.getString("planName");
			%>
			<option value="<%=planName%>"><%=planName%></option>
			<%
			}
			resultSet.close();
			statement.close();
			connection.close();
			} catch (java.sql.SQLException | ClassNotFoundException e) {
			e.printStackTrace(); // Handle exceptions appropriately in your application
			}
			%>
		</select><br>
		<br> <label for="coachingHour">Coaching Hour (0 to 5):</label><br>
		<input type="number" id="coachingHour" name="coachingHour" min="0"
			max="5" step="1" required="required"><br>
		<br> <input type="submit" value="Submit">
	</form>

</body>
</html>