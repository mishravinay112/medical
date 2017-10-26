package com.medical.repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import org.springframework.stereotype.Repository;

import com.medical.connection.JdbcConfig;
import com.medical.model.User;

@Repository
public class LoginRepository
{
	
	public User signIn(String email, String password,String role) throws Exception 
	{
		System.out.println("inside loginRepo");
		User user=new User();
		user.setEmail(email);
		user.setPassword(password);
		Connection con=JdbcConfig.getConnection();
		String query="select id, firstName,lastName,dob,email, password, date, time, mobile,role, isDeleted,image,gender from user where email='"+email+"' and password='"+password+"' and role='"+role+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		boolean isValid=false;
		System.out.println("before while loop");
		while(rs.next())
		{
			isValid=true;
			user.setId(rs.getString(1));
			user.setFirstName(rs.getString(2));
			user.setLastName(rs.getString(3));
			user.setDob(rs.getString(4));
			user.setDate(rs.getString(7));
			user.setTime(rs.getString(8));
			user.setMobile(rs.getString(9));
			user.setRole(rs.getString(10));
			user.setIsDeleted(rs.getBoolean(11));
			user.setImage(rs.getBinaryStream(12));
			user.setGender(rs.getString(13));
		}
		System.out.println("after while loop");
		System.out.println(user.getFirstName());
		System.out.println(user.getLastName());
		System.out.println(user.getId());
		System.out.println(user.getDate());
		System.out.println(user.getDob());
		System.out.println(user.getEmail());
		System.out.println(user.getRole());
		System.out.println(user.getMobile());
		System.out.println("-----------------");
		if(!isValid)
		{
			return null;
		}
		System.out.println("login successFul");
		return user;
	}

	public User checkData(String email, String mobile) 
	{
		User user=new User();
		boolean isValid=false;
		try{
		Connection con=JdbcConfig.getConnection();
		String query="select id, firstName,lastName,dob,email, password, date, time, mobile,role, isDeleted,image,gender from user where email='"+email+"' or mobile='"+mobile+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		System.out.println("before while loop");
		while(rs.next())
		{
			System.out.println("yes email or mobile is right");
			isValid=true;
			user.setId(rs.getString(1));
			user.setFirstName(rs.getString(2));
			user.setLastName(rs.getString(3));
			user.setDob(rs.getString(4));
			user.setEmail(rs.getString(5));
			user.setPassword(rs.getString(6));
			user.setDate(rs.getString(7));
			user.setTime(rs.getString(8));
			user.setMobile(rs.getString(9));
			user.setRole(rs.getString(10));
			user.setIsDeleted(rs.getBoolean(11));
			user.setImage(rs.getBinaryStream(12));
			user.setGender(rs.getString(13));
			
			}
		
		}
		catch(Exception e)
		{
			System.out.println("reset password check in database-----------error in try block");
			e.printStackTrace();
		}
		if(!isValid)
		{
			return null;
		}
		
		return user;
	}

	public boolean setNewPassword(String email, String new_pasword)
	{
		System.out.println("set new password user loginrepo");
		System.out.println("new password : "+new_pasword);
		try
		{
			Connection con = JdbcConfig.getConnection();
			Statement st=con.createStatement();
			String query="UPDATE USER SET password='"+new_pasword+"' WHERE email='"+email+"'";
			int update=st.executeUpdate(query);
			System.out.println("no of user password updated : "+update);
			if(update==1)
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
	
