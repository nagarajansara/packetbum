package com.truck.mailservice;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.MimeMessage;

public class CustomMimeMessage extends MimeMessage
{
 private String messageID;
 public CustomMimeMessage(Session session, String messageID)
 {
  super(session);
  this.messageID = messageID;
 }
 @Override
 protected void updateMessageID() throws MessagingException
 {
  setHeader("Message-ID", messageID);
 }
}
