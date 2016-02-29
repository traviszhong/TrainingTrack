package com.tracking.services;

import com.tracking.utils.LoadPlanUtil;
import com.tracking.utils.Plan;

public class ViewPlanService implements ViewPlan{
	
	private LoadPlanUtil lpu;
	/**
	 * 
	 * @param id: The plan id in database
	 * @return: The response which is a plan
	 */
	public Plan viewPlan(String id){
		lpu = new LoadPlanUtil();
		return lpu.loadPlanDetails(id);
	}
}
