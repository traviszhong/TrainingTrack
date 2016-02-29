package com.tracking.services;

import com.tracking.utils.AddPlanUtil;

public class AddPlanService implements AddPlan {
	private AddPlanUtil apu;
	/**
	 * 
	 * @param planname:the name of plan in database
	 * @param plancontent: the content of the plan
	 * @param completedate: the date the plan is completed
	 * @param username: user name of the user who add the plan
	 * @return: whether the add plan is successful or not
	 */	
	public boolean addPlan(String planname, String plancontent, String completedate, String username){
		apu = new AddPlanUtil();
		if(apu.confirmAddPlan(planname, plancontent, completedate, username)){
			return true;
		}else{
			return false;
		}
	}
}
