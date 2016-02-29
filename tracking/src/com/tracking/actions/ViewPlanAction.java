package com.tracking.actions;

import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tracking.services.ViewPlanService;
import com.tracking.utils.Plan;


public class ViewPlanAction extends ActionSupport {

	private String planid;
	private String username;
	private ViewPlanService vps;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPlanid() {
		return planid;
	}

	public void setPlanid(String planid) {
		this.planid = planid;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		vps = new ViewPlanService();
		Plan pl = vps.viewPlan(this.planid);
		if(pl != null){
			JSONObject json = JSONObject.fromObject(pl); 
			String plan = json.toString();
			ActionContext actionContext =  ActionContext.getContext();
			Map<String,Object> request = (Map)actionContext.get("request");
			//request.put("username", username);
			request.put("plan", plan);
		}
		return SUCCESS;
	}
	
}
