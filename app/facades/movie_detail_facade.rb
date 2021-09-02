class MovieDetailFacade
  def self.movie_details_fetch(params_id)
    json = MovieService.get_movie_details(params_id)
    MovieDetail.new(json)
  end


end
