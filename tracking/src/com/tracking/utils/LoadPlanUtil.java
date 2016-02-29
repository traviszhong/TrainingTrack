package com.tracking.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class LoadPlanUtil {

	private String driver;
	private String dbURL;
	private String uname;
	private String pword;
	private boolean successflag;
	
	public LoadPlanUtil(){
		this.driver = "com.mysql.jdbc.Driver";
		this.dbURL = "jdbc:mysql://localhost:3306/tracking";
		this.uname = "root";
		this.pword = "root";
		successflag = false;
	}
	
	public Plan loadPlanDetails(String pid){
		Connection dbConn;
		Plan pl = null;
		try {
			Class.forName(driver);
			dbConn = DriverManager.getConnection(dbURL, uname, pword);
			Statement st = dbConn.createStatement();
			ResultSet rs;
			rs=st.executeQuery("select PLANNAME,PLANCONTENT,COMPLETEDATE,RESULT from t_plan WHERE PID='" + pid + "'");
			if(rs.next()){
				String planname;
				String plancontent;
				String completedate;
				String result;
				if(rs.getString(1) != null){
					planname = rs.getString(1);
				}else{
					planname = "";
				}
				if(rs.getString(2) != null){
					plancontent = rs.getString(2);
				}else{
					plancontent = "";
				}
				if(rs.getString(3) != null){
					completedate = rs.getString(3);
				}else{
					completedate = "";
				}
				if(rs.getString(4) != null){
					result = rs.getString(4);
				}else{
					result = "";
				}
				pl = new Plan(pid, planname,plancontent,completedate,result);

			}
			dbConn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pl;
	}
	
	public List<VOPlan> loadPlan(String username){
		
		Connection dbConn;
		List plst = new ArrayList<VOPlan>();
		try {
			Class.forName(driver);
			dbConn = DriverManager.getConnection(dbURL, uname, pword);
			Statement st = dbConn.createStatement();
			ResultSet rs;
			rs=st.executeQuery("select PID,PLANNAME,COMPLETEDATE from t_plan WHERE USERNAME='" + username + "'");
			while(rs.next()){
				String pid = "" + rs.getInt(1);
				String planname;
				String completedate;
				if(rs.getString(2) != null){
					planname = rs.getString(2);
				}else{
					planname = "";
				}
				if(rs.getString(3) != null){
					completedate = rs.getString(3);
				}else{
					completedate = "";
				}
				VOPlan pl = new VOPlan(pid, planname, completedate);
				plst.add(pl);
			}
			dbConn.close();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return plst;
	}
}
