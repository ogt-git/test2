<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>admin_Login</title>
</head>
<!-- 페이지 열리면 시큐리티 확인하는 form 전송  -->
<body onload="document.getElementById('check_admin_login').submit();"> 
<%
	String session_id = (String)session.getAttribute("sessionId");
	
	if (session.getAttribute("sessionId") == null) {
		response.sendRedirect("../loginFolder/login.jsp");	
	} 

	if (!session_id.equals("rudxor4") && !session_id.equals("dlehgns02")) {
		%>
		<script>
			alert("관리자만 사용 가능한 권한입니다.\n관리자 아이디로 로그인해주세요.");
			location.href = "../movieFolder/mainPage.jsp";
		</script>
		<%
	}else{
		String id = session_id;
		String password = (String)session.getAttribute("sessionPw");;
		%>
		<form id="check_admin_login" class="form-signin" action="j_security_check" method="post" >
	        <input type="hidden" class="form-control" name="j_username" value="<%=id%>">
	        <input type="hidden" class="form-control" name="j_password" value="<%=password%>">
	    </form>
		<%}%>
	
</body>
</html>


						