<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/validation.js"></script>
<title>Rating</title>
</head>
<body>
	<%@ include file = "menuPage.jsp" %>
	<%
        String session_id= (String)session.getAttribute("sessionId");
        if (session_id == null) {
            response.sendRedirect("../loginFolder/login.jsp"); 
            return;
        }
    %>
	<h2 class="text-center">영화 평점 매기기</h2>
	
	<form action="./process_rating.jsp" name="movie_rating_star" method="post"  class="form-horizontal text-center" onsubmit="return check_validation_rating_star()">
		<input type="radio" name="rating" id="star1" value="1">
		<label for="rating_star1">★☆☆☆☆</label>
		<input type="radio" name="rating" id="star2" value="2">
		<label for="rating_star2">★★☆☆☆</label>
		<input type="radio" name="rating" id="star3" value="3">
		<label for="rating_star3">★★★☆☆</label>
		<input type="radio" name="rating" id="star4" value="4">
		<label for="rating_star4">★★★★☆</label>
		<input type="radio" name="rating" id="star5" value="5">
		<label for="rating_star5">★★★★★</label>
		
		<div class="text-center mt-4">
		<label for="rating_review" class="fs-4">영화 리뷰</label>
		<textarea style="width: 50%" name="rating_review" id="rating_review" class="form-control mx-auto " placeholder="영화 리뷰 남기기" oninput="check_validation_review()"></textarea>
		<div id="review_msg" class="msg-box font-weight-bold text-danger"></div>
		</div>
		<br>
		<input type="submit" class="btn btn-outline-success btn-sm text-center" value="평가하기">
	</form>
	
	
	
	<%@ include file = "footerPage.jsp" %>
</body>
</html>