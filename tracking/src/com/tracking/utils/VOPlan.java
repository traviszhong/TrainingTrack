package com.tracking.utils;

public class VOPlan {
	private String id;
	private String planname;
	private String completedate;
	public VOPlan(String id, String planname, String completedate){
		this.id = id;
		this.planname = planname;
		this.completedate = completedate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPlanname() {
		return planname;
	}
	public void setPlanname(String planname) {
		this.planname = planname;
	}
	public String getCompletedate() {
		return completedate;
	}
	public void setCompletedate(String completedate) {
		this.completedate = completedate;
	}
}
