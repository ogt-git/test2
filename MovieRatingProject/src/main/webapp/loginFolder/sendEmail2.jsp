<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.mail.*" %>
<%@ page import="jakarta.mail.internet.*" %>
<%
    String email = request.getParameter("email");
    String authCode = String.valueOf((int)(Math.random() * 900000) + 100000);
    session.setAttribute("authCode", authCode);

    String host = "smtp.naver.com";
    final String user = "0rchid241@naver.com";
    final String password = "dohun0401@@";

    String to = email;

    Properties props = new Properties();
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.starttls.enable", "true");
    props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

    Session mailSession = Session.getInstance(props, new jakarta.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
        }
    });

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(user));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject("인증번호입니다.");
        message.setText("인증번호: " + authCode);

        Transport.send(message);
        out.print("이메일 전송 성공");
    } catch (MessagingException e) {
        e.printStackTrace();
        out.print("이메일 전송 실패");
    }
%>

