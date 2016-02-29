package com.tracking.services;

import java.util.List;

import com.tracking.utils.LoadPlanUtil;

public class LoadPlanService implements LoadPlan{
	private LoadPlanUtil lpu;
	/**
	 * 
	 * @param username: the username of current user
	 * @return: a list of plans
	 */
	public List loadPlan(String username){
		
		lpu = new LoadPlanUtil();
		return lpu.loadPlan(username);
	}
}
