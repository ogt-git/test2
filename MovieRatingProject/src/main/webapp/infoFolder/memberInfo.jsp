<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = (String) session.getAttribute("sessionId");
	String email = "";
	String phone = "";
	String birth = "";
	
	if (userId == null) {
		response.sendRedirect("../loginFolder/login.jsp");
		return;
	}
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/MovieRatingDB"
	driver="com.mysql.jdbc.Driver" user="root" password="rudxor98" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?  
   <sql:param value="<%=userId%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
		<c:set var="e-mail" value="${row.mail }"/>
		<c:set var="p-hone" value="${row.phone }"/>
		<c:set var="b-irth" value="${row.birth }"/>
		<%
			email = (String) pageContext.getAttribute("e-mail");
			phone = (String) pageContext.getAttribute("p-hone");
			birth = (String) pageContext.getAttribute("b-irth");
		%>
		
</c:forEach>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<title>회원 정보</title>
</head>
<body>
<%@ include file="../movieFolder/menuPage.jsp"%>
<div class="container py-4">
	<h2>회원 정보</h2>
	<div class="form-floating mb-3 row">
		아이디 : <%=userId %>
	</div>
	<div class="form-floating mb-3 row">
		이메일 : <%=email %>
	</div>
	<div class="form-floating mb-3 row">
		전화번호 : <%=phone %>
	</div>
	<div class="form-floating mb-3 row">
		생일 : <%=birth %>
	</div>
	
	<div class="col-sm-offset-2 col-sm-10">
		<form action="../loginFolder/deleteMember.jsp" method="post" style="display:inline;" onsubmit="return confirm('정말 탈퇴하시겠습니까?');">
			<button type="submit">회원 탈퇴</button>
		</form>
	</div>
</div>
</body>
</html>