package com.tracking.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddPlanUtil {

	private String driver;
	private String dbURL;
	private String uname;
	private String pword;
	private boolean successflag;
	
	public AddPlanUtil(){
		this.driver = "com.mysql.jdbc.Driver";
		this.dbURL = "jdbc:mysql://localhost:3306/tracking";
		this.uname = "root";
		this.pword = "root";
		successflag = false;
	}
	
	public boolean confirmAddPlan(String planname, String plancontent, String completedate, String username){
		
		Connection dbConn;
		try {
			Class.forName(driver);
			dbConn = DriverManager.getConnection(dbURL, uname, pword);
			String sql_insert = "INSERT INTO t_plan(PLANNAME,PLANCONTENT,COMPLETEDATE,USERNAME) VALUES(?,?,?,?)";
			PreparedStatement pst;
			pst = dbConn.prepareStatement(sql_insert);
			pst.setString(1, planname);
			pst.setString(2, plancontent);
			pst.setString(3, completedate);
			pst.setString(4, username);
			pst.executeUpdate();
			dbConn.close();
			this.successflag = true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.successflag = false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			this.successflag = false;
		}
		return this.successflag;
	}
}
