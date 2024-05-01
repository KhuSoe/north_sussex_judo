<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.khusoe.dao.DbManager" %>

<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
</head>
<body>
    <h2>Athlete Registration Form</h2>
    <form action="processTournamentRegistration.jsp" method="post">
        <input type="hidden" name="idAthlete" value="<%= request.getAttribute("idAthlete") %>">
        <label for="weightClass">Select Weight Class:</label><br>
        <select id="weightClass" name="weightClass">
            <!-- Retrieve weight classes from the database -->
            <%
            try (Connection conn = DbManager.getConnection();
                    PreparedStatement stmt = conn.prepareStatement("SELECT weightClassName FROM tournament");
                    ResultSet rs = stmt.executeQuery()){
                
                while (rs.next()) {
                    String weightClass = rs.getString("weightClassName");
            %>
            <option value="<%=weightClass%>"><%=weightClass%></option>
            <%
                }
            
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            %>
        </select><br><br>

        <label for="numCompetitions">Number of Competitions (1 to 5):</label><br>
        <input type="number" id="numCompetitions" name="numCompetitions" min="1" max="5" required><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
