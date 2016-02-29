package com.tracking.actions;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tracking.services.LoadPlanService;
import com.tracking.services.SignInCheckService;

public class SignInCheckAction extends ActionSupport {
	private String usrname;
	private String psword;
	private SignInCheckService scs;
	private LoadPlanService lps;
	
	public String getUsrname() {
		return usrname;
	}
	public void setUsrname(String usrname) {
		this.usrname = usrname;
	}
	public String getPsword() {
		return psword;
	}
	public void setPsword(String psword) {
		this.psword = psword;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		scs = new SignInCheckService();
		if(scs.signIn(this.usrname, this.psword)){
			lps = new LoadPlanService();
			List planlst = lps.loadPlan(this.usrname);
			JSONArray json = new JSONArray();
			json.addAll(planlst);
			String planlist = json.toString();
			ActionContext actionContext =  ActionContext.getContext();
			Map<String,Object> request = (Map)actionContext.get("request");
			request.put("username", usrname);
			request.put("planlist", planlist);
			System.out.println(json.toString());
			return SUCCESS;
		}else{
			return "failure";
		}
	}
	
}
