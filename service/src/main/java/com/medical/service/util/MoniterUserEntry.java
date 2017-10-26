/*package com.medical.service.util;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.medical.repository.DashboardRepository;

@Component
public class MoniterUserEntry extends Thread
{
	
	//@Autowired
	DashboardRepository dashboardRepository=new DashboardRepository();
	
	@Override
	public void run() 
	{
		Timestamp lastVisitedTime=new Timestamp(Calendar.getInstance().getTime().getTime());
		while(true)
		{
			System.out.println();
			Map<String,Integer> updatedDataofUserMonitor= dashboardRepository.monitorNewUsers(lastVisitedTime);
			if(updatedDataofUserMonitor!=null)
			{
				System.out.println(updatedDataofUserMonitor);
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
	public static void main(String[] args) 
	{
		MoniterUserEntry t=new MoniterUserEntry();
		t.start();
	}
}
*/