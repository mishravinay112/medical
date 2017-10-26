package com.medical.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.model.User;
import com.medical.repository.LoginRepository;

@Service
public class LoginService
{
	@Autowired
	LoginRepository loginRepository;

	public User signIn(String email, String password,String role) throws Exception 
	{
		return loginRepository.signIn(email,password,role);
	}

	public User checkData(String email, String mobile)
	{
		return loginRepository.checkData(email,mobile);
	}

	public boolean setNewPassword(String email, String new_pasword) 
	{
		
		return loginRepository.setNewPassword(email,new_pasword);
	}
	
}
