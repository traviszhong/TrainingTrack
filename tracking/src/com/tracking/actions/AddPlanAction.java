package com.tracking.actions;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddPlanAction extends ActionSupport {

	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ActionContext actionContext =  ActionContext.getContext();
		Map<String,Object> request = (Map)actionContext.get("request");
		request.put("username", username);
		return SUCCESS;
	}
	
}
