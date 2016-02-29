package com.tracking.services;

import com.tracking.utils.SignInCheck;

public class SignInCheckService{
	private SignInCheck sc;
	public boolean signIn(String userName, String password){
		sc = new SignInCheck();
		return sc.checkSignIn(userName, password);
	}
}
