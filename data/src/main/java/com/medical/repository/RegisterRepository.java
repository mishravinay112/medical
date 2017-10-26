package com.medical.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import org.springframework.stereotype.Repository;

import com.medical.connection.JdbcConfig;
import com.medical.model.User;

@Repository
public class RegisterRepository {

	public boolean save(User user) {

		try {
			Connection con = JdbcConfig.getConnection();
			String query = "insert into user(id,firstName,lastName,dob,email,password,date,time,mobile,role,isDeleted,image,gender,entry_time) "
					+ "		values(?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getId());
			ps.setString(2, user.getFirstName());
			ps.setString(3, user.getLastName());
			ps.setString(4, user.getDob());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getPassword());
			ps.setString(7, user.getDate());
			ps.setString(8, user.getTime());
			ps.setString(9, user.getMobile());
			ps.setString(10, user.getRole());
			ps.setBoolean(11, user.getIsDeleted());
			ps.setBinaryStream(12, user.getImageFile().getInputStream());
			ps.setString(13, user.getGender());
			int p = ps.executeUpdate();
			System.out.println("successfully saved " + p + " person");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;

	}

	public boolean activateUser(String email)
	{
		System.out.println("activate user repo");
		try
		{
			Connection con = JdbcConfig.getConnection();
			Statement st=con.createStatement();
			String query="UPDATE USER SET isDeleted=FALSE WHERE email='"+email+"'";
			int update=st.executeUpdate(query);
			System.out.println("no of user activated : "+update);
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
