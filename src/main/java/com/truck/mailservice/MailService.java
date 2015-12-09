package com.truck.mailservice;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;

import com.truck.util.ConstProp;
import com.truck.util.TruckUtil;


public class MailService {


	public static String setMailHeader(){
		
		String content="<html><body><table cellspacing='0' cellpadding='0' border='0' width='100%'>";
		content+="<tbody><tr>";
		content+="<td style='padding:10px 0 30px 0'>";
		content+="<table cellspacing='0' cellpadding='0' border='0' align='center' width='600' style='border:1px solid #cccccc;border-collapse:collapse'>";
		content+="<tbody><tr>";
		content+="<td bgcolor='#f4f4f4' align='center' style='padding:40px 0 30px 0;color:#fff;font-size:28px;font-weight:bold;font-family:Arial,sans-serif'>";
		content+="<img style='display:block' alt='PAKETBUM' src='http://"+ ConstProp.getServerHost() +"/"+ ConstProp.getContextName() +"/assets/img/logo.png' class='CToWUd'>";
		content+="</td></tr>";
		
		
		return content;
		
	}
	
	public static String setFooter(String content){
		
		content+="<tr><td bgcolor='#f4f4f4' style='padding:30px 30px 30px 30px'>";
		content+="<table cellspacing='0' cellpadding='0' border='0' width='100%'>";
		content+="<tbody><tr><td width='75%' style='color:#333;font-family:Arial,sans-serif;font-size:14px'>";
		content+="&reg; PAKETBUM @2014<br>";
		content+="</td></tr></tbody></table></td></tr></tbody></table></td>	</tr></tbody></table></body></html>";					
				
		return content;
	}
	
	public static void sendMail(String fromEmail, String toEmail, String subject, String content){
		
		String msgId = "dummyMsgId";

		  String smtpHost ="smtp.gmail.com";
		  String smtpPort ="587";
		 // final String username = "gkp.karthik@gmail.com";
		//  final String password = "browser12345";
		  
		  final String username = "info@bytemindztech.com";
		  final String password = "mindzbyte1!";
		  final String fromName = "saravanan m";

		  
		  Properties props = new Properties();
		  
		  
		    props.put("mail.smtp.host", "smtp.zoho.com");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.port", "465");
	        props.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.setProperty("mail.smtp.socketFactory.fallback", "false");
	        props.setProperty("mail.smtp.socketFactory.port", "465");
	        props.put("mail.smtp.startssl.enable", "false");		
		   
		

		        String dsn = "SUCCESS,FAILURE,DELAY ORCPT=rfc822;" + username;
		        props.put("mail.smtp.dsn.notify", dsn);


		        Session session = Session.getInstance(props, new javax.mail.Authenticator()
		        {
		            protected PasswordAuthentication getPasswordAuthentication()
		            {
		                return new PasswordAuthentication(username, password);
		            }
		        });

		        try
		        {
		         msgId =TruckUtil.getUUID();
		         
		            CustomMimeMessage message = new CustomMimeMessage(session, msgId);
		            message.setReplyTo(new javax.mail.Address[]
		            {
		                new javax.mail.internet.InternetAddress(fromEmail)
		            });
		        //    MailService mailService =new MailService();
		     		 /*   Configuration cfg = new Configuration();
		     		    cfg.setDirectoryForTemplateLoading(new File(ConstProp.getFreemarkerTemplateLoadingPath()));
		                Template template = cfg.getTemplate("html-mail-template.ftl");
		                Map<String, String> rootMap = new HashMap<String, String>();
		                rootMap.put("to", " ");
		                rootMap.put("body", content);
		                rootMap.put("from", "sayways team.");
		                Writer out = new StringWriter();           
		     			template.process(rootMap, out);*/
		     		String ContentBody=setMailHeader();
		     		InternetAddress[] myCcList = InternetAddress.parse("connecttosavan@gmail.com");
		     		ContentBody+="<tr><td>"+content+"</td></tr>";
		     		ContentBody=setFooter(ContentBody);
		            message.setFrom(new InternetAddress(username, fromName));
		            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
		            message.setRecipients(Message.RecipientType.CC,myCcList);
		            message.setSubject(subject);
		            message.setContent(ContentBody, "text/html; charset=utf-8");
		            Transport.send(message);
		            msgId = message.getMessageID();
		            System.out.println("toAddress: " +toEmail);
					System.out.println("fromEmail: " +fromEmail);
					System.out.println("msgId: " +msgId);
		 
		        }
		        catch(Exception e) 
		        {
		        	System.out.println("error in sendMail() : " + e.getMessage() + " ...");
		       //   throw e;
		        }
		        finally
		        {
		            props.clear();                   
		        }
	}
	
	

 /* public static void main( String[] args )
  {
  
   
 MailService.sendMail("info@bytemindztech.com", "connecttosavan@gmail.com", "testing", "Java Mail API is Java standard for sending Emails. One common requirement that developers often have is to send notification emails to an application’s users. In the example i demonstrate the basic use of Java mail API to send html formatted email with attachment");
	  
	  

  }*/
  
  /*public static void main(String[] args) throws Exception{
      Properties props = new Properties();
      props.setProperty("mail.transport.protocol", "smtp");
      props.setProperty("mail.host", "smtp.zoho.com");
      props.setProperty(" mail.smtp.starttls.enable", "false");
      props.setProperty("mail.user", "info@bytemindztech.com");
      props.setProperty("mail.password", "mindzbyte1!");
    
      Session mailSession = Session.getDefaultInstance(props, null);
      Transport transport = mailSession.getTransport();

      MimeMessage message = new MimeMessage(mailSession);
      message.setSubject("Testing javamail html");
      message.setContent
         ("This is a test <b>HOWTO<b>", "text/html; charset=ISO-8859-1");
      message.addRecipient(Message.RecipientType.TO,
         new InternetAddress("connecttosavan@gmail.com"));

      transport.connect();
      transport.sendMessage(message,
         message.getRecipients(Message.RecipientType.TO));
      transport.close();
    }
  */
  
  
  

}
