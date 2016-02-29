package com.tracking.services;

import com.tracking.utils.WorkSubmitUtil;

public class WorkSubmitService implements WorkSubmit{
	private WorkSubmitUtil wsu;
	/**
	 * 
	 * @param pid: Plan Id
	 * @param link: A link to the work
	 * @return: Whether it is successful or not
	 */
	public boolean submitWork(String pid,String link){
		this.wsu = new WorkSubmitUtil();
		return wsu.submitWorkToDB(pid, link);
	}
}
