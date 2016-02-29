package com.tracking.actions;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tracking.services.LoadPlanService;

public class GoBackAction extends ActionSupport {
	private String usrname;
	private LoadPlanService lps;
	public String getUsrname() {
		return usrname;
	}
	public void setUsrname(String usrname) {
		this.usrname = usrname;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		lps = new LoadPlanService();
		List planlst = lps.loadPlan(this.usrname);
		JSONArray json = new JSONArray();
		json.addAll(planlst);
		String planlist = json.toString();
		ActionContext actionContext =  ActionContext.getContext();
		Map<String,Object> request = (Map)actionContext.get("request");
		request.put("username", this.usrname);
		request.put("planlist", planlist);
		System.out.println(json.toString());
		return SUCCESS;
	}
	
}
