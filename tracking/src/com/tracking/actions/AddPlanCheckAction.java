package com.tracking.actions;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tracking.services.AddPlanService;
import com.tracking.services.LoadPlanService;

public class AddPlanCheckAction extends ActionSupport {

	private String planname;
	private String plancontent;
	private String completedate;
	private String username;
	private AddPlanService aps;
	private LoadPlanService lps;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		aps = new AddPlanService();
		this.lps = new LoadPlanService();
		if(aps.addPlan(planname, plancontent, completedate, username)){
			lps = new LoadPlanService();
			List planlst = lps.loadPlan(this.username);
			JSONArray json = new JSONArray();
			json.addAll(planlst);
			String planlist = json.toString();
			ActionContext actionContext =  ActionContext.getContext();
			Map<String,Object> request = (Map)actionContext.get("request");
			request.put("username", this.username);
			request.put("planlist", planlist);
			System.out.println(json.toString());
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
}
