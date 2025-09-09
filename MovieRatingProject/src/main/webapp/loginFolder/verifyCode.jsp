<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String code = request.getParameter("code");
	String sessionCode = (String) session.getAttribute("authCode");
	
	if (code != null && code.equals(sessionCode)) {
		out.print("인증 완료!");
	} else {
		out.print("인증 실패. 다시 확인해주세요.");
	}
%>