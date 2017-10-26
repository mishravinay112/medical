package com.medical.util;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.medical.repository.DashboardRepository;

@Component
@ServerEndpoint("/careTeam")
public class CareTeamMessage 
{
	DashboardRepository dashboardRepository=new DashboardRepository();
	//Autowire karne par dashboard repository ka object nahi mila so null pointer exception aaya.
	
	private Session session;
	@OnOpen
	public void connect(Session session)
	{
		this.session=session;
		System.out.println("sesion: "+session);
	}
	@OnClose
	public void close()
	{
		this.session=null;
		System.out.println("closed: ");
	}
	@OnMessage
	public void onMessage(String userId)
	{
		System.out.println("websocket careTeam------->admin userId : "+userId);
		
		/*System.out.println("enter new message");
		this.session.getAsyncRemote().sendText(i+" "+s.next());*/
		Timestamp lastVisitedTime=new Timestamp(Calendar.getInstance().getTime().getTime());
		int hit=1;
		String role="doctor";
		while(true)
		{
			String updatedDataofUserMonitor= dashboardRepository.monitorUser(lastVisitedTime,hit++,role,userId);
			if(updatedDataofUserMonitor!=null)
			{
				/*Gson gson=new Gson();
				String json= gson.toJson(updatedDataofUserMonitor);
				*///System.out.println(json+"<---------");
				 // Convert JSON string back to Map.
		       /* Type type = new TypeToken<Map<String, String>>(){}.getType();
		        Map<String, String> map = gson.fromJson(json, type);
		        for (String key : map.keySet()) {
		            System.out.println("map.get = " + map.get(key));
		        }*/
				System.out.println(updatedDataofUserMonitor);
				//this.session.getAsyncRemote().sendText(updatedDataofUserMonitor.toString());
				this.session.getAsyncRemote().sendText(updatedDataofUserMonitor);
			}
			try 
			{
				lastVisitedTime=new Timestamp(Calendar.getInstance().getTime().getTime());
				Thread.sleep(30000);
			} 
			catch (InterruptedException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	}
}