package com.khusoe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginManager {
	
	public static boolean isValidUser(String email, String password) throws ClassNotFoundException {
	    String SQL = "select * from user where email = ? and password = ?";
	    
	    try (Connection con = DbManager.getConnection();
	         PreparedStatement psmt = con.prepareStatement(SQL)) {
	        
	        psmt.setString(1, email);
	        psmt.setString(2, password);
	        
	        try (ResultSet resultSet = psmt.executeQuery()) {
	            return resultSet.next();
	        }
	    } catch (SQLException e) {
	        // Handle SQLException
	        e.printStackTrace();
	    }
	    
	    return false;
	}

}
