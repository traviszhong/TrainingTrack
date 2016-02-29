package com.tracking.services;

import com.tracking.utils.SignUpUtil;

public class SignUpService implements SignUp{

	private SignUpUtil sut;
	/**
	 * 
	 * @param userName: User name of current user
	 * @param password: The password of current user
	 * @param firstName:First name, the user's information
	 * @param lastName: Last name , the user's information
	 * @param email: Email, the user's information
	 * @return: Whether it's successful or not
	 */
	public boolean signUp(String userName, String password, String firstName, String lastName, String email){
		this.sut = new SignUpUtil();
		return sut.confirmSignUp(userName, password, firstName, lastName, email);
	}
}
