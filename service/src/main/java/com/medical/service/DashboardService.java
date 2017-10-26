package com.medical.service;

import java.io.InputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.medical.model.DataFile;
import com.medical.model.User;
import com.medical.repository.DashboardRepository;

@Service
public class DashboardService 
{	
	@Autowired
	DashboardRepository dashboardRepository;
	public InputStream getImage(String id)
	{
		InputStream userImage=dashboardRepository.getUserImage(id);
		return userImage;
	}
	
	public String getAllUsers()
	{
		return dashboardRepository.getAllUsers();
	}

	public String getUser(String id) {
		return dashboardRepository.getUser(id);
	}

	public void saveFileName(String id, String fileName)
	{
		dashboardRepository.saveFileName(id,fileName);
		
	}

	public String getFiles(String id, String fileType) 
	{
		
		return dashboardRepository.getFiles(id,fileType);
	}

	public boolean saveFile(DataFile file)
	{
		return dashboardRepository.saveFile(file);
	}

	public InputStream getFile(String id) 
	{
		return dashboardRepository.getFile(id);
	}

}
