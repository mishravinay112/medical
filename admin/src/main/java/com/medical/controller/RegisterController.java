package com.medical.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medical.model.User;
import com.medical.service.RegisterService;
import com.medical.util.Utilmail;

@Controller
public class RegisterController 
{
	@Autowired
	RegisterService registerService;
	
	@RequestMapping(value = {"/register"}, method = RequestMethod.POST)
	public String register(@ModelAttribute("User")User user,Model model,HttpServletRequest request) throws Exception
	{
		
		System.out.println("inside register");
		user.setId(user.getFirstName().toLowerCase()+user.getLastName().toLowerCase()+user.getDob().replaceAll("/", ""));
		LocalDateTime current= LocalDateTime.now();
		DateTimeFormatter current_date = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		DateTimeFormatter current_time = DateTimeFormatter.ofPattern("HH:mm:ss");
		user.setDate(current.format(current_date));
		user.setTime(current.format(current_time));
		user.setIsDeleted(true);
		String gender=request.getParameter("gen");
		//System.out.println(gender+"<-----");
		user.setGender(gender);
		//System.out.println(user.getEmail());
		try
		{
			System.out.println("Bytes Length : "+user.getImageFile().getBytes().length);
		}
		catch (IOException e)
		{
			System.out.println("user ke data ki image post nahi ho paa rahi");
			e.printStackTrace();
		}
		/*System.out.println("----------------------");
		System.out.println(" id : "+user.getId());
		System.out.println("name : "+user.getFirstName()+" "+user.getLastName());
		System.out.println(user.getDob());
		System.out.println(user.getEmail());
		System.out.println(user.getPassword());
		System.out.println(user.getRole());
		System.out.println(user.getDate());
		System.out.println(user.getTime());
		System.out.println(user.getIsDeleted());
		System.out.println(user.getGender());
		System.out.println(user.getMobile());
		System.out.println("------------------");*/
		
		boolean isSave=registerService.save(user);
		
		if(isSave)
		{
			HttpSession session=request.getSession(true);
			String pin=""+Math.round(Math.random()*1000000);
			boolean isSend=Utilmail.confirmationMail(user.getEmail(),user.getPassword(),user.getFirstName(),pin);
			if(isSend)
			{
				session.setAttribute("user", user);
				session.setAttribute("pin", pin);
				System.out.println("pin is set for varification");
				System.out.println("mail send");
			}
			else
			{
				session.setAttribute("user", user);
				System.out.println("email send fail");
				model.addAttribute("user",user);
				return "confirmation";
			}
		}
		
		return "confirmation";
	}
	
	@RequestMapping(value = {"/pin_confirm"}, method = RequestMethod.GET)
	public String pinConfirmation(@ModelAttribute("user")User user,Model model,HttpServletRequest request) throws Exception
	{
		
		String pin=request.getParameter("pin");
		HttpSession session=request.getSession(false);
		System.out.println(pin);
		if(session!=null)
		{
			user=(User) session.getAttribute("user");
			String savedPin=(String) session.getAttribute("pin");
			if(savedPin.equals(pin))
			{
				System.out.println(user.getEmail());
				System.out.println("session pin is matched with entered pin");
				boolean activate=registerService.activateUser(user.getEmail());
				if(activate)
				{
					model.addAttribute("user",user);
					return "login";
				}
				
			}
				System.out.println("not matched pin");
				model.addAttribute("msg","invalid pin");
				return "confirmation";
			
		}
		else
		{
			model.addAttribute("user",new User());
			model.addAttribute("loginFirst","please login first to proceed");
			return "login";
		}
	}
	
	@RequestMapping(value = {"/send_again"}, method = RequestMethod.GET)
	public String resend(@ModelAttribute("user")User user,Model model,HttpServletRequest request) throws Exception
	{
		HttpSession session=request.getSession(false);
		if(session==null)
		{
			model.addAttribute("user", user);
			return "login";
		}
		user=(User) session.getAttribute("user");
		System.out.println("is user null :"+user==null);
		System.out.println("resend mail method ");
		String pin=""+Math.round(Math.random()*1000000);
			boolean isSend=Utilmail.confirmationMail(user.getEmail(),user.getPassword(),user.getFirstName(),pin);
		
		if(isSend)
		{
			session.setAttribute("pin", pin);
			System.out.println("pin is set for varification");
			System.out.println("mail send");
			session.setAttribute("sent", "yes");
		}
		else
		{
			System.out.println("email send fail");
			session.removeAttribute("sent");
		}
		return "confirmation";
	}
	
}
