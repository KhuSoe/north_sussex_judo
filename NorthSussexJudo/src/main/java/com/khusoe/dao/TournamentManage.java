package com.khusoe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TournamentManage {
	
	public static boolean addTournament(int idAthlete, int tournament_idTournament, int noOfCompetition) {
		String SQL = "UPDATE athlete SET tournament_idTournament = ?, noOfCompetition = ? WHERE idAthlete = ?";
		
		try (Connection con = DbManager.getConnection();
				PreparedStatement psmt = con.prepareStatement(SQL)){
			psmt.setInt(1, tournament_idTournament);
			psmt.setInt(2, noOfCompetition);
			psmt.setInt(3, idAthlete);
			
			int rowsAffected = psmt.executeUpdate();
			if (rowsAffected > 0) {
				return true;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
