<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/validation.js"></script>

<title>updateRating</title>
</head>
<body>
	<%@ include file = "menuPage.jsp" %>
	<%@ include file="dbconn.jsp" %>
	<h2 class="text-center">리뷰 수정</h2>
	
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	    
		int id = Integer.parseInt(request.getParameter("id")); 
		String sql = "SELECT * FROM rating WHERE rating_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,id);
		rs = pstmt.executeQuery();
 		if(rs.next()){
 			int cur_rating = rs.getInt("user_rating");
 	%>	 
 	
	<form action="./process_updaterating.jsp" name="movie_update_star" method="post"  class="form-horizontal text-center" onsubmit="return check_validation_rating_star()">
		<input type="radio" name="rating" id="star1" value="1" <%if(cur_rating == 1)%>checked>
		<label for="rating_star1">★☆☆☆☆</label>
		<input type="radio" name="rating" id="star2" value="2" <%if(cur_rating == 2)%> checked>
		<label for="rating_star2">★★☆☆☆</label>
		<input type="radio" name="rating" id="star3" value="3" <%if(cur_rating == 3)%> checked>
		<label for="rating_star3">★★★☆☆</label>
		<input type="radio" name="rating" id="star4" value="4" <%if(cur_rating == 4)%> checked>
		<label for="rating_star4">★★★★☆</label>
		<input type="radio" name="rating" id="star5" value="5" <%if(cur_rating == 5)%> checked>
		<label for="rating_star5">★★★★★</label>
		<br>
		
		<div class="text-center">
		<label for="rating_review" class="fs-4">영화 리뷰</label>
		<textarea   style="width: 50%" name="rating_review" id="rating_review" class="form-control mx-auto" placeholder="영화 리뷰 남기기" oninput="check_validation_review()"><%=rs.getString("review")%></textarea>
		<div id="review_msg" class="msg-box font-weight-bold text-danger"></div>
		</div>
		<br>
		<input type="hidden" name="rating_id" id="rating_id" value="<%=id%>">
		<input type="submit" class="btn btn-outline-success btn-sm text-center" value="수정하기">
	</form>
	
<%
	}
	if (rs != null)
	rs.close();
	if (pstmt != null)
	pstmt.close();
	if (conn != null)
	conn.close();
	%>

	<%@ include file = "footerPage.jsp" %>
</body>
</html>





