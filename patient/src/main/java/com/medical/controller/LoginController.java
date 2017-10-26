package com.medical.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.medical.model.DataFile;
import com.medical.model.User;
import com.medical.service.LoginService;
import com.medical.util.PasswordResetMail;
import com.medical.util.Utilmail;

@Controller
public class LoginController 
{
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value = { "/login"}, method = RequestMethod.GET)
	public String loginPage(User user,Model model,@RequestParam(required = false) String invalid)
	{
		model.addAttribute("user", user);
		model.addAttribute("invalid", invalid);
		System.out.println("login GET");
		return "login";
	}
	
	@RequestMapping(value = { "/signIn"}, method = RequestMethod.POST)
	public String signIn(@ModelAttribute("user")User user,BindingResult result,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception
	{
		System.out.println("sign in ke liye request aayi hai----------------->>>");
		/*String email=request.getParameter("email");
		String password=request.getParameter("password");*/
		String role=request.getParameter("role");
		boolean isActivated=false;
		
			if(result.hasErrors())
			{
				System.out.println("it contains error");
				model.addAttribute("user",user);
				return "login";
			}
			 user=loginService.signIn(user.getEmail(),user.getPassword(),role);
			if(user==null)
			{
				model.addAttribute("invalid", "Invalid email or password");
				return "redirect:/login";
			}
			else
			{
				HttpSession session=request.getSession(true);
				session.setAttribute("user", user);
				isActivated=!user.getIsDeleted();
				if(!isActivated)
				{
					String pin=""+Math.round(Math.random()*1000000);
					boolean isSend=Utilmail.confirmationMail(user.getEmail(),user.getPassword(),user.getFirstName(),pin);
					if(isSend)
					{
						
						session.setAttribute("pin", pin);
						System.out.println("pin is set for varification");
						System.out.println("mail send");
					}
					else
					{
						System.out.println("email send fail");
					}
					return "confirmation";
				}
				
				
			}
		
		
		System.out.println("-----login done---------");
		model.addAttribute("user",user);
		model.addAttribute("DataFile",new DataFile());
		return "dashboard";
	}
	
	@RequestMapping(value = { "/resetPassword"}, method = RequestMethod.POST)
	public String reset(User user,Model model,HttpServletRequest request)
	{
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		user=loginService.checkData(email,mobile);
		boolean sendMail=false;
		if(user==null)
		{
			System.out.println("kisi user ka yah email or mobile number nahi hai");
			model.addAttribute("invalidReset","yes");
			
		}
		else
		{
			sendMail=true;
			HttpSession session=request.getSession(true);
			session.setAttribute("user", user);
			model.addAttribute("checkMail", "yes");
		}
		if(sendMail)
		{
			boolean isMailed=PasswordResetMail.resetMail(user.getEmail(), user.getPassword(), user.getFirstName());
			if(isMailed)
				System.out.println("mail send kr diya hai");
			else
				System.out.println("reset mail nahi jaa paaya");
		}
		model.addAttribute("user",new User());
		return "login";
	}
	
	@RequestMapping(value = { "/newPassword"}, method = RequestMethod.POST)
	public String setNewPassword(User user,Model model,HttpServletRequest request)
	{
		String new_pasword=request.getParameter("password");
		System.out.println("new password: "+new_pasword);
		HttpSession session=request.getSession(false);
		user=(User) session.getAttribute("user");
		boolean isChange=loginService.setNewPassword(user.getEmail(),new_pasword);
		model.addAttribute("user",new User());
		if(isChange)
		{
			System.out.println("passwordchanged");
			model.addAttribute("passwordchanged","yes");
		}
		else
		{
			model.addAttribute("failedToChangePassword","yes");
			System.out.println("password not changed");
		}
		return "login";
	}
	
	@RequestMapping(value = { "/changePassword"}, method = RequestMethod.GET)
	public String emailClick(User user,Model model,HttpServletRequest request)
	{
		HttpSession session=request.getSession(false);
		if(session==null)
		{
			HttpSession s=request.getSession(true);
			s.setAttribute("checkMail", "yes");
			model.addAttribute("user",new User());
			return "login";
		}
		else
		{
			return "resetPassword";
		}
	}
}
