<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>


<%
request.setCharacterEncoding("UTF-8");

	String user_id, movie_review;
	double set_average_rating;
	int user_rating, movie_id, rating_id;
	
	rating_id = Integer.parseInt(request.getParameter("rating_id"));
	movie_id = (Integer) session.getAttribute("movie_id");
	user_rating = Integer.parseInt(request.getParameter("rating"));
	movie_review = request.getParameter("rating_review");
	set_average_rating = 0.0;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	pstmt = conn.prepareStatement("SELECT * FROM rating WHERE rating_id = ?");
	pstmt.setInt(1,rating_id);
	rs = pstmt.executeQuery();
		if(rs.next()){
			pstmt = conn.prepareStatement("UPDATE rating SET user_rating=?, review=? WHERE rating_id = ?");
			pstmt.setInt(1, user_rating);
			pstmt.setString(2, movie_review);
			pstmt.setInt(3, rating_id);
			pstmt.executeUpdate();
		}
	
	
	pstmt = conn.prepareStatement("SELECT avg(user_rating) FROM rating where movie_id = ?");
	pstmt.setInt(1, movie_id);
	rs = pstmt.executeQuery();
	if (rs.next())
		set_average_rating = rs.getDouble(1);

	pstmt = conn.prepareStatement("UPDATE movie SET average_rating = ? WHERE movie_id = ?");
	pstmt.setDouble(1, set_average_rating);
	pstmt.setInt(2, movie_id);
	pstmt.executeUpdate();

	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	if (rs != null)
		rs.close();

	response.sendRedirect("./detailPage.jsp?id=" + movie_id);
%>

