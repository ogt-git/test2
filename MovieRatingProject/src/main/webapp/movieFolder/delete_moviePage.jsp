<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/validation.js"></script>
  
<title>deleteMovie</title>
</head>
<body>
	<%@ include file="menuPage.jsp"%>
	<%@ include file="dbconn.jsp"%>
	<h2 class="text-center">영화 정보 삭제</h2>
	
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int id = Integer.parseInt(request.getParameter("id")); 
		
		String sql = "SELECT * FROM movie";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
 		if(rs.next()){
 			sql = "DELETE FROM movie WHERE movie_id = ?";
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setInt(1, id);
 			pstmt.executeUpdate();
 		}else
 			out.println("영화가 존재하지 않습니다.");
 	
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		
		response.sendRedirect("./edit_moviePage.jsp?edit=delete");
	%>

	<%@ include file = "footerPage.jsp" %>
</body>
</html>





