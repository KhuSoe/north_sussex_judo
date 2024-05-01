<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>North Sussex Judo</title>
<style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
Home.jsp this is
<h2>Athletes Data</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Current Weight</th>
                <th>Plan</th>
                <th>Weight Class</th>
                <th>No of Competition</th>
            </tr>
        </thead>
        <tbody>
            <% 
            try {
                java.sql.Connection conn = com.khusoe.dao.DbManager.getConnection();
                java.sql.Statement stmt = conn.createStatement();
                java.sql.ResultSet rs = stmt.executeQuery("SELECT a.idAthlete, a.name, a.weight, p.planName, t.weightClassName, a.noOfCompetition FROM athlete a " +
                                                  "JOIN plan p ON a.plan_idPlan = p.idPlan " +
                                                  "LEFT JOIN tournament t ON a.tournament_idTournament = t.idTournament");
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("idAthlete") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getInt("weight") %></td>
                <td><%= rs.getString("planName") %></td>
                <td><%= rs.getString("weightClassName") %></td>
                <td><%= rs.getInt("noOfCompetition") %></td>
            </tr>
            <%
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
<a href="athleteRegistration.jsp">register athlete</a>
</body>
</html>