<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>


<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>main</title>
</head>
<%String [] kind_category ={"액션","로맨스","코미디","판타지","스릴러","공포","SF","범죄","애니메이션","고전","재난","음악","스포츠","다큐멘터리","기타"};%>
<body>
	<%@ include file="menuPage.jsp"%>
	<%@ include file="dbconn.jsp" %>
	 
  	<h1 class="text-center mb-0">영화 평가 사이트</h1>

		<div class="d-flex justify-content-end mb-4">
		  <form action="category_mainPage.jsp" name="main_sort_by_category" method="post">
		    <select name="movie_category" id="movie_catesgory" class="form-select" onchange="submit()">
		      <option value="" disabled hidden selected>카테고리</option>
		      <% for(int i = 0; i < kind_category.length; i++) { %>
		        <option value="<%= kind_category[i] %>"><%= kind_category[i] %></option>
		      <% } %>
		    </select>
		  </form>
		</div>
		
	
		<div class="container d-flex flex-wrap justify-content-start">
	 <% 	 	
	 	PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM movie";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
 		while(rs.next()){
 		 	
	 %>
		<div class="col-4 text-center">	
	 		<a href="./detailPage.jsp?id=<%=rs.getInt("movie_id")%>" class="text-decoration-none text-dark">
	 		<img src="../resources/images/<%=rs.getString("poster")%>" class="img-fluid rounded card-img-top" style="width : 200px">
	 		<h3><%=rs.getString("title") %></h3>	
	 		<h5>★ : <%=String.format("%.1f", rs.getDouble("average_rating"))%></h5>
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