package com.medical.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.medical.model.DataFile;
import com.medical.model.User;
import com.medical.service.DashboardService;

@Controller
public class DashBoardController 
{
	@Autowired
	DashboardService dashboardService;
	
	@RequestMapping(value={"/saveFile"},method=RequestMethod.POST)
	public void saveFile(@ModelAttribute("DataFile")DataFile file,HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println(file.getName());
		boolean isSave=dashboardService.saveFile(file);
		if(isSave)
		{
			System.out.println("file Successfully saved confirmation from dashboard controller");
		}
		else
		{
			System.out.println("file not saved<----------dashboard controller");
		}
	}
	
	@RequestMapping(value={"/getFiles"},method=RequestMethod.GET)
	public void getFiles(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("request to get file name ");
		String id=request.getParameter("id");
		System.out.println("id : "+id);
		String fileType=request.getParameter("fileType");
		System.out.println("fileType : "+fileType);
		response.setContentType(" application/json");
		String data=dashboardService.getFiles(id,fileType);
		System.out.println("---------------------");
		System.out.println(data);
		System.out.println("--------------------");
		if(data==null)
		{
			response.getWriter().write("[]");
			System.out.println("empty json response gaya");
		}
		else
		{
			response.getWriter().write(data);
			System.out.println("get file ka response gaya");
		}
	}
	
	@RequestMapping(value={"/updateFileType"},method=RequestMethod.GET)
	public void updateFileType(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("request to save file name");
		String id=request.getParameter("id");
		String fileName=request.getParameter("fileType");
		if(fileName!=null)
		{
			if(fileName.trim().length()!=0)
			{
				dashboardService.saveFileName(id,fileName);
				response.getWriter().write("successfully saved");
			}
		}
	}
	
	@RequestMapping(value={"/updateUser"},method=RequestMethod.POST)
	public void updateUser(@ModelAttribute("User")User user,HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("inside register-------------->");
		System.out.println(user.getId());
		System.out.println(user.getDate());
		System.out.println(user.getDob());
		System.out.println(user.getFirstName());
		System.out.println(user.getLastName());
		System.out.println(user.getGender());
		System.out.println(user.getMobile());
		System.out.println(user.getPassword());
		System.out.println(user.getRole());
		System.out.println(user.getImageFile());
		System.out.println(user.getImage());
		System.out.println(user.getIsDeleted());
		System.out.println("----------------done updating-------------");
		PrintWriter out=response.getWriter();
		out.write("haa bhai tune kr dikhaya------->update");
		
	}
	
	
	@RequestMapping(value={"/getUser"},method=RequestMethod.GET)
	public void getUser(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String id=request.getParameter("id");
		System.out.println("update user :  "+id);
		id=id.toLowerCase();
		//response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");
	   // response.getWriter().write(message);
		//response.setContentType("application/json");
		PrintWriter out=response.getWriter();
		String send="wrong";
		if(id.matches("^[a-z][a-z0-9]*[0-9]$"))
		{
			System.out.println("regex is working");
			String data=dashboardService.getUser(id);
			if(data!=null)
			{
				System.out.println("data gaya");
				out.write(data);
			}
			else
			{
				out.write(send);
			}
		}
		else
		{
			System.out.println("regex cause this "+id);
			out.write(send);
		}
		
		System.out.println("done sending user update");
		//out.println();
	}
	
	@RequestMapping(value = { "/getAllUsers"}, method =RequestMethod.GET)
	public void getAllUsers(HttpServletResponse response) throws IOException
	{
		System.out.println("<-------------------request for getting all users-----------<");
		String allUsers=dashboardService.getAllUsers();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(allUsers);
		out.flush();
		System.out.println("all user sent");
	}
	
	@RequestMapping(value = { "/userImage"}, method =RequestMethod.GET)
	public void getUserImage(@RequestParam("id") String id, HttpServletResponse response,HttpServletRequest request)
	{
		if(id!=null)
		{
			InputStream image=dashboardService.getImage(id);
			if(image==null)
			{
				System.out.println("image nahi aayi");
			}
			try 
			{
				byte[] img= IOUtils.toByteArray(image);
				response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
				response.getOutputStream().write(img);
				response.getOutputStream().close();
				System.out.println("gayi image : "+id);
			} 
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = { "/viewFile"}, method =RequestMethod.GET)
	public void viewFile(@RequestParam("fileId") String id, HttpServletResponse response,HttpServletRequest request)
	{
		if(id!=null)
		{
			InputStream image=dashboardService.getFile(id);
			if(image==null)
			{
				System.out.println("image nahi aayi");
			}
			try 
			{
				byte[] img= IOUtils.toByteArray(image);
				response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
				response.getOutputStream().write(img);
				response.getOutputStream().close();
				System.out.println("gayi file : "+id);
			} 
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
	}
}
