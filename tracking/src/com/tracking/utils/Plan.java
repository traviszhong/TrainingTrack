package com.tracking.utils;

public class Plan {

	private String planname;
	private String plancontent;
	private String completedate;
	private String id;
	private String result;
	public Plan(String id, String planname, String plancontent, String completedate, String result){
		this.id = id;
		this.planname = planname;
		this.plancontent = plancontent;
		this.completedate = completedate;
		this.result = result;
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
	public String getPlancontent() {
		return plancontent;
	}
	public void setPlancontent(String plancontent) {
		this.plancontent = plancontent;
	}
	public String getCompletedate() {
		return completedate;
	}
	public void setCompletedate(String completedate) {
		this.completedate = completedate;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
}
