package com.medical.util;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class PasswordResetMail
{

	public static boolean resetMail(String toEmail, String userPassword, String firstName) {
		try {
			Message message = new MimeMessage(SendMailProperty.mailProperty());
			message.setFrom(new InternetAddress(MailConstant.FROM_EMAIL_ID));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Regards:Password Reset");
			String msg = "Dear " + firstName + ",<br>";
			msg += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please click the link below to reset your password:<br>";
			msg += " <br>";
			msg += "<h3>";
			msg+="http://localhost:8080/admin/changePassword";
			msg+="</h3><h6>(this is valid only for only 20 min)";
			msg += " <br>";
			//msg+="enter this pin to activate your accound";
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
