package com.khusoe.dao;

import java.sql.SQLException;

public class Test {
	public static void main(String[] args) {
		try {
			System.out.println(AthleteManage.addAthlete("Khu Soe", 1, 20, 1));
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
