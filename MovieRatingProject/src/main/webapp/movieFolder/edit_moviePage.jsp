<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>editMovie</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script>
function confirm_delete(id) {
	if(confirm("영화를 삭제하시겠습니까?\n삭제 시 모든 정보는 삭제됩니다.")){
		location.href="./delete_moviePage.jsp?id="+id;
	}
	else
		return;
}</script>
</head>
<body>
	<%@ include file = "menuPage.jsp" %>
	<%@ include file="dbconn.jsp" %>	
	
	<%
	String edit = request.getParameter("edit");
	%>

	<h1 class="text-center my-4">영화 평점 페이지</h1>
	<h3 class="text-center my-4 text-primary">수정, 삭제할 영화 선택하시오. </h3><br>
		
		<div class="container d-flex flex-wrap justify-content-start">
	 <% 	 	
	 	
	 	PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM movie ";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
 		while(rs.next()){
 		 	
	 %>
		<div class="movie-box col-4 text-center">	
	 		<%if(edit.equals("update")) {%>
	 			<a href="./update_moviePage.jsp?id=<%=rs.getInt("movie_id")%>" class="text-decoration-none text-dark">
	 		<% } else if(edit.equals("delete")){%>
	 				<a href="#" onclick="confirm_delete(<%=rs.getInt("movie_id")%>)" class="text-decoration-none text-dark">
	 		<%} %>
	 		<img src="../resources/images/<%=rs.getString("poster")%>" class="rounded card-img-top" style="width : 200px">
	 		<h3><%=rs.getString("title") %></h3>
	 		<h5>★ : <%=rs.getDouble("average_rating") %></h5>
	 		</a><br>
	 	</div>
	 	
	<%
	}
	if (rs != null)
	rs.close();
	if (pstmt != null)
	pstmt.close();
	if (conn != null)
	conn.close();
	%>
</div>
	

	<%@ include file = "footerPage.jsp" %>
</body>
</html>





