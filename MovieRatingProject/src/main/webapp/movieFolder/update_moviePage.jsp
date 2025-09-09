<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/validation.js"></script>
  
<title>updateMovie</title>
</head>
<body>
	<%@ include file = "menuPage.jsp" %>
	<%@ include file="dbconn.jsp" %>
	<h2 class="text-center">영화 정보 수정</h2>
	
	<%
		String [] category ={"액션","로맨스","코미디","판타지","스릴러","공포","SF","범죄","애니메이션","고전","재난","음악","스포츠","다큐멘터리","기타"};	
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int id = Integer.parseInt(request.getParameter("id")); 
		String sql = "SELECT * FROM movie WHERE movie_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,id);
		rs = pstmt.executeQuery();
 		if(rs.next()){
 	%>	 
 	
    <div class="container mt-4">
  <div class="row align-items-md-stretch">
  
    <div class="col-md-4 text-center">
      <img src="../resources/images/<%=rs.getString("poster")%>" alt="image" class="rounded mb-3" style="width: 100%; max-width: 250px; margin-right: 20px;">
    </div>

  
    <div class="col-md-8">
      <form name="updatemovie" action="./process_updatemovie.jsp" method="post" class="form-horizontal" enctype="multipart/form-data" onsubmit="return check_validation_add_movie()">
       
		<label for="movie_id">영화 식별 코드</label>
        <input type="text" name="movie_id" id="movie_id" class="form-control" value="<%=rs.getInt("movie_id")%>" readonly>
        
        <label for="movie_title">영화 제목</label>
        <input type="text" name="movie_title" id="movie_title" class="form-control" value="<%=rs.getString("title")%>" oninput="check_validation_movie_title()">
   		<div id="title_msg" class="msg-box font-weight-bold text-danger"></div>
   	
		<label for="movie_story">영화 줄거리</label>
        <textarea name="movie_story" id="movie_story" class="form-control" oninput="check_validation_movie_story()"><%=rs.getString("story")%></textarea>
       	<div id="story_msg" class="msg-box font-weight-bold text-danger"></div>
       
        <label for="movie_actor">출연한 영화 배우</label>
        <input type="text" name="movie_actor" id="movie_actor" class="form-control" value="<%=rs.getString("actor")%>">
        
        <label for="movie_releaseyear">영화 개봉연도</label>
        <input type="text" name="movie_releaseyear" id="movie_releaseyear" class="form-control" value="<%=rs.getString("release_year")%>" oninput="check_validation_movie_releaseyear()">
     	<div id="releaseyear_msg" class="msg-box font-weight-bold text-danger"></div>
       
        <label for="movie_director">영화 감독</label>
        <input type="text" name="movie_director" id="movie_director" class="form-control" value="<%=rs.getString("director")%>">
       
        <label for="movie_genre">영화 장르</label>
        <input type="text" name="movie_genre" id="movie_genre" class="form-control" value="<%=rs.getString("genre")%>">
     
     	<label for="movie_category">영화 카테고리</label>
		<select name="movie_category" id = "movie_category" class="form-select" >
			 <option value="<%=rs.getString("category")%>" hidden selected><%=rs.getString("category")%></option>
			 <%for(int i=0;i<category.length;i++){ %>
			 	<option value="<%=category[i]%>"><%=category[i]%></option>
			 <%} %>
		</select>

	
      	<div class="form-group mb-3">
      	    <label for="movie_poster">영화 이미지</label>
      	    <input type="file" name="movie_poster" id="movie_poster" class="form-control" oninput="check_validation_movie_poster()">
      	    <div id="poster_msg" class="msg-box font-weight-bold text-danger"></div>
      	</div>
 			
        <input type="submit" value="수정" class="btn btn-info">
        
      </form>
    </div>
  </div>
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

	<%@ include file = "footerPage.jsp" %>
</body>
</html>





