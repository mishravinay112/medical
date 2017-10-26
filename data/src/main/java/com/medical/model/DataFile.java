package com.medical.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class DataFile implements Serializable
{
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String getDate()
	{
		return date;
	}
	public void setDate(String date) 
	{
		this.date = date;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name) 
	{
		this.name = name;
	}
	public String getUserId() 
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getDescription()
	{
		return Description;
	}
	public void setDescription(String description)
	{
		Description = description;
	}
	public String getFileType() 
	{
		return fileType;
	}
	public void setFileType(String fileType)
	{
		this.fileType = fileType;
	}
	public MultipartFile getFile() 
	{
		return file;
	}
	public void setFile(MultipartFile file) 
	{
		this.file = file;
	}
	@Override
	public String toString()
	{
		return name+" "+date+" "+userId+" "+Description+" "+fileType+" "+file+" "+fileId;
	}
	
	
	private String date;
	private String name;
	private String userId;
	private String Description;
	private String fileType;
	private String fileId;
	private MultipartFile file;
	
	
	
}
