<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	session.setAttribute("user_id", id);
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/MovieRatingDB"
	driver="com.mysql.jdbc.Driver" user="root" password="rudxor98" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=? and password=?  
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
</sql:query>

<c:forEach var="row" items="${resultSet.rows}">
	<%
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionPw", password);
	%>
	<c:redirect url="login.jsp?msg=2" />
</c:forEach>

<c:redirect url="login.jsp?error=1" />
