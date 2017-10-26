package com.medical.util;

import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;

public class SendMailProperty {
	public static Session mailProperty() {
		// final String username = IConstant.FROM_EMAIL_ID;
		// final String password = IConstant.FROM_PASSWORD;
		final String username = MailConstant.FROM_EMAIL_ID;
		final String password = MailConstant.FROM_PASSWORD;;
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "25");
		props.put("mail.smtp.starttls.enable", "true");
		/* props.put("mail.smtp.starttls.enable", "true"); */
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});
		return session;
	}
}
