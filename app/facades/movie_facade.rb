class MovieFacade
  
  def self.top_rated_movies_fetch
    json = MovieService.new.get_top_rated_movies
    json[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_search_fetch(params_search)
    json = MovieService.new.get_movie_search(params_search)
    json[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
