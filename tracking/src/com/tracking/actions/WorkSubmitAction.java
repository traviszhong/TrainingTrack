package com.tracking.actions;

import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tracking.services.ViewPlanService;
import com.tracking.services.WorkSubmitService;
import com.tracking.utils.Plan;

public class WorkSubmitAction extends ActionSupport {
	private String username;
	private String pid;
	private String youtubelink;
	private WorkSubmitService wss;
	private ViewPlanService vps;
	public String getYoutubelink() {
		return youtubelink;
	}
	public void setYoutubelink(String youtubelink) {
		this.youtubelink = youtubelink;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.wss = new WorkSubmitService();
		if(wss.submitWork(pid, youtubelink)){
			vps = new ViewPlanService();
			Plan pl = vps.viewPlan(this.pid);
			if(pl != null){
				JSONObject json = JSONObject.fromObject(pl); 
				String plan = json.toString();
				System.out.println(plan);
				ActionContext actionContext =  ActionContext.getContext();
				Map<String,Object> request = (Map)actionContext.get("request");
				request.put("username",this.username);
				request.put("plan", plan);
			}
			return SUCCESS;
		}else{
			return "failed";
		}
	}
}
