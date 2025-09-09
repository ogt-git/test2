<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/MovieRatingDB"
	driver="com.mysql.jdbc.Driver" user="root" password="rudxor98" />

<sql:query dataSource="${dataSource}" var="result">
	SELECT title FROM movie WHERE title = ?
	<sql:param value="<%=title %>" />
</sql:query>

<c:choose>
    <c:when test="${not empty result.rows}">
        	dup
    </c:when>
    <c:otherwise>
        	ok
    </c:otherwise>
</c:choose>
