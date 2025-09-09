<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	if (session.getAttribute("sessionId") != null) {
		response.sendRedirect("../movieFolder/mainPage.jsp");	// 이미 로그인 한 상태라면 메인화면으로 돌아감
		return;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<fmt:setLocale value='<%=request.getParameter("language") %>' />  	
<fmt:bundle basename="bundle.message">

<%@ include file="../movieFolder/menuPage.jsp"%>
<div class="container py-4">
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="text-center mb-4">
			<h1 class="fw-bold"><fmt:message key = "login" /></h1>
		</div>
	</div>
	
<div class="text-end mb-3">
    <form method="get" id="languageForm">
        <select name="language" class="form-select w-auto d-inline" onchange="document.getElementById('languageForm').submit();">
            <option value="ko" ${param.language == 'ko' ? 'selected' : ''}>한국어</option>
            <option value="en" ${param.language == 'en' ? 'selected' : ''}>English</option>
        </select>
    </form>
</div>
	
	
	<div class="row align-items-md-stretch text-center">
		<div class="row justify-content-center align-items-center">
			<div class="h-100 p-5 col-md-6">
				<%
					String error = request.getParameter("error");
					if (error != null) {
						out.println("<div class='alert alert-danger'>");
						out.println("아이디와 비밀번호를 확인해 주세요");
						out.println("</div>");
					}
				%>
				<form class="form-signin" action="processLogin.jsp" method="post">
					<div class="form-floating mb-3 row">
						<input type="text" class="form-control" name="id" id="floatingInput" placeholder="아이디" required autofocus>
						<label for="floatingInput"><fmt:message key = "id" /></label>
					</div>
					<div class="form-floating mb-3 row">
						<input type="password" class="form-control" name="password" placeholder="비밀번호" required>
						<label for="floatingInput"><fmt:message key = "password" /></label>
					</div>
					<button class="btn btn-success w-100" type="submit"><fmt:message key = "login" /></button>
				</form>
				
				<hr>
				
				<div class="d-flex justify-content-center gap-3 mt-3 small">
					<a href="addMember.jsp" class="text-decoration-none text-dark mx-2"><fmt:message key = "new_member" /></a>
				</div>
			</div>
		</div>
	</div>
</div>
</fmt:bundle>
</body>
</html>

