package com.medical.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.model.User;
import com.medical.repository.RegisterRepository;

@Service
public class RegisterService 
{
	@Autowired
	RegisterRepository registerRepo;
	
	public boolean save(User user) 
	{
		return registerRepo.save(user);
	}

	public boolean activateUser(String email) 
	{
		System.out.println("activate user service");
		return registerRepo.activateUser(email);
	}

}
