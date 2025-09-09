	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script>
function confirm_delete(id) {
	if(confirm("리뷰를 삭제하시겠습니까?\n삭제 시 모든 정보는 삭제됩니다.")){
		location.href="./delete_ratingPage.jsp?id="+id;
	}
	else
		return;
}

</script>
<title>detail</title>
</head>
<body>
	<%@ include file = "menuPage.jsp" %>
	<%@ include file="dbconn.jsp" %>
<div class="container ">
	 <% 	 	
	    int movie_id = Integer.parseInt(request.getParameter("id"));
	 	session.setAttribute("movie_id", movie_id);
	 	
	 	PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM movie WHERE movie_id ="+movie_id;
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
 		while(rs.next()){
 		 	
	 %>
	 <div class="text-center">
	 	<h2 ><img class="img-fluid rounded" style="max-width: 45%; height: auto;" src="../resources/images/<%=rs.getString("poster")%>"></h2>
	 	<h5>영화 제목 : <%=rs.getString("title") %></h5>
	 	<h5>평점 : <%=String.format("%.1f", rs.getDouble("average_rating"))	%></h5>
	 	<h6>영화 개봉연도 : <%=rs.getInt("release_year")%>년</h6>
	 	<h5>영화 줄거리 : <%=rs.getString("story") %></h5>
	 	<h5>영화 배우 : <%=rs.getString("actor") %></h5>
	 	<h5>영화 감독 : <%=rs.getString("director") %></h5>
	 	<h6>영화 장르 : <%=rs.getString("genre")%></h6>
	 	<h6>영화 카테고리 : <%=rs.getString("category")%></h6>
	 	<div class="d-flex justify-content-center gap-2 ">
	 		<form action="ratingPage.jsp" method="post"><input type="submit" class="btn btn-outline-info fw-bold btn-sm"  value="평점 매기기"></form>
	 		<form action="mainPage.jsp" method="post"><input type="submit" class="btn btn-outline-info fw-bold btn-sm" value="메인화면"></form> 
	 	</div>
	 </div>
	 	<%}%>
	 	<hr>
 		<h3>사용자 리뷰</h3> 		
 		
 		<%
 		sql = "SELECT * FROM rating, member WHERE movie_id =? && user_id = id";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, movie_id);
		rs = pstmt.executeQuery();
 		while(rs.next()){
 		%>
 			<div class="pb-3 mb-2">
 			닉네임 : <%=rs.getString("name")%>
	 		🌟<%=rs.getInt("user_rating")%>/5 <br> 
			평가 : <%= rs.getString("review") %>
			<%
				String session_user_id = (String)session.getAttribute("sessionId");
				if (session_user_id == null) { session_user_id = "";}
	 			String user_id = rs.getString("user_id");
				if(session_user_id.equals(user_id)){%>
					<div class="d-flex gap-2">
						<a href="./update_ratingPage.jsp?id=<%=rs.getInt("rating_id")%>" class="btn btn-outline-primary btn-sm">리뷰 수정</a> 
						<a href="#" onclick="confirm_delete(<%=rs.getInt("rating_id")%>)" class="btn btn-outline-danger btn-sm">리뷰 삭제</a>
					</div>
 				<%}%></div><%
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