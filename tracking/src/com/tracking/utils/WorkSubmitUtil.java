package com.tracking.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class WorkSubmitUtil {
	private String driver;
	private String dbURL;
	private String uname;
	private String pword;
	private boolean successflag;
	
	public WorkSubmitUtil(){
		this.driver = "com.mysql.jdbc.Driver";
		this.dbURL = "jdbc:mysql://localhost:3306/tracking";
		this.uname = "root";
		this.pword = "root";
		successflag = false;
	}
	
	public boolean submitWorkToDB(String pid, String link){
		Connection dbConn;
		try {
			Class.forName(driver);
			dbConn = DriverManager.getConnection(dbURL, uname, pword);
			String sql_update = "UPDATE t_plan SET RESULT = ? WHERE PID = ?";
			PreparedStatement pst;
			pst = dbConn.prepareStatement(sql_update);
			pst.setString(1, link);
			pst.setInt(2, Integer.parseInt(pid));
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
