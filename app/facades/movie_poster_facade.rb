class MoviePosterFacade

  def self.movie_poster_fetch(params_id)
    json = MovieService.new.get_movie_poster(params_id)
    json[:posters].map do |image|
      MoviePoster.new(image)
    end
  end
end
