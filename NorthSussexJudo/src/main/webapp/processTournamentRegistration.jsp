<%@page import="com.khusoe.dao.TournamentManage"%>
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


int idAthlete = Integer.parseInt(request.getParameter("idAthlete"));
String weightClass = request.getParameter("weightClass");
int noOfCompetition = Integer.parseInt(request.getParameter("numCompetitions"));
int tournament_idTournament = 1;

try {
	try (java.sql.Connection connection = com.khusoe.dao.DbManager.getConnection();
	java.sql.PreparedStatement statement = connection
	.prepareStatement("SELECT idTournament FROM tournament where weightClassName = ?")) {

		statement.setString(1, weightClass);

		try (java.sql.ResultSet resultSet = statement.executeQuery()) {
	if (resultSet.next()) {
		// Setting idTournament
		tournament_idTournament = resultSet.getInt("idTournament");
	}
		}

	} // Resources are automatically closed here

} catch (java.sql.SQLException e) {
	e.printStackTrace(); // Handle SQLException appropriately in your application
} catch (ClassNotFoundException e) {
	e.printStackTrace(); // Handle ClassNotFoundException appropriately in your application
}

boolean work = TournamentManage.addTournament(idAthlete, tournament_idTournament, noOfCompetition);
if (work) {
	request.getRequestDispatcher("home.jsp").forward(request, response);
} else {
	out.println("error");
}
%>
</body>
</html>