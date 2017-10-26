package com.medical.repository;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.medical.connection.JdbcConfig;
import com.medical.model.DataFile;

@Repository
public class DashboardRepository 
{

	public InputStream getUserImage(String id)
	{
		InputStream image=null;
		try
		{
			Connection con=JdbcConfig.getConnection();
			String query="select image from user where id='"+id+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			int check=1;
			while(rs.next())
			{
				System.out.println(id+" user ki image aa gayi hai "+check+" bar chala");
				image=rs.getBinaryStream(1);
				
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return image;
	}
	
	public  Map<String,Integer> monitorNewUsers(Timestamp lastVisitedTime,int hit)
	{
		Map<String,Integer>user;
		try
		{
			Connection con=JdbcConfig.getConnection();
			String query="SELECT * FROM USER  where entry_time >'"+lastVisitedTime+"'";
			user=new HashMap<String,Integer>();
			user.put("doctor", 0);
			user.put("care_team", 0);
			user.put("patient", 0);
			user.put("pharmacist", 0);
			ResultSet rs=con.createStatement().executeQuery(query);
			System.out.println("hitting on db");
			if(rs.first() || hit==1)
			{
				if(hit==1)
				{
					System.out.println("first Time");
				}
				else
				System.out.println("found a new user");
				/*//System.out.println(rs.getString(1)+" "+rs.getInt(2));
				user.put(rs.getString(1), rs.getInt(2));
				System.out.println("new user found");*/
				
				String return_query="SELECT role,COUNT(*) AS total FROM USER group by (role)";
				ResultSet rs1=con.createStatement().executeQuery(return_query);
				while(rs1.next())
				{
					user.put(rs1.getString(1), rs1.getInt(2));
				}
				return user;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("there is an exception in monitor");
		}
		return null;
	}

	public String getAllUsers()
	{
		try
		{
			Connection con=JdbcConfig.getConnection();
			String query="select id,firstName,lastName,dob,email,entry_time,gender,role,mobile,isDeleted from user";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			ArrayList<String>json=new ArrayList<String>();
			
			while(rs.next())
			{
				Map<String,Object> user=new HashMap<String,Object>();
				user.put("id", rs.getString(1));
				//user.put("image", "localhost:8080/admin/userImage?id="+rs.getString(1)+"");
				user.put("name", rs.getString(2)+" "+rs.getString(3));
				String part[]=rs.getString(4).split("/");
				LocalDateTime t=LocalDateTime.of(Integer.parseInt(part[2]),Integer.parseInt(part[1]),Integer.parseInt(part[0]),10,10);
			//	System.out.println(t.getDayOfMonth()+" " +t.getMonthValue()+" "+t.getYear());
				LocalDateTime now=LocalDateTime.now();
				LocalDate birthdate =LocalDate.of(Integer.parseInt(part[2]),Integer.parseInt(part[1]),Integer.parseInt(part[0]));
				long age=ChronoUnit.YEARS.between(birthdate, now);
				//Year.between
				user.put("age", ""+age);
				user.put("email", rs.getString(5));
				user.put("entry_time", rs.getString(6));
				user.put("gender", rs.getString(7));
				user.put("role", rs.getString(8));
				user.put("mobile", rs.getString(9));
				user.put("status", rs.getString(10));
				String data=new Gson().toJson(user);
			//	System.out.println(data);
				json.add(data);
			}
			
			return new Gson().toJson(json);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public String getUser(String id)
	{
		Map<String,String>data=new HashMap<String,String>();
		try
		{
			Connection con=JdbcConfig.getConnection();
			String query="select id,firstName,lastName,dob,email,password,gender,role,mobile,isDeleted from user where id='"+id+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while(rs.next())
			{
				System.out.println("got user to update : "+id);
				data.put("id", rs.getString(1));
				data.put("firstName", rs.getString(2));
				data.put("lastName", rs.getString(3));
				data.put("dob", rs.getString(4));
				data.put("email", rs.getString(5));
				data.put("password", rs.getString(6));
				data.put("gender", rs.getString(7));
				data.put("role", rs.getString(8));
				data.put("mobile", rs.getString(9));
				data.put("isDeleted", rs.getString(10));
				System.out.println(data);
				return new Gson().toJson(data);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public String monitorUser(Timestamp lastVisitedTime, int hit, String role,String adminUserId)
	{
		System.out.println("inside monitor user");
		ArrayList<String> json=new ArrayList<String>();
		try
		{
			Connection con=JdbcConfig.getConnection();
			String query="SELECT * FROM message where date_time >'"+lastVisitedTime+"' and sender_role='"+role+"' and reciever_role='admin'";
			ResultSet rs=con.createStatement().executeQuery(query);
			System.out.println("hitting on db");
			if(rs.first() || hit==1)
			{
				String return_query="";
				if(hit==1)
				{
					System.out.println("first hit to monitor "+role);
					return_query="SELECT sender_name,send_from,msg,date_time,send_to FROM message where sender_role='"+role+"' and reciever_role='admin' and send_to='"+adminUserId+"' ORDER BY(date_time) ;";
				}
				else
				{
					System.out.println("found a new message");
					return_query="SELECT sender_name,send_from,msg,date_time FROM message where sender_role='"+role+"' and reciever_role='admin' and send_to='"+adminUserId+"' and date_time>'"+lastVisitedTime+"' ORDER BY(date_time) ;";
					
				}
				/*//System.out.println(rs.getString(1)+" "+rs.getInt(2));
				user.put(rs.getString(1), rs.getInt(2));
				System.out.println("new user found");*/
				//System.out.println(return_query);
				ResultSet rs1=con.createStatement().executeQuery(return_query);
				while(rs1.next())
				{
					Map<String,String>data=new LinkedHashMap<String,String>();
					data.put("name", rs1.getString(1));
					data.put("from", rs1.getString(2));
					data.put("msg", rs1.getString(3));
					data.put("date_time", rs1.getTimestamp(4).toString());
					json.add(new Gson().toJson(data));
					
				}
				return new Gson().toJson(json);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			System.out.println("there is an exception in monitoring msg");
		}
		return null;
	}

	public void saveFileName(String id, String fileName)
	{
	
		try {
			Connection con = JdbcConfig.getConnection();
			String query = "insert into filetype(name,id) values(?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, fileName);
			ps.setString(2, id);
			int p = ps.executeUpdate();
			System.out.println("successfully saved fileNAMA " + fileName);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}

	public String getFiles(String id, String fileType)
	{
		Map<String,String>data=new HashMap<String,String>();
		try
		{
			Connection con=JdbcConfig.getConnection();
			String query="select date,name,fileId,description from file where userId='"+id+"' and fileType='"+fileType+"' order by(timestamp)";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			ArrayList<String>send=new ArrayList<String>();
			while(rs.next())
			{
				System.out.println("---------->got files of filetype : "+fileType);
				data.put("date", rs.getString(1));
				data.put("name", rs.getString(2));
				data.put("fileId", rs.getString(3));
				data.put("description", rs.getString(4));
				data.put("userId",id);
				System.out.println(data);
				send.add(new Gson().toJson(data));
			}
			return new Gson().toJson(send);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	public boolean saveFile(DataFile file)
	{
		//System.out.println("save file in dashboard repository");
		try {
			Connection con = JdbcConfig.getConnection();
			String query = "insert into file(date,name,userId,fileId,description,file,fileType,timestamp) values(?,?,?,?,?,?,?,now())";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, file.getDate());
			ps.setString(2, file.getName());
			ps.setString(3, file.getUserId());
			file.setFileId(""+System.currentTimeMillis());
			ps.setString(4,file.getFileId());
			ps.setString(5, file.getDescription());
			ps.setBinaryStream(6, file.getFile().getInputStream());
			ps.setString(7, file.getFileType());
			int p = ps.executeUpdate();
			System.out.println("successfully saved " + p + " file of user "+file.getUserId());
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return false;
	}

	public InputStream getFile(String id)
	{
		InputStream image=null;
		try
		{
			Connection con=JdbcConfig.getConnection();
			String query="select file from file where fileId='"+id+"'";
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);
			int check=1;
			while(rs.next())
			{
				System.out.println(id+" user ki file aa gayi hai "+check+" bar chala");
				image=rs.getBinaryStream(1);
				
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return image;
	}
	
	/*public static void main(String[] args)
	{
		DashboardRepository dr=new DashboardRepository();
		Timestamp lastVisitedTime=new Timestamp(Calendar.getInstance().getTime().getTime());
		int hit=1;
		String role="doctor";
		String v=dr.monitorUser(lastVisitedTime,hit,role,"vinaymishra24081993");
		System.out.println(v);
	}*/
	
}
