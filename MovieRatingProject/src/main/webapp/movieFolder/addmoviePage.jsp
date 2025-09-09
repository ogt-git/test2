<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/validation.js"></script>
<title>addMovie</title>
</head>
<body>
<% 
	String [] category ={"액션","로맨스","코미디","판타지","스릴러","공포","SF","범죄","애니메이션","고전","재난","음악","스포츠","다큐멘터리","기타"};	
%>

	<%@ include file = "menuPage.jsp" %>
	<h2 class="text-center">영화 등록</h2>
	
	<form name="addnewmovie" action="./process_addmovie.jsp" method="post" class="form-horizontal" enctype="multipart/form-data" onsubmit="return check_validation_add_movie()">
	<div class="d-flex justify-content-center text-start row ">
	<div class="col-sm-5">
	
	<label for="movie_id">영화 식별 코드</label>
	<div class="input-group">
	<input type="text" name="movie_id" id = "movie_id" class="form-control" placeholder="영화 식별 코드" oninput="check_validation_movie_id()">
	<button type="button" class="btn btn-outline-secondary fw-bold btn-sm" onclick="check_duplicate_id()">식별코드 중복 확인</button>
	</div>
	<div id="id_msg" class="msg-box font-weight-bold text-danger"></div>
	<input type="hidden" id="id_check" name="id_check" value="false">
	<script>
	function check_duplicate_id() {
		const movie_id = document.getElementById("movie_id").value;
		
		fetch("check_dup_id.jsp?movie_id=" + encodeURIComponent(movie_id))
			.then(response => response.text())
			.then(data => {
				if (data.trim() == "ok") {
					alert("중복되지 않는 식별코드입니다.");
					//document.getElementById("id_msg").innerText = "중복되지 않는 식별코드입니다.";
					document.getElementById("id_check").value = "true";
					
				}
				else {
					alert("식별코드는 중복될 수 없습니다. 다른 숫자로 변경해주세요.");
					//document.getElementById("id_msg").innerText = "식별코드는 중복될 수 없습니다. 다른 숫자로 변경해주세요.";
					document.getElementById("id_check").value = "false";
				}
			});
	}</script>
	  
	 
	<label for="movie_title">영화 제목</label>
	<div class="input-group">
	<input type="text" name="movie_title" id = "movie_title" class="form-control" placeholder="영화 제목"  oninput="check_validation_movie_title()"> 
	<button type="button" class="btn btn-outline-secondary fw-bold btn-sm" onclick="check_duplicate_title()">제목 중복 확인</button>
	</div>
	<div id="title_msg" class="msg-box font-weight-bold text-danger"></div>
	<input type="hidden" id="title_check" name="title_check" value="false">
	<script>
	function check_duplicate_title() {
		const title = document.getElementById("movie_title").value;
		
		fetch("check_dup_title.jsp?title=" + encodeURIComponent(title))
			.then(response => response.text())
			.then(data => {
				if (data.trim() == "ok") {
					document.getElementById("title_msg").innerText = "중복되지 않는 영화 제목입니다.";
					document.getElementById("title_check").value = "true";
					
				}
				else {
					document.getElementById("title_msg").innerText = "중복된 영화 제목이 존재합니다. 영화가 있는지 확인해보세요!!";
					document.getElementById("title_check").value = "false";
				}
			});
	}</script>
	
	<label for="movie_story">영화 줄거리</label>
	<textarea name="movie_story" id="movie_story" class="form-control" placeholder="영화 줄거리"  oninput="check_validation_movie_story()"></textarea>
	<div id="story_msg" class="msg-box font-weight-bold text-danger"></div>
	
	<label for="movie_actor">출연한 영화 배우</label>
	<input type="text" name="movie_actor" id = "movie_actor" class="form-control" placeholder="출연한 영화 배우">
	
	<label for="movie_releaseyear">영화 개봉연도</label>
	<input type="text" name="movie_releaseyear" id = "movie_releaseyear" class="form-control" placeholder="영화 개봉연도(개봉연도만 입력하시오)" oninput="check_validation_movie_releaseyear()">
	<div id="releaseyear_msg" class="msg-box font-weight-bold text-danger"></div>
	
	<label for="movie_director">영화 감독</label>
	<input type="text" name="movie_director" id = "movie_director" class="form-control" placeholder="영화 감독">
	 
	<label for="movie_genre">영화 장르</label>
	<input type="text" name="movie_genre" id = "movie_genre" class="form-control" placeholder="영화 장르">
	
	<label for="movie_category">영화 카테고리</label>
	<select name="movie_category" id = "movie_category" class="form-select" >
		 <option value="" disabled hidden selected>영화 카테고리 선택</option>
		 <%for(int i=0;i<category.length;i++){ %>
		 	<option value="<%=category[i]%>"><%=category[i]%></option>
		 <%} %>
	</select>
	
	<div class="form-group mb-3">
		<label for="movie_poster">영화 이미지</label>
		<input type="file" name="movie_poster" id = "movie_poster" class="form-control" placeholder="영화 포스터"  oninput="check_validation_movie_poster()">
 		<div id="poster_msg" class="msg-box font-weight-bold text-danger"></div>
	</div>
 	
	<input type="submit" value="저장" class="btn btn-info">
	</div>
	</div> 
	</form>

	<%@ include file = "footerPage.jsp" %>
	
</body>
</html>




