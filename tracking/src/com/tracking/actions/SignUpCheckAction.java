package com.tracking.actions;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.tracking.services.SignUpService;

public class SignUpCheckAction extends ActionSupport {

	private String usrname;
	private String psword;
	private String firstname;
	private String lastname;
	private String email;
	private SignUpService sus;
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
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		
		this.sus = new SignUpService();
		if(sus.signUp(this.usrname, this.psword, this.firstname, this.lastname, this.email)){
			
			ActionContext actionContext =  ActionContext.getContext();
			Map<String,Object> request = (Map)actionContext.get("request");
			request.put("username", "usrname");
			return SUCCESS;
		}else{
			return "failed";
		}
	}
	
}
