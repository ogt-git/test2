<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>


<%
request.setCharacterEncoding("UTF-8");

	String movie_id, movie_title, movie_releaseyear, movie_story, movie_actor, movie_director, movie_genre, movie_filename = "", movie_category;
	double movie_totalavg_rating = 0.0;
	
	String realFolder = "C:\\Users\\rudxo\\eclipse-workspace_webserver\\MovieRatingProject\\src\\main\\webapp\\resources\\images";
	int max_size = 20*1024*1024;
	String encType = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, max_size, encType, new DefaultFileRenamePolicy());
	
	movie_id = multi.getParameter("movie_id");
	movie_title = multi.getParameter("movie_title");
	movie_releaseyear = multi.getParameter("movie_releaseyear");
	movie_story = multi.getParameter("movie_story");
	movie_actor = multi.getParameter("movie_actor");
	movie_genre = multi.getParameter("movie_genre");
	movie_director = multi.getParameter("movie_director");
	movie_category = multi.getParameter("movie_category");
	System.out.println(movie_category);
	Enumeration files = multi.getFileNames();
	movie_filename = multi.getFilesystemName((String) files.nextElement());
	
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	pstmt = conn.prepareStatement("SELECT * FROM movie WHERE movie_id = ?");
	pstmt.setInt(1,Integer.parseInt(movie_id));
	rs = pstmt.executeQuery();
		if(rs.next()){
			pstmt = conn.prepareStatement("UPDATE movie SET title=?, release_year=?, director=?, actor=?, genre=?, story=? ,category=? WHERE movie_id = ?");

			pstmt.setString(1, movie_title);
			pstmt.setInt(2, Integer.parseInt(movie_releaseyear));
			pstmt.setString(3, movie_director);
			pstmt.setString(4, movie_actor);
			pstmt.setString(5, movie_genre);
			pstmt.setString(6, movie_story);
			pstmt.setString(7, movie_category);
			pstmt.setInt(8, Integer.parseInt(movie_id));
			pstmt.executeUpdate();
			
			if(movie_filename != null){
				pstmt = conn.prepareStatement("UPDATE movie SET poster=? WHERE movie_id = ?");
				pstmt.setString(1, movie_filename);
				pstmt.setInt(2, Integer.parseInt(movie_id));
				pstmt.executeUpdate();
			}
			
		}

		if (pstmt != null)
	pstmt.close();
		if (conn != null)
	conn.close();
		if (rs != null)
	rs.close();

		response.sendRedirect("./edit_moviePage.jsp?edit=update");
%>

