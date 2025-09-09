<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<div class="container">
<c:choose>
	
	<c:when test="${empty sessionId}">
		<div class="container d-flex justify-content-between align-items-center py-2 ">
		<h4 class="mb-0"><a href="../movieFolder/mainPage.jsp" class="text-decoration-none">Main</a></h4>
	
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link" href="<c:url value="/loginFolder/login.jsp"/>">로그인</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value="/loginFolder/addMember.jsp"/>">회원 가입</a></li>
		</ul>
		</div>
	</c:when>
	<c:otherwise>
		<div class="container d-flex justify-content-between align-items-center py-2 ">
		<h4 class="mb-0"><a href="../movieFolder/mainPage.jsp" class="text-decoration-none">Main</a></h4>
		
		<ul class="nav justify-content-end">
			<li class="nav-item"><a class="nav-link" href="<c:url value="/loginFolder/logout.jsp"/>">로그아웃</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value="/infoFolder/memberInfo.jsp"/>">회원 정보</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value="../movieFolder/addmoviePage.jsp"/>">영화 등록</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value="../movieFolder/edit_moviePage.jsp?edit=update"/>">영화 수정</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value="../movieFolder/edit_moviePage.jsp?edit=delete"/>">영화 삭제</a></li>
		</ul>
		</div>
	</c:otherwise>
	
</c:choose>
<hr>
</div>

