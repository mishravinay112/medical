package com.medical.util;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class Utilmail 
{
	public static boolean confirmationMail(String toEmail, String userPassword, String firstName,String pin) {
		try {
			Message message = new MimeMessage(SendMailProperty.mailProperty());
			message.setFrom(new InternetAddress(MailConstant.FROM_EMAIL_ID));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Regards:registration confirmation");
			String msg = "Dear <b>" + firstName + "</b>,<br>";
			msg += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You have been registered with medical-card below are confirmation pin:<br>";
			msg += " <br>";
			msg += "<h1><b>"+pin+"</b></h1><h6>(this is valid only for only 20 min)";
			msg += " <br>";
			msg+="enter this pin to activate your accound";
			//msg += "http://localhost:8080/HELLOVALIDATION/mail_verification?email="+toEmail; // used
																						// on
																						// local
//		 msg += "http://prestigepoint.in/verify.do?registrationId=" + regId; //used on the server
			/*msg += " <br>";
			msg += "Regards,<br>";
			msg += "Hello valid";*/
			message.setContent(msg, "text/html");
			Transport.send(message);
			System.out.println("Done");
		} catch (MessagingException e) 
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
