<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>


<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>category</title>
</head>
<body>
	<%@ include file="menuPage.jsp"%>
	<%@ include file="dbconn.jsp" %>
	<%String cate = request.getParameter("movie_category"); %>
  	<h1 class="text-center mb-3"><%=cate%></h1>

	
		<div class="container d-flex flex-wrap justify-content-start">
	 <% 	 	

	 	PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM movie WHERE category = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,cate);
		rs = pstmt.executeQuery();
 		while(rs.next()){
 		 	
	 %>
		<div class="col-4 text-center">	
	 		<a href="./detailPage.jsp?id=<%=rs.getInt("movie_id")%>" class="text-decoration-none text-dark">
	 		<img src="../resources/images/<%=rs.getString("poster")%>" class="img-fluid rounded card-img-top" style="width : 200px">
	 		<h3><%=rs.getString("title") %></h3>	
	 		<h5>★ : <%=String.format("%.1f", rs.getDouble("average_rating")) %></h5>
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