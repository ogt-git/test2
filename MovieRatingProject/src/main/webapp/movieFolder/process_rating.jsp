<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String user_id, movie_review;
	double set_average_rating;
	int user_rating, movie_id, rating_id=1;

 	movie_id = (Integer)session.getAttribute("movie_id");
	user_rating = Integer.parseInt(request.getParameter("rating"));
	movie_review = request.getParameter("rating_review");
	user_id = (String)session.getAttribute("user_id");
	set_average_rating = 0.0;
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	pstmt = conn.prepareStatement("INSERT INTO rating VALUES(?,?,?,?,?)");
	pstmt.setInt(1, 0);
	pstmt.setInt(2, movie_id);
	pstmt.setString(3, user_id);
	pstmt.setInt(4, user_rating);
	pstmt.setString(5, movie_review);
	pstmt.executeUpdate();

	//영화에 대한 모든 평점에 대한 평균 계산
	pstmt = conn.prepareStatement("SELECT avg(user_rating) FROM rating where movie_id = ?");
	pstmt.setInt(1, movie_id);
	rs = pstmt.executeQuery();
	if(rs.next())
		set_average_rating = rs.getDouble(1);
	
	//평균 계산한 값 movie DB에 있는 평균평점에 저장
	pstmt = conn.prepareStatement("UPDATE movie SET average_rating = ? WHERE movie_id = ?");
	pstmt.setDouble(1, set_average_rating);
	pstmt.setInt(2, movie_id);
	pstmt.executeUpdate();


	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("./detailPage.jsp?id=" + movie_id);
%>