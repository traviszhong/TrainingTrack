package com.tracking.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SignUpUtil {
	private String driver;
	private String dbURL;
	private String uname;
	private String pword;
	private boolean successflag;
	
	public SignUpUtil(){
		this.driver = "com.mysql.jdbc.Driver";
		this.dbURL = "jdbc:mysql://localhost:3306/tracking";
		this.uname = "root";
		this.pword = "root";
		successflag = false;
	}
	public boolean confirmSignUp(String userName, String password, String firstName, String lastName, String email){
		
		Connection dbConn;
		try {
			Class.forName(driver);
			dbConn = DriverManager.getConnection(dbURL, uname, pword);
			String sql_insert = "INSERT INTO t_user(USERNAME,PASSWORD,FIRSTNAME,LASTNAME,EMAIL) VALUES(?,?,?,?,?)";
			PreparedStatement pst;
			pst = dbConn.prepareStatement(sql_insert);
			pst.setString(1, userName);
			pst.setString(2, password);
			pst.setString(3, firstName);
			pst.setString(4, lastName);
			pst.setString(5, email);
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
