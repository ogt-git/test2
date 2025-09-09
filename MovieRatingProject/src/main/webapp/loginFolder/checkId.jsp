<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/MovieRatingDB"
	driver="com.mysql.jdbc.Driver" user="root" password="rudxor98" />

<sql:query dataSource="${dataSource}" var="result">
	SELECT id FROM MEMBER WHERE id = ?
	<sql:param value="<%=userId %>" />
</sql:query>

<c:choose>
    <c:when test="${not empty result.rows}">
        	이미 존재하는 아이디입니다
    </c:when>
    <c:otherwise>
        	사용 가능한 아이디입니다
    </c:otherwise>
</c:choose>
