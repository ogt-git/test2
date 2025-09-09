/*
 * package movie;
 * 
 * import java.util.ArrayList;
 * 
 * public class MovieDAO { private ArrayList<Movie> list_of_movie = new
 * ArrayList<Movie>(); private static MovieDAO instance = new MovieDAO();
 * 
 * public MovieDAO() {
 * 
 * }
 * 
 * public ArrayList<Movie> getAllMovies(){ return list_of_movie; }
 * 
 * public Movie getMovie_detail_id(int movie_id) { Movie movie_detail_id= null;
 * 
 * for(int i=0;i<list_of_movie.size();i++) { Movie movie = list_of_movie.get(i);
 * if(movie.getMovie_id() == movie_id && movie.getMovie_id() != 0 && movie !=
 * null) { movie_detail_id = movie; break; } } return movie_detail_id; }
 * 
 * public static MovieDAO getInstance() { return instance; } public void
 * addMovie(Movie movie) { list_of_movie.add(movie); }
 * 
 * 
 * }
 */