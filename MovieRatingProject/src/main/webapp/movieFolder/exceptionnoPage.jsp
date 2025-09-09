<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>페이지 404 오류</title>
</head>
<body >
	<%@ include file = "menuPage.jsp" %>

	<div class="text-center">
		<h1 class="text-danger">404</h1>
		<h2 class="mb-4">요청하신 페이지를 찾을 수 없습니다.</h2>
		<a href="mainPage.jsp" class="btn btn-primary">홈으로 돌아가기</a>
	</div>
	

	<%@ include file = "footerPage.jsp" %>
</body>
</html>