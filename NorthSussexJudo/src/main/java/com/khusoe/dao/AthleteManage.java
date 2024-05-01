package com.khusoe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AthleteManage {

	public static int addAthlete(String name, int plan, int weight, int coachingHour) throws ClassNotFoundException, SQLException {
	    String SQL = "INSERT INTO athlete (name, weight, plan_idPlan, coachingHour) VALUES (?, ?, ?, ?)";

	    try (Connection con = DbManager.getConnection();
	         PreparedStatement psmt = con.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {

	        psmt.setString(1, name);
	        psmt.setInt(2, weight);
	        psmt.setInt(3, plan);
	        psmt.setInt(4, coachingHour);

	        int rowsAffected = psmt.executeUpdate();
	        if (rowsAffected > 0) {
	            // Retrieve the generated keys
	            ResultSet generatedKeys = psmt.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                // Return the auto-generated ID
	                return generatedKeys.getInt(1);
	            }
	        }
	        return -1; // Return -1 if no ID is generated
	    }
	}

}

